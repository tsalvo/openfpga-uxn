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
entity rot2_0CLK_6006c90f is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end rot2_0CLK_6006c90f;
architecture arch of rot2_0CLK_6006c90f is
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
-- BIN_OP_EQ[uxn_opcodes_h_l2547_c6_5eb9]
signal BIN_OP_EQ_uxn_opcodes_h_l2547_c6_5eb9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2547_c6_5eb9_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2547_c6_5eb9_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2547_c1_cdf3]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2547_c1_cdf3_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2547_c1_cdf3_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2547_c1_cdf3_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2547_c1_cdf3_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2547_c2_7390]
signal n16_MUX_uxn_opcodes_h_l2547_c2_7390_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2547_c2_7390_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2547_c2_7390_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2547_c2_7390_return_output : unsigned(15 downto 0);

-- l16_MUX[uxn_opcodes_h_l2547_c2_7390]
signal l16_MUX_uxn_opcodes_h_l2547_c2_7390_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2547_c2_7390_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2547_c2_7390_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2547_c2_7390_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2547_c2_7390]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_7390_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_7390_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_7390_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_7390_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2547_c2_7390]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_7390_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_7390_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_7390_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_7390_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2547_c2_7390]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2547_c2_7390_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2547_c2_7390_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2547_c2_7390_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2547_c2_7390_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2547_c2_7390]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_7390_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_7390_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_7390_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_7390_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2547_c2_7390]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_7390_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_7390_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_7390_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_7390_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2547_c2_7390]
signal result_u8_value_MUX_uxn_opcodes_h_l2547_c2_7390_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2547_c2_7390_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2547_c2_7390_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2547_c2_7390_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2547_c2_7390]
signal t16_MUX_uxn_opcodes_h_l2547_c2_7390_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2547_c2_7390_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2547_c2_7390_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2547_c2_7390_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l2548_c3_8fe3[uxn_opcodes_h_l2548_c3_8fe3]
signal printf_uxn_opcodes_h_l2548_c3_8fe3_uxn_opcodes_h_l2548_c3_8fe3_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2552_c11_a7f7]
signal BIN_OP_EQ_uxn_opcodes_h_l2552_c11_a7f7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2552_c11_a7f7_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2552_c11_a7f7_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2552_c7_e069]
signal n16_MUX_uxn_opcodes_h_l2552_c7_e069_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2552_c7_e069_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2552_c7_e069_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2552_c7_e069_return_output : unsigned(15 downto 0);

-- l16_MUX[uxn_opcodes_h_l2552_c7_e069]
signal l16_MUX_uxn_opcodes_h_l2552_c7_e069_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2552_c7_e069_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2552_c7_e069_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2552_c7_e069_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2552_c7_e069]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2552_c7_e069_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2552_c7_e069_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2552_c7_e069_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2552_c7_e069_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2552_c7_e069]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2552_c7_e069_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2552_c7_e069_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2552_c7_e069_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2552_c7_e069_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2552_c7_e069]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2552_c7_e069_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2552_c7_e069_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2552_c7_e069_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2552_c7_e069_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2552_c7_e069]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2552_c7_e069_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2552_c7_e069_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2552_c7_e069_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2552_c7_e069_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2552_c7_e069]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2552_c7_e069_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2552_c7_e069_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2552_c7_e069_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2552_c7_e069_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2552_c7_e069]
signal result_u8_value_MUX_uxn_opcodes_h_l2552_c7_e069_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2552_c7_e069_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2552_c7_e069_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2552_c7_e069_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2552_c7_e069]
signal t16_MUX_uxn_opcodes_h_l2552_c7_e069_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2552_c7_e069_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2552_c7_e069_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2552_c7_e069_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2555_c11_5e76]
signal BIN_OP_EQ_uxn_opcodes_h_l2555_c11_5e76_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2555_c11_5e76_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2555_c11_5e76_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2555_c7_aa0e]
signal n16_MUX_uxn_opcodes_h_l2555_c7_aa0e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2555_c7_aa0e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2555_c7_aa0e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2555_c7_aa0e_return_output : unsigned(15 downto 0);

-- l16_MUX[uxn_opcodes_h_l2555_c7_aa0e]
signal l16_MUX_uxn_opcodes_h_l2555_c7_aa0e_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2555_c7_aa0e_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2555_c7_aa0e_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2555_c7_aa0e_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2555_c7_aa0e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2555_c7_aa0e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2555_c7_aa0e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2555_c7_aa0e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2555_c7_aa0e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2555_c7_aa0e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2555_c7_aa0e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2555_c7_aa0e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2555_c7_aa0e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2555_c7_aa0e_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2555_c7_aa0e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2555_c7_aa0e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2555_c7_aa0e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2555_c7_aa0e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2555_c7_aa0e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2555_c7_aa0e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2555_c7_aa0e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2555_c7_aa0e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2555_c7_aa0e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2555_c7_aa0e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2555_c7_aa0e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2555_c7_aa0e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2555_c7_aa0e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2555_c7_aa0e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2555_c7_aa0e_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2555_c7_aa0e]
signal result_u8_value_MUX_uxn_opcodes_h_l2555_c7_aa0e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2555_c7_aa0e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2555_c7_aa0e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2555_c7_aa0e_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2555_c7_aa0e]
signal t16_MUX_uxn_opcodes_h_l2555_c7_aa0e_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2555_c7_aa0e_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2555_c7_aa0e_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2555_c7_aa0e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2560_c11_714c]
signal BIN_OP_EQ_uxn_opcodes_h_l2560_c11_714c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2560_c11_714c_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2560_c11_714c_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2560_c7_c7fa]
signal n16_MUX_uxn_opcodes_h_l2560_c7_c7fa_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2560_c7_c7fa_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2560_c7_c7fa_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2560_c7_c7fa_return_output : unsigned(15 downto 0);

-- l16_MUX[uxn_opcodes_h_l2560_c7_c7fa]
signal l16_MUX_uxn_opcodes_h_l2560_c7_c7fa_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2560_c7_c7fa_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2560_c7_c7fa_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2560_c7_c7fa_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2560_c7_c7fa]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_c7fa_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_c7fa_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_c7fa_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_c7fa_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2560_c7_c7fa]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_c7fa_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_c7fa_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_c7fa_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_c7fa_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2560_c7_c7fa]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2560_c7_c7fa_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2560_c7_c7fa_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2560_c7_c7fa_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2560_c7_c7fa_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2560_c7_c7fa]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_c7fa_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_c7fa_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_c7fa_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_c7fa_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2560_c7_c7fa]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_c7fa_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_c7fa_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_c7fa_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_c7fa_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2560_c7_c7fa]
signal result_u8_value_MUX_uxn_opcodes_h_l2560_c7_c7fa_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2560_c7_c7fa_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2560_c7_c7fa_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2560_c7_c7fa_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2560_c7_c7fa]
signal t16_MUX_uxn_opcodes_h_l2560_c7_c7fa_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2560_c7_c7fa_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2560_c7_c7fa_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2560_c7_c7fa_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2561_c3_509c]
signal BIN_OP_OR_uxn_opcodes_h_l2561_c3_509c_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2561_c3_509c_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2561_c3_509c_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2564_c11_ac25]
signal BIN_OP_EQ_uxn_opcodes_h_l2564_c11_ac25_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2564_c11_ac25_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2564_c11_ac25_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2564_c7_3d9c]
signal n16_MUX_uxn_opcodes_h_l2564_c7_3d9c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2564_c7_3d9c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2564_c7_3d9c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2564_c7_3d9c_return_output : unsigned(15 downto 0);

-- l16_MUX[uxn_opcodes_h_l2564_c7_3d9c]
signal l16_MUX_uxn_opcodes_h_l2564_c7_3d9c_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2564_c7_3d9c_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2564_c7_3d9c_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2564_c7_3d9c_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2564_c7_3d9c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_3d9c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_3d9c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_3d9c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_3d9c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2564_c7_3d9c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_3d9c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_3d9c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_3d9c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_3d9c_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2564_c7_3d9c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2564_c7_3d9c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2564_c7_3d9c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2564_c7_3d9c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2564_c7_3d9c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2564_c7_3d9c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_3d9c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_3d9c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_3d9c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_3d9c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2564_c7_3d9c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_3d9c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_3d9c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_3d9c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_3d9c_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2564_c7_3d9c]
signal result_u8_value_MUX_uxn_opcodes_h_l2564_c7_3d9c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2564_c7_3d9c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2564_c7_3d9c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2564_c7_3d9c_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2569_c11_3b0b]
signal BIN_OP_EQ_uxn_opcodes_h_l2569_c11_3b0b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2569_c11_3b0b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2569_c11_3b0b_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2569_c7_29d9]
signal n16_MUX_uxn_opcodes_h_l2569_c7_29d9_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2569_c7_29d9_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2569_c7_29d9_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2569_c7_29d9_return_output : unsigned(15 downto 0);

-- l16_MUX[uxn_opcodes_h_l2569_c7_29d9]
signal l16_MUX_uxn_opcodes_h_l2569_c7_29d9_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2569_c7_29d9_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2569_c7_29d9_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2569_c7_29d9_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2569_c7_29d9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2569_c7_29d9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2569_c7_29d9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2569_c7_29d9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2569_c7_29d9_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2569_c7_29d9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2569_c7_29d9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2569_c7_29d9_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2569_c7_29d9_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2569_c7_29d9_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2569_c7_29d9]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2569_c7_29d9_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2569_c7_29d9_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2569_c7_29d9_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2569_c7_29d9_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2569_c7_29d9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2569_c7_29d9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2569_c7_29d9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2569_c7_29d9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2569_c7_29d9_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2569_c7_29d9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2569_c7_29d9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2569_c7_29d9_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2569_c7_29d9_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2569_c7_29d9_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2569_c7_29d9]
signal result_u8_value_MUX_uxn_opcodes_h_l2569_c7_29d9_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2569_c7_29d9_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2569_c7_29d9_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2569_c7_29d9_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2570_c3_486a]
signal BIN_OP_OR_uxn_opcodes_h_l2570_c3_486a_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2570_c3_486a_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2570_c3_486a_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2573_c11_e3b8]
signal BIN_OP_EQ_uxn_opcodes_h_l2573_c11_e3b8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2573_c11_e3b8_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2573_c11_e3b8_return_output : unsigned(0 downto 0);

-- l16_MUX[uxn_opcodes_h_l2573_c7_4cd3]
signal l16_MUX_uxn_opcodes_h_l2573_c7_4cd3_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2573_c7_4cd3_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2573_c7_4cd3_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2573_c7_4cd3_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2573_c7_4cd3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2573_c7_4cd3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2573_c7_4cd3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2573_c7_4cd3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2573_c7_4cd3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2573_c7_4cd3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2573_c7_4cd3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2573_c7_4cd3_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2573_c7_4cd3_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2573_c7_4cd3_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2573_c7_4cd3]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2573_c7_4cd3_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2573_c7_4cd3_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2573_c7_4cd3_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2573_c7_4cd3_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2573_c7_4cd3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2573_c7_4cd3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2573_c7_4cd3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2573_c7_4cd3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2573_c7_4cd3_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2573_c7_4cd3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2573_c7_4cd3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2573_c7_4cd3_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2573_c7_4cd3_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2573_c7_4cd3_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2573_c7_4cd3]
signal result_u8_value_MUX_uxn_opcodes_h_l2573_c7_4cd3_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2573_c7_4cd3_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2573_c7_4cd3_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2573_c7_4cd3_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2577_c30_28d3]
signal sp_relative_shift_uxn_opcodes_h_l2577_c30_28d3_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2577_c30_28d3_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2577_c30_28d3_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2577_c30_28d3_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2582_c11_5036]
signal BIN_OP_EQ_uxn_opcodes_h_l2582_c11_5036_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2582_c11_5036_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2582_c11_5036_return_output : unsigned(0 downto 0);

-- l16_MUX[uxn_opcodes_h_l2582_c7_a535]
signal l16_MUX_uxn_opcodes_h_l2582_c7_a535_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2582_c7_a535_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2582_c7_a535_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2582_c7_a535_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2582_c7_a535]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2582_c7_a535_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2582_c7_a535_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2582_c7_a535_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2582_c7_a535_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2582_c7_a535]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2582_c7_a535_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2582_c7_a535_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2582_c7_a535_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2582_c7_a535_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2582_c7_a535]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2582_c7_a535_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2582_c7_a535_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2582_c7_a535_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2582_c7_a535_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2582_c7_a535]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2582_c7_a535_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2582_c7_a535_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2582_c7_a535_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2582_c7_a535_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2582_c7_a535]
signal result_u8_value_MUX_uxn_opcodes_h_l2582_c7_a535_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2582_c7_a535_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2582_c7_a535_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2582_c7_a535_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2583_c3_78a5]
signal BIN_OP_OR_uxn_opcodes_h_l2583_c3_78a5_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2583_c3_78a5_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2583_c3_78a5_return_output : unsigned(15 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2586_c31_1d41]
signal CONST_SR_8_uxn_opcodes_h_l2586_c31_1d41_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2586_c31_1d41_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2588_c11_6301]
signal BIN_OP_EQ_uxn_opcodes_h_l2588_c11_6301_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2588_c11_6301_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2588_c11_6301_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2588_c7_f4e0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2588_c7_f4e0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2588_c7_f4e0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2588_c7_f4e0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2588_c7_f4e0_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2588_c7_f4e0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2588_c7_f4e0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2588_c7_f4e0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2588_c7_f4e0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2588_c7_f4e0_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2588_c7_f4e0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2588_c7_f4e0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2588_c7_f4e0_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2588_c7_f4e0_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2588_c7_f4e0_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2588_c7_f4e0]
signal result_u8_value_MUX_uxn_opcodes_h_l2588_c7_f4e0_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2588_c7_f4e0_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2588_c7_f4e0_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2588_c7_f4e0_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2592_c11_baee]
signal BIN_OP_EQ_uxn_opcodes_h_l2592_c11_baee_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2592_c11_baee_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2592_c11_baee_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2592_c7_fa22]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_fa22_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_fa22_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_fa22_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_fa22_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2592_c7_fa22]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_fa22_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_fa22_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_fa22_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_fa22_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2592_c7_fa22]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_fa22_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_fa22_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_fa22_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_fa22_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2592_c7_fa22]
signal result_u8_value_MUX_uxn_opcodes_h_l2592_c7_fa22_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2592_c7_fa22_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2592_c7_fa22_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2592_c7_fa22_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2594_c31_6455]
signal CONST_SR_8_uxn_opcodes_h_l2594_c31_6455_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2594_c31_6455_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2596_c11_e52a]
signal BIN_OP_EQ_uxn_opcodes_h_l2596_c11_e52a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2596_c11_e52a_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2596_c11_e52a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2596_c7_303d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2596_c7_303d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2596_c7_303d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2596_c7_303d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2596_c7_303d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2596_c7_303d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2596_c7_303d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2596_c7_303d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2596_c7_303d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2596_c7_303d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2596_c7_303d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2596_c7_303d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2596_c7_303d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2596_c7_303d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2596_c7_303d_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2596_c7_303d]
signal result_u8_value_MUX_uxn_opcodes_h_l2596_c7_303d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2596_c7_303d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2596_c7_303d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2596_c7_303d_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2600_c11_f5e3]
signal BIN_OP_EQ_uxn_opcodes_h_l2600_c11_f5e3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2600_c11_f5e3_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2600_c11_f5e3_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2600_c7_9eb5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2600_c7_9eb5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2600_c7_9eb5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2600_c7_9eb5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2600_c7_9eb5_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2600_c7_9eb5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2600_c7_9eb5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2600_c7_9eb5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2600_c7_9eb5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2600_c7_9eb5_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2600_c7_9eb5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c7_9eb5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c7_9eb5_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c7_9eb5_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c7_9eb5_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2600_c7_9eb5]
signal result_u8_value_MUX_uxn_opcodes_h_l2600_c7_9eb5_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2600_c7_9eb5_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2600_c7_9eb5_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2600_c7_9eb5_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2602_c31_31c1]
signal CONST_SR_8_uxn_opcodes_h_l2602_c31_31c1_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2602_c31_31c1_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2604_c11_b02a]
signal BIN_OP_EQ_uxn_opcodes_h_l2604_c11_b02a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2604_c11_b02a_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2604_c11_b02a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2604_c7_4d94]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_4d94_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_4d94_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_4d94_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_4d94_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2604_c7_4d94]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_4d94_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_4d94_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_4d94_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_4d94_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2566_l2557_l2575_DUPLICATE_d178
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2566_l2557_l2575_DUPLICATE_d178_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2566_l2557_l2575_DUPLICATE_d178_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_5b93( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : signed;
 ref_toks_6 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_stack_write := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.is_sp_shift := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.u8_value := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2547_c6_5eb9
BIN_OP_EQ_uxn_opcodes_h_l2547_c6_5eb9 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2547_c6_5eb9_left,
BIN_OP_EQ_uxn_opcodes_h_l2547_c6_5eb9_right,
BIN_OP_EQ_uxn_opcodes_h_l2547_c6_5eb9_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2547_c1_cdf3
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2547_c1_cdf3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2547_c1_cdf3_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2547_c1_cdf3_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2547_c1_cdf3_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2547_c1_cdf3_return_output);

-- n16_MUX_uxn_opcodes_h_l2547_c2_7390
n16_MUX_uxn_opcodes_h_l2547_c2_7390 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2547_c2_7390_cond,
n16_MUX_uxn_opcodes_h_l2547_c2_7390_iftrue,
n16_MUX_uxn_opcodes_h_l2547_c2_7390_iffalse,
n16_MUX_uxn_opcodes_h_l2547_c2_7390_return_output);

-- l16_MUX_uxn_opcodes_h_l2547_c2_7390
l16_MUX_uxn_opcodes_h_l2547_c2_7390 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2547_c2_7390_cond,
l16_MUX_uxn_opcodes_h_l2547_c2_7390_iftrue,
l16_MUX_uxn_opcodes_h_l2547_c2_7390_iffalse,
l16_MUX_uxn_opcodes_h_l2547_c2_7390_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_7390
result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_7390 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_7390_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_7390_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_7390_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_7390_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_7390
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_7390 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_7390_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_7390_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_7390_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_7390_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2547_c2_7390
result_is_sp_shift_MUX_uxn_opcodes_h_l2547_c2_7390 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2547_c2_7390_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2547_c2_7390_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2547_c2_7390_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2547_c2_7390_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_7390
result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_7390 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_7390_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_7390_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_7390_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_7390_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_7390
result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_7390 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_7390_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_7390_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_7390_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_7390_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2547_c2_7390
result_u8_value_MUX_uxn_opcodes_h_l2547_c2_7390 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2547_c2_7390_cond,
result_u8_value_MUX_uxn_opcodes_h_l2547_c2_7390_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2547_c2_7390_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2547_c2_7390_return_output);

-- t16_MUX_uxn_opcodes_h_l2547_c2_7390
t16_MUX_uxn_opcodes_h_l2547_c2_7390 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2547_c2_7390_cond,
t16_MUX_uxn_opcodes_h_l2547_c2_7390_iftrue,
t16_MUX_uxn_opcodes_h_l2547_c2_7390_iffalse,
t16_MUX_uxn_opcodes_h_l2547_c2_7390_return_output);

-- printf_uxn_opcodes_h_l2548_c3_8fe3_uxn_opcodes_h_l2548_c3_8fe3
printf_uxn_opcodes_h_l2548_c3_8fe3_uxn_opcodes_h_l2548_c3_8fe3 : entity work.printf_uxn_opcodes_h_l2548_c3_8fe3_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2548_c3_8fe3_uxn_opcodes_h_l2548_c3_8fe3_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2552_c11_a7f7
BIN_OP_EQ_uxn_opcodes_h_l2552_c11_a7f7 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2552_c11_a7f7_left,
BIN_OP_EQ_uxn_opcodes_h_l2552_c11_a7f7_right,
BIN_OP_EQ_uxn_opcodes_h_l2552_c11_a7f7_return_output);

-- n16_MUX_uxn_opcodes_h_l2552_c7_e069
n16_MUX_uxn_opcodes_h_l2552_c7_e069 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2552_c7_e069_cond,
n16_MUX_uxn_opcodes_h_l2552_c7_e069_iftrue,
n16_MUX_uxn_opcodes_h_l2552_c7_e069_iffalse,
n16_MUX_uxn_opcodes_h_l2552_c7_e069_return_output);

-- l16_MUX_uxn_opcodes_h_l2552_c7_e069
l16_MUX_uxn_opcodes_h_l2552_c7_e069 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2552_c7_e069_cond,
l16_MUX_uxn_opcodes_h_l2552_c7_e069_iftrue,
l16_MUX_uxn_opcodes_h_l2552_c7_e069_iffalse,
l16_MUX_uxn_opcodes_h_l2552_c7_e069_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2552_c7_e069
result_is_stack_write_MUX_uxn_opcodes_h_l2552_c7_e069 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2552_c7_e069_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2552_c7_e069_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2552_c7_e069_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2552_c7_e069_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2552_c7_e069
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2552_c7_e069 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2552_c7_e069_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2552_c7_e069_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2552_c7_e069_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2552_c7_e069_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2552_c7_e069
result_is_sp_shift_MUX_uxn_opcodes_h_l2552_c7_e069 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2552_c7_e069_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2552_c7_e069_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2552_c7_e069_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2552_c7_e069_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2552_c7_e069
result_is_opc_done_MUX_uxn_opcodes_h_l2552_c7_e069 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2552_c7_e069_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2552_c7_e069_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2552_c7_e069_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2552_c7_e069_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2552_c7_e069
result_sp_relative_shift_MUX_uxn_opcodes_h_l2552_c7_e069 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2552_c7_e069_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2552_c7_e069_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2552_c7_e069_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2552_c7_e069_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2552_c7_e069
result_u8_value_MUX_uxn_opcodes_h_l2552_c7_e069 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2552_c7_e069_cond,
result_u8_value_MUX_uxn_opcodes_h_l2552_c7_e069_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2552_c7_e069_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2552_c7_e069_return_output);

-- t16_MUX_uxn_opcodes_h_l2552_c7_e069
t16_MUX_uxn_opcodes_h_l2552_c7_e069 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2552_c7_e069_cond,
t16_MUX_uxn_opcodes_h_l2552_c7_e069_iftrue,
t16_MUX_uxn_opcodes_h_l2552_c7_e069_iffalse,
t16_MUX_uxn_opcodes_h_l2552_c7_e069_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2555_c11_5e76
BIN_OP_EQ_uxn_opcodes_h_l2555_c11_5e76 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2555_c11_5e76_left,
BIN_OP_EQ_uxn_opcodes_h_l2555_c11_5e76_right,
BIN_OP_EQ_uxn_opcodes_h_l2555_c11_5e76_return_output);

-- n16_MUX_uxn_opcodes_h_l2555_c7_aa0e
n16_MUX_uxn_opcodes_h_l2555_c7_aa0e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2555_c7_aa0e_cond,
n16_MUX_uxn_opcodes_h_l2555_c7_aa0e_iftrue,
n16_MUX_uxn_opcodes_h_l2555_c7_aa0e_iffalse,
n16_MUX_uxn_opcodes_h_l2555_c7_aa0e_return_output);

-- l16_MUX_uxn_opcodes_h_l2555_c7_aa0e
l16_MUX_uxn_opcodes_h_l2555_c7_aa0e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2555_c7_aa0e_cond,
l16_MUX_uxn_opcodes_h_l2555_c7_aa0e_iftrue,
l16_MUX_uxn_opcodes_h_l2555_c7_aa0e_iffalse,
l16_MUX_uxn_opcodes_h_l2555_c7_aa0e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2555_c7_aa0e
result_is_stack_write_MUX_uxn_opcodes_h_l2555_c7_aa0e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2555_c7_aa0e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2555_c7_aa0e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2555_c7_aa0e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2555_c7_aa0e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2555_c7_aa0e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2555_c7_aa0e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2555_c7_aa0e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2555_c7_aa0e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2555_c7_aa0e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2555_c7_aa0e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2555_c7_aa0e
result_is_sp_shift_MUX_uxn_opcodes_h_l2555_c7_aa0e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2555_c7_aa0e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2555_c7_aa0e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2555_c7_aa0e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2555_c7_aa0e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2555_c7_aa0e
result_is_opc_done_MUX_uxn_opcodes_h_l2555_c7_aa0e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2555_c7_aa0e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2555_c7_aa0e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2555_c7_aa0e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2555_c7_aa0e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2555_c7_aa0e
result_sp_relative_shift_MUX_uxn_opcodes_h_l2555_c7_aa0e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2555_c7_aa0e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2555_c7_aa0e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2555_c7_aa0e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2555_c7_aa0e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2555_c7_aa0e
result_u8_value_MUX_uxn_opcodes_h_l2555_c7_aa0e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2555_c7_aa0e_cond,
result_u8_value_MUX_uxn_opcodes_h_l2555_c7_aa0e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2555_c7_aa0e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2555_c7_aa0e_return_output);

-- t16_MUX_uxn_opcodes_h_l2555_c7_aa0e
t16_MUX_uxn_opcodes_h_l2555_c7_aa0e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2555_c7_aa0e_cond,
t16_MUX_uxn_opcodes_h_l2555_c7_aa0e_iftrue,
t16_MUX_uxn_opcodes_h_l2555_c7_aa0e_iffalse,
t16_MUX_uxn_opcodes_h_l2555_c7_aa0e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2560_c11_714c
BIN_OP_EQ_uxn_opcodes_h_l2560_c11_714c : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2560_c11_714c_left,
BIN_OP_EQ_uxn_opcodes_h_l2560_c11_714c_right,
BIN_OP_EQ_uxn_opcodes_h_l2560_c11_714c_return_output);

-- n16_MUX_uxn_opcodes_h_l2560_c7_c7fa
n16_MUX_uxn_opcodes_h_l2560_c7_c7fa : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2560_c7_c7fa_cond,
n16_MUX_uxn_opcodes_h_l2560_c7_c7fa_iftrue,
n16_MUX_uxn_opcodes_h_l2560_c7_c7fa_iffalse,
n16_MUX_uxn_opcodes_h_l2560_c7_c7fa_return_output);

-- l16_MUX_uxn_opcodes_h_l2560_c7_c7fa
l16_MUX_uxn_opcodes_h_l2560_c7_c7fa : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2560_c7_c7fa_cond,
l16_MUX_uxn_opcodes_h_l2560_c7_c7fa_iftrue,
l16_MUX_uxn_opcodes_h_l2560_c7_c7fa_iffalse,
l16_MUX_uxn_opcodes_h_l2560_c7_c7fa_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_c7fa
result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_c7fa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_c7fa_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_c7fa_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_c7fa_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_c7fa_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_c7fa
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_c7fa : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_c7fa_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_c7fa_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_c7fa_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_c7fa_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2560_c7_c7fa
result_is_sp_shift_MUX_uxn_opcodes_h_l2560_c7_c7fa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2560_c7_c7fa_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2560_c7_c7fa_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2560_c7_c7fa_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2560_c7_c7fa_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_c7fa
result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_c7fa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_c7fa_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_c7fa_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_c7fa_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_c7fa_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_c7fa
result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_c7fa : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_c7fa_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_c7fa_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_c7fa_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_c7fa_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2560_c7_c7fa
result_u8_value_MUX_uxn_opcodes_h_l2560_c7_c7fa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2560_c7_c7fa_cond,
result_u8_value_MUX_uxn_opcodes_h_l2560_c7_c7fa_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2560_c7_c7fa_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2560_c7_c7fa_return_output);

-- t16_MUX_uxn_opcodes_h_l2560_c7_c7fa
t16_MUX_uxn_opcodes_h_l2560_c7_c7fa : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2560_c7_c7fa_cond,
t16_MUX_uxn_opcodes_h_l2560_c7_c7fa_iftrue,
t16_MUX_uxn_opcodes_h_l2560_c7_c7fa_iffalse,
t16_MUX_uxn_opcodes_h_l2560_c7_c7fa_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2561_c3_509c
BIN_OP_OR_uxn_opcodes_h_l2561_c3_509c : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2561_c3_509c_left,
BIN_OP_OR_uxn_opcodes_h_l2561_c3_509c_right,
BIN_OP_OR_uxn_opcodes_h_l2561_c3_509c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2564_c11_ac25
BIN_OP_EQ_uxn_opcodes_h_l2564_c11_ac25 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2564_c11_ac25_left,
BIN_OP_EQ_uxn_opcodes_h_l2564_c11_ac25_right,
BIN_OP_EQ_uxn_opcodes_h_l2564_c11_ac25_return_output);

-- n16_MUX_uxn_opcodes_h_l2564_c7_3d9c
n16_MUX_uxn_opcodes_h_l2564_c7_3d9c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2564_c7_3d9c_cond,
n16_MUX_uxn_opcodes_h_l2564_c7_3d9c_iftrue,
n16_MUX_uxn_opcodes_h_l2564_c7_3d9c_iffalse,
n16_MUX_uxn_opcodes_h_l2564_c7_3d9c_return_output);

-- l16_MUX_uxn_opcodes_h_l2564_c7_3d9c
l16_MUX_uxn_opcodes_h_l2564_c7_3d9c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2564_c7_3d9c_cond,
l16_MUX_uxn_opcodes_h_l2564_c7_3d9c_iftrue,
l16_MUX_uxn_opcodes_h_l2564_c7_3d9c_iffalse,
l16_MUX_uxn_opcodes_h_l2564_c7_3d9c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_3d9c
result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_3d9c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_3d9c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_3d9c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_3d9c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_3d9c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_3d9c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_3d9c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_3d9c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_3d9c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_3d9c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_3d9c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2564_c7_3d9c
result_is_sp_shift_MUX_uxn_opcodes_h_l2564_c7_3d9c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2564_c7_3d9c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2564_c7_3d9c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2564_c7_3d9c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2564_c7_3d9c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_3d9c
result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_3d9c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_3d9c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_3d9c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_3d9c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_3d9c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_3d9c
result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_3d9c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_3d9c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_3d9c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_3d9c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_3d9c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2564_c7_3d9c
result_u8_value_MUX_uxn_opcodes_h_l2564_c7_3d9c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2564_c7_3d9c_cond,
result_u8_value_MUX_uxn_opcodes_h_l2564_c7_3d9c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2564_c7_3d9c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2564_c7_3d9c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2569_c11_3b0b
BIN_OP_EQ_uxn_opcodes_h_l2569_c11_3b0b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2569_c11_3b0b_left,
BIN_OP_EQ_uxn_opcodes_h_l2569_c11_3b0b_right,
BIN_OP_EQ_uxn_opcodes_h_l2569_c11_3b0b_return_output);

-- n16_MUX_uxn_opcodes_h_l2569_c7_29d9
n16_MUX_uxn_opcodes_h_l2569_c7_29d9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2569_c7_29d9_cond,
n16_MUX_uxn_opcodes_h_l2569_c7_29d9_iftrue,
n16_MUX_uxn_opcodes_h_l2569_c7_29d9_iffalse,
n16_MUX_uxn_opcodes_h_l2569_c7_29d9_return_output);

-- l16_MUX_uxn_opcodes_h_l2569_c7_29d9
l16_MUX_uxn_opcodes_h_l2569_c7_29d9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2569_c7_29d9_cond,
l16_MUX_uxn_opcodes_h_l2569_c7_29d9_iftrue,
l16_MUX_uxn_opcodes_h_l2569_c7_29d9_iffalse,
l16_MUX_uxn_opcodes_h_l2569_c7_29d9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2569_c7_29d9
result_is_stack_write_MUX_uxn_opcodes_h_l2569_c7_29d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2569_c7_29d9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2569_c7_29d9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2569_c7_29d9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2569_c7_29d9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2569_c7_29d9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2569_c7_29d9 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2569_c7_29d9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2569_c7_29d9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2569_c7_29d9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2569_c7_29d9_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2569_c7_29d9
result_is_sp_shift_MUX_uxn_opcodes_h_l2569_c7_29d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2569_c7_29d9_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2569_c7_29d9_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2569_c7_29d9_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2569_c7_29d9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2569_c7_29d9
result_is_opc_done_MUX_uxn_opcodes_h_l2569_c7_29d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2569_c7_29d9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2569_c7_29d9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2569_c7_29d9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2569_c7_29d9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2569_c7_29d9
result_sp_relative_shift_MUX_uxn_opcodes_h_l2569_c7_29d9 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2569_c7_29d9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2569_c7_29d9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2569_c7_29d9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2569_c7_29d9_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2569_c7_29d9
result_u8_value_MUX_uxn_opcodes_h_l2569_c7_29d9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2569_c7_29d9_cond,
result_u8_value_MUX_uxn_opcodes_h_l2569_c7_29d9_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2569_c7_29d9_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2569_c7_29d9_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2570_c3_486a
BIN_OP_OR_uxn_opcodes_h_l2570_c3_486a : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2570_c3_486a_left,
BIN_OP_OR_uxn_opcodes_h_l2570_c3_486a_right,
BIN_OP_OR_uxn_opcodes_h_l2570_c3_486a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2573_c11_e3b8
BIN_OP_EQ_uxn_opcodes_h_l2573_c11_e3b8 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2573_c11_e3b8_left,
BIN_OP_EQ_uxn_opcodes_h_l2573_c11_e3b8_right,
BIN_OP_EQ_uxn_opcodes_h_l2573_c11_e3b8_return_output);

-- l16_MUX_uxn_opcodes_h_l2573_c7_4cd3
l16_MUX_uxn_opcodes_h_l2573_c7_4cd3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2573_c7_4cd3_cond,
l16_MUX_uxn_opcodes_h_l2573_c7_4cd3_iftrue,
l16_MUX_uxn_opcodes_h_l2573_c7_4cd3_iffalse,
l16_MUX_uxn_opcodes_h_l2573_c7_4cd3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2573_c7_4cd3
result_is_stack_write_MUX_uxn_opcodes_h_l2573_c7_4cd3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2573_c7_4cd3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2573_c7_4cd3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2573_c7_4cd3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2573_c7_4cd3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2573_c7_4cd3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2573_c7_4cd3 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2573_c7_4cd3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2573_c7_4cd3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2573_c7_4cd3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2573_c7_4cd3_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2573_c7_4cd3
result_is_sp_shift_MUX_uxn_opcodes_h_l2573_c7_4cd3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2573_c7_4cd3_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2573_c7_4cd3_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2573_c7_4cd3_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2573_c7_4cd3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2573_c7_4cd3
result_is_opc_done_MUX_uxn_opcodes_h_l2573_c7_4cd3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2573_c7_4cd3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2573_c7_4cd3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2573_c7_4cd3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2573_c7_4cd3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2573_c7_4cd3
result_sp_relative_shift_MUX_uxn_opcodes_h_l2573_c7_4cd3 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2573_c7_4cd3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2573_c7_4cd3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2573_c7_4cd3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2573_c7_4cd3_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2573_c7_4cd3
result_u8_value_MUX_uxn_opcodes_h_l2573_c7_4cd3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2573_c7_4cd3_cond,
result_u8_value_MUX_uxn_opcodes_h_l2573_c7_4cd3_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2573_c7_4cd3_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2573_c7_4cd3_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2577_c30_28d3
sp_relative_shift_uxn_opcodes_h_l2577_c30_28d3 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2577_c30_28d3_ins,
sp_relative_shift_uxn_opcodes_h_l2577_c30_28d3_x,
sp_relative_shift_uxn_opcodes_h_l2577_c30_28d3_y,
sp_relative_shift_uxn_opcodes_h_l2577_c30_28d3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2582_c11_5036
BIN_OP_EQ_uxn_opcodes_h_l2582_c11_5036 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2582_c11_5036_left,
BIN_OP_EQ_uxn_opcodes_h_l2582_c11_5036_right,
BIN_OP_EQ_uxn_opcodes_h_l2582_c11_5036_return_output);

-- l16_MUX_uxn_opcodes_h_l2582_c7_a535
l16_MUX_uxn_opcodes_h_l2582_c7_a535 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2582_c7_a535_cond,
l16_MUX_uxn_opcodes_h_l2582_c7_a535_iftrue,
l16_MUX_uxn_opcodes_h_l2582_c7_a535_iffalse,
l16_MUX_uxn_opcodes_h_l2582_c7_a535_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2582_c7_a535
result_is_stack_write_MUX_uxn_opcodes_h_l2582_c7_a535 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2582_c7_a535_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2582_c7_a535_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2582_c7_a535_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2582_c7_a535_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2582_c7_a535
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2582_c7_a535 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2582_c7_a535_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2582_c7_a535_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2582_c7_a535_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2582_c7_a535_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2582_c7_a535
result_is_sp_shift_MUX_uxn_opcodes_h_l2582_c7_a535 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2582_c7_a535_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2582_c7_a535_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2582_c7_a535_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2582_c7_a535_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2582_c7_a535
result_is_opc_done_MUX_uxn_opcodes_h_l2582_c7_a535 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2582_c7_a535_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2582_c7_a535_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2582_c7_a535_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2582_c7_a535_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2582_c7_a535
result_u8_value_MUX_uxn_opcodes_h_l2582_c7_a535 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2582_c7_a535_cond,
result_u8_value_MUX_uxn_opcodes_h_l2582_c7_a535_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2582_c7_a535_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2582_c7_a535_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2583_c3_78a5
BIN_OP_OR_uxn_opcodes_h_l2583_c3_78a5 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2583_c3_78a5_left,
BIN_OP_OR_uxn_opcodes_h_l2583_c3_78a5_right,
BIN_OP_OR_uxn_opcodes_h_l2583_c3_78a5_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2586_c31_1d41
CONST_SR_8_uxn_opcodes_h_l2586_c31_1d41 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2586_c31_1d41_x,
CONST_SR_8_uxn_opcodes_h_l2586_c31_1d41_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2588_c11_6301
BIN_OP_EQ_uxn_opcodes_h_l2588_c11_6301 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2588_c11_6301_left,
BIN_OP_EQ_uxn_opcodes_h_l2588_c11_6301_right,
BIN_OP_EQ_uxn_opcodes_h_l2588_c11_6301_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2588_c7_f4e0
result_is_stack_write_MUX_uxn_opcodes_h_l2588_c7_f4e0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2588_c7_f4e0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2588_c7_f4e0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2588_c7_f4e0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2588_c7_f4e0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2588_c7_f4e0
result_is_opc_done_MUX_uxn_opcodes_h_l2588_c7_f4e0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2588_c7_f4e0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2588_c7_f4e0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2588_c7_f4e0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2588_c7_f4e0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2588_c7_f4e0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2588_c7_f4e0 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2588_c7_f4e0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2588_c7_f4e0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2588_c7_f4e0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2588_c7_f4e0_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2588_c7_f4e0
result_u8_value_MUX_uxn_opcodes_h_l2588_c7_f4e0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2588_c7_f4e0_cond,
result_u8_value_MUX_uxn_opcodes_h_l2588_c7_f4e0_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2588_c7_f4e0_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2588_c7_f4e0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2592_c11_baee
BIN_OP_EQ_uxn_opcodes_h_l2592_c11_baee : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2592_c11_baee_left,
BIN_OP_EQ_uxn_opcodes_h_l2592_c11_baee_right,
BIN_OP_EQ_uxn_opcodes_h_l2592_c11_baee_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_fa22
result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_fa22 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_fa22_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_fa22_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_fa22_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_fa22_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_fa22
result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_fa22 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_fa22_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_fa22_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_fa22_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_fa22_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_fa22
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_fa22 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_fa22_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_fa22_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_fa22_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_fa22_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2592_c7_fa22
result_u8_value_MUX_uxn_opcodes_h_l2592_c7_fa22 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2592_c7_fa22_cond,
result_u8_value_MUX_uxn_opcodes_h_l2592_c7_fa22_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2592_c7_fa22_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2592_c7_fa22_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2594_c31_6455
CONST_SR_8_uxn_opcodes_h_l2594_c31_6455 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2594_c31_6455_x,
CONST_SR_8_uxn_opcodes_h_l2594_c31_6455_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2596_c11_e52a
BIN_OP_EQ_uxn_opcodes_h_l2596_c11_e52a : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2596_c11_e52a_left,
BIN_OP_EQ_uxn_opcodes_h_l2596_c11_e52a_right,
BIN_OP_EQ_uxn_opcodes_h_l2596_c11_e52a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2596_c7_303d
result_is_stack_write_MUX_uxn_opcodes_h_l2596_c7_303d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2596_c7_303d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2596_c7_303d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2596_c7_303d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2596_c7_303d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2596_c7_303d
result_is_opc_done_MUX_uxn_opcodes_h_l2596_c7_303d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2596_c7_303d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2596_c7_303d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2596_c7_303d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2596_c7_303d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2596_c7_303d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2596_c7_303d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2596_c7_303d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2596_c7_303d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2596_c7_303d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2596_c7_303d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2596_c7_303d
result_u8_value_MUX_uxn_opcodes_h_l2596_c7_303d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2596_c7_303d_cond,
result_u8_value_MUX_uxn_opcodes_h_l2596_c7_303d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2596_c7_303d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2596_c7_303d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2600_c11_f5e3
BIN_OP_EQ_uxn_opcodes_h_l2600_c11_f5e3 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2600_c11_f5e3_left,
BIN_OP_EQ_uxn_opcodes_h_l2600_c11_f5e3_right,
BIN_OP_EQ_uxn_opcodes_h_l2600_c11_f5e3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2600_c7_9eb5
result_is_stack_write_MUX_uxn_opcodes_h_l2600_c7_9eb5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2600_c7_9eb5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2600_c7_9eb5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2600_c7_9eb5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2600_c7_9eb5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2600_c7_9eb5
result_is_opc_done_MUX_uxn_opcodes_h_l2600_c7_9eb5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2600_c7_9eb5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2600_c7_9eb5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2600_c7_9eb5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2600_c7_9eb5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c7_9eb5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c7_9eb5 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c7_9eb5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c7_9eb5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c7_9eb5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c7_9eb5_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2600_c7_9eb5
result_u8_value_MUX_uxn_opcodes_h_l2600_c7_9eb5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2600_c7_9eb5_cond,
result_u8_value_MUX_uxn_opcodes_h_l2600_c7_9eb5_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2600_c7_9eb5_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2600_c7_9eb5_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2602_c31_31c1
CONST_SR_8_uxn_opcodes_h_l2602_c31_31c1 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2602_c31_31c1_x,
CONST_SR_8_uxn_opcodes_h_l2602_c31_31c1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2604_c11_b02a
BIN_OP_EQ_uxn_opcodes_h_l2604_c11_b02a : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2604_c11_b02a_left,
BIN_OP_EQ_uxn_opcodes_h_l2604_c11_b02a_right,
BIN_OP_EQ_uxn_opcodes_h_l2604_c11_b02a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_4d94
result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_4d94 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_4d94_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_4d94_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_4d94_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_4d94_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_4d94
result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_4d94 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_4d94_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_4d94_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_4d94_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_4d94_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2566_l2557_l2575_DUPLICATE_d178
CONST_SL_8_uint16_t_uxn_opcodes_h_l2566_l2557_l2575_DUPLICATE_d178 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l2566_l2557_l2575_DUPLICATE_d178_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l2566_l2557_l2575_DUPLICATE_d178_return_output);



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
 l16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l2547_c6_5eb9_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2547_c1_cdf3_return_output,
 n16_MUX_uxn_opcodes_h_l2547_c2_7390_return_output,
 l16_MUX_uxn_opcodes_h_l2547_c2_7390_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_7390_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_7390_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2547_c2_7390_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_7390_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_7390_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2547_c2_7390_return_output,
 t16_MUX_uxn_opcodes_h_l2547_c2_7390_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2552_c11_a7f7_return_output,
 n16_MUX_uxn_opcodes_h_l2552_c7_e069_return_output,
 l16_MUX_uxn_opcodes_h_l2552_c7_e069_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2552_c7_e069_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2552_c7_e069_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2552_c7_e069_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2552_c7_e069_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2552_c7_e069_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2552_c7_e069_return_output,
 t16_MUX_uxn_opcodes_h_l2552_c7_e069_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2555_c11_5e76_return_output,
 n16_MUX_uxn_opcodes_h_l2555_c7_aa0e_return_output,
 l16_MUX_uxn_opcodes_h_l2555_c7_aa0e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2555_c7_aa0e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2555_c7_aa0e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2555_c7_aa0e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2555_c7_aa0e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2555_c7_aa0e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2555_c7_aa0e_return_output,
 t16_MUX_uxn_opcodes_h_l2555_c7_aa0e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2560_c11_714c_return_output,
 n16_MUX_uxn_opcodes_h_l2560_c7_c7fa_return_output,
 l16_MUX_uxn_opcodes_h_l2560_c7_c7fa_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_c7fa_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_c7fa_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2560_c7_c7fa_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_c7fa_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_c7fa_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2560_c7_c7fa_return_output,
 t16_MUX_uxn_opcodes_h_l2560_c7_c7fa_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2561_c3_509c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2564_c11_ac25_return_output,
 n16_MUX_uxn_opcodes_h_l2564_c7_3d9c_return_output,
 l16_MUX_uxn_opcodes_h_l2564_c7_3d9c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_3d9c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_3d9c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2564_c7_3d9c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_3d9c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_3d9c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2564_c7_3d9c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2569_c11_3b0b_return_output,
 n16_MUX_uxn_opcodes_h_l2569_c7_29d9_return_output,
 l16_MUX_uxn_opcodes_h_l2569_c7_29d9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2569_c7_29d9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2569_c7_29d9_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2569_c7_29d9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2569_c7_29d9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2569_c7_29d9_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2569_c7_29d9_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2570_c3_486a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2573_c11_e3b8_return_output,
 l16_MUX_uxn_opcodes_h_l2573_c7_4cd3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2573_c7_4cd3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2573_c7_4cd3_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2573_c7_4cd3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2573_c7_4cd3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2573_c7_4cd3_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2573_c7_4cd3_return_output,
 sp_relative_shift_uxn_opcodes_h_l2577_c30_28d3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2582_c11_5036_return_output,
 l16_MUX_uxn_opcodes_h_l2582_c7_a535_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2582_c7_a535_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2582_c7_a535_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2582_c7_a535_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2582_c7_a535_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2582_c7_a535_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2583_c3_78a5_return_output,
 CONST_SR_8_uxn_opcodes_h_l2586_c31_1d41_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2588_c11_6301_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2588_c7_f4e0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2588_c7_f4e0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2588_c7_f4e0_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2588_c7_f4e0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2592_c11_baee_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_fa22_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_fa22_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_fa22_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2592_c7_fa22_return_output,
 CONST_SR_8_uxn_opcodes_h_l2594_c31_6455_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2596_c11_e52a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2596_c7_303d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2596_c7_303d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2596_c7_303d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2596_c7_303d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2600_c11_f5e3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2600_c7_9eb5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2600_c7_9eb5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c7_9eb5_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2600_c7_9eb5_return_output,
 CONST_SR_8_uxn_opcodes_h_l2602_c31_31c1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2604_c11_b02a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_4d94_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_4d94_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l2566_l2557_l2575_DUPLICATE_d178_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2547_c6_5eb9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2547_c6_5eb9_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2547_c6_5eb9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2547_c1_cdf3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2547_c1_cdf3_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2547_c1_cdf3_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2547_c1_cdf3_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2547_c2_7390_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2547_c2_7390_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2552_c7_e069_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2547_c2_7390_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2547_c2_7390_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2547_c2_7390_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2547_c2_7390_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2552_c7_e069_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2547_c2_7390_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2547_c2_7390_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_7390_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_7390_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2552_c7_e069_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_7390_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_7390_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_7390_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2549_c3_f719 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_7390_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2552_c7_e069_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_7390_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_7390_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2547_c2_7390_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2547_c2_7390_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2552_c7_e069_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2547_c2_7390_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2547_c2_7390_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_7390_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_7390_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2552_c7_e069_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_7390_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_7390_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_7390_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_7390_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2552_c7_e069_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_7390_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_7390_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2547_c2_7390_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2547_c2_7390_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2552_c7_e069_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2547_c2_7390_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2547_c2_7390_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2547_c2_7390_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2547_c2_7390_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2552_c7_e069_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2547_c2_7390_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2547_c2_7390_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2548_c3_8fe3_uxn_opcodes_h_l2548_c3_8fe3_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2552_c11_a7f7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2552_c11_a7f7_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2552_c11_a7f7_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2552_c7_e069_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2552_c7_e069_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2555_c7_aa0e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2552_c7_e069_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2552_c7_e069_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2552_c7_e069_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2555_c7_aa0e_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2552_c7_e069_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2552_c7_e069_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2552_c7_e069_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2555_c7_aa0e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2552_c7_e069_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2552_c7_e069_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2553_c3_abae : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2552_c7_e069_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2555_c7_aa0e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2552_c7_e069_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2552_c7_e069_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2552_c7_e069_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2555_c7_aa0e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2552_c7_e069_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2552_c7_e069_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2552_c7_e069_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2555_c7_aa0e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2552_c7_e069_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2552_c7_e069_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2552_c7_e069_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2555_c7_aa0e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2552_c7_e069_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2552_c7_e069_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2552_c7_e069_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2555_c7_aa0e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2552_c7_e069_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2552_c7_e069_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2552_c7_e069_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2555_c7_aa0e_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2552_c7_e069_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2555_c11_5e76_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2555_c11_5e76_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2555_c11_5e76_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2555_c7_aa0e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2555_c7_aa0e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2560_c7_c7fa_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2555_c7_aa0e_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2555_c7_aa0e_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2555_c7_aa0e_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2560_c7_c7fa_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2555_c7_aa0e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2555_c7_aa0e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2555_c7_aa0e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_c7fa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2555_c7_aa0e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2555_c7_aa0e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2558_c3_ce2b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2555_c7_aa0e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_c7fa_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2555_c7_aa0e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2555_c7_aa0e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2555_c7_aa0e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2560_c7_c7fa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2555_c7_aa0e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2555_c7_aa0e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2555_c7_aa0e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_c7fa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2555_c7_aa0e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2555_c7_aa0e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2555_c7_aa0e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_c7fa_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2555_c7_aa0e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2555_c7_aa0e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2555_c7_aa0e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2560_c7_c7fa_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2555_c7_aa0e_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2555_c7_aa0e_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2555_c7_aa0e_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2560_c7_c7fa_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2555_c7_aa0e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2560_c11_714c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2560_c11_714c_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2560_c11_714c_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2560_c7_c7fa_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2560_c7_c7fa_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2564_c7_3d9c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2560_c7_c7fa_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2560_c7_c7fa_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2560_c7_c7fa_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2564_c7_3d9c_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2560_c7_c7fa_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_c7fa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_c7fa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_3d9c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_c7fa_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_c7fa_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2562_c3_1a65 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_c7fa_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_3d9c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_c7fa_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2560_c7_c7fa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2560_c7_c7fa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2564_c7_3d9c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2560_c7_c7fa_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_c7fa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_c7fa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_3d9c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_c7fa_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_c7fa_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_c7fa_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_3d9c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_c7fa_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2560_c7_c7fa_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2560_c7_c7fa_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2564_c7_3d9c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2560_c7_c7fa_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2560_c7_c7fa_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2560_c7_c7fa_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2560_c7_c7fa_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2561_c3_509c_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2561_c3_509c_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2561_c3_509c_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c11_ac25_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c11_ac25_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c11_ac25_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2564_c7_3d9c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2564_c7_3d9c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2569_c7_29d9_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2564_c7_3d9c_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2564_c7_3d9c_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2564_c7_3d9c_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2569_c7_29d9_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2564_c7_3d9c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_3d9c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_3d9c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2569_c7_29d9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_3d9c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_3d9c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2567_c3_c29a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_3d9c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2569_c7_29d9_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_3d9c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2564_c7_3d9c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2564_c7_3d9c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2569_c7_29d9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2564_c7_3d9c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_3d9c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_3d9c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2569_c7_29d9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_3d9c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_3d9c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_3d9c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2569_c7_29d9_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_3d9c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2564_c7_3d9c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2564_c7_3d9c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2569_c7_29d9_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2564_c7_3d9c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2569_c11_3b0b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2569_c11_3b0b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2569_c11_3b0b_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2569_c7_29d9_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2569_c7_29d9_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2569_c7_29d9_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2569_c7_29d9_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2569_c7_29d9_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2573_c7_4cd3_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2569_c7_29d9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2569_c7_29d9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2569_c7_29d9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2573_c7_4cd3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2569_c7_29d9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2569_c7_29d9_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2571_c3_a0af : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2569_c7_29d9_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2573_c7_4cd3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2569_c7_29d9_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2569_c7_29d9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2569_c7_29d9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2573_c7_4cd3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2569_c7_29d9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2569_c7_29d9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2569_c7_29d9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2573_c7_4cd3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2569_c7_29d9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2569_c7_29d9_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2569_c7_29d9_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2573_c7_4cd3_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2569_c7_29d9_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2569_c7_29d9_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2569_c7_29d9_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2573_c7_4cd3_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2569_c7_29d9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2570_c3_486a_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2570_c3_486a_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2570_c3_486a_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2573_c11_e3b8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2573_c11_e3b8_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2573_c11_e3b8_return_output : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2573_c7_4cd3_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2573_c7_4cd3_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2582_c7_a535_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2573_c7_4cd3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2573_c7_4cd3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2573_c7_4cd3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2582_c7_a535_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2573_c7_4cd3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2573_c7_4cd3_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2579_c3_c6f7 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2573_c7_4cd3_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2582_c7_a535_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2573_c7_4cd3_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2573_c7_4cd3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2573_c7_4cd3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2582_c7_a535_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2573_c7_4cd3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2573_c7_4cd3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2573_c7_4cd3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2582_c7_a535_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2573_c7_4cd3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2573_c7_4cd3_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2573_c7_4cd3_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2573_c7_4cd3_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2573_c7_4cd3_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2573_c7_4cd3_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2582_c7_a535_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2573_c7_4cd3_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2577_c30_28d3_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2577_c30_28d3_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2577_c30_28d3_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2577_c30_28d3_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2580_c21_f3c9_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2582_c11_5036_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2582_c11_5036_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2582_c11_5036_return_output : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2582_c7_a535_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2582_c7_a535_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2582_c7_a535_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2582_c7_a535_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2582_c7_a535_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2588_c7_f4e0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2582_c7_a535_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2582_c7_a535_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2585_c3_cf11 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2582_c7_a535_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2588_c7_f4e0_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2582_c7_a535_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2582_c7_a535_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2582_c7_a535_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2582_c7_a535_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2582_c7_a535_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2582_c7_a535_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2588_c7_f4e0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2582_c7_a535_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2582_c7_a535_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2582_c7_a535_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2588_c7_f4e0_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2582_c7_a535_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2583_c3_78a5_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2583_c3_78a5_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2583_c3_78a5_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2586_c31_1d41_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2586_c31_1d41_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2586_c21_7873_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2588_c11_6301_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2588_c11_6301_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2588_c11_6301_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2588_c7_f4e0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2588_c7_f4e0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_fa22_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2588_c7_f4e0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2588_c7_f4e0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2588_c7_f4e0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_fa22_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2588_c7_f4e0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2588_c7_f4e0_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2589_c3_9d56 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2588_c7_f4e0_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_fa22_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2588_c7_f4e0_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2588_c7_f4e0_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2588_c7_f4e0_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2592_c7_fa22_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2588_c7_f4e0_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2590_c21_7969_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2592_c11_baee_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2592_c11_baee_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2592_c11_baee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_fa22_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_fa22_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2596_c7_303d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_fa22_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_fa22_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_fa22_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2596_c7_303d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_fa22_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_fa22_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2593_c3_dc5c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_fa22_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2596_c7_303d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_fa22_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2592_c7_fa22_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2592_c7_fa22_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2596_c7_303d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2592_c7_fa22_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2594_c31_6455_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2594_c31_6455_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2594_c21_b8c4_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2596_c11_e52a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2596_c11_e52a_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2596_c11_e52a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2596_c7_303d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2596_c7_303d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2600_c7_9eb5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2596_c7_303d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2596_c7_303d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2596_c7_303d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2600_c7_9eb5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2596_c7_303d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2596_c7_303d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2597_c3_5166 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2596_c7_303d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c7_9eb5_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2596_c7_303d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2596_c7_303d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2596_c7_303d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2600_c7_9eb5_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2596_c7_303d_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2598_c21_1727_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2600_c11_f5e3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2600_c11_f5e3_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2600_c11_f5e3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2600_c7_9eb5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2600_c7_9eb5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_4d94_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2600_c7_9eb5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2600_c7_9eb5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2600_c7_9eb5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_4d94_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2600_c7_9eb5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c7_9eb5_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2601_c3_14a2 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c7_9eb5_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2600_c7_9eb5_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c7_9eb5_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2600_c7_9eb5_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2600_c7_9eb5_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2600_c7_9eb5_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2602_c31_31c1_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2602_c31_31c1_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2602_c21_3178_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2604_c11_b02a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2604_c11_b02a_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2604_c11_b02a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_4d94_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_4d94_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_4d94_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_4d94_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_4d94_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_4d94_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2547_l2604_l2569_l2600_l2564_l2596_l2560_l2592_l2555_l2588_l2552_l2582_DUPLICATE_1ac9_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2547_l2569_l2564_l2560_l2555_l2552_l2582_DUPLICATE_b62e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2547_l2573_l2569_l2564_l2560_l2555_l2552_DUPLICATE_4331_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2547_l2569_l2600_l2564_l2560_l2555_l2552_DUPLICATE_5536_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2573_l2604_l2569_l2600_l2564_l2596_l2560_l2592_l2555_l2588_l2552_l2582_DUPLICATE_f275_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2561_l2565_l2556_l2574_l2583_l2570_DUPLICATE_a62a_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2566_l2557_l2575_DUPLICATE_d178_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2566_l2557_l2575_DUPLICATE_d178_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5b93_uxn_opcodes_h_l2609_l2543_DUPLICATE_7bbb_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2562_c3_1a65 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_c7fa_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2562_c3_1a65;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2579_c3_c6f7 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2573_c7_4cd3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2579_c3_c6f7;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2547_c6_5eb9_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2597_c3_5166 := resize(to_unsigned(5, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2596_c7_303d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2597_c3_5166;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2582_c7_a535_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2596_c11_e52a_right := to_unsigned(10, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2604_c11_b02a_right := to_unsigned(12, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c11_ac25_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2592_c11_baee_right := to_unsigned(9, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2588_c11_6301_right := to_unsigned(8, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2553_c3_abae := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2552_c7_e069_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2553_c3_abae;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_4d94_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2589_c3_9d56 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2588_c7_f4e0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2589_c3_9d56;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2585_c3_cf11 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2582_c7_a535_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2585_c3_cf11;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2573_c7_4cd3_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2573_c7_4cd3_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2601_c3_14a2 := resize(to_unsigned(6, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c7_9eb5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2601_c3_14a2;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2569_c11_3b0b_right := to_unsigned(5, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_4d94_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2577_c30_28d3_x := signed(std_logic_vector(resize(to_unsigned(6, 3), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2571_c3_a0af := resize(to_unsigned(5, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2569_c7_29d9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2571_c3_a0af;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2549_c3_f719 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_7390_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2549_c3_f719;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2567_c3_c29a := resize(to_unsigned(6, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_3d9c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2567_c3_c29a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2600_c11_f5e3_right := to_unsigned(11, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2593_c3_dc5c := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_fa22_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2593_c3_dc5c;
     VAR_sp_relative_shift_uxn_opcodes_h_l2577_c30_28d3_y := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2558_c3_ce2b := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2555_c7_aa0e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2558_c3_ce2b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2560_c11_714c_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2582_c11_5036_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2573_c11_e3b8_right := to_unsigned(6, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_7390_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2552_c11_a7f7_right := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2547_c1_cdf3_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2555_c11_5e76_right := to_unsigned(2, 2);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2547_c1_cdf3_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l2577_c30_28d3_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2583_c3_78a5_left := l16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2594_c31_6455_x := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2547_c2_7390_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2552_c7_e069_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2555_c7_aa0e_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2560_c7_c7fa_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2564_c7_3d9c_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2569_c7_29d9_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2582_c7_a535_iffalse := l16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2570_c3_486a_left := n16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2602_c31_31c1_x := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2547_c2_7390_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2552_c7_e069_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2555_c7_aa0e_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2560_c7_c7fa_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2569_c7_29d9_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2547_c6_5eb9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2552_c11_a7f7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2555_c11_5e76_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2560_c11_714c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c11_ac25_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2569_c11_3b0b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2573_c11_e3b8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2582_c11_5036_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2588_c11_6301_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2592_c11_baee_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2596_c11_e52a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2600_c11_f5e3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2604_c11_b02a_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2561_c3_509c_left := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2586_c31_1d41_x := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2547_c2_7390_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2552_c7_e069_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2560_c7_c7fa_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l2569_c11_3b0b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2569_c11_3b0b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2569_c11_3b0b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2569_c11_3b0b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2569_c11_3b0b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2569_c11_3b0b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2569_c11_3b0b_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2573_l2604_l2569_l2600_l2564_l2596_l2560_l2592_l2555_l2588_l2552_l2582_DUPLICATE_f275 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2573_l2604_l2569_l2600_l2564_l2596_l2560_l2592_l2555_l2588_l2552_l2582_DUPLICATE_f275_return_output := result.is_opc_done;

     -- CONST_SR_8[uxn_opcodes_h_l2586_c31_1d41] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2586_c31_1d41_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2586_c31_1d41_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2586_c31_1d41_return_output := CONST_SR_8_uxn_opcodes_h_l2586_c31_1d41_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2588_c11_6301] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2588_c11_6301_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2588_c11_6301_left;
     BIN_OP_EQ_uxn_opcodes_h_l2588_c11_6301_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2588_c11_6301_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2588_c11_6301_return_output := BIN_OP_EQ_uxn_opcodes_h_l2588_c11_6301_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2590_c21_7969] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2590_c21_7969_return_output := CAST_TO_uint8_t_uint16_t(
     l16);

     -- BIN_OP_EQ[uxn_opcodes_h_l2564_c11_ac25] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2564_c11_ac25_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c11_ac25_left;
     BIN_OP_EQ_uxn_opcodes_h_l2564_c11_ac25_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c11_ac25_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c11_ac25_return_output := BIN_OP_EQ_uxn_opcodes_h_l2564_c11_ac25_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2555_c11_5e76] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2555_c11_5e76_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2555_c11_5e76_left;
     BIN_OP_EQ_uxn_opcodes_h_l2555_c11_5e76_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2555_c11_5e76_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2555_c11_5e76_return_output := BIN_OP_EQ_uxn_opcodes_h_l2555_c11_5e76_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2580_c21_f3c9] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2580_c21_f3c9_return_output := CAST_TO_uint8_t_uint16_t(
     t16);

     -- BIN_OP_EQ[uxn_opcodes_h_l2604_c11_b02a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2604_c11_b02a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2604_c11_b02a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2604_c11_b02a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2604_c11_b02a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2604_c11_b02a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2604_c11_b02a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2600_c11_f5e3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2600_c11_f5e3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2600_c11_f5e3_left;
     BIN_OP_EQ_uxn_opcodes_h_l2600_c11_f5e3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2600_c11_f5e3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2600_c11_f5e3_return_output := BIN_OP_EQ_uxn_opcodes_h_l2600_c11_f5e3_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2547_l2569_l2600_l2564_l2560_l2555_l2552_DUPLICATE_5536 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2547_l2569_l2600_l2564_l2560_l2555_l2552_DUPLICATE_5536_return_output := result.u8_value;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2547_l2573_l2569_l2564_l2560_l2555_l2552_DUPLICATE_4331 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2547_l2573_l2569_l2564_l2560_l2555_l2552_DUPLICATE_4331_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2547_c6_5eb9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2547_c6_5eb9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2547_c6_5eb9_left;
     BIN_OP_EQ_uxn_opcodes_h_l2547_c6_5eb9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2547_c6_5eb9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2547_c6_5eb9_return_output := BIN_OP_EQ_uxn_opcodes_h_l2547_c6_5eb9_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2598_c21_1727] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2598_c21_1727_return_output := CAST_TO_uint8_t_uint16_t(
     n16);

     -- BIN_OP_EQ[uxn_opcodes_h_l2596_c11_e52a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2596_c11_e52a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2596_c11_e52a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2596_c11_e52a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2596_c11_e52a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2596_c11_e52a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2596_c11_e52a_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l2577_c30_28d3] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2577_c30_28d3_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2577_c30_28d3_ins;
     sp_relative_shift_uxn_opcodes_h_l2577_c30_28d3_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2577_c30_28d3_x;
     sp_relative_shift_uxn_opcodes_h_l2577_c30_28d3_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2577_c30_28d3_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2577_c30_28d3_return_output := sp_relative_shift_uxn_opcodes_h_l2577_c30_28d3_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l2594_c31_6455] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2594_c31_6455_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2594_c31_6455_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2594_c31_6455_return_output := CONST_SR_8_uxn_opcodes_h_l2594_c31_6455_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2582_c11_5036] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2582_c11_5036_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2582_c11_5036_left;
     BIN_OP_EQ_uxn_opcodes_h_l2582_c11_5036_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2582_c11_5036_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2582_c11_5036_return_output := BIN_OP_EQ_uxn_opcodes_h_l2582_c11_5036_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2547_l2569_l2564_l2560_l2555_l2552_l2582_DUPLICATE_b62e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2547_l2569_l2564_l2560_l2555_l2552_l2582_DUPLICATE_b62e_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2547_l2604_l2569_l2600_l2564_l2596_l2560_l2592_l2555_l2588_l2552_l2582_DUPLICATE_1ac9 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2547_l2604_l2569_l2600_l2564_l2596_l2560_l2592_l2555_l2588_l2552_l2582_DUPLICATE_1ac9_return_output := result.is_stack_write;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2600_c7_9eb5] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2600_c7_9eb5_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2592_c11_baee] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2592_c11_baee_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2592_c11_baee_left;
     BIN_OP_EQ_uxn_opcodes_h_l2592_c11_baee_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2592_c11_baee_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2592_c11_baee_return_output := BIN_OP_EQ_uxn_opcodes_h_l2592_c11_baee_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2560_c11_714c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2560_c11_714c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2560_c11_714c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2560_c11_714c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2560_c11_714c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2560_c11_714c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2560_c11_714c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2552_c11_a7f7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2552_c11_a7f7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2552_c11_a7f7_left;
     BIN_OP_EQ_uxn_opcodes_h_l2552_c11_a7f7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2552_c11_a7f7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2552_c11_a7f7_return_output := BIN_OP_EQ_uxn_opcodes_h_l2552_c11_a7f7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2573_c11_e3b8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2573_c11_e3b8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2573_c11_e3b8_left;
     BIN_OP_EQ_uxn_opcodes_h_l2573_c11_e3b8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2573_c11_e3b8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2573_c11_e3b8_return_output := BIN_OP_EQ_uxn_opcodes_h_l2573_c11_e3b8_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l2602_c31_31c1] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2602_c31_31c1_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2602_c31_31c1_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2602_c31_31c1_return_output := CONST_SR_8_uxn_opcodes_h_l2602_c31_31c1_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2561_l2565_l2556_l2574_l2583_l2570_DUPLICATE_a62a LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2561_l2565_l2556_l2574_l2583_l2570_DUPLICATE_a62a_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2547_c1_cdf3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2547_c6_5eb9_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2547_c2_7390_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2547_c6_5eb9_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2547_c2_7390_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2547_c6_5eb9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_7390_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2547_c6_5eb9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2547_c2_7390_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2547_c6_5eb9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_7390_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2547_c6_5eb9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_7390_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2547_c6_5eb9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_7390_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2547_c6_5eb9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2547_c2_7390_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2547_c6_5eb9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2547_c2_7390_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2547_c6_5eb9_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2552_c7_e069_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2552_c11_a7f7_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2552_c7_e069_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2552_c11_a7f7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2552_c7_e069_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2552_c11_a7f7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2552_c7_e069_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2552_c11_a7f7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2552_c7_e069_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2552_c11_a7f7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2552_c7_e069_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2552_c11_a7f7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2552_c7_e069_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2552_c11_a7f7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2552_c7_e069_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2552_c11_a7f7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2552_c7_e069_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2552_c11_a7f7_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2555_c7_aa0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2555_c11_5e76_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2555_c7_aa0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2555_c11_5e76_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2555_c7_aa0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2555_c11_5e76_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2555_c7_aa0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2555_c11_5e76_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2555_c7_aa0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2555_c11_5e76_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2555_c7_aa0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2555_c11_5e76_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2555_c7_aa0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2555_c11_5e76_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2555_c7_aa0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2555_c11_5e76_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2555_c7_aa0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2555_c11_5e76_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2560_c7_c7fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2560_c11_714c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2560_c7_c7fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2560_c11_714c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_c7fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2560_c11_714c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2560_c7_c7fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2560_c11_714c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_c7fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2560_c11_714c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_c7fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2560_c11_714c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_c7fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2560_c11_714c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2560_c7_c7fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2560_c11_714c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2560_c7_c7fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2560_c11_714c_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2564_c7_3d9c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c11_ac25_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2564_c7_3d9c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c11_ac25_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_3d9c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c11_ac25_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2564_c7_3d9c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c11_ac25_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_3d9c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c11_ac25_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_3d9c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c11_ac25_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_3d9c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c11_ac25_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2564_c7_3d9c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c11_ac25_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2569_c7_29d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2569_c11_3b0b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2569_c7_29d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2569_c11_3b0b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2569_c7_29d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2569_c11_3b0b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2569_c7_29d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2569_c11_3b0b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2569_c7_29d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2569_c11_3b0b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2569_c7_29d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2569_c11_3b0b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2569_c7_29d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2569_c11_3b0b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2569_c7_29d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2569_c11_3b0b_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2573_c7_4cd3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2573_c11_e3b8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2573_c7_4cd3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2573_c11_e3b8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2573_c7_4cd3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2573_c11_e3b8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2573_c7_4cd3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2573_c11_e3b8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2573_c7_4cd3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2573_c11_e3b8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2573_c7_4cd3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2573_c11_e3b8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2573_c7_4cd3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2573_c11_e3b8_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2582_c7_a535_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2582_c11_5036_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2582_c7_a535_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2582_c11_5036_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2582_c7_a535_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2582_c11_5036_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2582_c7_a535_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2582_c11_5036_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2582_c7_a535_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2582_c11_5036_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2582_c7_a535_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2582_c11_5036_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2588_c7_f4e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2588_c11_6301_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2588_c7_f4e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2588_c11_6301_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2588_c7_f4e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2588_c11_6301_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2588_c7_f4e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2588_c11_6301_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_fa22_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2592_c11_baee_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_fa22_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2592_c11_baee_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_fa22_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2592_c11_baee_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2592_c7_fa22_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2592_c11_baee_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2596_c7_303d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2596_c11_e52a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2596_c7_303d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2596_c11_e52a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2596_c7_303d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2596_c11_e52a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2596_c7_303d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2596_c11_e52a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2600_c7_9eb5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2600_c11_f5e3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2600_c7_9eb5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2600_c11_f5e3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c7_9eb5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2600_c11_f5e3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2600_c7_9eb5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2600_c11_f5e3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_4d94_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2604_c11_b02a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_4d94_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2604_c11_b02a_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2561_c3_509c_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2561_l2565_l2556_l2574_l2583_l2570_DUPLICATE_a62a_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2570_c3_486a_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2561_l2565_l2556_l2574_l2583_l2570_DUPLICATE_a62a_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2583_c3_78a5_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2561_l2565_l2556_l2574_l2583_l2570_DUPLICATE_a62a_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2566_l2557_l2575_DUPLICATE_d178_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2561_l2565_l2556_l2574_l2583_l2570_DUPLICATE_a62a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2573_c7_4cd3_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2580_c21_f3c9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2588_c7_f4e0_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2590_c21_7969_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2596_c7_303d_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2598_c21_1727_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_7390_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2547_l2573_l2569_l2564_l2560_l2555_l2552_DUPLICATE_4331_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2552_c7_e069_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2547_l2573_l2569_l2564_l2560_l2555_l2552_DUPLICATE_4331_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2555_c7_aa0e_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2547_l2573_l2569_l2564_l2560_l2555_l2552_DUPLICATE_4331_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_c7fa_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2547_l2573_l2569_l2564_l2560_l2555_l2552_DUPLICATE_4331_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_3d9c_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2547_l2573_l2569_l2564_l2560_l2555_l2552_DUPLICATE_4331_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2569_c7_29d9_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2547_l2573_l2569_l2564_l2560_l2555_l2552_DUPLICATE_4331_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2573_c7_4cd3_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2547_l2573_l2569_l2564_l2560_l2555_l2552_DUPLICATE_4331_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2552_c7_e069_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2573_l2604_l2569_l2600_l2564_l2596_l2560_l2592_l2555_l2588_l2552_l2582_DUPLICATE_f275_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2555_c7_aa0e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2573_l2604_l2569_l2600_l2564_l2596_l2560_l2592_l2555_l2588_l2552_l2582_DUPLICATE_f275_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_c7fa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2573_l2604_l2569_l2600_l2564_l2596_l2560_l2592_l2555_l2588_l2552_l2582_DUPLICATE_f275_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_3d9c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2573_l2604_l2569_l2600_l2564_l2596_l2560_l2592_l2555_l2588_l2552_l2582_DUPLICATE_f275_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2569_c7_29d9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2573_l2604_l2569_l2600_l2564_l2596_l2560_l2592_l2555_l2588_l2552_l2582_DUPLICATE_f275_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2573_c7_4cd3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2573_l2604_l2569_l2600_l2564_l2596_l2560_l2592_l2555_l2588_l2552_l2582_DUPLICATE_f275_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2582_c7_a535_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2573_l2604_l2569_l2600_l2564_l2596_l2560_l2592_l2555_l2588_l2552_l2582_DUPLICATE_f275_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2588_c7_f4e0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2573_l2604_l2569_l2600_l2564_l2596_l2560_l2592_l2555_l2588_l2552_l2582_DUPLICATE_f275_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_fa22_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2573_l2604_l2569_l2600_l2564_l2596_l2560_l2592_l2555_l2588_l2552_l2582_DUPLICATE_f275_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2596_c7_303d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2573_l2604_l2569_l2600_l2564_l2596_l2560_l2592_l2555_l2588_l2552_l2582_DUPLICATE_f275_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2600_c7_9eb5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2573_l2604_l2569_l2600_l2564_l2596_l2560_l2592_l2555_l2588_l2552_l2582_DUPLICATE_f275_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_4d94_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2573_l2604_l2569_l2600_l2564_l2596_l2560_l2592_l2555_l2588_l2552_l2582_DUPLICATE_f275_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2547_c2_7390_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2547_l2569_l2564_l2560_l2555_l2552_l2582_DUPLICATE_b62e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2552_c7_e069_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2547_l2569_l2564_l2560_l2555_l2552_l2582_DUPLICATE_b62e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2555_c7_aa0e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2547_l2569_l2564_l2560_l2555_l2552_l2582_DUPLICATE_b62e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2560_c7_c7fa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2547_l2569_l2564_l2560_l2555_l2552_l2582_DUPLICATE_b62e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2564_c7_3d9c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2547_l2569_l2564_l2560_l2555_l2552_l2582_DUPLICATE_b62e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2569_c7_29d9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2547_l2569_l2564_l2560_l2555_l2552_l2582_DUPLICATE_b62e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2582_c7_a535_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2547_l2569_l2564_l2560_l2555_l2552_l2582_DUPLICATE_b62e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_7390_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2547_l2604_l2569_l2600_l2564_l2596_l2560_l2592_l2555_l2588_l2552_l2582_DUPLICATE_1ac9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2552_c7_e069_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2547_l2604_l2569_l2600_l2564_l2596_l2560_l2592_l2555_l2588_l2552_l2582_DUPLICATE_1ac9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2555_c7_aa0e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2547_l2604_l2569_l2600_l2564_l2596_l2560_l2592_l2555_l2588_l2552_l2582_DUPLICATE_1ac9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_c7fa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2547_l2604_l2569_l2600_l2564_l2596_l2560_l2592_l2555_l2588_l2552_l2582_DUPLICATE_1ac9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_3d9c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2547_l2604_l2569_l2600_l2564_l2596_l2560_l2592_l2555_l2588_l2552_l2582_DUPLICATE_1ac9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2569_c7_29d9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2547_l2604_l2569_l2600_l2564_l2596_l2560_l2592_l2555_l2588_l2552_l2582_DUPLICATE_1ac9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2582_c7_a535_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2547_l2604_l2569_l2600_l2564_l2596_l2560_l2592_l2555_l2588_l2552_l2582_DUPLICATE_1ac9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2588_c7_f4e0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2547_l2604_l2569_l2600_l2564_l2596_l2560_l2592_l2555_l2588_l2552_l2582_DUPLICATE_1ac9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_fa22_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2547_l2604_l2569_l2600_l2564_l2596_l2560_l2592_l2555_l2588_l2552_l2582_DUPLICATE_1ac9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2596_c7_303d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2547_l2604_l2569_l2600_l2564_l2596_l2560_l2592_l2555_l2588_l2552_l2582_DUPLICATE_1ac9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2600_c7_9eb5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2547_l2604_l2569_l2600_l2564_l2596_l2560_l2592_l2555_l2588_l2552_l2582_DUPLICATE_1ac9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_4d94_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2547_l2604_l2569_l2600_l2564_l2596_l2560_l2592_l2555_l2588_l2552_l2582_DUPLICATE_1ac9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2547_c2_7390_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2547_l2569_l2600_l2564_l2560_l2555_l2552_DUPLICATE_5536_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2552_c7_e069_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2547_l2569_l2600_l2564_l2560_l2555_l2552_DUPLICATE_5536_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2555_c7_aa0e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2547_l2569_l2600_l2564_l2560_l2555_l2552_DUPLICATE_5536_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2560_c7_c7fa_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2547_l2569_l2600_l2564_l2560_l2555_l2552_DUPLICATE_5536_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2564_c7_3d9c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2547_l2569_l2600_l2564_l2560_l2555_l2552_DUPLICATE_5536_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2569_c7_29d9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2547_l2569_l2600_l2564_l2560_l2555_l2552_DUPLICATE_5536_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2600_c7_9eb5_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2547_l2569_l2600_l2564_l2560_l2555_l2552_DUPLICATE_5536_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c7_9eb5_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2600_c7_9eb5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2573_c7_4cd3_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2577_c30_28d3_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2604_c7_4d94] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_4d94_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_4d94_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_4d94_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_4d94_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_4d94_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_4d94_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_4d94_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_4d94_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2586_c21_7873] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2586_c21_7873_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2586_c31_1d41_return_output);

     -- BIN_OP_OR[uxn_opcodes_h_l2583_c3_78a5] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2583_c3_78a5_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2583_c3_78a5_left;
     BIN_OP_OR_uxn_opcodes_h_l2583_c3_78a5_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2583_c3_78a5_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2583_c3_78a5_return_output := BIN_OP_OR_uxn_opcodes_h_l2583_c3_78a5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2600_c7_9eb5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c7_9eb5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c7_9eb5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c7_9eb5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c7_9eb5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c7_9eb5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c7_9eb5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c7_9eb5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c7_9eb5_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2594_c21_b8c4] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2594_c21_b8c4_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2594_c31_6455_return_output);

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2604_c7_4d94] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_4d94_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_4d94_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_4d94_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_4d94_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_4d94_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_4d94_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_4d94_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_4d94_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2561_c3_509c] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2561_c3_509c_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2561_c3_509c_left;
     BIN_OP_OR_uxn_opcodes_h_l2561_c3_509c_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2561_c3_509c_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2561_c3_509c_return_output := BIN_OP_OR_uxn_opcodes_h_l2561_c3_509c_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2602_c21_3178] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2602_c21_3178_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2602_c31_31c1_return_output);

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2573_c7_4cd3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2573_c7_4cd3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2573_c7_4cd3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2573_c7_4cd3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2573_c7_4cd3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2573_c7_4cd3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2573_c7_4cd3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2573_c7_4cd3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2573_c7_4cd3_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2547_c1_cdf3] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2547_c1_cdf3_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2547_c1_cdf3_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2547_c1_cdf3_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2547_c1_cdf3_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2547_c1_cdf3_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2547_c1_cdf3_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2547_c1_cdf3_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2547_c1_cdf3_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l2566_l2557_l2575_DUPLICATE_d178 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l2566_l2557_l2575_DUPLICATE_d178_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2566_l2557_l2575_DUPLICATE_d178_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2566_l2557_l2575_DUPLICATE_d178_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l2566_l2557_l2575_DUPLICATE_d178_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2582_c7_a535] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2582_c7_a535_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2582_c7_a535_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2582_c7_a535_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2582_c7_a535_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2582_c7_a535_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2582_c7_a535_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2582_c7_a535_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2582_c7_a535_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2570_c3_486a] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2570_c3_486a_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2570_c3_486a_left;
     BIN_OP_OR_uxn_opcodes_h_l2570_c3_486a_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2570_c3_486a_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2570_c3_486a_return_output := BIN_OP_OR_uxn_opcodes_h_l2570_c3_486a_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l2560_c7_c7fa_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2561_c3_509c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2569_c7_29d9_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2570_c3_486a_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2582_c7_a535_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2583_c3_78a5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2582_c7_a535_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2586_c21_7873_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2592_c7_fa22_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2594_c21_b8c4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2600_c7_9eb5_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2602_c21_3178_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2573_c7_4cd3_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2566_l2557_l2575_DUPLICATE_d178_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2564_c7_3d9c_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2566_l2557_l2575_DUPLICATE_d178_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2555_c7_aa0e_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2566_l2557_l2575_DUPLICATE_d178_return_output;
     VAR_printf_uxn_opcodes_h_l2548_c3_8fe3_uxn_opcodes_h_l2548_c3_8fe3_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2547_c1_cdf3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2600_c7_9eb5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_4d94_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2573_c7_4cd3_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2582_c7_a535_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2600_c7_9eb5_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_4d94_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2569_c7_29d9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2573_c7_4cd3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2596_c7_303d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c7_9eb5_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2573_c7_4cd3] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2573_c7_4cd3_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2573_c7_4cd3_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2573_c7_4cd3_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2573_c7_4cd3_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2573_c7_4cd3_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2573_c7_4cd3_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2573_c7_4cd3_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2573_c7_4cd3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2600_c7_9eb5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2600_c7_9eb5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2600_c7_9eb5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2600_c7_9eb5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2600_c7_9eb5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2600_c7_9eb5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2600_c7_9eb5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2600_c7_9eb5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2600_c7_9eb5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2596_c7_303d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2596_c7_303d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2596_c7_303d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2596_c7_303d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2596_c7_303d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2596_c7_303d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2596_c7_303d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2596_c7_303d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2596_c7_303d_return_output;

     -- printf_uxn_opcodes_h_l2548_c3_8fe3[uxn_opcodes_h_l2548_c3_8fe3] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2548_c3_8fe3_uxn_opcodes_h_l2548_c3_8fe3_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2548_c3_8fe3_uxn_opcodes_h_l2548_c3_8fe3_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2600_c7_9eb5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2600_c7_9eb5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2600_c7_9eb5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2600_c7_9eb5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2600_c7_9eb5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2600_c7_9eb5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2600_c7_9eb5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2600_c7_9eb5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2600_c7_9eb5_return_output;

     -- t16_MUX[uxn_opcodes_h_l2560_c7_c7fa] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2560_c7_c7fa_cond <= VAR_t16_MUX_uxn_opcodes_h_l2560_c7_c7fa_cond;
     t16_MUX_uxn_opcodes_h_l2560_c7_c7fa_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2560_c7_c7fa_iftrue;
     t16_MUX_uxn_opcodes_h_l2560_c7_c7fa_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2560_c7_c7fa_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2560_c7_c7fa_return_output := t16_MUX_uxn_opcodes_h_l2560_c7_c7fa_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2600_c7_9eb5] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2600_c7_9eb5_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2600_c7_9eb5_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2600_c7_9eb5_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2600_c7_9eb5_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2600_c7_9eb5_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2600_c7_9eb5_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2600_c7_9eb5_return_output := result_u8_value_MUX_uxn_opcodes_h_l2600_c7_9eb5_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2569_c7_29d9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2569_c7_29d9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2569_c7_29d9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2569_c7_29d9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2569_c7_29d9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2569_c7_29d9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2569_c7_29d9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2569_c7_29d9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2569_c7_29d9_return_output;

     -- l16_MUX[uxn_opcodes_h_l2582_c7_a535] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2582_c7_a535_cond <= VAR_l16_MUX_uxn_opcodes_h_l2582_c7_a535_cond;
     l16_MUX_uxn_opcodes_h_l2582_c7_a535_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2582_c7_a535_iftrue;
     l16_MUX_uxn_opcodes_h_l2582_c7_a535_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2582_c7_a535_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2582_c7_a535_return_output := l16_MUX_uxn_opcodes_h_l2582_c7_a535_return_output;

     -- n16_MUX[uxn_opcodes_h_l2569_c7_29d9] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2569_c7_29d9_cond <= VAR_n16_MUX_uxn_opcodes_h_l2569_c7_29d9_cond;
     n16_MUX_uxn_opcodes_h_l2569_c7_29d9_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2569_c7_29d9_iftrue;
     n16_MUX_uxn_opcodes_h_l2569_c7_29d9_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2569_c7_29d9_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2569_c7_29d9_return_output := n16_MUX_uxn_opcodes_h_l2569_c7_29d9_return_output;

     -- Submodule level 3
     VAR_l16_MUX_uxn_opcodes_h_l2573_c7_4cd3_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2582_c7_a535_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2564_c7_3d9c_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2569_c7_29d9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2596_c7_303d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2600_c7_9eb5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2569_c7_29d9_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2573_c7_4cd3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2596_c7_303d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2600_c7_9eb5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_3d9c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2569_c7_29d9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_fa22_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2596_c7_303d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2596_c7_303d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2600_c7_9eb5_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2555_c7_aa0e_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2560_c7_c7fa_return_output;
     -- t16_MUX[uxn_opcodes_h_l2555_c7_aa0e] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2555_c7_aa0e_cond <= VAR_t16_MUX_uxn_opcodes_h_l2555_c7_aa0e_cond;
     t16_MUX_uxn_opcodes_h_l2555_c7_aa0e_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2555_c7_aa0e_iftrue;
     t16_MUX_uxn_opcodes_h_l2555_c7_aa0e_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2555_c7_aa0e_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2555_c7_aa0e_return_output := t16_MUX_uxn_opcodes_h_l2555_c7_aa0e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2592_c7_fa22] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_fa22_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_fa22_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_fa22_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_fa22_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_fa22_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_fa22_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_fa22_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_fa22_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2596_c7_303d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2596_c7_303d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2596_c7_303d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2596_c7_303d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2596_c7_303d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2596_c7_303d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2596_c7_303d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2596_c7_303d_return_output := result_u8_value_MUX_uxn_opcodes_h_l2596_c7_303d_return_output;

     -- n16_MUX[uxn_opcodes_h_l2564_c7_3d9c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2564_c7_3d9c_cond <= VAR_n16_MUX_uxn_opcodes_h_l2564_c7_3d9c_cond;
     n16_MUX_uxn_opcodes_h_l2564_c7_3d9c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2564_c7_3d9c_iftrue;
     n16_MUX_uxn_opcodes_h_l2564_c7_3d9c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2564_c7_3d9c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2564_c7_3d9c_return_output := n16_MUX_uxn_opcodes_h_l2564_c7_3d9c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2596_c7_303d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2596_c7_303d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2596_c7_303d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2596_c7_303d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2596_c7_303d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2596_c7_303d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2596_c7_303d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2596_c7_303d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2596_c7_303d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2569_c7_29d9] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2569_c7_29d9_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2569_c7_29d9_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2569_c7_29d9_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2569_c7_29d9_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2569_c7_29d9_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2569_c7_29d9_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2569_c7_29d9_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2569_c7_29d9_return_output;

     -- l16_MUX[uxn_opcodes_h_l2573_c7_4cd3] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2573_c7_4cd3_cond <= VAR_l16_MUX_uxn_opcodes_h_l2573_c7_4cd3_cond;
     l16_MUX_uxn_opcodes_h_l2573_c7_4cd3_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2573_c7_4cd3_iftrue;
     l16_MUX_uxn_opcodes_h_l2573_c7_4cd3_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2573_c7_4cd3_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2573_c7_4cd3_return_output := l16_MUX_uxn_opcodes_h_l2573_c7_4cd3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2564_c7_3d9c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_3d9c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_3d9c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_3d9c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_3d9c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_3d9c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_3d9c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_3d9c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_3d9c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2596_c7_303d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2596_c7_303d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2596_c7_303d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2596_c7_303d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2596_c7_303d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2596_c7_303d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2596_c7_303d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2596_c7_303d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2596_c7_303d_return_output;

     -- Submodule level 4
     VAR_l16_MUX_uxn_opcodes_h_l2569_c7_29d9_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2573_c7_4cd3_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2560_c7_c7fa_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2564_c7_3d9c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_fa22_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2596_c7_303d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2564_c7_3d9c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2569_c7_29d9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_fa22_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2596_c7_303d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_c7fa_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_3d9c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2588_c7_f4e0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_fa22_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2592_c7_fa22_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2596_c7_303d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2552_c7_e069_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2555_c7_aa0e_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2560_c7_c7fa] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_c7fa_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_c7fa_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_c7fa_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_c7fa_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_c7fa_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_c7fa_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_c7fa_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_c7fa_return_output;

     -- t16_MUX[uxn_opcodes_h_l2552_c7_e069] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2552_c7_e069_cond <= VAR_t16_MUX_uxn_opcodes_h_l2552_c7_e069_cond;
     t16_MUX_uxn_opcodes_h_l2552_c7_e069_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2552_c7_e069_iftrue;
     t16_MUX_uxn_opcodes_h_l2552_c7_e069_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2552_c7_e069_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2552_c7_e069_return_output := t16_MUX_uxn_opcodes_h_l2552_c7_e069_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2592_c7_fa22] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2592_c7_fa22_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2592_c7_fa22_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2592_c7_fa22_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2592_c7_fa22_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2592_c7_fa22_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2592_c7_fa22_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2592_c7_fa22_return_output := result_u8_value_MUX_uxn_opcodes_h_l2592_c7_fa22_return_output;

     -- n16_MUX[uxn_opcodes_h_l2560_c7_c7fa] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2560_c7_c7fa_cond <= VAR_n16_MUX_uxn_opcodes_h_l2560_c7_c7fa_cond;
     n16_MUX_uxn_opcodes_h_l2560_c7_c7fa_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2560_c7_c7fa_iftrue;
     n16_MUX_uxn_opcodes_h_l2560_c7_c7fa_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2560_c7_c7fa_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2560_c7_c7fa_return_output := n16_MUX_uxn_opcodes_h_l2560_c7_c7fa_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2592_c7_fa22] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_fa22_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_fa22_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_fa22_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_fa22_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_fa22_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_fa22_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_fa22_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_fa22_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2592_c7_fa22] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_fa22_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_fa22_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_fa22_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_fa22_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_fa22_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_fa22_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_fa22_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_fa22_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2588_c7_f4e0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2588_c7_f4e0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2588_c7_f4e0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2588_c7_f4e0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2588_c7_f4e0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2588_c7_f4e0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2588_c7_f4e0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2588_c7_f4e0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2588_c7_f4e0_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2564_c7_3d9c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2564_c7_3d9c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2564_c7_3d9c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2564_c7_3d9c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2564_c7_3d9c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2564_c7_3d9c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2564_c7_3d9c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2564_c7_3d9c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2564_c7_3d9c_return_output;

     -- l16_MUX[uxn_opcodes_h_l2569_c7_29d9] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2569_c7_29d9_cond <= VAR_l16_MUX_uxn_opcodes_h_l2569_c7_29d9_cond;
     l16_MUX_uxn_opcodes_h_l2569_c7_29d9_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2569_c7_29d9_iftrue;
     l16_MUX_uxn_opcodes_h_l2569_c7_29d9_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2569_c7_29d9_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2569_c7_29d9_return_output := l16_MUX_uxn_opcodes_h_l2569_c7_29d9_return_output;

     -- Submodule level 5
     VAR_l16_MUX_uxn_opcodes_h_l2564_c7_3d9c_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2569_c7_29d9_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2555_c7_aa0e_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2560_c7_c7fa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2588_c7_f4e0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_fa22_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2560_c7_c7fa_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2564_c7_3d9c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2588_c7_f4e0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_fa22_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2555_c7_aa0e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_c7fa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2582_c7_a535_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2588_c7_f4e0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2588_c7_f4e0_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2592_c7_fa22_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2547_c2_7390_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2552_c7_e069_return_output;
     -- t16_MUX[uxn_opcodes_h_l2547_c2_7390] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2547_c2_7390_cond <= VAR_t16_MUX_uxn_opcodes_h_l2547_c2_7390_cond;
     t16_MUX_uxn_opcodes_h_l2547_c2_7390_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2547_c2_7390_iftrue;
     t16_MUX_uxn_opcodes_h_l2547_c2_7390_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2547_c2_7390_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2547_c2_7390_return_output := t16_MUX_uxn_opcodes_h_l2547_c2_7390_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2588_c7_f4e0] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2588_c7_f4e0_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2588_c7_f4e0_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2588_c7_f4e0_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2588_c7_f4e0_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2588_c7_f4e0_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2588_c7_f4e0_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2588_c7_f4e0_return_output := result_u8_value_MUX_uxn_opcodes_h_l2588_c7_f4e0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2588_c7_f4e0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2588_c7_f4e0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2588_c7_f4e0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2588_c7_f4e0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2588_c7_f4e0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2588_c7_f4e0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2588_c7_f4e0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2588_c7_f4e0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2588_c7_f4e0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2582_c7_a535] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2582_c7_a535_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2582_c7_a535_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2582_c7_a535_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2582_c7_a535_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2582_c7_a535_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2582_c7_a535_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2582_c7_a535_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2582_c7_a535_return_output;

     -- l16_MUX[uxn_opcodes_h_l2564_c7_3d9c] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2564_c7_3d9c_cond <= VAR_l16_MUX_uxn_opcodes_h_l2564_c7_3d9c_cond;
     l16_MUX_uxn_opcodes_h_l2564_c7_3d9c_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2564_c7_3d9c_iftrue;
     l16_MUX_uxn_opcodes_h_l2564_c7_3d9c_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2564_c7_3d9c_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2564_c7_3d9c_return_output := l16_MUX_uxn_opcodes_h_l2564_c7_3d9c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2560_c7_c7fa] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2560_c7_c7fa_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2560_c7_c7fa_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2560_c7_c7fa_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2560_c7_c7fa_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2560_c7_c7fa_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2560_c7_c7fa_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2560_c7_c7fa_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2560_c7_c7fa_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2588_c7_f4e0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2588_c7_f4e0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2588_c7_f4e0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2588_c7_f4e0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2588_c7_f4e0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2588_c7_f4e0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2588_c7_f4e0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2588_c7_f4e0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2588_c7_f4e0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2555_c7_aa0e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2555_c7_aa0e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2555_c7_aa0e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2555_c7_aa0e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2555_c7_aa0e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2555_c7_aa0e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2555_c7_aa0e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2555_c7_aa0e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2555_c7_aa0e_return_output;

     -- n16_MUX[uxn_opcodes_h_l2555_c7_aa0e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2555_c7_aa0e_cond <= VAR_n16_MUX_uxn_opcodes_h_l2555_c7_aa0e_cond;
     n16_MUX_uxn_opcodes_h_l2555_c7_aa0e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2555_c7_aa0e_iftrue;
     n16_MUX_uxn_opcodes_h_l2555_c7_aa0e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2555_c7_aa0e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2555_c7_aa0e_return_output := n16_MUX_uxn_opcodes_h_l2555_c7_aa0e_return_output;

     -- Submodule level 6
     VAR_l16_MUX_uxn_opcodes_h_l2560_c7_c7fa_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2564_c7_3d9c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2552_c7_e069_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2555_c7_aa0e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2582_c7_a535_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2588_c7_f4e0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2555_c7_aa0e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2560_c7_c7fa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2582_c7_a535_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2588_c7_f4e0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2552_c7_e069_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2555_c7_aa0e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2573_c7_4cd3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2582_c7_a535_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2582_c7_a535_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2588_c7_f4e0_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2547_c2_7390_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2582_c7_a535] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2582_c7_a535_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2582_c7_a535_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2582_c7_a535_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2582_c7_a535_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2582_c7_a535_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2582_c7_a535_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2582_c7_a535_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2582_c7_a535_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2582_c7_a535] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2582_c7_a535_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2582_c7_a535_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2582_c7_a535_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2582_c7_a535_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2582_c7_a535_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2582_c7_a535_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2582_c7_a535_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2582_c7_a535_return_output;

     -- n16_MUX[uxn_opcodes_h_l2552_c7_e069] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2552_c7_e069_cond <= VAR_n16_MUX_uxn_opcodes_h_l2552_c7_e069_cond;
     n16_MUX_uxn_opcodes_h_l2552_c7_e069_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2552_c7_e069_iftrue;
     n16_MUX_uxn_opcodes_h_l2552_c7_e069_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2552_c7_e069_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2552_c7_e069_return_output := n16_MUX_uxn_opcodes_h_l2552_c7_e069_return_output;

     -- l16_MUX[uxn_opcodes_h_l2560_c7_c7fa] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2560_c7_c7fa_cond <= VAR_l16_MUX_uxn_opcodes_h_l2560_c7_c7fa_cond;
     l16_MUX_uxn_opcodes_h_l2560_c7_c7fa_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2560_c7_c7fa_iftrue;
     l16_MUX_uxn_opcodes_h_l2560_c7_c7fa_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2560_c7_c7fa_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2560_c7_c7fa_return_output := l16_MUX_uxn_opcodes_h_l2560_c7_c7fa_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2582_c7_a535] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2582_c7_a535_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2582_c7_a535_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2582_c7_a535_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2582_c7_a535_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2582_c7_a535_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2582_c7_a535_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2582_c7_a535_return_output := result_u8_value_MUX_uxn_opcodes_h_l2582_c7_a535_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2552_c7_e069] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2552_c7_e069_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2552_c7_e069_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2552_c7_e069_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2552_c7_e069_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2552_c7_e069_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2552_c7_e069_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2552_c7_e069_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2552_c7_e069_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2573_c7_4cd3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2573_c7_4cd3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2573_c7_4cd3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2573_c7_4cd3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2573_c7_4cd3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2573_c7_4cd3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2573_c7_4cd3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2573_c7_4cd3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2573_c7_4cd3_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2555_c7_aa0e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2555_c7_aa0e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2555_c7_aa0e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2555_c7_aa0e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2555_c7_aa0e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2555_c7_aa0e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2555_c7_aa0e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2555_c7_aa0e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2555_c7_aa0e_return_output;

     -- Submodule level 7
     VAR_l16_MUX_uxn_opcodes_h_l2555_c7_aa0e_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2560_c7_c7fa_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2547_c2_7390_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2552_c7_e069_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2573_c7_4cd3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2582_c7_a535_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2552_c7_e069_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2555_c7_aa0e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2573_c7_4cd3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2582_c7_a535_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_7390_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2552_c7_e069_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2569_c7_29d9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2573_c7_4cd3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2573_c7_4cd3_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2582_c7_a535_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2573_c7_4cd3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2573_c7_4cd3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2573_c7_4cd3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2573_c7_4cd3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2573_c7_4cd3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2573_c7_4cd3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2573_c7_4cd3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2573_c7_4cd3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2573_c7_4cd3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2569_c7_29d9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2569_c7_29d9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2569_c7_29d9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2569_c7_29d9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2569_c7_29d9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2569_c7_29d9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2569_c7_29d9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2569_c7_29d9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2569_c7_29d9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2547_c2_7390] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_7390_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_7390_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_7390_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_7390_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_7390_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_7390_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_7390_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_7390_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2573_c7_4cd3] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2573_c7_4cd3_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2573_c7_4cd3_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2573_c7_4cd3_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2573_c7_4cd3_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2573_c7_4cd3_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2573_c7_4cd3_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2573_c7_4cd3_return_output := result_u8_value_MUX_uxn_opcodes_h_l2573_c7_4cd3_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2552_c7_e069] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2552_c7_e069_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2552_c7_e069_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2552_c7_e069_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2552_c7_e069_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2552_c7_e069_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2552_c7_e069_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2552_c7_e069_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2552_c7_e069_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2573_c7_4cd3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2573_c7_4cd3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2573_c7_4cd3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2573_c7_4cd3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2573_c7_4cd3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2573_c7_4cd3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2573_c7_4cd3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2573_c7_4cd3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2573_c7_4cd3_return_output;

     -- l16_MUX[uxn_opcodes_h_l2555_c7_aa0e] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2555_c7_aa0e_cond <= VAR_l16_MUX_uxn_opcodes_h_l2555_c7_aa0e_cond;
     l16_MUX_uxn_opcodes_h_l2555_c7_aa0e_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2555_c7_aa0e_iftrue;
     l16_MUX_uxn_opcodes_h_l2555_c7_aa0e_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2555_c7_aa0e_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2555_c7_aa0e_return_output := l16_MUX_uxn_opcodes_h_l2555_c7_aa0e_return_output;

     -- n16_MUX[uxn_opcodes_h_l2547_c2_7390] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2547_c2_7390_cond <= VAR_n16_MUX_uxn_opcodes_h_l2547_c2_7390_cond;
     n16_MUX_uxn_opcodes_h_l2547_c2_7390_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2547_c2_7390_iftrue;
     n16_MUX_uxn_opcodes_h_l2547_c2_7390_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2547_c2_7390_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2547_c2_7390_return_output := n16_MUX_uxn_opcodes_h_l2547_c2_7390_return_output;

     -- Submodule level 8
     VAR_l16_MUX_uxn_opcodes_h_l2552_c7_e069_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2555_c7_aa0e_return_output;
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2547_c2_7390_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2569_c7_29d9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2573_c7_4cd3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2547_c2_7390_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2552_c7_e069_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2569_c7_29d9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2573_c7_4cd3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_3d9c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2569_c7_29d9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2569_c7_29d9_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2573_c7_4cd3_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2569_c7_29d9] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2569_c7_29d9_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2569_c7_29d9_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2569_c7_29d9_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2569_c7_29d9_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2569_c7_29d9_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2569_c7_29d9_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2569_c7_29d9_return_output := result_u8_value_MUX_uxn_opcodes_h_l2569_c7_29d9_return_output;

     -- l16_MUX[uxn_opcodes_h_l2552_c7_e069] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2552_c7_e069_cond <= VAR_l16_MUX_uxn_opcodes_h_l2552_c7_e069_cond;
     l16_MUX_uxn_opcodes_h_l2552_c7_e069_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2552_c7_e069_iftrue;
     l16_MUX_uxn_opcodes_h_l2552_c7_e069_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2552_c7_e069_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2552_c7_e069_return_output := l16_MUX_uxn_opcodes_h_l2552_c7_e069_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2547_c2_7390] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2547_c2_7390_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2547_c2_7390_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2547_c2_7390_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2547_c2_7390_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2547_c2_7390_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2547_c2_7390_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2547_c2_7390_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2547_c2_7390_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2569_c7_29d9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2569_c7_29d9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2569_c7_29d9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2569_c7_29d9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2569_c7_29d9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2569_c7_29d9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2569_c7_29d9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2569_c7_29d9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2569_c7_29d9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2564_c7_3d9c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_3d9c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_3d9c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_3d9c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_3d9c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_3d9c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_3d9c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_3d9c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_3d9c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2569_c7_29d9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2569_c7_29d9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2569_c7_29d9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2569_c7_29d9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2569_c7_29d9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2569_c7_29d9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2569_c7_29d9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2569_c7_29d9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2569_c7_29d9_return_output;

     -- Submodule level 9
     VAR_l16_MUX_uxn_opcodes_h_l2547_c2_7390_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2552_c7_e069_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_3d9c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2569_c7_29d9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_3d9c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2569_c7_29d9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_c7fa_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_3d9c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2564_c7_3d9c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2569_c7_29d9_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2564_c7_3d9c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2564_c7_3d9c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2564_c7_3d9c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2564_c7_3d9c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2564_c7_3d9c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2564_c7_3d9c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2564_c7_3d9c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2564_c7_3d9c_return_output := result_u8_value_MUX_uxn_opcodes_h_l2564_c7_3d9c_return_output;

     -- l16_MUX[uxn_opcodes_h_l2547_c2_7390] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2547_c2_7390_cond <= VAR_l16_MUX_uxn_opcodes_h_l2547_c2_7390_cond;
     l16_MUX_uxn_opcodes_h_l2547_c2_7390_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2547_c2_7390_iftrue;
     l16_MUX_uxn_opcodes_h_l2547_c2_7390_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2547_c2_7390_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2547_c2_7390_return_output := l16_MUX_uxn_opcodes_h_l2547_c2_7390_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2564_c7_3d9c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_3d9c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_3d9c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_3d9c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_3d9c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_3d9c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_3d9c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_3d9c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_3d9c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2560_c7_c7fa] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_c7fa_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_c7fa_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_c7fa_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_c7fa_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_c7fa_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_c7fa_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_c7fa_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_c7fa_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2564_c7_3d9c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_3d9c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_3d9c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_3d9c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_3d9c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_3d9c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_3d9c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_3d9c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_3d9c_return_output;

     -- Submodule level 10
     REG_VAR_l16 := VAR_l16_MUX_uxn_opcodes_h_l2547_c2_7390_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_c7fa_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_3d9c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_c7fa_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_3d9c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2555_c7_aa0e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_c7fa_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2560_c7_c7fa_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2564_c7_3d9c_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2555_c7_aa0e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2555_c7_aa0e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2555_c7_aa0e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2555_c7_aa0e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2555_c7_aa0e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2555_c7_aa0e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2555_c7_aa0e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2555_c7_aa0e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2555_c7_aa0e_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2560_c7_c7fa] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2560_c7_c7fa_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2560_c7_c7fa_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2560_c7_c7fa_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2560_c7_c7fa_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2560_c7_c7fa_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2560_c7_c7fa_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2560_c7_c7fa_return_output := result_u8_value_MUX_uxn_opcodes_h_l2560_c7_c7fa_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2560_c7_c7fa] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_c7fa_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_c7fa_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_c7fa_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_c7fa_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_c7fa_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_c7fa_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_c7fa_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_c7fa_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2560_c7_c7fa] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_c7fa_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_c7fa_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_c7fa_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_c7fa_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_c7fa_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_c7fa_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_c7fa_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_c7fa_return_output;

     -- Submodule level 11
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2555_c7_aa0e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_c7fa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2555_c7_aa0e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_c7fa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2552_c7_e069_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2555_c7_aa0e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2555_c7_aa0e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2560_c7_c7fa_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2555_c7_aa0e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2555_c7_aa0e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2555_c7_aa0e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2555_c7_aa0e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2555_c7_aa0e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2555_c7_aa0e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2555_c7_aa0e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2555_c7_aa0e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2555_c7_aa0e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2555_c7_aa0e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2555_c7_aa0e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2555_c7_aa0e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2555_c7_aa0e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2555_c7_aa0e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2555_c7_aa0e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2555_c7_aa0e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2555_c7_aa0e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2555_c7_aa0e_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2555_c7_aa0e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2555_c7_aa0e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2555_c7_aa0e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2555_c7_aa0e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2555_c7_aa0e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2555_c7_aa0e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2555_c7_aa0e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2555_c7_aa0e_return_output := result_u8_value_MUX_uxn_opcodes_h_l2555_c7_aa0e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2552_c7_e069] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2552_c7_e069_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2552_c7_e069_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2552_c7_e069_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2552_c7_e069_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2552_c7_e069_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2552_c7_e069_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2552_c7_e069_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2552_c7_e069_return_output;

     -- Submodule level 12
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2552_c7_e069_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2555_c7_aa0e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2552_c7_e069_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2555_c7_aa0e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_7390_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2552_c7_e069_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2552_c7_e069_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2555_c7_aa0e_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2547_c2_7390] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_7390_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_7390_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_7390_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_7390_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_7390_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_7390_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_7390_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_7390_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2552_c7_e069] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2552_c7_e069_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2552_c7_e069_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2552_c7_e069_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2552_c7_e069_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2552_c7_e069_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2552_c7_e069_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2552_c7_e069_return_output := result_u8_value_MUX_uxn_opcodes_h_l2552_c7_e069_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2552_c7_e069] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2552_c7_e069_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2552_c7_e069_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2552_c7_e069_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2552_c7_e069_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2552_c7_e069_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2552_c7_e069_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2552_c7_e069_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2552_c7_e069_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2552_c7_e069] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2552_c7_e069_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2552_c7_e069_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2552_c7_e069_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2552_c7_e069_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2552_c7_e069_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2552_c7_e069_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2552_c7_e069_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2552_c7_e069_return_output;

     -- Submodule level 13
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_7390_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2552_c7_e069_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_7390_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2552_c7_e069_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2547_c2_7390_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2552_c7_e069_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2547_c2_7390] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_7390_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_7390_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_7390_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_7390_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_7390_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_7390_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_7390_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_7390_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2547_c2_7390] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_7390_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_7390_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_7390_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_7390_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_7390_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_7390_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_7390_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_7390_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2547_c2_7390] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2547_c2_7390_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2547_c2_7390_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2547_c2_7390_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2547_c2_7390_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2547_c2_7390_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2547_c2_7390_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2547_c2_7390_return_output := result_u8_value_MUX_uxn_opcodes_h_l2547_c2_7390_return_output;

     -- Submodule level 14
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_5b93_uxn_opcodes_h_l2609_l2543_DUPLICATE_7bbb LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5b93_uxn_opcodes_h_l2609_l2543_DUPLICATE_7bbb_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_5b93(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_7390_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_7390_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2547_c2_7390_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_7390_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_7390_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2547_c2_7390_return_output);

     -- Submodule level 15
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5b93_uxn_opcodes_h_l2609_l2543_DUPLICATE_7bbb_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5b93_uxn_opcodes_h_l2609_l2543_DUPLICATE_7bbb_return_output;
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
