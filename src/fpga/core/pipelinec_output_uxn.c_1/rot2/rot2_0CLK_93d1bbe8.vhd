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
-- Submodules: 121
entity rot2_0CLK_93d1bbe8 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end rot2_0CLK_93d1bbe8;
architecture arch of rot2_0CLK_93d1bbe8 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l2549_c6_1519]
signal BIN_OP_EQ_uxn_opcodes_h_l2549_c6_1519_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2549_c6_1519_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2549_c6_1519_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2549_c1_a1aa]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2549_c1_a1aa_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2549_c1_a1aa_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2549_c1_a1aa_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2549_c1_a1aa_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2549_c2_16ab]
signal n16_MUX_uxn_opcodes_h_l2549_c2_16ab_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2549_c2_16ab_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2549_c2_16ab_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2549_c2_16ab_return_output : unsigned(15 downto 0);

-- l16_MUX[uxn_opcodes_h_l2549_c2_16ab]
signal l16_MUX_uxn_opcodes_h_l2549_c2_16ab_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2549_c2_16ab_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2549_c2_16ab_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2549_c2_16ab_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2549_c2_16ab]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2549_c2_16ab_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2549_c2_16ab_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2549_c2_16ab_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2549_c2_16ab_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2549_c2_16ab]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2549_c2_16ab_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2549_c2_16ab_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2549_c2_16ab_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2549_c2_16ab_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2549_c2_16ab]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2549_c2_16ab_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2549_c2_16ab_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2549_c2_16ab_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2549_c2_16ab_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2549_c2_16ab]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2549_c2_16ab_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2549_c2_16ab_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2549_c2_16ab_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2549_c2_16ab_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2549_c2_16ab]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2549_c2_16ab_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2549_c2_16ab_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2549_c2_16ab_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2549_c2_16ab_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2549_c2_16ab]
signal result_u8_value_MUX_uxn_opcodes_h_l2549_c2_16ab_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2549_c2_16ab_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2549_c2_16ab_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2549_c2_16ab_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2549_c2_16ab]
signal t16_MUX_uxn_opcodes_h_l2549_c2_16ab_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2549_c2_16ab_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2549_c2_16ab_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2549_c2_16ab_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l2550_c3_882e[uxn_opcodes_h_l2550_c3_882e]
signal printf_uxn_opcodes_h_l2550_c3_882e_uxn_opcodes_h_l2550_c3_882e_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2554_c11_c4f5]
signal BIN_OP_EQ_uxn_opcodes_h_l2554_c11_c4f5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2554_c11_c4f5_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2554_c11_c4f5_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2554_c7_c9a1]
signal n16_MUX_uxn_opcodes_h_l2554_c7_c9a1_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2554_c7_c9a1_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2554_c7_c9a1_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2554_c7_c9a1_return_output : unsigned(15 downto 0);

-- l16_MUX[uxn_opcodes_h_l2554_c7_c9a1]
signal l16_MUX_uxn_opcodes_h_l2554_c7_c9a1_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2554_c7_c9a1_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2554_c7_c9a1_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2554_c7_c9a1_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2554_c7_c9a1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2554_c7_c9a1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2554_c7_c9a1_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2554_c7_c9a1_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2554_c7_c9a1_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2554_c7_c9a1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2554_c7_c9a1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2554_c7_c9a1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2554_c7_c9a1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2554_c7_c9a1_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2554_c7_c9a1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2554_c7_c9a1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2554_c7_c9a1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2554_c7_c9a1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2554_c7_c9a1_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2554_c7_c9a1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2554_c7_c9a1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2554_c7_c9a1_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2554_c7_c9a1_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2554_c7_c9a1_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2554_c7_c9a1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2554_c7_c9a1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2554_c7_c9a1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2554_c7_c9a1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2554_c7_c9a1_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2554_c7_c9a1]
signal result_u8_value_MUX_uxn_opcodes_h_l2554_c7_c9a1_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2554_c7_c9a1_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2554_c7_c9a1_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2554_c7_c9a1_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2554_c7_c9a1]
signal t16_MUX_uxn_opcodes_h_l2554_c7_c9a1_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2554_c7_c9a1_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2554_c7_c9a1_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2554_c7_c9a1_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2557_c11_0734]
signal BIN_OP_EQ_uxn_opcodes_h_l2557_c11_0734_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2557_c11_0734_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2557_c11_0734_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2557_c7_f7ad]
signal n16_MUX_uxn_opcodes_h_l2557_c7_f7ad_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2557_c7_f7ad_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2557_c7_f7ad_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2557_c7_f7ad_return_output : unsigned(15 downto 0);

-- l16_MUX[uxn_opcodes_h_l2557_c7_f7ad]
signal l16_MUX_uxn_opcodes_h_l2557_c7_f7ad_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2557_c7_f7ad_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2557_c7_f7ad_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2557_c7_f7ad_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2557_c7_f7ad]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2557_c7_f7ad_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2557_c7_f7ad_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2557_c7_f7ad_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2557_c7_f7ad_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2557_c7_f7ad]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2557_c7_f7ad_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2557_c7_f7ad_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2557_c7_f7ad_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2557_c7_f7ad_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2557_c7_f7ad]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2557_c7_f7ad_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2557_c7_f7ad_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2557_c7_f7ad_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2557_c7_f7ad_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2557_c7_f7ad]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2557_c7_f7ad_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2557_c7_f7ad_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2557_c7_f7ad_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2557_c7_f7ad_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2557_c7_f7ad]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2557_c7_f7ad_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2557_c7_f7ad_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2557_c7_f7ad_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2557_c7_f7ad_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2557_c7_f7ad]
signal result_u8_value_MUX_uxn_opcodes_h_l2557_c7_f7ad_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2557_c7_f7ad_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2557_c7_f7ad_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2557_c7_f7ad_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2557_c7_f7ad]
signal t16_MUX_uxn_opcodes_h_l2557_c7_f7ad_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2557_c7_f7ad_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2557_c7_f7ad_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2557_c7_f7ad_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2562_c11_91ac]
signal BIN_OP_EQ_uxn_opcodes_h_l2562_c11_91ac_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2562_c11_91ac_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2562_c11_91ac_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2562_c7_7283]
signal n16_MUX_uxn_opcodes_h_l2562_c7_7283_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2562_c7_7283_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2562_c7_7283_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2562_c7_7283_return_output : unsigned(15 downto 0);

-- l16_MUX[uxn_opcodes_h_l2562_c7_7283]
signal l16_MUX_uxn_opcodes_h_l2562_c7_7283_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2562_c7_7283_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2562_c7_7283_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2562_c7_7283_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2562_c7_7283]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2562_c7_7283_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2562_c7_7283_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2562_c7_7283_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2562_c7_7283_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2562_c7_7283]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2562_c7_7283_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2562_c7_7283_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2562_c7_7283_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2562_c7_7283_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2562_c7_7283]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2562_c7_7283_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2562_c7_7283_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2562_c7_7283_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2562_c7_7283_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2562_c7_7283]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2562_c7_7283_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2562_c7_7283_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2562_c7_7283_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2562_c7_7283_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2562_c7_7283]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2562_c7_7283_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2562_c7_7283_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2562_c7_7283_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2562_c7_7283_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2562_c7_7283]
signal result_u8_value_MUX_uxn_opcodes_h_l2562_c7_7283_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2562_c7_7283_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2562_c7_7283_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2562_c7_7283_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2562_c7_7283]
signal t16_MUX_uxn_opcodes_h_l2562_c7_7283_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2562_c7_7283_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2562_c7_7283_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2562_c7_7283_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2563_c3_f311]
signal BIN_OP_OR_uxn_opcodes_h_l2563_c3_f311_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2563_c3_f311_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2563_c3_f311_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2566_c11_cf78]
signal BIN_OP_EQ_uxn_opcodes_h_l2566_c11_cf78_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2566_c11_cf78_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2566_c11_cf78_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2566_c7_c443]
signal n16_MUX_uxn_opcodes_h_l2566_c7_c443_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2566_c7_c443_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2566_c7_c443_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2566_c7_c443_return_output : unsigned(15 downto 0);

-- l16_MUX[uxn_opcodes_h_l2566_c7_c443]
signal l16_MUX_uxn_opcodes_h_l2566_c7_c443_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2566_c7_c443_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2566_c7_c443_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2566_c7_c443_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2566_c7_c443]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2566_c7_c443_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2566_c7_c443_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2566_c7_c443_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2566_c7_c443_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2566_c7_c443]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2566_c7_c443_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2566_c7_c443_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2566_c7_c443_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2566_c7_c443_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2566_c7_c443]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2566_c7_c443_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2566_c7_c443_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2566_c7_c443_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2566_c7_c443_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2566_c7_c443]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2566_c7_c443_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2566_c7_c443_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2566_c7_c443_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2566_c7_c443_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2566_c7_c443]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2566_c7_c443_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2566_c7_c443_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2566_c7_c443_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2566_c7_c443_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2566_c7_c443]
signal result_u8_value_MUX_uxn_opcodes_h_l2566_c7_c443_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2566_c7_c443_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2566_c7_c443_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2566_c7_c443_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2571_c11_bb3c]
signal BIN_OP_EQ_uxn_opcodes_h_l2571_c11_bb3c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2571_c11_bb3c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2571_c11_bb3c_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2571_c7_10b9]
signal n16_MUX_uxn_opcodes_h_l2571_c7_10b9_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2571_c7_10b9_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2571_c7_10b9_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2571_c7_10b9_return_output : unsigned(15 downto 0);

-- l16_MUX[uxn_opcodes_h_l2571_c7_10b9]
signal l16_MUX_uxn_opcodes_h_l2571_c7_10b9_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2571_c7_10b9_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2571_c7_10b9_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2571_c7_10b9_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2571_c7_10b9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_10b9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_10b9_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_10b9_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_10b9_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2571_c7_10b9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2571_c7_10b9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2571_c7_10b9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2571_c7_10b9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2571_c7_10b9_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2571_c7_10b9]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2571_c7_10b9_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2571_c7_10b9_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2571_c7_10b9_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2571_c7_10b9_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2571_c7_10b9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_10b9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_10b9_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_10b9_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_10b9_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2571_c7_10b9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_10b9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_10b9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_10b9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_10b9_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2571_c7_10b9]
signal result_u8_value_MUX_uxn_opcodes_h_l2571_c7_10b9_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2571_c7_10b9_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2571_c7_10b9_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2571_c7_10b9_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2572_c3_78e3]
signal BIN_OP_OR_uxn_opcodes_h_l2572_c3_78e3_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2572_c3_78e3_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2572_c3_78e3_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2575_c11_d0ad]
signal BIN_OP_EQ_uxn_opcodes_h_l2575_c11_d0ad_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2575_c11_d0ad_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2575_c11_d0ad_return_output : unsigned(0 downto 0);

-- l16_MUX[uxn_opcodes_h_l2575_c7_7275]
signal l16_MUX_uxn_opcodes_h_l2575_c7_7275_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2575_c7_7275_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2575_c7_7275_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2575_c7_7275_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2575_c7_7275]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2575_c7_7275_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2575_c7_7275_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2575_c7_7275_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2575_c7_7275_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2575_c7_7275]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2575_c7_7275_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2575_c7_7275_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2575_c7_7275_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2575_c7_7275_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2575_c7_7275]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2575_c7_7275_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2575_c7_7275_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2575_c7_7275_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2575_c7_7275_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2575_c7_7275]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2575_c7_7275_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2575_c7_7275_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2575_c7_7275_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2575_c7_7275_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2575_c7_7275]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2575_c7_7275_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2575_c7_7275_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2575_c7_7275_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2575_c7_7275_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2575_c7_7275]
signal result_u8_value_MUX_uxn_opcodes_h_l2575_c7_7275_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2575_c7_7275_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2575_c7_7275_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2575_c7_7275_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2579_c11_74cf]
signal BIN_OP_EQ_uxn_opcodes_h_l2579_c11_74cf_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2579_c11_74cf_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2579_c11_74cf_return_output : unsigned(0 downto 0);

-- l16_MUX[uxn_opcodes_h_l2579_c7_95bf]
signal l16_MUX_uxn_opcodes_h_l2579_c7_95bf_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2579_c7_95bf_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2579_c7_95bf_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2579_c7_95bf_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2579_c7_95bf]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_95bf_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_95bf_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_95bf_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_95bf_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2579_c7_95bf]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_95bf_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_95bf_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_95bf_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_95bf_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2579_c7_95bf]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_95bf_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_95bf_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_95bf_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_95bf_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2579_c7_95bf]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_95bf_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_95bf_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_95bf_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_95bf_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2579_c7_95bf]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_95bf_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_95bf_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_95bf_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_95bf_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2579_c7_95bf]
signal result_u8_value_MUX_uxn_opcodes_h_l2579_c7_95bf_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2579_c7_95bf_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2579_c7_95bf_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2579_c7_95bf_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2580_c3_a5ce]
signal BIN_OP_OR_uxn_opcodes_h_l2580_c3_a5ce_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2580_c3_a5ce_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2580_c3_a5ce_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2582_c30_717a]
signal sp_relative_shift_uxn_opcodes_h_l2582_c30_717a_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2582_c30_717a_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2582_c30_717a_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2582_c30_717a_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2587_c11_2442]
signal BIN_OP_EQ_uxn_opcodes_h_l2587_c11_2442_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2587_c11_2442_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2587_c11_2442_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2587_c7_6336]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_6336_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_6336_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_6336_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_6336_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2587_c7_6336]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2587_c7_6336_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2587_c7_6336_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2587_c7_6336_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2587_c7_6336_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2587_c7_6336]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_6336_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_6336_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_6336_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_6336_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2587_c7_6336]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2587_c7_6336_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2587_c7_6336_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2587_c7_6336_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2587_c7_6336_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2587_c7_6336]
signal result_u8_value_MUX_uxn_opcodes_h_l2587_c7_6336_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2587_c7_6336_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2587_c7_6336_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2587_c7_6336_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2590_c31_67e0]
signal CONST_SR_8_uxn_opcodes_h_l2590_c31_67e0_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2590_c31_67e0_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2592_c11_3ee6]
signal BIN_OP_EQ_uxn_opcodes_h_l2592_c11_3ee6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2592_c11_3ee6_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2592_c11_3ee6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2592_c7_9458]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_9458_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_9458_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_9458_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_9458_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2592_c7_9458]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_9458_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_9458_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_9458_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_9458_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2592_c7_9458]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_9458_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_9458_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_9458_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_9458_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2592_c7_9458]
signal result_u8_value_MUX_uxn_opcodes_h_l2592_c7_9458_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2592_c7_9458_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2592_c7_9458_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2592_c7_9458_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2596_c11_f74d]
signal BIN_OP_EQ_uxn_opcodes_h_l2596_c11_f74d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2596_c11_f74d_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2596_c11_f74d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2596_c7_b58c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2596_c7_b58c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2596_c7_b58c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2596_c7_b58c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2596_c7_b58c_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2596_c7_b58c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2596_c7_b58c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2596_c7_b58c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2596_c7_b58c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2596_c7_b58c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2596_c7_b58c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2596_c7_b58c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2596_c7_b58c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2596_c7_b58c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2596_c7_b58c_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2596_c7_b58c]
signal result_u8_value_MUX_uxn_opcodes_h_l2596_c7_b58c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2596_c7_b58c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2596_c7_b58c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2596_c7_b58c_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2598_c31_2e0a]
signal CONST_SR_8_uxn_opcodes_h_l2598_c31_2e0a_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2598_c31_2e0a_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2600_c11_c220]
signal BIN_OP_EQ_uxn_opcodes_h_l2600_c11_c220_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2600_c11_c220_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2600_c11_c220_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2600_c7_7d84]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c7_7d84_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c7_7d84_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c7_7d84_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c7_7d84_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2600_c7_7d84]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2600_c7_7d84_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2600_c7_7d84_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2600_c7_7d84_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2600_c7_7d84_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2600_c7_7d84]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2600_c7_7d84_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2600_c7_7d84_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2600_c7_7d84_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2600_c7_7d84_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2600_c7_7d84]
signal result_u8_value_MUX_uxn_opcodes_h_l2600_c7_7d84_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2600_c7_7d84_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2600_c7_7d84_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2600_c7_7d84_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2604_c11_39e7]
signal BIN_OP_EQ_uxn_opcodes_h_l2604_c11_39e7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2604_c11_39e7_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2604_c11_39e7_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2604_c7_608e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2604_c7_608e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2604_c7_608e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2604_c7_608e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2604_c7_608e_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2604_c7_608e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_608e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_608e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_608e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_608e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2604_c7_608e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_608e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_608e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_608e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_608e_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2604_c7_608e]
signal result_u8_value_MUX_uxn_opcodes_h_l2604_c7_608e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2604_c7_608e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2604_c7_608e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2604_c7_608e_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2606_c31_8b28]
signal CONST_SR_8_uxn_opcodes_h_l2606_c31_8b28_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2606_c31_8b28_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2608_c11_0ab7]
signal BIN_OP_EQ_uxn_opcodes_h_l2608_c11_0ab7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2608_c11_0ab7_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2608_c11_0ab7_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2608_c7_d0ab]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2608_c7_d0ab_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2608_c7_d0ab_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2608_c7_d0ab_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2608_c7_d0ab_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2608_c7_d0ab]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2608_c7_d0ab_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2608_c7_d0ab_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2608_c7_d0ab_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2608_c7_d0ab_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2577_l2559_l2568_DUPLICATE_e191
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2577_l2559_l2568_DUPLICATE_e191_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2577_l2559_l2568_DUPLICATE_e191_return_output : unsigned(15 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l2549_c6_1519
BIN_OP_EQ_uxn_opcodes_h_l2549_c6_1519 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2549_c6_1519_left,
BIN_OP_EQ_uxn_opcodes_h_l2549_c6_1519_right,
BIN_OP_EQ_uxn_opcodes_h_l2549_c6_1519_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2549_c1_a1aa
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2549_c1_a1aa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2549_c1_a1aa_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2549_c1_a1aa_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2549_c1_a1aa_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2549_c1_a1aa_return_output);

-- n16_MUX_uxn_opcodes_h_l2549_c2_16ab
n16_MUX_uxn_opcodes_h_l2549_c2_16ab : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2549_c2_16ab_cond,
n16_MUX_uxn_opcodes_h_l2549_c2_16ab_iftrue,
n16_MUX_uxn_opcodes_h_l2549_c2_16ab_iffalse,
n16_MUX_uxn_opcodes_h_l2549_c2_16ab_return_output);

-- l16_MUX_uxn_opcodes_h_l2549_c2_16ab
l16_MUX_uxn_opcodes_h_l2549_c2_16ab : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2549_c2_16ab_cond,
l16_MUX_uxn_opcodes_h_l2549_c2_16ab_iftrue,
l16_MUX_uxn_opcodes_h_l2549_c2_16ab_iffalse,
l16_MUX_uxn_opcodes_h_l2549_c2_16ab_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2549_c2_16ab
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2549_c2_16ab : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2549_c2_16ab_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2549_c2_16ab_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2549_c2_16ab_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2549_c2_16ab_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2549_c2_16ab
result_is_stack_write_MUX_uxn_opcodes_h_l2549_c2_16ab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2549_c2_16ab_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2549_c2_16ab_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2549_c2_16ab_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2549_c2_16ab_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2549_c2_16ab
result_is_sp_shift_MUX_uxn_opcodes_h_l2549_c2_16ab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2549_c2_16ab_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2549_c2_16ab_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2549_c2_16ab_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2549_c2_16ab_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2549_c2_16ab
result_sp_relative_shift_MUX_uxn_opcodes_h_l2549_c2_16ab : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2549_c2_16ab_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2549_c2_16ab_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2549_c2_16ab_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2549_c2_16ab_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2549_c2_16ab
result_is_opc_done_MUX_uxn_opcodes_h_l2549_c2_16ab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2549_c2_16ab_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2549_c2_16ab_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2549_c2_16ab_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2549_c2_16ab_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2549_c2_16ab
result_u8_value_MUX_uxn_opcodes_h_l2549_c2_16ab : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2549_c2_16ab_cond,
result_u8_value_MUX_uxn_opcodes_h_l2549_c2_16ab_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2549_c2_16ab_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2549_c2_16ab_return_output);

-- t16_MUX_uxn_opcodes_h_l2549_c2_16ab
t16_MUX_uxn_opcodes_h_l2549_c2_16ab : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2549_c2_16ab_cond,
t16_MUX_uxn_opcodes_h_l2549_c2_16ab_iftrue,
t16_MUX_uxn_opcodes_h_l2549_c2_16ab_iffalse,
t16_MUX_uxn_opcodes_h_l2549_c2_16ab_return_output);

-- printf_uxn_opcodes_h_l2550_c3_882e_uxn_opcodes_h_l2550_c3_882e
printf_uxn_opcodes_h_l2550_c3_882e_uxn_opcodes_h_l2550_c3_882e : entity work.printf_uxn_opcodes_h_l2550_c3_882e_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2550_c3_882e_uxn_opcodes_h_l2550_c3_882e_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2554_c11_c4f5
BIN_OP_EQ_uxn_opcodes_h_l2554_c11_c4f5 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2554_c11_c4f5_left,
BIN_OP_EQ_uxn_opcodes_h_l2554_c11_c4f5_right,
BIN_OP_EQ_uxn_opcodes_h_l2554_c11_c4f5_return_output);

-- n16_MUX_uxn_opcodes_h_l2554_c7_c9a1
n16_MUX_uxn_opcodes_h_l2554_c7_c9a1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2554_c7_c9a1_cond,
n16_MUX_uxn_opcodes_h_l2554_c7_c9a1_iftrue,
n16_MUX_uxn_opcodes_h_l2554_c7_c9a1_iffalse,
n16_MUX_uxn_opcodes_h_l2554_c7_c9a1_return_output);

-- l16_MUX_uxn_opcodes_h_l2554_c7_c9a1
l16_MUX_uxn_opcodes_h_l2554_c7_c9a1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2554_c7_c9a1_cond,
l16_MUX_uxn_opcodes_h_l2554_c7_c9a1_iftrue,
l16_MUX_uxn_opcodes_h_l2554_c7_c9a1_iffalse,
l16_MUX_uxn_opcodes_h_l2554_c7_c9a1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2554_c7_c9a1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2554_c7_c9a1 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2554_c7_c9a1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2554_c7_c9a1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2554_c7_c9a1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2554_c7_c9a1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2554_c7_c9a1
result_is_stack_write_MUX_uxn_opcodes_h_l2554_c7_c9a1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2554_c7_c9a1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2554_c7_c9a1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2554_c7_c9a1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2554_c7_c9a1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2554_c7_c9a1
result_is_sp_shift_MUX_uxn_opcodes_h_l2554_c7_c9a1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2554_c7_c9a1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2554_c7_c9a1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2554_c7_c9a1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2554_c7_c9a1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2554_c7_c9a1
result_sp_relative_shift_MUX_uxn_opcodes_h_l2554_c7_c9a1 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2554_c7_c9a1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2554_c7_c9a1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2554_c7_c9a1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2554_c7_c9a1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2554_c7_c9a1
result_is_opc_done_MUX_uxn_opcodes_h_l2554_c7_c9a1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2554_c7_c9a1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2554_c7_c9a1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2554_c7_c9a1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2554_c7_c9a1_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2554_c7_c9a1
result_u8_value_MUX_uxn_opcodes_h_l2554_c7_c9a1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2554_c7_c9a1_cond,
result_u8_value_MUX_uxn_opcodes_h_l2554_c7_c9a1_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2554_c7_c9a1_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2554_c7_c9a1_return_output);

-- t16_MUX_uxn_opcodes_h_l2554_c7_c9a1
t16_MUX_uxn_opcodes_h_l2554_c7_c9a1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2554_c7_c9a1_cond,
t16_MUX_uxn_opcodes_h_l2554_c7_c9a1_iftrue,
t16_MUX_uxn_opcodes_h_l2554_c7_c9a1_iffalse,
t16_MUX_uxn_opcodes_h_l2554_c7_c9a1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2557_c11_0734
BIN_OP_EQ_uxn_opcodes_h_l2557_c11_0734 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2557_c11_0734_left,
BIN_OP_EQ_uxn_opcodes_h_l2557_c11_0734_right,
BIN_OP_EQ_uxn_opcodes_h_l2557_c11_0734_return_output);

-- n16_MUX_uxn_opcodes_h_l2557_c7_f7ad
n16_MUX_uxn_opcodes_h_l2557_c7_f7ad : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2557_c7_f7ad_cond,
n16_MUX_uxn_opcodes_h_l2557_c7_f7ad_iftrue,
n16_MUX_uxn_opcodes_h_l2557_c7_f7ad_iffalse,
n16_MUX_uxn_opcodes_h_l2557_c7_f7ad_return_output);

-- l16_MUX_uxn_opcodes_h_l2557_c7_f7ad
l16_MUX_uxn_opcodes_h_l2557_c7_f7ad : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2557_c7_f7ad_cond,
l16_MUX_uxn_opcodes_h_l2557_c7_f7ad_iftrue,
l16_MUX_uxn_opcodes_h_l2557_c7_f7ad_iffalse,
l16_MUX_uxn_opcodes_h_l2557_c7_f7ad_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2557_c7_f7ad
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2557_c7_f7ad : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2557_c7_f7ad_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2557_c7_f7ad_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2557_c7_f7ad_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2557_c7_f7ad_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2557_c7_f7ad
result_is_stack_write_MUX_uxn_opcodes_h_l2557_c7_f7ad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2557_c7_f7ad_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2557_c7_f7ad_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2557_c7_f7ad_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2557_c7_f7ad_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2557_c7_f7ad
result_is_sp_shift_MUX_uxn_opcodes_h_l2557_c7_f7ad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2557_c7_f7ad_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2557_c7_f7ad_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2557_c7_f7ad_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2557_c7_f7ad_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2557_c7_f7ad
result_sp_relative_shift_MUX_uxn_opcodes_h_l2557_c7_f7ad : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2557_c7_f7ad_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2557_c7_f7ad_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2557_c7_f7ad_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2557_c7_f7ad_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2557_c7_f7ad
result_is_opc_done_MUX_uxn_opcodes_h_l2557_c7_f7ad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2557_c7_f7ad_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2557_c7_f7ad_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2557_c7_f7ad_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2557_c7_f7ad_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2557_c7_f7ad
result_u8_value_MUX_uxn_opcodes_h_l2557_c7_f7ad : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2557_c7_f7ad_cond,
result_u8_value_MUX_uxn_opcodes_h_l2557_c7_f7ad_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2557_c7_f7ad_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2557_c7_f7ad_return_output);

-- t16_MUX_uxn_opcodes_h_l2557_c7_f7ad
t16_MUX_uxn_opcodes_h_l2557_c7_f7ad : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2557_c7_f7ad_cond,
t16_MUX_uxn_opcodes_h_l2557_c7_f7ad_iftrue,
t16_MUX_uxn_opcodes_h_l2557_c7_f7ad_iffalse,
t16_MUX_uxn_opcodes_h_l2557_c7_f7ad_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2562_c11_91ac
BIN_OP_EQ_uxn_opcodes_h_l2562_c11_91ac : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2562_c11_91ac_left,
BIN_OP_EQ_uxn_opcodes_h_l2562_c11_91ac_right,
BIN_OP_EQ_uxn_opcodes_h_l2562_c11_91ac_return_output);

-- n16_MUX_uxn_opcodes_h_l2562_c7_7283
n16_MUX_uxn_opcodes_h_l2562_c7_7283 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2562_c7_7283_cond,
n16_MUX_uxn_opcodes_h_l2562_c7_7283_iftrue,
n16_MUX_uxn_opcodes_h_l2562_c7_7283_iffalse,
n16_MUX_uxn_opcodes_h_l2562_c7_7283_return_output);

-- l16_MUX_uxn_opcodes_h_l2562_c7_7283
l16_MUX_uxn_opcodes_h_l2562_c7_7283 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2562_c7_7283_cond,
l16_MUX_uxn_opcodes_h_l2562_c7_7283_iftrue,
l16_MUX_uxn_opcodes_h_l2562_c7_7283_iffalse,
l16_MUX_uxn_opcodes_h_l2562_c7_7283_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2562_c7_7283
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2562_c7_7283 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2562_c7_7283_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2562_c7_7283_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2562_c7_7283_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2562_c7_7283_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2562_c7_7283
result_is_stack_write_MUX_uxn_opcodes_h_l2562_c7_7283 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2562_c7_7283_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2562_c7_7283_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2562_c7_7283_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2562_c7_7283_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2562_c7_7283
result_is_sp_shift_MUX_uxn_opcodes_h_l2562_c7_7283 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2562_c7_7283_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2562_c7_7283_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2562_c7_7283_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2562_c7_7283_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2562_c7_7283
result_sp_relative_shift_MUX_uxn_opcodes_h_l2562_c7_7283 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2562_c7_7283_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2562_c7_7283_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2562_c7_7283_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2562_c7_7283_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2562_c7_7283
result_is_opc_done_MUX_uxn_opcodes_h_l2562_c7_7283 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2562_c7_7283_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2562_c7_7283_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2562_c7_7283_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2562_c7_7283_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2562_c7_7283
result_u8_value_MUX_uxn_opcodes_h_l2562_c7_7283 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2562_c7_7283_cond,
result_u8_value_MUX_uxn_opcodes_h_l2562_c7_7283_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2562_c7_7283_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2562_c7_7283_return_output);

-- t16_MUX_uxn_opcodes_h_l2562_c7_7283
t16_MUX_uxn_opcodes_h_l2562_c7_7283 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2562_c7_7283_cond,
t16_MUX_uxn_opcodes_h_l2562_c7_7283_iftrue,
t16_MUX_uxn_opcodes_h_l2562_c7_7283_iffalse,
t16_MUX_uxn_opcodes_h_l2562_c7_7283_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2563_c3_f311
BIN_OP_OR_uxn_opcodes_h_l2563_c3_f311 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2563_c3_f311_left,
BIN_OP_OR_uxn_opcodes_h_l2563_c3_f311_right,
BIN_OP_OR_uxn_opcodes_h_l2563_c3_f311_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2566_c11_cf78
BIN_OP_EQ_uxn_opcodes_h_l2566_c11_cf78 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2566_c11_cf78_left,
BIN_OP_EQ_uxn_opcodes_h_l2566_c11_cf78_right,
BIN_OP_EQ_uxn_opcodes_h_l2566_c11_cf78_return_output);

-- n16_MUX_uxn_opcodes_h_l2566_c7_c443
n16_MUX_uxn_opcodes_h_l2566_c7_c443 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2566_c7_c443_cond,
n16_MUX_uxn_opcodes_h_l2566_c7_c443_iftrue,
n16_MUX_uxn_opcodes_h_l2566_c7_c443_iffalse,
n16_MUX_uxn_opcodes_h_l2566_c7_c443_return_output);

-- l16_MUX_uxn_opcodes_h_l2566_c7_c443
l16_MUX_uxn_opcodes_h_l2566_c7_c443 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2566_c7_c443_cond,
l16_MUX_uxn_opcodes_h_l2566_c7_c443_iftrue,
l16_MUX_uxn_opcodes_h_l2566_c7_c443_iffalse,
l16_MUX_uxn_opcodes_h_l2566_c7_c443_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2566_c7_c443
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2566_c7_c443 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2566_c7_c443_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2566_c7_c443_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2566_c7_c443_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2566_c7_c443_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2566_c7_c443
result_is_stack_write_MUX_uxn_opcodes_h_l2566_c7_c443 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2566_c7_c443_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2566_c7_c443_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2566_c7_c443_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2566_c7_c443_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2566_c7_c443
result_is_sp_shift_MUX_uxn_opcodes_h_l2566_c7_c443 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2566_c7_c443_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2566_c7_c443_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2566_c7_c443_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2566_c7_c443_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2566_c7_c443
result_sp_relative_shift_MUX_uxn_opcodes_h_l2566_c7_c443 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2566_c7_c443_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2566_c7_c443_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2566_c7_c443_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2566_c7_c443_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2566_c7_c443
result_is_opc_done_MUX_uxn_opcodes_h_l2566_c7_c443 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2566_c7_c443_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2566_c7_c443_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2566_c7_c443_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2566_c7_c443_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2566_c7_c443
result_u8_value_MUX_uxn_opcodes_h_l2566_c7_c443 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2566_c7_c443_cond,
result_u8_value_MUX_uxn_opcodes_h_l2566_c7_c443_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2566_c7_c443_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2566_c7_c443_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2571_c11_bb3c
BIN_OP_EQ_uxn_opcodes_h_l2571_c11_bb3c : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2571_c11_bb3c_left,
BIN_OP_EQ_uxn_opcodes_h_l2571_c11_bb3c_right,
BIN_OP_EQ_uxn_opcodes_h_l2571_c11_bb3c_return_output);

-- n16_MUX_uxn_opcodes_h_l2571_c7_10b9
n16_MUX_uxn_opcodes_h_l2571_c7_10b9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2571_c7_10b9_cond,
n16_MUX_uxn_opcodes_h_l2571_c7_10b9_iftrue,
n16_MUX_uxn_opcodes_h_l2571_c7_10b9_iffalse,
n16_MUX_uxn_opcodes_h_l2571_c7_10b9_return_output);

-- l16_MUX_uxn_opcodes_h_l2571_c7_10b9
l16_MUX_uxn_opcodes_h_l2571_c7_10b9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2571_c7_10b9_cond,
l16_MUX_uxn_opcodes_h_l2571_c7_10b9_iftrue,
l16_MUX_uxn_opcodes_h_l2571_c7_10b9_iffalse,
l16_MUX_uxn_opcodes_h_l2571_c7_10b9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_10b9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_10b9 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_10b9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_10b9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_10b9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_10b9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2571_c7_10b9
result_is_stack_write_MUX_uxn_opcodes_h_l2571_c7_10b9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2571_c7_10b9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2571_c7_10b9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2571_c7_10b9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2571_c7_10b9_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2571_c7_10b9
result_is_sp_shift_MUX_uxn_opcodes_h_l2571_c7_10b9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2571_c7_10b9_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2571_c7_10b9_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2571_c7_10b9_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2571_c7_10b9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_10b9
result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_10b9 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_10b9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_10b9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_10b9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_10b9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_10b9
result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_10b9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_10b9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_10b9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_10b9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_10b9_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2571_c7_10b9
result_u8_value_MUX_uxn_opcodes_h_l2571_c7_10b9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2571_c7_10b9_cond,
result_u8_value_MUX_uxn_opcodes_h_l2571_c7_10b9_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2571_c7_10b9_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2571_c7_10b9_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2572_c3_78e3
BIN_OP_OR_uxn_opcodes_h_l2572_c3_78e3 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2572_c3_78e3_left,
BIN_OP_OR_uxn_opcodes_h_l2572_c3_78e3_right,
BIN_OP_OR_uxn_opcodes_h_l2572_c3_78e3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2575_c11_d0ad
BIN_OP_EQ_uxn_opcodes_h_l2575_c11_d0ad : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2575_c11_d0ad_left,
BIN_OP_EQ_uxn_opcodes_h_l2575_c11_d0ad_right,
BIN_OP_EQ_uxn_opcodes_h_l2575_c11_d0ad_return_output);

-- l16_MUX_uxn_opcodes_h_l2575_c7_7275
l16_MUX_uxn_opcodes_h_l2575_c7_7275 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2575_c7_7275_cond,
l16_MUX_uxn_opcodes_h_l2575_c7_7275_iftrue,
l16_MUX_uxn_opcodes_h_l2575_c7_7275_iffalse,
l16_MUX_uxn_opcodes_h_l2575_c7_7275_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2575_c7_7275
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2575_c7_7275 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2575_c7_7275_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2575_c7_7275_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2575_c7_7275_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2575_c7_7275_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2575_c7_7275
result_is_stack_write_MUX_uxn_opcodes_h_l2575_c7_7275 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2575_c7_7275_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2575_c7_7275_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2575_c7_7275_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2575_c7_7275_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2575_c7_7275
result_is_sp_shift_MUX_uxn_opcodes_h_l2575_c7_7275 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2575_c7_7275_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2575_c7_7275_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2575_c7_7275_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2575_c7_7275_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2575_c7_7275
result_sp_relative_shift_MUX_uxn_opcodes_h_l2575_c7_7275 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2575_c7_7275_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2575_c7_7275_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2575_c7_7275_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2575_c7_7275_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2575_c7_7275
result_is_opc_done_MUX_uxn_opcodes_h_l2575_c7_7275 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2575_c7_7275_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2575_c7_7275_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2575_c7_7275_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2575_c7_7275_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2575_c7_7275
result_u8_value_MUX_uxn_opcodes_h_l2575_c7_7275 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2575_c7_7275_cond,
result_u8_value_MUX_uxn_opcodes_h_l2575_c7_7275_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2575_c7_7275_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2575_c7_7275_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2579_c11_74cf
BIN_OP_EQ_uxn_opcodes_h_l2579_c11_74cf : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2579_c11_74cf_left,
BIN_OP_EQ_uxn_opcodes_h_l2579_c11_74cf_right,
BIN_OP_EQ_uxn_opcodes_h_l2579_c11_74cf_return_output);

-- l16_MUX_uxn_opcodes_h_l2579_c7_95bf
l16_MUX_uxn_opcodes_h_l2579_c7_95bf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2579_c7_95bf_cond,
l16_MUX_uxn_opcodes_h_l2579_c7_95bf_iftrue,
l16_MUX_uxn_opcodes_h_l2579_c7_95bf_iffalse,
l16_MUX_uxn_opcodes_h_l2579_c7_95bf_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_95bf
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_95bf : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_95bf_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_95bf_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_95bf_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_95bf_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_95bf
result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_95bf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_95bf_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_95bf_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_95bf_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_95bf_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_95bf
result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_95bf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_95bf_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_95bf_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_95bf_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_95bf_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_95bf
result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_95bf : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_95bf_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_95bf_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_95bf_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_95bf_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_95bf
result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_95bf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_95bf_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_95bf_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_95bf_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_95bf_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2579_c7_95bf
result_u8_value_MUX_uxn_opcodes_h_l2579_c7_95bf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2579_c7_95bf_cond,
result_u8_value_MUX_uxn_opcodes_h_l2579_c7_95bf_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2579_c7_95bf_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2579_c7_95bf_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2580_c3_a5ce
BIN_OP_OR_uxn_opcodes_h_l2580_c3_a5ce : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2580_c3_a5ce_left,
BIN_OP_OR_uxn_opcodes_h_l2580_c3_a5ce_right,
BIN_OP_OR_uxn_opcodes_h_l2580_c3_a5ce_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2582_c30_717a
sp_relative_shift_uxn_opcodes_h_l2582_c30_717a : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2582_c30_717a_ins,
sp_relative_shift_uxn_opcodes_h_l2582_c30_717a_x,
sp_relative_shift_uxn_opcodes_h_l2582_c30_717a_y,
sp_relative_shift_uxn_opcodes_h_l2582_c30_717a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2587_c11_2442
BIN_OP_EQ_uxn_opcodes_h_l2587_c11_2442 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2587_c11_2442_left,
BIN_OP_EQ_uxn_opcodes_h_l2587_c11_2442_right,
BIN_OP_EQ_uxn_opcodes_h_l2587_c11_2442_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_6336
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_6336 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_6336_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_6336_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_6336_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_6336_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2587_c7_6336
result_is_stack_write_MUX_uxn_opcodes_h_l2587_c7_6336 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2587_c7_6336_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2587_c7_6336_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2587_c7_6336_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2587_c7_6336_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_6336
result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_6336 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_6336_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_6336_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_6336_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_6336_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2587_c7_6336
result_is_sp_shift_MUX_uxn_opcodes_h_l2587_c7_6336 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2587_c7_6336_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2587_c7_6336_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2587_c7_6336_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2587_c7_6336_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2587_c7_6336
result_u8_value_MUX_uxn_opcodes_h_l2587_c7_6336 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2587_c7_6336_cond,
result_u8_value_MUX_uxn_opcodes_h_l2587_c7_6336_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2587_c7_6336_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2587_c7_6336_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2590_c31_67e0
CONST_SR_8_uxn_opcodes_h_l2590_c31_67e0 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2590_c31_67e0_x,
CONST_SR_8_uxn_opcodes_h_l2590_c31_67e0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2592_c11_3ee6
BIN_OP_EQ_uxn_opcodes_h_l2592_c11_3ee6 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2592_c11_3ee6_left,
BIN_OP_EQ_uxn_opcodes_h_l2592_c11_3ee6_right,
BIN_OP_EQ_uxn_opcodes_h_l2592_c11_3ee6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_9458
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_9458 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_9458_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_9458_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_9458_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_9458_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_9458
result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_9458 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_9458_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_9458_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_9458_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_9458_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_9458
result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_9458 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_9458_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_9458_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_9458_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_9458_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2592_c7_9458
result_u8_value_MUX_uxn_opcodes_h_l2592_c7_9458 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2592_c7_9458_cond,
result_u8_value_MUX_uxn_opcodes_h_l2592_c7_9458_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2592_c7_9458_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2592_c7_9458_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2596_c11_f74d
BIN_OP_EQ_uxn_opcodes_h_l2596_c11_f74d : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2596_c11_f74d_left,
BIN_OP_EQ_uxn_opcodes_h_l2596_c11_f74d_right,
BIN_OP_EQ_uxn_opcodes_h_l2596_c11_f74d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2596_c7_b58c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2596_c7_b58c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2596_c7_b58c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2596_c7_b58c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2596_c7_b58c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2596_c7_b58c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2596_c7_b58c
result_is_stack_write_MUX_uxn_opcodes_h_l2596_c7_b58c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2596_c7_b58c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2596_c7_b58c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2596_c7_b58c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2596_c7_b58c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2596_c7_b58c
result_is_opc_done_MUX_uxn_opcodes_h_l2596_c7_b58c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2596_c7_b58c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2596_c7_b58c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2596_c7_b58c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2596_c7_b58c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2596_c7_b58c
result_u8_value_MUX_uxn_opcodes_h_l2596_c7_b58c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2596_c7_b58c_cond,
result_u8_value_MUX_uxn_opcodes_h_l2596_c7_b58c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2596_c7_b58c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2596_c7_b58c_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2598_c31_2e0a
CONST_SR_8_uxn_opcodes_h_l2598_c31_2e0a : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2598_c31_2e0a_x,
CONST_SR_8_uxn_opcodes_h_l2598_c31_2e0a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2600_c11_c220
BIN_OP_EQ_uxn_opcodes_h_l2600_c11_c220 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2600_c11_c220_left,
BIN_OP_EQ_uxn_opcodes_h_l2600_c11_c220_right,
BIN_OP_EQ_uxn_opcodes_h_l2600_c11_c220_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c7_7d84
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c7_7d84 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c7_7d84_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c7_7d84_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c7_7d84_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c7_7d84_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2600_c7_7d84
result_is_stack_write_MUX_uxn_opcodes_h_l2600_c7_7d84 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2600_c7_7d84_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2600_c7_7d84_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2600_c7_7d84_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2600_c7_7d84_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2600_c7_7d84
result_is_opc_done_MUX_uxn_opcodes_h_l2600_c7_7d84 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2600_c7_7d84_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2600_c7_7d84_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2600_c7_7d84_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2600_c7_7d84_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2600_c7_7d84
result_u8_value_MUX_uxn_opcodes_h_l2600_c7_7d84 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2600_c7_7d84_cond,
result_u8_value_MUX_uxn_opcodes_h_l2600_c7_7d84_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2600_c7_7d84_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2600_c7_7d84_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2604_c11_39e7
BIN_OP_EQ_uxn_opcodes_h_l2604_c11_39e7 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2604_c11_39e7_left,
BIN_OP_EQ_uxn_opcodes_h_l2604_c11_39e7_right,
BIN_OP_EQ_uxn_opcodes_h_l2604_c11_39e7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2604_c7_608e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2604_c7_608e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2604_c7_608e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2604_c7_608e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2604_c7_608e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2604_c7_608e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_608e
result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_608e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_608e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_608e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_608e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_608e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_608e
result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_608e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_608e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_608e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_608e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_608e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2604_c7_608e
result_u8_value_MUX_uxn_opcodes_h_l2604_c7_608e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2604_c7_608e_cond,
result_u8_value_MUX_uxn_opcodes_h_l2604_c7_608e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2604_c7_608e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2604_c7_608e_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2606_c31_8b28
CONST_SR_8_uxn_opcodes_h_l2606_c31_8b28 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2606_c31_8b28_x,
CONST_SR_8_uxn_opcodes_h_l2606_c31_8b28_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2608_c11_0ab7
BIN_OP_EQ_uxn_opcodes_h_l2608_c11_0ab7 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2608_c11_0ab7_left,
BIN_OP_EQ_uxn_opcodes_h_l2608_c11_0ab7_right,
BIN_OP_EQ_uxn_opcodes_h_l2608_c11_0ab7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2608_c7_d0ab
result_is_stack_write_MUX_uxn_opcodes_h_l2608_c7_d0ab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2608_c7_d0ab_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2608_c7_d0ab_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2608_c7_d0ab_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2608_c7_d0ab_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2608_c7_d0ab
result_is_opc_done_MUX_uxn_opcodes_h_l2608_c7_d0ab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2608_c7_d0ab_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2608_c7_d0ab_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2608_c7_d0ab_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2608_c7_d0ab_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2577_l2559_l2568_DUPLICATE_e191
CONST_SL_8_uint16_t_uxn_opcodes_h_l2577_l2559_l2568_DUPLICATE_e191 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l2577_l2559_l2568_DUPLICATE_e191_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l2577_l2559_l2568_DUPLICATE_e191_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2549_c6_1519_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2549_c1_a1aa_return_output,
 n16_MUX_uxn_opcodes_h_l2549_c2_16ab_return_output,
 l16_MUX_uxn_opcodes_h_l2549_c2_16ab_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2549_c2_16ab_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2549_c2_16ab_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2549_c2_16ab_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2549_c2_16ab_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2549_c2_16ab_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2549_c2_16ab_return_output,
 t16_MUX_uxn_opcodes_h_l2549_c2_16ab_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2554_c11_c4f5_return_output,
 n16_MUX_uxn_opcodes_h_l2554_c7_c9a1_return_output,
 l16_MUX_uxn_opcodes_h_l2554_c7_c9a1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2554_c7_c9a1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2554_c7_c9a1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2554_c7_c9a1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2554_c7_c9a1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2554_c7_c9a1_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2554_c7_c9a1_return_output,
 t16_MUX_uxn_opcodes_h_l2554_c7_c9a1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2557_c11_0734_return_output,
 n16_MUX_uxn_opcodes_h_l2557_c7_f7ad_return_output,
 l16_MUX_uxn_opcodes_h_l2557_c7_f7ad_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2557_c7_f7ad_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2557_c7_f7ad_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2557_c7_f7ad_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2557_c7_f7ad_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2557_c7_f7ad_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2557_c7_f7ad_return_output,
 t16_MUX_uxn_opcodes_h_l2557_c7_f7ad_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2562_c11_91ac_return_output,
 n16_MUX_uxn_opcodes_h_l2562_c7_7283_return_output,
 l16_MUX_uxn_opcodes_h_l2562_c7_7283_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2562_c7_7283_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2562_c7_7283_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2562_c7_7283_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2562_c7_7283_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2562_c7_7283_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2562_c7_7283_return_output,
 t16_MUX_uxn_opcodes_h_l2562_c7_7283_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2563_c3_f311_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2566_c11_cf78_return_output,
 n16_MUX_uxn_opcodes_h_l2566_c7_c443_return_output,
 l16_MUX_uxn_opcodes_h_l2566_c7_c443_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2566_c7_c443_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2566_c7_c443_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2566_c7_c443_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2566_c7_c443_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2566_c7_c443_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2566_c7_c443_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2571_c11_bb3c_return_output,
 n16_MUX_uxn_opcodes_h_l2571_c7_10b9_return_output,
 l16_MUX_uxn_opcodes_h_l2571_c7_10b9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_10b9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2571_c7_10b9_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2571_c7_10b9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_10b9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_10b9_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2571_c7_10b9_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2572_c3_78e3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2575_c11_d0ad_return_output,
 l16_MUX_uxn_opcodes_h_l2575_c7_7275_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2575_c7_7275_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2575_c7_7275_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2575_c7_7275_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2575_c7_7275_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2575_c7_7275_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2575_c7_7275_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2579_c11_74cf_return_output,
 l16_MUX_uxn_opcodes_h_l2579_c7_95bf_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_95bf_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_95bf_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_95bf_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_95bf_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_95bf_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2579_c7_95bf_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2580_c3_a5ce_return_output,
 sp_relative_shift_uxn_opcodes_h_l2582_c30_717a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2587_c11_2442_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_6336_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2587_c7_6336_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_6336_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2587_c7_6336_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2587_c7_6336_return_output,
 CONST_SR_8_uxn_opcodes_h_l2590_c31_67e0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2592_c11_3ee6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_9458_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_9458_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_9458_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2592_c7_9458_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2596_c11_f74d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2596_c7_b58c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2596_c7_b58c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2596_c7_b58c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2596_c7_b58c_return_output,
 CONST_SR_8_uxn_opcodes_h_l2598_c31_2e0a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2600_c11_c220_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c7_7d84_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2600_c7_7d84_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2600_c7_7d84_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2600_c7_7d84_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2604_c11_39e7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2604_c7_608e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_608e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_608e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2604_c7_608e_return_output,
 CONST_SR_8_uxn_opcodes_h_l2606_c31_8b28_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2608_c11_0ab7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2608_c7_d0ab_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2608_c7_d0ab_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l2577_l2559_l2568_DUPLICATE_e191_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2549_c6_1519_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2549_c6_1519_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2549_c6_1519_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2549_c1_a1aa_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2549_c1_a1aa_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2549_c1_a1aa_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2549_c1_a1aa_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2549_c2_16ab_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2549_c2_16ab_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2554_c7_c9a1_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2549_c2_16ab_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2549_c2_16ab_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2549_c2_16ab_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2549_c2_16ab_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2554_c7_c9a1_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2549_c2_16ab_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2549_c2_16ab_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2549_c2_16ab_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2551_c3_dafd : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2549_c2_16ab_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2554_c7_c9a1_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2549_c2_16ab_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2549_c2_16ab_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2549_c2_16ab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2549_c2_16ab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2554_c7_c9a1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2549_c2_16ab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2549_c2_16ab_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2549_c2_16ab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2549_c2_16ab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2554_c7_c9a1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2549_c2_16ab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2549_c2_16ab_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2549_c2_16ab_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2549_c2_16ab_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2554_c7_c9a1_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2549_c2_16ab_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2549_c2_16ab_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2549_c2_16ab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2549_c2_16ab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2554_c7_c9a1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2549_c2_16ab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2549_c2_16ab_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2549_c2_16ab_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2549_c2_16ab_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2554_c7_c9a1_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2549_c2_16ab_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2549_c2_16ab_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2549_c2_16ab_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2549_c2_16ab_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2554_c7_c9a1_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2549_c2_16ab_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2549_c2_16ab_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2550_c3_882e_uxn_opcodes_h_l2550_c3_882e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2554_c11_c4f5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2554_c11_c4f5_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2554_c11_c4f5_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2554_c7_c9a1_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2554_c7_c9a1_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2557_c7_f7ad_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2554_c7_c9a1_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2554_c7_c9a1_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2554_c7_c9a1_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2557_c7_f7ad_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2554_c7_c9a1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2554_c7_c9a1_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2555_c3_25aa : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2554_c7_c9a1_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2557_c7_f7ad_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2554_c7_c9a1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2554_c7_c9a1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2554_c7_c9a1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2557_c7_f7ad_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2554_c7_c9a1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2554_c7_c9a1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2554_c7_c9a1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2557_c7_f7ad_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2554_c7_c9a1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2554_c7_c9a1_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2554_c7_c9a1_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2557_c7_f7ad_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2554_c7_c9a1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2554_c7_c9a1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2554_c7_c9a1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2557_c7_f7ad_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2554_c7_c9a1_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2554_c7_c9a1_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2554_c7_c9a1_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2557_c7_f7ad_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2554_c7_c9a1_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2554_c7_c9a1_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2554_c7_c9a1_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2557_c7_f7ad_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2554_c7_c9a1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2557_c11_0734_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2557_c11_0734_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2557_c11_0734_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2557_c7_f7ad_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2557_c7_f7ad_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2562_c7_7283_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2557_c7_f7ad_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2557_c7_f7ad_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2557_c7_f7ad_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2562_c7_7283_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2557_c7_f7ad_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2557_c7_f7ad_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2560_c3_7b2f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2557_c7_f7ad_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2562_c7_7283_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2557_c7_f7ad_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2557_c7_f7ad_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2557_c7_f7ad_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2562_c7_7283_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2557_c7_f7ad_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2557_c7_f7ad_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2557_c7_f7ad_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2562_c7_7283_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2557_c7_f7ad_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2557_c7_f7ad_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2557_c7_f7ad_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2562_c7_7283_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2557_c7_f7ad_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2557_c7_f7ad_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2557_c7_f7ad_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2562_c7_7283_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2557_c7_f7ad_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2557_c7_f7ad_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2557_c7_f7ad_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2562_c7_7283_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2557_c7_f7ad_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2557_c7_f7ad_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2557_c7_f7ad_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2562_c7_7283_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2557_c7_f7ad_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2562_c11_91ac_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2562_c11_91ac_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2562_c11_91ac_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2562_c7_7283_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2562_c7_7283_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2566_c7_c443_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2562_c7_7283_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2562_c7_7283_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2562_c7_7283_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2566_c7_c443_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2562_c7_7283_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2562_c7_7283_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2564_c3_764f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2562_c7_7283_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2566_c7_c443_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2562_c7_7283_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2562_c7_7283_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2562_c7_7283_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2566_c7_c443_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2562_c7_7283_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2562_c7_7283_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2562_c7_7283_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2566_c7_c443_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2562_c7_7283_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2562_c7_7283_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2562_c7_7283_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2566_c7_c443_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2562_c7_7283_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2562_c7_7283_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2562_c7_7283_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2566_c7_c443_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2562_c7_7283_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2562_c7_7283_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2562_c7_7283_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2566_c7_c443_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2562_c7_7283_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2562_c7_7283_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2562_c7_7283_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2562_c7_7283_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2563_c3_f311_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2563_c3_f311_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2563_c3_f311_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2566_c11_cf78_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2566_c11_cf78_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2566_c11_cf78_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2566_c7_c443_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2566_c7_c443_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2571_c7_10b9_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2566_c7_c443_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2566_c7_c443_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2566_c7_c443_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2571_c7_10b9_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2566_c7_c443_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2566_c7_c443_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2569_c3_714a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2566_c7_c443_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_10b9_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2566_c7_c443_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2566_c7_c443_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2566_c7_c443_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2571_c7_10b9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2566_c7_c443_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2566_c7_c443_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2566_c7_c443_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2571_c7_10b9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2566_c7_c443_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2566_c7_c443_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2566_c7_c443_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_10b9_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2566_c7_c443_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2566_c7_c443_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2566_c7_c443_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_10b9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2566_c7_c443_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2566_c7_c443_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2566_c7_c443_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2571_c7_10b9_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2566_c7_c443_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2571_c11_bb3c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2571_c11_bb3c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2571_c11_bb3c_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2571_c7_10b9_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2571_c7_10b9_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2571_c7_10b9_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2571_c7_10b9_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2571_c7_10b9_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2575_c7_7275_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2571_c7_10b9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_10b9_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2573_c3_19c3 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_10b9_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2575_c7_7275_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_10b9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2571_c7_10b9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2571_c7_10b9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2575_c7_7275_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2571_c7_10b9_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2571_c7_10b9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2571_c7_10b9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2575_c7_7275_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2571_c7_10b9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_10b9_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_10b9_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2575_c7_7275_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_10b9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_10b9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_10b9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2575_c7_7275_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_10b9_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2571_c7_10b9_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2571_c7_10b9_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2575_c7_7275_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2571_c7_10b9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2572_c3_78e3_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2572_c3_78e3_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2572_c3_78e3_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2575_c11_d0ad_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2575_c11_d0ad_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2575_c11_d0ad_return_output : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2575_c7_7275_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2575_c7_7275_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2579_c7_95bf_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2575_c7_7275_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2575_c7_7275_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2575_c7_7275_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_95bf_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2575_c7_7275_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2575_c7_7275_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2575_c7_7275_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_95bf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2575_c7_7275_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2575_c7_7275_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2575_c7_7275_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_95bf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2575_c7_7275_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2575_c7_7275_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2575_c7_7275_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_95bf_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2575_c7_7275_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2575_c7_7275_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2575_c7_7275_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_95bf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2575_c7_7275_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2575_c7_7275_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2575_c7_7275_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2579_c7_95bf_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2575_c7_7275_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2579_c11_74cf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2579_c11_74cf_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2579_c11_74cf_return_output : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2579_c7_95bf_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2579_c7_95bf_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2579_c7_95bf_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_95bf_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2584_c3_26c5 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_95bf_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_6336_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_95bf_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_95bf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_95bf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2587_c7_6336_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_95bf_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_95bf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_95bf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2587_c7_6336_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_95bf_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_95bf_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_95bf_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_95bf_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_95bf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_95bf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_6336_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_95bf_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2579_c7_95bf_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2579_c7_95bf_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2587_c7_6336_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2579_c7_95bf_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2580_c3_a5ce_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2580_c3_a5ce_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2580_c3_a5ce_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2582_c30_717a_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2582_c30_717a_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2582_c30_717a_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2582_c30_717a_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2585_c21_da1f_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2587_c11_2442_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2587_c11_2442_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2587_c11_2442_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_6336_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2589_c3_6f50 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_6336_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_9458_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_6336_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2587_c7_6336_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2587_c7_6336_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_9458_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2587_c7_6336_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_6336_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_6336_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_9458_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_6336_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2587_c7_6336_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2587_c7_6336_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2587_c7_6336_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2587_c7_6336_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2587_c7_6336_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2592_c7_9458_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2587_c7_6336_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2590_c31_67e0_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2590_c31_67e0_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2590_c21_a157_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2592_c11_3ee6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2592_c11_3ee6_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2592_c11_3ee6_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_9458_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2593_c3_34a7 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_9458_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2596_c7_b58c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_9458_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_9458_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_9458_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2596_c7_b58c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_9458_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_9458_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_9458_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2596_c7_b58c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_9458_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2592_c7_9458_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2592_c7_9458_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2596_c7_b58c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2592_c7_9458_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2594_c21_f805_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2596_c11_f74d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2596_c11_f74d_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2596_c11_f74d_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2596_c7_b58c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2597_c3_add6 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2596_c7_b58c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c7_7d84_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2596_c7_b58c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2596_c7_b58c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2596_c7_b58c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2600_c7_7d84_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2596_c7_b58c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2596_c7_b58c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2596_c7_b58c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2600_c7_7d84_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2596_c7_b58c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2596_c7_b58c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2596_c7_b58c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2600_c7_7d84_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2596_c7_b58c_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2598_c31_2e0a_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2598_c31_2e0a_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2598_c21_bc4e_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2600_c11_c220_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2600_c11_c220_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2600_c11_c220_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c7_7d84_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2601_c3_0d16 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c7_7d84_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2604_c7_608e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c7_7d84_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2600_c7_7d84_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2600_c7_7d84_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_608e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2600_c7_7d84_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2600_c7_7d84_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2600_c7_7d84_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_608e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2600_c7_7d84_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2600_c7_7d84_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2600_c7_7d84_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2604_c7_608e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2600_c7_7d84_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2602_c21_f409_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2604_c11_39e7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2604_c11_39e7_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2604_c11_39e7_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2604_c7_608e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2605_c3_0636 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2604_c7_608e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2604_c7_608e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_608e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_608e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2608_c7_d0ab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_608e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_608e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_608e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2608_c7_d0ab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_608e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2604_c7_608e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2604_c7_608e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2604_c7_608e_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2606_c31_8b28_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2606_c31_8b28_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2606_c21_186f_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2608_c11_0ab7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2608_c11_0ab7_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2608_c11_0ab7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2608_c7_d0ab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2608_c7_d0ab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2608_c7_d0ab_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2608_c7_d0ab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2608_c7_d0ab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2608_c7_d0ab_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2554_l2608_l2549_l2575_l2604_l2571_l2600_l2566_l2596_l2562_l2592_l2557_l2587_DUPLICATE_d884_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2554_l2549_l2575_l2571_l2566_l2562_l2557_l2587_DUPLICATE_585a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2554_l2579_l2549_l2575_l2571_l2566_l2562_l2557_DUPLICATE_d587_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2554_l2549_l2575_l2604_l2571_l2566_l2562_l2557_DUPLICATE_2c08_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2554_l2579_l2608_l2575_l2604_l2571_l2600_l2566_l2596_l2562_l2592_l2557_l2587_DUPLICATE_c29a_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2558_l2567_l2563_l2576_l2572_l2580_DUPLICATE_14a8_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2577_l2559_l2568_DUPLICATE_e191_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2577_l2559_l2568_DUPLICATE_e191_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2604_l2575_DUPLICATE_556a_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4e73_uxn_opcodes_h_l2613_l2545_DUPLICATE_2f69_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2584_c3_26c5 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_95bf_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2584_c3_26c5;
     VAR_sp_relative_shift_uxn_opcodes_h_l2582_c30_717a_x := signed(std_logic_vector(resize(to_unsigned(6, 3), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2566_c11_cf78_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2551_c3_dafd := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2549_c2_16ab_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2551_c3_dafd;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2587_c11_2442_right := to_unsigned(8, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2575_c11_d0ad_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2569_c3_714a := resize(to_unsigned(6, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2566_c7_c443_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2569_c3_714a;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2597_c3_add6 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2596_c7_b58c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2597_c3_add6;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2589_c3_6f50 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_6336_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2589_c3_6f50;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_95bf_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2549_c1_a1aa_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2571_c11_bb3c_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2601_c3_0d16 := resize(to_unsigned(5, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c7_7d84_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2601_c3_0d16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2562_c11_91ac_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2605_c3_0636 := resize(to_unsigned(6, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2604_c7_608e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2605_c3_0636;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2549_c2_16ab_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2582_c30_717a_y := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2608_c7_d0ab_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2557_c11_0734_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2564_c3_764f := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2562_c7_7283_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2564_c3_764f;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2593_c3_34a7 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_9458_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2593_c3_34a7;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2573_c3_19c3 := resize(to_unsigned(5, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_10b9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2573_c3_19c3;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2608_c7_d0ab_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2554_c11_c4f5_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2549_c6_1519_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2596_c11_f74d_right := to_unsigned(10, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2604_c11_39e7_right := to_unsigned(12, 4);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_95bf_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2579_c11_74cf_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2600_c11_c220_right := to_unsigned(11, 4);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2587_c7_6336_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2555_c3_25aa := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2554_c7_c9a1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2555_c3_25aa;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2560_c3_7b2f := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2557_c7_f7ad_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2560_c3_7b2f;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2592_c11_3ee6_right := to_unsigned(9, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2608_c11_0ab7_right := to_unsigned(13, 4);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2549_c1_a1aa_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l2582_c30_717a_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2580_c3_a5ce_left := l16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2590_c31_67e0_x := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2549_c2_16ab_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2554_c7_c9a1_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2557_c7_f7ad_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2562_c7_7283_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2566_c7_c443_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2571_c7_10b9_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2579_c7_95bf_iffalse := l16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2572_c3_78e3_left := n16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2606_c31_8b28_x := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2549_c2_16ab_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2554_c7_c9a1_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2557_c7_f7ad_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2562_c7_7283_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2571_c7_10b9_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2549_c6_1519_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2554_c11_c4f5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2557_c11_0734_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2562_c11_91ac_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2566_c11_cf78_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2571_c11_bb3c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2575_c11_d0ad_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2579_c11_74cf_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2587_c11_2442_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2592_c11_3ee6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2596_c11_f74d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2600_c11_c220_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2604_c11_39e7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2608_c11_0ab7_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2563_c3_f311_left := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2598_c31_2e0a_x := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2549_c2_16ab_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2554_c7_c9a1_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2562_c7_7283_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l2608_c11_0ab7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2608_c11_0ab7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2608_c11_0ab7_left;
     BIN_OP_EQ_uxn_opcodes_h_l2608_c11_0ab7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2608_c11_0ab7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2608_c11_0ab7_return_output := BIN_OP_EQ_uxn_opcodes_h_l2608_c11_0ab7_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2554_l2549_l2575_l2604_l2571_l2566_l2562_l2557_DUPLICATE_2c08 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2554_l2549_l2575_l2604_l2571_l2566_l2562_l2557_DUPLICATE_2c08_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2604_c11_39e7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2604_c11_39e7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2604_c11_39e7_left;
     BIN_OP_EQ_uxn_opcodes_h_l2604_c11_39e7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2604_c11_39e7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2604_c11_39e7_return_output := BIN_OP_EQ_uxn_opcodes_h_l2604_c11_39e7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2554_c11_c4f5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2554_c11_c4f5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2554_c11_c4f5_left;
     BIN_OP_EQ_uxn_opcodes_h_l2554_c11_c4f5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2554_c11_c4f5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2554_c11_c4f5_return_output := BIN_OP_EQ_uxn_opcodes_h_l2554_c11_c4f5_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2554_l2549_l2575_l2571_l2566_l2562_l2557_l2587_DUPLICATE_585a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2554_l2549_l2575_l2571_l2566_l2562_l2557_l2587_DUPLICATE_585a_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2571_c11_bb3c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2571_c11_bb3c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2571_c11_bb3c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2571_c11_bb3c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2571_c11_bb3c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2571_c11_bb3c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2571_c11_bb3c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2579_c11_74cf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2579_c11_74cf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2579_c11_74cf_left;
     BIN_OP_EQ_uxn_opcodes_h_l2579_c11_74cf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2579_c11_74cf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2579_c11_74cf_return_output := BIN_OP_EQ_uxn_opcodes_h_l2579_c11_74cf_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2604_l2575_DUPLICATE_556a LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2604_l2575_DUPLICATE_556a_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2549_c6_1519] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2549_c6_1519_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2549_c6_1519_left;
     BIN_OP_EQ_uxn_opcodes_h_l2549_c6_1519_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2549_c6_1519_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2549_c6_1519_return_output := BIN_OP_EQ_uxn_opcodes_h_l2549_c6_1519_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l2598_c31_2e0a] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2598_c31_2e0a_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2598_c31_2e0a_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2598_c31_2e0a_return_output := CONST_SR_8_uxn_opcodes_h_l2598_c31_2e0a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2557_c11_0734] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2557_c11_0734_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2557_c11_0734_left;
     BIN_OP_EQ_uxn_opcodes_h_l2557_c11_0734_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2557_c11_0734_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2557_c11_0734_return_output := BIN_OP_EQ_uxn_opcodes_h_l2557_c11_0734_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l2582_c30_717a] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2582_c30_717a_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2582_c30_717a_ins;
     sp_relative_shift_uxn_opcodes_h_l2582_c30_717a_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2582_c30_717a_x;
     sp_relative_shift_uxn_opcodes_h_l2582_c30_717a_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2582_c30_717a_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2582_c30_717a_return_output := sp_relative_shift_uxn_opcodes_h_l2582_c30_717a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2562_c11_91ac] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2562_c11_91ac_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2562_c11_91ac_left;
     BIN_OP_EQ_uxn_opcodes_h_l2562_c11_91ac_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2562_c11_91ac_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2562_c11_91ac_return_output := BIN_OP_EQ_uxn_opcodes_h_l2562_c11_91ac_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2558_l2567_l2563_l2576_l2572_l2580_DUPLICATE_14a8 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2558_l2567_l2563_l2576_l2572_l2580_DUPLICATE_14a8_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l2587_c11_2442] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2587_c11_2442_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2587_c11_2442_left;
     BIN_OP_EQ_uxn_opcodes_h_l2587_c11_2442_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2587_c11_2442_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2587_c11_2442_return_output := BIN_OP_EQ_uxn_opcodes_h_l2587_c11_2442_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2554_l2579_l2549_l2575_l2571_l2566_l2562_l2557_DUPLICATE_d587 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2554_l2579_l2549_l2575_l2571_l2566_l2562_l2557_DUPLICATE_d587_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2600_c11_c220] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2600_c11_c220_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2600_c11_c220_left;
     BIN_OP_EQ_uxn_opcodes_h_l2600_c11_c220_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2600_c11_c220_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2600_c11_c220_return_output := BIN_OP_EQ_uxn_opcodes_h_l2600_c11_c220_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2594_c21_f805] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2594_c21_f805_return_output := CAST_TO_uint8_t_uint16_t(
     t16);

     -- CONST_SR_8[uxn_opcodes_h_l2606_c31_8b28] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2606_c31_8b28_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2606_c31_8b28_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2606_c31_8b28_return_output := CONST_SR_8_uxn_opcodes_h_l2606_c31_8b28_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2575_c11_d0ad] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2575_c11_d0ad_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2575_c11_d0ad_left;
     BIN_OP_EQ_uxn_opcodes_h_l2575_c11_d0ad_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2575_c11_d0ad_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2575_c11_d0ad_return_output := BIN_OP_EQ_uxn_opcodes_h_l2575_c11_d0ad_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l2590_c31_67e0] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2590_c31_67e0_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2590_c31_67e0_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2590_c31_67e0_return_output := CONST_SR_8_uxn_opcodes_h_l2590_c31_67e0_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2602_c21_f409] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2602_c21_f409_return_output := CAST_TO_uint8_t_uint16_t(
     n16);

     -- BIN_OP_EQ[uxn_opcodes_h_l2592_c11_3ee6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2592_c11_3ee6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2592_c11_3ee6_left;
     BIN_OP_EQ_uxn_opcodes_h_l2592_c11_3ee6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2592_c11_3ee6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2592_c11_3ee6_return_output := BIN_OP_EQ_uxn_opcodes_h_l2592_c11_3ee6_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2554_l2579_l2608_l2575_l2604_l2571_l2600_l2566_l2596_l2562_l2592_l2557_l2587_DUPLICATE_c29a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2554_l2579_l2608_l2575_l2604_l2571_l2600_l2566_l2596_l2562_l2592_l2557_l2587_DUPLICATE_c29a_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2554_l2608_l2549_l2575_l2604_l2571_l2600_l2566_l2596_l2562_l2592_l2557_l2587_DUPLICATE_d884 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2554_l2608_l2549_l2575_l2604_l2571_l2600_l2566_l2596_l2562_l2592_l2557_l2587_DUPLICATE_d884_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2566_c11_cf78] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2566_c11_cf78_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2566_c11_cf78_left;
     BIN_OP_EQ_uxn_opcodes_h_l2566_c11_cf78_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2566_c11_cf78_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2566_c11_cf78_return_output := BIN_OP_EQ_uxn_opcodes_h_l2566_c11_cf78_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2596_c11_f74d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2596_c11_f74d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2596_c11_f74d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2596_c11_f74d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2596_c11_f74d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2596_c11_f74d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2596_c11_f74d_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2549_c1_a1aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2549_c6_1519_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2549_c2_16ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2549_c6_1519_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2549_c2_16ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2549_c6_1519_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2549_c2_16ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2549_c6_1519_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2549_c2_16ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2549_c6_1519_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2549_c2_16ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2549_c6_1519_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2549_c2_16ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2549_c6_1519_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2549_c2_16ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2549_c6_1519_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2549_c2_16ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2549_c6_1519_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2549_c2_16ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2549_c6_1519_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2554_c7_c9a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2554_c11_c4f5_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2554_c7_c9a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2554_c11_c4f5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2554_c7_c9a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2554_c11_c4f5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2554_c7_c9a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2554_c11_c4f5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2554_c7_c9a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2554_c11_c4f5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2554_c7_c9a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2554_c11_c4f5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2554_c7_c9a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2554_c11_c4f5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2554_c7_c9a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2554_c11_c4f5_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2554_c7_c9a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2554_c11_c4f5_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2557_c7_f7ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2557_c11_0734_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2557_c7_f7ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2557_c11_0734_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2557_c7_f7ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2557_c11_0734_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2557_c7_f7ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2557_c11_0734_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2557_c7_f7ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2557_c11_0734_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2557_c7_f7ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2557_c11_0734_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2557_c7_f7ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2557_c11_0734_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2557_c7_f7ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2557_c11_0734_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2557_c7_f7ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2557_c11_0734_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2562_c7_7283_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2562_c11_91ac_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2562_c7_7283_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2562_c11_91ac_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2562_c7_7283_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2562_c11_91ac_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2562_c7_7283_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2562_c11_91ac_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2562_c7_7283_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2562_c11_91ac_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2562_c7_7283_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2562_c11_91ac_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2562_c7_7283_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2562_c11_91ac_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2562_c7_7283_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2562_c11_91ac_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2562_c7_7283_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2562_c11_91ac_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2566_c7_c443_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2566_c11_cf78_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2566_c7_c443_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2566_c11_cf78_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2566_c7_c443_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2566_c11_cf78_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2566_c7_c443_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2566_c11_cf78_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2566_c7_c443_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2566_c11_cf78_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2566_c7_c443_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2566_c11_cf78_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2566_c7_c443_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2566_c11_cf78_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2566_c7_c443_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2566_c11_cf78_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2571_c7_10b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2571_c11_bb3c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2571_c7_10b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2571_c11_bb3c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_10b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2571_c11_bb3c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2571_c7_10b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2571_c11_bb3c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2571_c7_10b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2571_c11_bb3c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_10b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2571_c11_bb3c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_10b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2571_c11_bb3c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2571_c7_10b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2571_c11_bb3c_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2575_c7_7275_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2575_c11_d0ad_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2575_c7_7275_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2575_c11_d0ad_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2575_c7_7275_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2575_c11_d0ad_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2575_c7_7275_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2575_c11_d0ad_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2575_c7_7275_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2575_c11_d0ad_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2575_c7_7275_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2575_c11_d0ad_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2575_c7_7275_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2575_c11_d0ad_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2579_c7_95bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2579_c11_74cf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_95bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2579_c11_74cf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_95bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2579_c11_74cf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_95bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2579_c11_74cf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_95bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2579_c11_74cf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_95bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2579_c11_74cf_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2579_c7_95bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2579_c11_74cf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_6336_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2587_c11_2442_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2587_c7_6336_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2587_c11_2442_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2587_c7_6336_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2587_c11_2442_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_6336_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2587_c11_2442_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2587_c7_6336_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2587_c11_2442_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_9458_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2592_c11_3ee6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_9458_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2592_c11_3ee6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_9458_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2592_c11_3ee6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2592_c7_9458_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2592_c11_3ee6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2596_c7_b58c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2596_c11_f74d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2596_c7_b58c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2596_c11_f74d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2596_c7_b58c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2596_c11_f74d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2596_c7_b58c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2596_c11_f74d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2600_c7_7d84_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2600_c11_c220_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2600_c7_7d84_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2600_c11_c220_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c7_7d84_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2600_c11_c220_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2600_c7_7d84_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2600_c11_c220_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_608e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2604_c11_39e7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_608e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2604_c11_39e7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2604_c7_608e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2604_c11_39e7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2604_c7_608e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2604_c11_39e7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2608_c7_d0ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2608_c11_0ab7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2608_c7_d0ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2608_c11_0ab7_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2563_c3_f311_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2558_l2567_l2563_l2576_l2572_l2580_DUPLICATE_14a8_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2572_c3_78e3_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2558_l2567_l2563_l2576_l2572_l2580_DUPLICATE_14a8_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2580_c3_a5ce_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2558_l2567_l2563_l2576_l2572_l2580_DUPLICATE_14a8_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2577_l2559_l2568_DUPLICATE_e191_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2558_l2567_l2563_l2576_l2572_l2580_DUPLICATE_14a8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2592_c7_9458_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2594_c21_f805_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2600_c7_7d84_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2602_c21_f409_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2549_c2_16ab_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2554_l2579_l2549_l2575_l2571_l2566_l2562_l2557_DUPLICATE_d587_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2554_c7_c9a1_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2554_l2579_l2549_l2575_l2571_l2566_l2562_l2557_DUPLICATE_d587_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2557_c7_f7ad_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2554_l2579_l2549_l2575_l2571_l2566_l2562_l2557_DUPLICATE_d587_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2562_c7_7283_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2554_l2579_l2549_l2575_l2571_l2566_l2562_l2557_DUPLICATE_d587_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2566_c7_c443_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2554_l2579_l2549_l2575_l2571_l2566_l2562_l2557_DUPLICATE_d587_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_10b9_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2554_l2579_l2549_l2575_l2571_l2566_l2562_l2557_DUPLICATE_d587_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2575_c7_7275_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2554_l2579_l2549_l2575_l2571_l2566_l2562_l2557_DUPLICATE_d587_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_95bf_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2554_l2579_l2549_l2575_l2571_l2566_l2562_l2557_DUPLICATE_d587_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2554_c7_c9a1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2554_l2579_l2608_l2575_l2604_l2571_l2600_l2566_l2596_l2562_l2592_l2557_l2587_DUPLICATE_c29a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2557_c7_f7ad_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2554_l2579_l2608_l2575_l2604_l2571_l2600_l2566_l2596_l2562_l2592_l2557_l2587_DUPLICATE_c29a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2562_c7_7283_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2554_l2579_l2608_l2575_l2604_l2571_l2600_l2566_l2596_l2562_l2592_l2557_l2587_DUPLICATE_c29a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2566_c7_c443_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2554_l2579_l2608_l2575_l2604_l2571_l2600_l2566_l2596_l2562_l2592_l2557_l2587_DUPLICATE_c29a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_10b9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2554_l2579_l2608_l2575_l2604_l2571_l2600_l2566_l2596_l2562_l2592_l2557_l2587_DUPLICATE_c29a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2575_c7_7275_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2554_l2579_l2608_l2575_l2604_l2571_l2600_l2566_l2596_l2562_l2592_l2557_l2587_DUPLICATE_c29a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_95bf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2554_l2579_l2608_l2575_l2604_l2571_l2600_l2566_l2596_l2562_l2592_l2557_l2587_DUPLICATE_c29a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_6336_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2554_l2579_l2608_l2575_l2604_l2571_l2600_l2566_l2596_l2562_l2592_l2557_l2587_DUPLICATE_c29a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_9458_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2554_l2579_l2608_l2575_l2604_l2571_l2600_l2566_l2596_l2562_l2592_l2557_l2587_DUPLICATE_c29a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2596_c7_b58c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2554_l2579_l2608_l2575_l2604_l2571_l2600_l2566_l2596_l2562_l2592_l2557_l2587_DUPLICATE_c29a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2600_c7_7d84_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2554_l2579_l2608_l2575_l2604_l2571_l2600_l2566_l2596_l2562_l2592_l2557_l2587_DUPLICATE_c29a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_608e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2554_l2579_l2608_l2575_l2604_l2571_l2600_l2566_l2596_l2562_l2592_l2557_l2587_DUPLICATE_c29a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2608_c7_d0ab_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2554_l2579_l2608_l2575_l2604_l2571_l2600_l2566_l2596_l2562_l2592_l2557_l2587_DUPLICATE_c29a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2549_c2_16ab_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2554_l2549_l2575_l2571_l2566_l2562_l2557_l2587_DUPLICATE_585a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2554_c7_c9a1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2554_l2549_l2575_l2571_l2566_l2562_l2557_l2587_DUPLICATE_585a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2557_c7_f7ad_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2554_l2549_l2575_l2571_l2566_l2562_l2557_l2587_DUPLICATE_585a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2562_c7_7283_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2554_l2549_l2575_l2571_l2566_l2562_l2557_l2587_DUPLICATE_585a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2566_c7_c443_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2554_l2549_l2575_l2571_l2566_l2562_l2557_l2587_DUPLICATE_585a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2571_c7_10b9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2554_l2549_l2575_l2571_l2566_l2562_l2557_l2587_DUPLICATE_585a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2575_c7_7275_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2554_l2549_l2575_l2571_l2566_l2562_l2557_l2587_DUPLICATE_585a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2587_c7_6336_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2554_l2549_l2575_l2571_l2566_l2562_l2557_l2587_DUPLICATE_585a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2549_c2_16ab_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2554_l2608_l2549_l2575_l2604_l2571_l2600_l2566_l2596_l2562_l2592_l2557_l2587_DUPLICATE_d884_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2554_c7_c9a1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2554_l2608_l2549_l2575_l2604_l2571_l2600_l2566_l2596_l2562_l2592_l2557_l2587_DUPLICATE_d884_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2557_c7_f7ad_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2554_l2608_l2549_l2575_l2604_l2571_l2600_l2566_l2596_l2562_l2592_l2557_l2587_DUPLICATE_d884_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2562_c7_7283_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2554_l2608_l2549_l2575_l2604_l2571_l2600_l2566_l2596_l2562_l2592_l2557_l2587_DUPLICATE_d884_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2566_c7_c443_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2554_l2608_l2549_l2575_l2604_l2571_l2600_l2566_l2596_l2562_l2592_l2557_l2587_DUPLICATE_d884_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2571_c7_10b9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2554_l2608_l2549_l2575_l2604_l2571_l2600_l2566_l2596_l2562_l2592_l2557_l2587_DUPLICATE_d884_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2575_c7_7275_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2554_l2608_l2549_l2575_l2604_l2571_l2600_l2566_l2596_l2562_l2592_l2557_l2587_DUPLICATE_d884_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2587_c7_6336_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2554_l2608_l2549_l2575_l2604_l2571_l2600_l2566_l2596_l2562_l2592_l2557_l2587_DUPLICATE_d884_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_9458_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2554_l2608_l2549_l2575_l2604_l2571_l2600_l2566_l2596_l2562_l2592_l2557_l2587_DUPLICATE_d884_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2596_c7_b58c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2554_l2608_l2549_l2575_l2604_l2571_l2600_l2566_l2596_l2562_l2592_l2557_l2587_DUPLICATE_d884_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2600_c7_7d84_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2554_l2608_l2549_l2575_l2604_l2571_l2600_l2566_l2596_l2562_l2592_l2557_l2587_DUPLICATE_d884_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_608e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2554_l2608_l2549_l2575_l2604_l2571_l2600_l2566_l2596_l2562_l2592_l2557_l2587_DUPLICATE_d884_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2608_c7_d0ab_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2554_l2608_l2549_l2575_l2604_l2571_l2600_l2566_l2596_l2562_l2592_l2557_l2587_DUPLICATE_d884_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2575_c7_7275_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2604_l2575_DUPLICATE_556a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2604_c7_608e_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2604_l2575_DUPLICATE_556a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2549_c2_16ab_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2554_l2549_l2575_l2604_l2571_l2566_l2562_l2557_DUPLICATE_2c08_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2554_c7_c9a1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2554_l2549_l2575_l2604_l2571_l2566_l2562_l2557_DUPLICATE_2c08_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2557_c7_f7ad_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2554_l2549_l2575_l2604_l2571_l2566_l2562_l2557_DUPLICATE_2c08_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2562_c7_7283_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2554_l2549_l2575_l2604_l2571_l2566_l2562_l2557_DUPLICATE_2c08_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2566_c7_c443_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2554_l2549_l2575_l2604_l2571_l2566_l2562_l2557_DUPLICATE_2c08_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2571_c7_10b9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2554_l2549_l2575_l2604_l2571_l2566_l2562_l2557_DUPLICATE_2c08_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2575_c7_7275_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2554_l2549_l2575_l2604_l2571_l2566_l2562_l2557_DUPLICATE_2c08_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2604_c7_608e_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2554_l2549_l2575_l2604_l2571_l2566_l2562_l2557_DUPLICATE_2c08_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_95bf_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2582_c30_717a_return_output;
     -- CAST_TO_uint8_t[uxn_opcodes_h_l2590_c21_a157] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2590_c21_a157_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2590_c31_67e0_return_output);

     -- BIN_OP_OR[uxn_opcodes_h_l2580_c3_a5ce] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2580_c3_a5ce_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2580_c3_a5ce_left;
     BIN_OP_OR_uxn_opcodes_h_l2580_c3_a5ce_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2580_c3_a5ce_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2580_c3_a5ce_return_output := BIN_OP_OR_uxn_opcodes_h_l2580_c3_a5ce_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2598_c21_bc4e] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2598_c21_bc4e_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2598_c31_2e0a_return_output);

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l2577_l2559_l2568_DUPLICATE_e191 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l2577_l2559_l2568_DUPLICATE_e191_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2577_l2559_l2568_DUPLICATE_e191_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2577_l2559_l2568_DUPLICATE_e191_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l2577_l2559_l2568_DUPLICATE_e191_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2563_c3_f311] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2563_c3_f311_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2563_c3_f311_left;
     BIN_OP_OR_uxn_opcodes_h_l2563_c3_f311_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2563_c3_f311_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2563_c3_f311_return_output := BIN_OP_OR_uxn_opcodes_h_l2563_c3_f311_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2572_c3_78e3] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2572_c3_78e3_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2572_c3_78e3_left;
     BIN_OP_OR_uxn_opcodes_h_l2572_c3_78e3_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2572_c3_78e3_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2572_c3_78e3_return_output := BIN_OP_OR_uxn_opcodes_h_l2572_c3_78e3_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2606_c21_186f] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2606_c21_186f_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2606_c31_8b28_return_output);

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2587_c7_6336] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2587_c7_6336_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2587_c7_6336_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2587_c7_6336_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2587_c7_6336_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2587_c7_6336_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2587_c7_6336_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2587_c7_6336_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2587_c7_6336_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2608_c7_d0ab] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2608_c7_d0ab_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2608_c7_d0ab_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2608_c7_d0ab_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2608_c7_d0ab_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2608_c7_d0ab_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2608_c7_d0ab_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2608_c7_d0ab_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2608_c7_d0ab_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2579_c7_95bf] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_95bf_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_95bf_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_95bf_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_95bf_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_95bf_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_95bf_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_95bf_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_95bf_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2608_c7_d0ab] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2608_c7_d0ab_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2608_c7_d0ab_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2608_c7_d0ab_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2608_c7_d0ab_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2608_c7_d0ab_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2608_c7_d0ab_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2608_c7_d0ab_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2608_c7_d0ab_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2549_c1_a1aa] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2549_c1_a1aa_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2549_c1_a1aa_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2549_c1_a1aa_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2549_c1_a1aa_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2549_c1_a1aa_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2549_c1_a1aa_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2549_c1_a1aa_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2549_c1_a1aa_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2604_c7_608e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2604_c7_608e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2604_c7_608e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2604_c7_608e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2604_c7_608e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2604_c7_608e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2604_c7_608e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2604_c7_608e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2604_c7_608e_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l2562_c7_7283_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2563_c3_f311_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2571_c7_10b9_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2572_c3_78e3_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2579_c7_95bf_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2580_c3_a5ce_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2587_c7_6336_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2590_c21_a157_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2596_c7_b58c_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2598_c21_bc4e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2604_c7_608e_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2606_c21_186f_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2575_c7_7275_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2577_l2559_l2568_DUPLICATE_e191_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2566_c7_c443_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2577_l2559_l2568_DUPLICATE_e191_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2557_c7_f7ad_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2577_l2559_l2568_DUPLICATE_e191_return_output;
     VAR_printf_uxn_opcodes_h_l2550_c3_882e_uxn_opcodes_h_l2550_c3_882e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2549_c1_a1aa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_608e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2608_c7_d0ab_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_95bf_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2587_c7_6336_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_608e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2608_c7_d0ab_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2575_c7_7275_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_95bf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c7_7d84_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2604_c7_608e_return_output;
     -- printf_uxn_opcodes_h_l2550_c3_882e[uxn_opcodes_h_l2550_c3_882e] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2550_c3_882e_uxn_opcodes_h_l2550_c3_882e_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2550_c3_882e_uxn_opcodes_h_l2550_c3_882e_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2585_c21_da1f] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2585_c21_da1f_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_OR_uxn_opcodes_h_l2580_c3_a5ce_return_output);

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2579_c7_95bf] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_95bf_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_95bf_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_95bf_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_95bf_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_95bf_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_95bf_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_95bf_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_95bf_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2604_c7_608e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_608e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_608e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_608e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_608e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_608e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_608e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_608e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_608e_return_output;

     -- l16_MUX[uxn_opcodes_h_l2579_c7_95bf] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2579_c7_95bf_cond <= VAR_l16_MUX_uxn_opcodes_h_l2579_c7_95bf_cond;
     l16_MUX_uxn_opcodes_h_l2579_c7_95bf_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2579_c7_95bf_iftrue;
     l16_MUX_uxn_opcodes_h_l2579_c7_95bf_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2579_c7_95bf_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2579_c7_95bf_return_output := l16_MUX_uxn_opcodes_h_l2579_c7_95bf_return_output;

     -- n16_MUX[uxn_opcodes_h_l2571_c7_10b9] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2571_c7_10b9_cond <= VAR_n16_MUX_uxn_opcodes_h_l2571_c7_10b9_cond;
     n16_MUX_uxn_opcodes_h_l2571_c7_10b9_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2571_c7_10b9_iftrue;
     n16_MUX_uxn_opcodes_h_l2571_c7_10b9_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2571_c7_10b9_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2571_c7_10b9_return_output := n16_MUX_uxn_opcodes_h_l2571_c7_10b9_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2604_c7_608e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2604_c7_608e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2604_c7_608e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2604_c7_608e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2604_c7_608e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2604_c7_608e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2604_c7_608e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2604_c7_608e_return_output := result_u8_value_MUX_uxn_opcodes_h_l2604_c7_608e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2604_c7_608e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_608e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_608e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_608e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_608e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_608e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_608e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_608e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_608e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2575_c7_7275] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2575_c7_7275_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2575_c7_7275_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2575_c7_7275_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2575_c7_7275_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2575_c7_7275_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2575_c7_7275_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2575_c7_7275_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2575_c7_7275_return_output;

     -- t16_MUX[uxn_opcodes_h_l2562_c7_7283] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2562_c7_7283_cond <= VAR_t16_MUX_uxn_opcodes_h_l2562_c7_7283_cond;
     t16_MUX_uxn_opcodes_h_l2562_c7_7283_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2562_c7_7283_iftrue;
     t16_MUX_uxn_opcodes_h_l2562_c7_7283_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2562_c7_7283_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2562_c7_7283_return_output := t16_MUX_uxn_opcodes_h_l2562_c7_7283_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2600_c7_7d84] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c7_7d84_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c7_7d84_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c7_7d84_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c7_7d84_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c7_7d84_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c7_7d84_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c7_7d84_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c7_7d84_return_output;

     -- Submodule level 3
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2579_c7_95bf_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2585_c21_da1f_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2575_c7_7275_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2579_c7_95bf_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2566_c7_c443_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2571_c7_10b9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2600_c7_7d84_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_608e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2575_c7_7275_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_95bf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2600_c7_7d84_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_608e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_10b9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2575_c7_7275_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2596_c7_b58c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c7_7d84_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2600_c7_7d84_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2604_c7_608e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2557_c7_f7ad_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2562_c7_7283_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2596_c7_b58c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2596_c7_b58c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2596_c7_b58c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2596_c7_b58c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2596_c7_b58c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2596_c7_b58c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2596_c7_b58c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2596_c7_b58c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2596_c7_b58c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2571_c7_10b9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_10b9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_10b9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_10b9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_10b9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_10b9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_10b9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_10b9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_10b9_return_output;

     -- n16_MUX[uxn_opcodes_h_l2566_c7_c443] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2566_c7_c443_cond <= VAR_n16_MUX_uxn_opcodes_h_l2566_c7_c443_cond;
     n16_MUX_uxn_opcodes_h_l2566_c7_c443_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2566_c7_c443_iftrue;
     n16_MUX_uxn_opcodes_h_l2566_c7_c443_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2566_c7_c443_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2566_c7_c443_return_output := n16_MUX_uxn_opcodes_h_l2566_c7_c443_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2600_c7_7d84] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2600_c7_7d84_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2600_c7_7d84_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2600_c7_7d84_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2600_c7_7d84_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2600_c7_7d84_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2600_c7_7d84_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2600_c7_7d84_return_output := result_u8_value_MUX_uxn_opcodes_h_l2600_c7_7d84_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2600_c7_7d84] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2600_c7_7d84_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2600_c7_7d84_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2600_c7_7d84_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2600_c7_7d84_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2600_c7_7d84_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2600_c7_7d84_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2600_c7_7d84_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2600_c7_7d84_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2600_c7_7d84] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2600_c7_7d84_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2600_c7_7d84_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2600_c7_7d84_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2600_c7_7d84_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2600_c7_7d84_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2600_c7_7d84_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2600_c7_7d84_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2600_c7_7d84_return_output;

     -- l16_MUX[uxn_opcodes_h_l2575_c7_7275] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2575_c7_7275_cond <= VAR_l16_MUX_uxn_opcodes_h_l2575_c7_7275_cond;
     l16_MUX_uxn_opcodes_h_l2575_c7_7275_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2575_c7_7275_iftrue;
     l16_MUX_uxn_opcodes_h_l2575_c7_7275_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2575_c7_7275_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2575_c7_7275_return_output := l16_MUX_uxn_opcodes_h_l2575_c7_7275_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2575_c7_7275] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2575_c7_7275_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2575_c7_7275_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2575_c7_7275_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2575_c7_7275_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2575_c7_7275_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2575_c7_7275_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2575_c7_7275_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2575_c7_7275_return_output;

     -- t16_MUX[uxn_opcodes_h_l2557_c7_f7ad] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2557_c7_f7ad_cond <= VAR_t16_MUX_uxn_opcodes_h_l2557_c7_f7ad_cond;
     t16_MUX_uxn_opcodes_h_l2557_c7_f7ad_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2557_c7_f7ad_iftrue;
     t16_MUX_uxn_opcodes_h_l2557_c7_f7ad_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2557_c7_f7ad_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2557_c7_f7ad_return_output := t16_MUX_uxn_opcodes_h_l2557_c7_f7ad_return_output;

     -- Submodule level 4
     VAR_l16_MUX_uxn_opcodes_h_l2571_c7_10b9_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2575_c7_7275_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2562_c7_7283_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2566_c7_c443_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2596_c7_b58c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2600_c7_7d84_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2571_c7_10b9_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2575_c7_7275_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2596_c7_b58c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2600_c7_7d84_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2566_c7_c443_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_10b9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_9458_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2596_c7_b58c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2596_c7_b58c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2600_c7_7d84_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2554_c7_c9a1_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2557_c7_f7ad_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2571_c7_10b9] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2571_c7_10b9_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2571_c7_10b9_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2571_c7_10b9_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2571_c7_10b9_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2571_c7_10b9_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2571_c7_10b9_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2571_c7_10b9_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2571_c7_10b9_return_output;

     -- n16_MUX[uxn_opcodes_h_l2562_c7_7283] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2562_c7_7283_cond <= VAR_n16_MUX_uxn_opcodes_h_l2562_c7_7283_cond;
     n16_MUX_uxn_opcodes_h_l2562_c7_7283_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2562_c7_7283_iftrue;
     n16_MUX_uxn_opcodes_h_l2562_c7_7283_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2562_c7_7283_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2562_c7_7283_return_output := n16_MUX_uxn_opcodes_h_l2562_c7_7283_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2566_c7_c443] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2566_c7_c443_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2566_c7_c443_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2566_c7_c443_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2566_c7_c443_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2566_c7_c443_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2566_c7_c443_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2566_c7_c443_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2566_c7_c443_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2592_c7_9458] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_9458_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_9458_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_9458_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_9458_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_9458_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_9458_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_9458_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_9458_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2596_c7_b58c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2596_c7_b58c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2596_c7_b58c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2596_c7_b58c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2596_c7_b58c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2596_c7_b58c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2596_c7_b58c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2596_c7_b58c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2596_c7_b58c_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2596_c7_b58c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2596_c7_b58c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2596_c7_b58c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2596_c7_b58c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2596_c7_b58c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2596_c7_b58c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2596_c7_b58c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2596_c7_b58c_return_output := result_u8_value_MUX_uxn_opcodes_h_l2596_c7_b58c_return_output;

     -- l16_MUX[uxn_opcodes_h_l2571_c7_10b9] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2571_c7_10b9_cond <= VAR_l16_MUX_uxn_opcodes_h_l2571_c7_10b9_cond;
     l16_MUX_uxn_opcodes_h_l2571_c7_10b9_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2571_c7_10b9_iftrue;
     l16_MUX_uxn_opcodes_h_l2571_c7_10b9_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2571_c7_10b9_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2571_c7_10b9_return_output := l16_MUX_uxn_opcodes_h_l2571_c7_10b9_return_output;

     -- t16_MUX[uxn_opcodes_h_l2554_c7_c9a1] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2554_c7_c9a1_cond <= VAR_t16_MUX_uxn_opcodes_h_l2554_c7_c9a1_cond;
     t16_MUX_uxn_opcodes_h_l2554_c7_c9a1_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2554_c7_c9a1_iftrue;
     t16_MUX_uxn_opcodes_h_l2554_c7_c9a1_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2554_c7_c9a1_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2554_c7_c9a1_return_output := t16_MUX_uxn_opcodes_h_l2554_c7_c9a1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2596_c7_b58c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2596_c7_b58c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2596_c7_b58c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2596_c7_b58c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2596_c7_b58c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2596_c7_b58c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2596_c7_b58c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2596_c7_b58c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2596_c7_b58c_return_output;

     -- Submodule level 5
     VAR_l16_MUX_uxn_opcodes_h_l2566_c7_c443_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2571_c7_10b9_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2557_c7_f7ad_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2562_c7_7283_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_9458_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2596_c7_b58c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2566_c7_c443_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2571_c7_10b9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_9458_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2596_c7_b58c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2562_c7_7283_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2566_c7_c443_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_6336_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_9458_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2592_c7_9458_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2596_c7_b58c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2549_c2_16ab_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2554_c7_c9a1_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2592_c7_9458] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_9458_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_9458_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_9458_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_9458_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_9458_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_9458_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_9458_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_9458_return_output;

     -- n16_MUX[uxn_opcodes_h_l2557_c7_f7ad] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2557_c7_f7ad_cond <= VAR_n16_MUX_uxn_opcodes_h_l2557_c7_f7ad_cond;
     n16_MUX_uxn_opcodes_h_l2557_c7_f7ad_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2557_c7_f7ad_iftrue;
     n16_MUX_uxn_opcodes_h_l2557_c7_f7ad_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2557_c7_f7ad_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2557_c7_f7ad_return_output := n16_MUX_uxn_opcodes_h_l2557_c7_f7ad_return_output;

     -- l16_MUX[uxn_opcodes_h_l2566_c7_c443] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2566_c7_c443_cond <= VAR_l16_MUX_uxn_opcodes_h_l2566_c7_c443_cond;
     l16_MUX_uxn_opcodes_h_l2566_c7_c443_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2566_c7_c443_iftrue;
     l16_MUX_uxn_opcodes_h_l2566_c7_c443_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2566_c7_c443_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2566_c7_c443_return_output := l16_MUX_uxn_opcodes_h_l2566_c7_c443_return_output;

     -- t16_MUX[uxn_opcodes_h_l2549_c2_16ab] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2549_c2_16ab_cond <= VAR_t16_MUX_uxn_opcodes_h_l2549_c2_16ab_cond;
     t16_MUX_uxn_opcodes_h_l2549_c2_16ab_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2549_c2_16ab_iftrue;
     t16_MUX_uxn_opcodes_h_l2549_c2_16ab_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2549_c2_16ab_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2549_c2_16ab_return_output := t16_MUX_uxn_opcodes_h_l2549_c2_16ab_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2562_c7_7283] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2562_c7_7283_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2562_c7_7283_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2562_c7_7283_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2562_c7_7283_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2562_c7_7283_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2562_c7_7283_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2562_c7_7283_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2562_c7_7283_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2587_c7_6336] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_6336_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_6336_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_6336_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_6336_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_6336_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_6336_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_6336_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_6336_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2592_c7_9458] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2592_c7_9458_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2592_c7_9458_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2592_c7_9458_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2592_c7_9458_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2592_c7_9458_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2592_c7_9458_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2592_c7_9458_return_output := result_u8_value_MUX_uxn_opcodes_h_l2592_c7_9458_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2566_c7_c443] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2566_c7_c443_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2566_c7_c443_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2566_c7_c443_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2566_c7_c443_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2566_c7_c443_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2566_c7_c443_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2566_c7_c443_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2566_c7_c443_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2592_c7_9458] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_9458_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_9458_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_9458_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_9458_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_9458_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_9458_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_9458_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_9458_return_output;

     -- Submodule level 6
     VAR_l16_MUX_uxn_opcodes_h_l2562_c7_7283_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2566_c7_c443_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2554_c7_c9a1_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2557_c7_f7ad_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_6336_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_9458_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2562_c7_7283_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2566_c7_c443_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2587_c7_6336_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_9458_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2557_c7_f7ad_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2562_c7_7283_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_95bf_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_6336_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2587_c7_6336_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2592_c7_9458_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2549_c2_16ab_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2587_c7_6336] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2587_c7_6336_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2587_c7_6336_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2587_c7_6336_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2587_c7_6336_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2587_c7_6336_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2587_c7_6336_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2587_c7_6336_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2587_c7_6336_return_output;

     -- l16_MUX[uxn_opcodes_h_l2562_c7_7283] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2562_c7_7283_cond <= VAR_l16_MUX_uxn_opcodes_h_l2562_c7_7283_cond;
     l16_MUX_uxn_opcodes_h_l2562_c7_7283_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2562_c7_7283_iftrue;
     l16_MUX_uxn_opcodes_h_l2562_c7_7283_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2562_c7_7283_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2562_c7_7283_return_output := l16_MUX_uxn_opcodes_h_l2562_c7_7283_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2557_c7_f7ad] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2557_c7_f7ad_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2557_c7_f7ad_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2557_c7_f7ad_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2557_c7_f7ad_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2557_c7_f7ad_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2557_c7_f7ad_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2557_c7_f7ad_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2557_c7_f7ad_return_output;

     -- n16_MUX[uxn_opcodes_h_l2554_c7_c9a1] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2554_c7_c9a1_cond <= VAR_n16_MUX_uxn_opcodes_h_l2554_c7_c9a1_cond;
     n16_MUX_uxn_opcodes_h_l2554_c7_c9a1_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2554_c7_c9a1_iftrue;
     n16_MUX_uxn_opcodes_h_l2554_c7_c9a1_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2554_c7_c9a1_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2554_c7_c9a1_return_output := n16_MUX_uxn_opcodes_h_l2554_c7_c9a1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2579_c7_95bf] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_95bf_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_95bf_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_95bf_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_95bf_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_95bf_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_95bf_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_95bf_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_95bf_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2587_c7_6336] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_6336_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_6336_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_6336_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_6336_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_6336_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_6336_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_6336_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_6336_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2587_c7_6336] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2587_c7_6336_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2587_c7_6336_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2587_c7_6336_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2587_c7_6336_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2587_c7_6336_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2587_c7_6336_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2587_c7_6336_return_output := result_u8_value_MUX_uxn_opcodes_h_l2587_c7_6336_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2562_c7_7283] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2562_c7_7283_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2562_c7_7283_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2562_c7_7283_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2562_c7_7283_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2562_c7_7283_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2562_c7_7283_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2562_c7_7283_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2562_c7_7283_return_output;

     -- Submodule level 7
     VAR_l16_MUX_uxn_opcodes_h_l2557_c7_f7ad_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2562_c7_7283_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2549_c2_16ab_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2554_c7_c9a1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_95bf_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_6336_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2557_c7_f7ad_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2562_c7_7283_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_95bf_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2587_c7_6336_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2554_c7_c9a1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2557_c7_f7ad_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2575_c7_7275_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_95bf_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2579_c7_95bf_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2587_c7_6336_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2579_c7_95bf] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2579_c7_95bf_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2579_c7_95bf_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2579_c7_95bf_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2579_c7_95bf_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2579_c7_95bf_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2579_c7_95bf_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2579_c7_95bf_return_output := result_u8_value_MUX_uxn_opcodes_h_l2579_c7_95bf_return_output;

     -- n16_MUX[uxn_opcodes_h_l2549_c2_16ab] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2549_c2_16ab_cond <= VAR_n16_MUX_uxn_opcodes_h_l2549_c2_16ab_cond;
     n16_MUX_uxn_opcodes_h_l2549_c2_16ab_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2549_c2_16ab_iftrue;
     n16_MUX_uxn_opcodes_h_l2549_c2_16ab_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2549_c2_16ab_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2549_c2_16ab_return_output := n16_MUX_uxn_opcodes_h_l2549_c2_16ab_return_output;

     -- l16_MUX[uxn_opcodes_h_l2557_c7_f7ad] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2557_c7_f7ad_cond <= VAR_l16_MUX_uxn_opcodes_h_l2557_c7_f7ad_cond;
     l16_MUX_uxn_opcodes_h_l2557_c7_f7ad_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2557_c7_f7ad_iftrue;
     l16_MUX_uxn_opcodes_h_l2557_c7_f7ad_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2557_c7_f7ad_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2557_c7_f7ad_return_output := l16_MUX_uxn_opcodes_h_l2557_c7_f7ad_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2575_c7_7275] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2575_c7_7275_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2575_c7_7275_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2575_c7_7275_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2575_c7_7275_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2575_c7_7275_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2575_c7_7275_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2575_c7_7275_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2575_c7_7275_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2554_c7_c9a1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2554_c7_c9a1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2554_c7_c9a1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2554_c7_c9a1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2554_c7_c9a1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2554_c7_c9a1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2554_c7_c9a1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2554_c7_c9a1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2554_c7_c9a1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2579_c7_95bf] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_95bf_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_95bf_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_95bf_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_95bf_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_95bf_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_95bf_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_95bf_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_95bf_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2579_c7_95bf] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_95bf_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_95bf_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_95bf_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_95bf_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_95bf_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_95bf_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_95bf_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_95bf_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2557_c7_f7ad] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2557_c7_f7ad_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2557_c7_f7ad_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2557_c7_f7ad_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2557_c7_f7ad_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2557_c7_f7ad_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2557_c7_f7ad_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2557_c7_f7ad_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2557_c7_f7ad_return_output;

     -- Submodule level 8
     VAR_l16_MUX_uxn_opcodes_h_l2554_c7_c9a1_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2557_c7_f7ad_return_output;
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2549_c2_16ab_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2575_c7_7275_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_95bf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2554_c7_c9a1_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2557_c7_f7ad_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2575_c7_7275_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_95bf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2549_c2_16ab_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2554_c7_c9a1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_10b9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2575_c7_7275_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2575_c7_7275_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2579_c7_95bf_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2575_c7_7275] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2575_c7_7275_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2575_c7_7275_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2575_c7_7275_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2575_c7_7275_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2575_c7_7275_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2575_c7_7275_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2575_c7_7275_return_output := result_u8_value_MUX_uxn_opcodes_h_l2575_c7_7275_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2575_c7_7275] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2575_c7_7275_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2575_c7_7275_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2575_c7_7275_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2575_c7_7275_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2575_c7_7275_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2575_c7_7275_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2575_c7_7275_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2575_c7_7275_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2549_c2_16ab] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2549_c2_16ab_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2549_c2_16ab_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2549_c2_16ab_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2549_c2_16ab_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2549_c2_16ab_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2549_c2_16ab_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2549_c2_16ab_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2549_c2_16ab_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2571_c7_10b9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_10b9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_10b9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_10b9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_10b9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_10b9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_10b9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_10b9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_10b9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2575_c7_7275] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2575_c7_7275_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2575_c7_7275_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2575_c7_7275_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2575_c7_7275_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2575_c7_7275_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2575_c7_7275_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2575_c7_7275_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2575_c7_7275_return_output;

     -- l16_MUX[uxn_opcodes_h_l2554_c7_c9a1] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2554_c7_c9a1_cond <= VAR_l16_MUX_uxn_opcodes_h_l2554_c7_c9a1_cond;
     l16_MUX_uxn_opcodes_h_l2554_c7_c9a1_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2554_c7_c9a1_iftrue;
     l16_MUX_uxn_opcodes_h_l2554_c7_c9a1_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2554_c7_c9a1_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2554_c7_c9a1_return_output := l16_MUX_uxn_opcodes_h_l2554_c7_c9a1_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2554_c7_c9a1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2554_c7_c9a1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2554_c7_c9a1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2554_c7_c9a1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2554_c7_c9a1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2554_c7_c9a1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2554_c7_c9a1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2554_c7_c9a1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2554_c7_c9a1_return_output;

     -- Submodule level 9
     VAR_l16_MUX_uxn_opcodes_h_l2549_c2_16ab_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2554_c7_c9a1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_10b9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2575_c7_7275_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2549_c2_16ab_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2554_c7_c9a1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2571_c7_10b9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2575_c7_7275_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2566_c7_c443_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_10b9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2571_c7_10b9_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2575_c7_7275_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2566_c7_c443] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2566_c7_c443_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2566_c7_c443_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2566_c7_c443_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2566_c7_c443_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2566_c7_c443_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2566_c7_c443_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2566_c7_c443_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2566_c7_c443_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2571_c7_10b9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_10b9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_10b9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_10b9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_10b9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_10b9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_10b9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_10b9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_10b9_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2571_c7_10b9] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2571_c7_10b9_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2571_c7_10b9_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2571_c7_10b9_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2571_c7_10b9_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2571_c7_10b9_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2571_c7_10b9_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2571_c7_10b9_return_output := result_u8_value_MUX_uxn_opcodes_h_l2571_c7_10b9_return_output;

     -- l16_MUX[uxn_opcodes_h_l2549_c2_16ab] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2549_c2_16ab_cond <= VAR_l16_MUX_uxn_opcodes_h_l2549_c2_16ab_cond;
     l16_MUX_uxn_opcodes_h_l2549_c2_16ab_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2549_c2_16ab_iftrue;
     l16_MUX_uxn_opcodes_h_l2549_c2_16ab_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2549_c2_16ab_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2549_c2_16ab_return_output := l16_MUX_uxn_opcodes_h_l2549_c2_16ab_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2549_c2_16ab] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2549_c2_16ab_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2549_c2_16ab_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2549_c2_16ab_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2549_c2_16ab_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2549_c2_16ab_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2549_c2_16ab_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2549_c2_16ab_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2549_c2_16ab_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2571_c7_10b9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2571_c7_10b9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2571_c7_10b9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2571_c7_10b9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2571_c7_10b9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2571_c7_10b9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2571_c7_10b9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2571_c7_10b9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2571_c7_10b9_return_output;

     -- Submodule level 10
     REG_VAR_l16 := VAR_l16_MUX_uxn_opcodes_h_l2549_c2_16ab_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2566_c7_c443_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_10b9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2566_c7_c443_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2571_c7_10b9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2562_c7_7283_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2566_c7_c443_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2566_c7_c443_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2571_c7_10b9_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2566_c7_c443] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2566_c7_c443_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2566_c7_c443_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2566_c7_c443_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2566_c7_c443_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2566_c7_c443_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2566_c7_c443_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2566_c7_c443_return_output := result_u8_value_MUX_uxn_opcodes_h_l2566_c7_c443_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2562_c7_7283] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2562_c7_7283_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2562_c7_7283_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2562_c7_7283_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2562_c7_7283_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2562_c7_7283_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2562_c7_7283_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2562_c7_7283_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2562_c7_7283_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2566_c7_c443] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2566_c7_c443_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2566_c7_c443_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2566_c7_c443_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2566_c7_c443_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2566_c7_c443_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2566_c7_c443_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2566_c7_c443_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2566_c7_c443_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2566_c7_c443] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2566_c7_c443_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2566_c7_c443_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2566_c7_c443_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2566_c7_c443_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2566_c7_c443_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2566_c7_c443_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2566_c7_c443_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2566_c7_c443_return_output;

     -- Submodule level 11
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2562_c7_7283_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2566_c7_c443_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2562_c7_7283_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2566_c7_c443_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2557_c7_f7ad_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2562_c7_7283_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2562_c7_7283_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2566_c7_c443_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2562_c7_7283] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2562_c7_7283_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2562_c7_7283_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2562_c7_7283_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2562_c7_7283_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2562_c7_7283_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2562_c7_7283_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2562_c7_7283_return_output := result_u8_value_MUX_uxn_opcodes_h_l2562_c7_7283_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2562_c7_7283] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2562_c7_7283_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2562_c7_7283_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2562_c7_7283_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2562_c7_7283_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2562_c7_7283_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2562_c7_7283_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2562_c7_7283_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2562_c7_7283_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2557_c7_f7ad] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2557_c7_f7ad_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2557_c7_f7ad_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2557_c7_f7ad_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2557_c7_f7ad_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2557_c7_f7ad_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2557_c7_f7ad_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2557_c7_f7ad_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2557_c7_f7ad_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2562_c7_7283] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2562_c7_7283_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2562_c7_7283_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2562_c7_7283_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2562_c7_7283_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2562_c7_7283_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2562_c7_7283_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2562_c7_7283_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2562_c7_7283_return_output;

     -- Submodule level 12
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2557_c7_f7ad_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2562_c7_7283_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2557_c7_f7ad_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2562_c7_7283_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2554_c7_c9a1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2557_c7_f7ad_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2557_c7_f7ad_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2562_c7_7283_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2557_c7_f7ad] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2557_c7_f7ad_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2557_c7_f7ad_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2557_c7_f7ad_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2557_c7_f7ad_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2557_c7_f7ad_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2557_c7_f7ad_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2557_c7_f7ad_return_output := result_u8_value_MUX_uxn_opcodes_h_l2557_c7_f7ad_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2557_c7_f7ad] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2557_c7_f7ad_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2557_c7_f7ad_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2557_c7_f7ad_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2557_c7_f7ad_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2557_c7_f7ad_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2557_c7_f7ad_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2557_c7_f7ad_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2557_c7_f7ad_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2557_c7_f7ad] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2557_c7_f7ad_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2557_c7_f7ad_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2557_c7_f7ad_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2557_c7_f7ad_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2557_c7_f7ad_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2557_c7_f7ad_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2557_c7_f7ad_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2557_c7_f7ad_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2554_c7_c9a1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2554_c7_c9a1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2554_c7_c9a1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2554_c7_c9a1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2554_c7_c9a1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2554_c7_c9a1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2554_c7_c9a1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2554_c7_c9a1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2554_c7_c9a1_return_output;

     -- Submodule level 13
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2554_c7_c9a1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2557_c7_f7ad_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2554_c7_c9a1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2557_c7_f7ad_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2549_c2_16ab_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2554_c7_c9a1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2554_c7_c9a1_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2557_c7_f7ad_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2554_c7_c9a1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2554_c7_c9a1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2554_c7_c9a1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2554_c7_c9a1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2554_c7_c9a1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2554_c7_c9a1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2554_c7_c9a1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2554_c7_c9a1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2554_c7_c9a1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2554_c7_c9a1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2554_c7_c9a1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2554_c7_c9a1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2554_c7_c9a1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2554_c7_c9a1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2554_c7_c9a1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2554_c7_c9a1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2554_c7_c9a1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2554_c7_c9a1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2549_c2_16ab] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2549_c2_16ab_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2549_c2_16ab_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2549_c2_16ab_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2549_c2_16ab_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2549_c2_16ab_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2549_c2_16ab_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2549_c2_16ab_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2549_c2_16ab_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2554_c7_c9a1] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2554_c7_c9a1_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2554_c7_c9a1_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2554_c7_c9a1_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2554_c7_c9a1_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2554_c7_c9a1_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2554_c7_c9a1_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2554_c7_c9a1_return_output := result_u8_value_MUX_uxn_opcodes_h_l2554_c7_c9a1_return_output;

     -- Submodule level 14
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2549_c2_16ab_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2554_c7_c9a1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2549_c2_16ab_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2554_c7_c9a1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2549_c2_16ab_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2554_c7_c9a1_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2549_c2_16ab] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2549_c2_16ab_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2549_c2_16ab_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2549_c2_16ab_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2549_c2_16ab_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2549_c2_16ab_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2549_c2_16ab_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2549_c2_16ab_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2549_c2_16ab_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2549_c2_16ab] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2549_c2_16ab_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2549_c2_16ab_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2549_c2_16ab_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2549_c2_16ab_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2549_c2_16ab_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2549_c2_16ab_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2549_c2_16ab_return_output := result_u8_value_MUX_uxn_opcodes_h_l2549_c2_16ab_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2549_c2_16ab] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2549_c2_16ab_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2549_c2_16ab_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2549_c2_16ab_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2549_c2_16ab_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2549_c2_16ab_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2549_c2_16ab_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2549_c2_16ab_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2549_c2_16ab_return_output;

     -- Submodule level 15
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_4e73_uxn_opcodes_h_l2613_l2545_DUPLICATE_2f69 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4e73_uxn_opcodes_h_l2613_l2545_DUPLICATE_2f69_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_4e73(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2549_c2_16ab_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2549_c2_16ab_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2549_c2_16ab_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2549_c2_16ab_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2549_c2_16ab_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2549_c2_16ab_return_output);

     -- Submodule level 16
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4e73_uxn_opcodes_h_l2613_l2545_DUPLICATE_2f69_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4e73_uxn_opcodes_h_l2613_l2545_DUPLICATE_2f69_return_output;
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
