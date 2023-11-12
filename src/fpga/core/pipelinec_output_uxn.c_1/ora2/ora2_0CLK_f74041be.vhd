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
-- Submodules: 79
entity ora2_0CLK_f74041be is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end ora2_0CLK_f74041be;
architecture arch of ora2_0CLK_f74041be is
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
-- BIN_OP_EQ[uxn_opcodes_h_l988_c6_4147]
signal BIN_OP_EQ_uxn_opcodes_h_l988_c6_4147_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l988_c6_4147_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l988_c6_4147_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l988_c1_ed1f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l988_c1_ed1f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l988_c1_ed1f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l988_c1_ed1f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l988_c1_ed1f_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l988_c2_22b0]
signal n16_MUX_uxn_opcodes_h_l988_c2_22b0_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l988_c2_22b0_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l988_c2_22b0_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l988_c2_22b0_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l988_c2_22b0]
signal t16_MUX_uxn_opcodes_h_l988_c2_22b0_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l988_c2_22b0_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l988_c2_22b0_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l988_c2_22b0_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l988_c2_22b0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l988_c2_22b0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l988_c2_22b0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l988_c2_22b0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l988_c2_22b0_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l988_c2_22b0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c2_22b0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c2_22b0_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c2_22b0_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c2_22b0_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l988_c2_22b0]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l988_c2_22b0_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l988_c2_22b0_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l988_c2_22b0_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l988_c2_22b0_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l988_c2_22b0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l988_c2_22b0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l988_c2_22b0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l988_c2_22b0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l988_c2_22b0_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l988_c2_22b0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c2_22b0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c2_22b0_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c2_22b0_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c2_22b0_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l988_c2_22b0]
signal result_u8_value_MUX_uxn_opcodes_h_l988_c2_22b0_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l988_c2_22b0_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l988_c2_22b0_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l988_c2_22b0_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l988_c2_22b0]
signal tmp16_MUX_uxn_opcodes_h_l988_c2_22b0_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l988_c2_22b0_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l988_c2_22b0_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l988_c2_22b0_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l989_c3_5bda[uxn_opcodes_h_l989_c3_5bda]
signal printf_uxn_opcodes_h_l989_c3_5bda_uxn_opcodes_h_l989_c3_5bda_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l993_c11_77d7]
signal BIN_OP_EQ_uxn_opcodes_h_l993_c11_77d7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l993_c11_77d7_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l993_c11_77d7_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l993_c7_c4f1]
signal n16_MUX_uxn_opcodes_h_l993_c7_c4f1_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l993_c7_c4f1_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l993_c7_c4f1_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l993_c7_c4f1_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l993_c7_c4f1]
signal t16_MUX_uxn_opcodes_h_l993_c7_c4f1_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l993_c7_c4f1_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l993_c7_c4f1_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l993_c7_c4f1_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l993_c7_c4f1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_c4f1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_c4f1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_c4f1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_c4f1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l993_c7_c4f1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_c4f1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_c4f1_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_c4f1_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_c4f1_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l993_c7_c4f1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_c4f1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_c4f1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_c4f1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_c4f1_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l993_c7_c4f1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_c4f1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_c4f1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_c4f1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_c4f1_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l993_c7_c4f1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_c4f1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_c4f1_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_c4f1_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_c4f1_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l993_c7_c4f1]
signal result_u8_value_MUX_uxn_opcodes_h_l993_c7_c4f1_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l993_c7_c4f1_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l993_c7_c4f1_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l993_c7_c4f1_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l993_c7_c4f1]
signal tmp16_MUX_uxn_opcodes_h_l993_c7_c4f1_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l993_c7_c4f1_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l993_c7_c4f1_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l993_c7_c4f1_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l996_c11_5741]
signal BIN_OP_EQ_uxn_opcodes_h_l996_c11_5741_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l996_c11_5741_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l996_c11_5741_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l996_c7_4023]
signal n16_MUX_uxn_opcodes_h_l996_c7_4023_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l996_c7_4023_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l996_c7_4023_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l996_c7_4023_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l996_c7_4023]
signal t16_MUX_uxn_opcodes_h_l996_c7_4023_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l996_c7_4023_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l996_c7_4023_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l996_c7_4023_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l996_c7_4023]
signal result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_4023_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_4023_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_4023_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_4023_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l996_c7_4023]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_4023_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_4023_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_4023_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_4023_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l996_c7_4023]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_4023_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_4023_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_4023_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_4023_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l996_c7_4023]
signal result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_4023_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_4023_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_4023_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_4023_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l996_c7_4023]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_4023_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_4023_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_4023_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_4023_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l996_c7_4023]
signal result_u8_value_MUX_uxn_opcodes_h_l996_c7_4023_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l996_c7_4023_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l996_c7_4023_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l996_c7_4023_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l996_c7_4023]
signal tmp16_MUX_uxn_opcodes_h_l996_c7_4023_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l996_c7_4023_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l996_c7_4023_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l996_c7_4023_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1001_c11_ad09]
signal BIN_OP_EQ_uxn_opcodes_h_l1001_c11_ad09_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1001_c11_ad09_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1001_c11_ad09_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1001_c7_1778]
signal n16_MUX_uxn_opcodes_h_l1001_c7_1778_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1001_c7_1778_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1001_c7_1778_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1001_c7_1778_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1001_c7_1778]
signal t16_MUX_uxn_opcodes_h_l1001_c7_1778_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1001_c7_1778_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1001_c7_1778_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1001_c7_1778_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1001_c7_1778]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_1778_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_1778_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_1778_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_1778_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1001_c7_1778]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_1778_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_1778_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_1778_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_1778_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1001_c7_1778]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_1778_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_1778_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_1778_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_1778_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1001_c7_1778]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_1778_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_1778_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_1778_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_1778_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1001_c7_1778]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_1778_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_1778_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_1778_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_1778_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1001_c7_1778]
signal result_u8_value_MUX_uxn_opcodes_h_l1001_c7_1778_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1001_c7_1778_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1001_c7_1778_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1001_c7_1778_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1001_c7_1778]
signal tmp16_MUX_uxn_opcodes_h_l1001_c7_1778_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1001_c7_1778_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1001_c7_1778_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1001_c7_1778_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1002_c3_7846]
signal BIN_OP_OR_uxn_opcodes_h_l1002_c3_7846_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1002_c3_7846_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1002_c3_7846_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1005_c11_27ba]
signal BIN_OP_EQ_uxn_opcodes_h_l1005_c11_27ba_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1005_c11_27ba_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1005_c11_27ba_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1005_c7_cb76]
signal n16_MUX_uxn_opcodes_h_l1005_c7_cb76_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1005_c7_cb76_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1005_c7_cb76_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1005_c7_cb76_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1005_c7_cb76]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_cb76_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_cb76_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_cb76_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_cb76_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1005_c7_cb76]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_cb76_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_cb76_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_cb76_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_cb76_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1005_c7_cb76]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_cb76_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_cb76_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_cb76_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_cb76_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1005_c7_cb76]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_cb76_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_cb76_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_cb76_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_cb76_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1005_c7_cb76]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_cb76_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_cb76_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_cb76_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_cb76_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1005_c7_cb76]
signal result_u8_value_MUX_uxn_opcodes_h_l1005_c7_cb76_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1005_c7_cb76_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1005_c7_cb76_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1005_c7_cb76_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1005_c7_cb76]
signal tmp16_MUX_uxn_opcodes_h_l1005_c7_cb76_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1005_c7_cb76_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1005_c7_cb76_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1005_c7_cb76_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1009_c11_45fb]
signal BIN_OP_EQ_uxn_opcodes_h_l1009_c11_45fb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1009_c11_45fb_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1009_c11_45fb_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1009_c7_8427]
signal n16_MUX_uxn_opcodes_h_l1009_c7_8427_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1009_c7_8427_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1009_c7_8427_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1009_c7_8427_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1009_c7_8427]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_8427_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_8427_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_8427_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_8427_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1009_c7_8427]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_8427_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_8427_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_8427_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_8427_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1009_c7_8427]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_8427_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_8427_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_8427_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_8427_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1009_c7_8427]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_8427_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_8427_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_8427_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_8427_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1009_c7_8427]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_8427_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_8427_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_8427_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_8427_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1009_c7_8427]
signal result_u8_value_MUX_uxn_opcodes_h_l1009_c7_8427_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1009_c7_8427_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1009_c7_8427_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1009_c7_8427_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1009_c7_8427]
signal tmp16_MUX_uxn_opcodes_h_l1009_c7_8427_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1009_c7_8427_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1009_c7_8427_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1009_c7_8427_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1010_c3_7368]
signal BIN_OP_OR_uxn_opcodes_h_l1010_c3_7368_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1010_c3_7368_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1010_c3_7368_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1011_c11_25eb]
signal BIN_OP_OR_uxn_opcodes_h_l1011_c11_25eb_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1011_c11_25eb_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1011_c11_25eb_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1013_c30_7798]
signal sp_relative_shift_uxn_opcodes_h_l1013_c30_7798_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1013_c30_7798_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1013_c30_7798_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1013_c30_7798_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1018_c11_eed9]
signal BIN_OP_EQ_uxn_opcodes_h_l1018_c11_eed9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1018_c11_eed9_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1018_c11_eed9_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1018_c7_e436]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_e436_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_e436_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_e436_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_e436_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1018_c7_e436]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1018_c7_e436_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1018_c7_e436_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1018_c7_e436_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1018_c7_e436_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1018_c7_e436]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1018_c7_e436_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1018_c7_e436_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1018_c7_e436_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1018_c7_e436_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1018_c7_e436]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_e436_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_e436_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_e436_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_e436_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1018_c7_e436]
signal result_u8_value_MUX_uxn_opcodes_h_l1018_c7_e436_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1018_c7_e436_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1018_c7_e436_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1018_c7_e436_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1021_c31_0cfc]
signal CONST_SR_8_uxn_opcodes_h_l1021_c31_0cfc_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1021_c31_0cfc_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1023_c11_32da]
signal BIN_OP_EQ_uxn_opcodes_h_l1023_c11_32da_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1023_c11_32da_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1023_c11_32da_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1023_c7_867a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_867a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_867a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_867a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_867a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1023_c7_867a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_867a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_867a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_867a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_867a_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1007_l998_DUPLICATE_ddfe
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1007_l998_DUPLICATE_ddfe_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1007_l998_DUPLICATE_ddfe_return_output : unsigned(15 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l988_c6_4147
BIN_OP_EQ_uxn_opcodes_h_l988_c6_4147 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l988_c6_4147_left,
BIN_OP_EQ_uxn_opcodes_h_l988_c6_4147_right,
BIN_OP_EQ_uxn_opcodes_h_l988_c6_4147_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l988_c1_ed1f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l988_c1_ed1f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l988_c1_ed1f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l988_c1_ed1f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l988_c1_ed1f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l988_c1_ed1f_return_output);

-- n16_MUX_uxn_opcodes_h_l988_c2_22b0
n16_MUX_uxn_opcodes_h_l988_c2_22b0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l988_c2_22b0_cond,
n16_MUX_uxn_opcodes_h_l988_c2_22b0_iftrue,
n16_MUX_uxn_opcodes_h_l988_c2_22b0_iffalse,
n16_MUX_uxn_opcodes_h_l988_c2_22b0_return_output);

-- t16_MUX_uxn_opcodes_h_l988_c2_22b0
t16_MUX_uxn_opcodes_h_l988_c2_22b0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l988_c2_22b0_cond,
t16_MUX_uxn_opcodes_h_l988_c2_22b0_iftrue,
t16_MUX_uxn_opcodes_h_l988_c2_22b0_iffalse,
t16_MUX_uxn_opcodes_h_l988_c2_22b0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l988_c2_22b0
result_is_stack_write_MUX_uxn_opcodes_h_l988_c2_22b0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l988_c2_22b0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l988_c2_22b0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l988_c2_22b0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l988_c2_22b0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c2_22b0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c2_22b0 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c2_22b0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c2_22b0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c2_22b0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c2_22b0_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l988_c2_22b0
result_is_sp_shift_MUX_uxn_opcodes_h_l988_c2_22b0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l988_c2_22b0_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l988_c2_22b0_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l988_c2_22b0_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l988_c2_22b0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l988_c2_22b0
result_is_opc_done_MUX_uxn_opcodes_h_l988_c2_22b0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l988_c2_22b0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l988_c2_22b0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l988_c2_22b0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l988_c2_22b0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c2_22b0
result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c2_22b0 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c2_22b0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c2_22b0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c2_22b0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c2_22b0_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l988_c2_22b0
result_u8_value_MUX_uxn_opcodes_h_l988_c2_22b0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l988_c2_22b0_cond,
result_u8_value_MUX_uxn_opcodes_h_l988_c2_22b0_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l988_c2_22b0_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l988_c2_22b0_return_output);

-- tmp16_MUX_uxn_opcodes_h_l988_c2_22b0
tmp16_MUX_uxn_opcodes_h_l988_c2_22b0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l988_c2_22b0_cond,
tmp16_MUX_uxn_opcodes_h_l988_c2_22b0_iftrue,
tmp16_MUX_uxn_opcodes_h_l988_c2_22b0_iffalse,
tmp16_MUX_uxn_opcodes_h_l988_c2_22b0_return_output);

-- printf_uxn_opcodes_h_l989_c3_5bda_uxn_opcodes_h_l989_c3_5bda
printf_uxn_opcodes_h_l989_c3_5bda_uxn_opcodes_h_l989_c3_5bda : entity work.printf_uxn_opcodes_h_l989_c3_5bda_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l989_c3_5bda_uxn_opcodes_h_l989_c3_5bda_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l993_c11_77d7
BIN_OP_EQ_uxn_opcodes_h_l993_c11_77d7 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l993_c11_77d7_left,
BIN_OP_EQ_uxn_opcodes_h_l993_c11_77d7_right,
BIN_OP_EQ_uxn_opcodes_h_l993_c11_77d7_return_output);

-- n16_MUX_uxn_opcodes_h_l993_c7_c4f1
n16_MUX_uxn_opcodes_h_l993_c7_c4f1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l993_c7_c4f1_cond,
n16_MUX_uxn_opcodes_h_l993_c7_c4f1_iftrue,
n16_MUX_uxn_opcodes_h_l993_c7_c4f1_iffalse,
n16_MUX_uxn_opcodes_h_l993_c7_c4f1_return_output);

-- t16_MUX_uxn_opcodes_h_l993_c7_c4f1
t16_MUX_uxn_opcodes_h_l993_c7_c4f1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l993_c7_c4f1_cond,
t16_MUX_uxn_opcodes_h_l993_c7_c4f1_iftrue,
t16_MUX_uxn_opcodes_h_l993_c7_c4f1_iffalse,
t16_MUX_uxn_opcodes_h_l993_c7_c4f1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_c4f1
result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_c4f1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_c4f1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_c4f1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_c4f1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_c4f1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_c4f1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_c4f1 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_c4f1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_c4f1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_c4f1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_c4f1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_c4f1
result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_c4f1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_c4f1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_c4f1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_c4f1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_c4f1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_c4f1
result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_c4f1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_c4f1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_c4f1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_c4f1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_c4f1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_c4f1
result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_c4f1 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_c4f1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_c4f1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_c4f1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_c4f1_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l993_c7_c4f1
result_u8_value_MUX_uxn_opcodes_h_l993_c7_c4f1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l993_c7_c4f1_cond,
result_u8_value_MUX_uxn_opcodes_h_l993_c7_c4f1_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l993_c7_c4f1_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l993_c7_c4f1_return_output);

-- tmp16_MUX_uxn_opcodes_h_l993_c7_c4f1
tmp16_MUX_uxn_opcodes_h_l993_c7_c4f1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l993_c7_c4f1_cond,
tmp16_MUX_uxn_opcodes_h_l993_c7_c4f1_iftrue,
tmp16_MUX_uxn_opcodes_h_l993_c7_c4f1_iffalse,
tmp16_MUX_uxn_opcodes_h_l993_c7_c4f1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l996_c11_5741
BIN_OP_EQ_uxn_opcodes_h_l996_c11_5741 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l996_c11_5741_left,
BIN_OP_EQ_uxn_opcodes_h_l996_c11_5741_right,
BIN_OP_EQ_uxn_opcodes_h_l996_c11_5741_return_output);

-- n16_MUX_uxn_opcodes_h_l996_c7_4023
n16_MUX_uxn_opcodes_h_l996_c7_4023 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l996_c7_4023_cond,
n16_MUX_uxn_opcodes_h_l996_c7_4023_iftrue,
n16_MUX_uxn_opcodes_h_l996_c7_4023_iffalse,
n16_MUX_uxn_opcodes_h_l996_c7_4023_return_output);

-- t16_MUX_uxn_opcodes_h_l996_c7_4023
t16_MUX_uxn_opcodes_h_l996_c7_4023 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l996_c7_4023_cond,
t16_MUX_uxn_opcodes_h_l996_c7_4023_iftrue,
t16_MUX_uxn_opcodes_h_l996_c7_4023_iffalse,
t16_MUX_uxn_opcodes_h_l996_c7_4023_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_4023
result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_4023 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_4023_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_4023_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_4023_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_4023_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_4023
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_4023 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_4023_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_4023_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_4023_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_4023_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_4023
result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_4023 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_4023_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_4023_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_4023_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_4023_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_4023
result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_4023 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_4023_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_4023_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_4023_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_4023_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_4023
result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_4023 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_4023_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_4023_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_4023_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_4023_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l996_c7_4023
result_u8_value_MUX_uxn_opcodes_h_l996_c7_4023 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l996_c7_4023_cond,
result_u8_value_MUX_uxn_opcodes_h_l996_c7_4023_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l996_c7_4023_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l996_c7_4023_return_output);

-- tmp16_MUX_uxn_opcodes_h_l996_c7_4023
tmp16_MUX_uxn_opcodes_h_l996_c7_4023 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l996_c7_4023_cond,
tmp16_MUX_uxn_opcodes_h_l996_c7_4023_iftrue,
tmp16_MUX_uxn_opcodes_h_l996_c7_4023_iffalse,
tmp16_MUX_uxn_opcodes_h_l996_c7_4023_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1001_c11_ad09
BIN_OP_EQ_uxn_opcodes_h_l1001_c11_ad09 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1001_c11_ad09_left,
BIN_OP_EQ_uxn_opcodes_h_l1001_c11_ad09_right,
BIN_OP_EQ_uxn_opcodes_h_l1001_c11_ad09_return_output);

-- n16_MUX_uxn_opcodes_h_l1001_c7_1778
n16_MUX_uxn_opcodes_h_l1001_c7_1778 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1001_c7_1778_cond,
n16_MUX_uxn_opcodes_h_l1001_c7_1778_iftrue,
n16_MUX_uxn_opcodes_h_l1001_c7_1778_iffalse,
n16_MUX_uxn_opcodes_h_l1001_c7_1778_return_output);

-- t16_MUX_uxn_opcodes_h_l1001_c7_1778
t16_MUX_uxn_opcodes_h_l1001_c7_1778 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1001_c7_1778_cond,
t16_MUX_uxn_opcodes_h_l1001_c7_1778_iftrue,
t16_MUX_uxn_opcodes_h_l1001_c7_1778_iffalse,
t16_MUX_uxn_opcodes_h_l1001_c7_1778_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_1778
result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_1778 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_1778_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_1778_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_1778_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_1778_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_1778
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_1778 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_1778_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_1778_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_1778_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_1778_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_1778
result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_1778 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_1778_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_1778_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_1778_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_1778_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_1778
result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_1778 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_1778_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_1778_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_1778_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_1778_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_1778
result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_1778 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_1778_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_1778_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_1778_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_1778_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1001_c7_1778
result_u8_value_MUX_uxn_opcodes_h_l1001_c7_1778 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1001_c7_1778_cond,
result_u8_value_MUX_uxn_opcodes_h_l1001_c7_1778_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1001_c7_1778_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1001_c7_1778_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1001_c7_1778
tmp16_MUX_uxn_opcodes_h_l1001_c7_1778 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1001_c7_1778_cond,
tmp16_MUX_uxn_opcodes_h_l1001_c7_1778_iftrue,
tmp16_MUX_uxn_opcodes_h_l1001_c7_1778_iffalse,
tmp16_MUX_uxn_opcodes_h_l1001_c7_1778_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1002_c3_7846
BIN_OP_OR_uxn_opcodes_h_l1002_c3_7846 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1002_c3_7846_left,
BIN_OP_OR_uxn_opcodes_h_l1002_c3_7846_right,
BIN_OP_OR_uxn_opcodes_h_l1002_c3_7846_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1005_c11_27ba
BIN_OP_EQ_uxn_opcodes_h_l1005_c11_27ba : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1005_c11_27ba_left,
BIN_OP_EQ_uxn_opcodes_h_l1005_c11_27ba_right,
BIN_OP_EQ_uxn_opcodes_h_l1005_c11_27ba_return_output);

-- n16_MUX_uxn_opcodes_h_l1005_c7_cb76
n16_MUX_uxn_opcodes_h_l1005_c7_cb76 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1005_c7_cb76_cond,
n16_MUX_uxn_opcodes_h_l1005_c7_cb76_iftrue,
n16_MUX_uxn_opcodes_h_l1005_c7_cb76_iffalse,
n16_MUX_uxn_opcodes_h_l1005_c7_cb76_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_cb76
result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_cb76 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_cb76_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_cb76_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_cb76_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_cb76_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_cb76
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_cb76 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_cb76_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_cb76_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_cb76_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_cb76_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_cb76
result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_cb76 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_cb76_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_cb76_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_cb76_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_cb76_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_cb76
result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_cb76 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_cb76_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_cb76_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_cb76_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_cb76_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_cb76
result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_cb76 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_cb76_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_cb76_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_cb76_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_cb76_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1005_c7_cb76
result_u8_value_MUX_uxn_opcodes_h_l1005_c7_cb76 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1005_c7_cb76_cond,
result_u8_value_MUX_uxn_opcodes_h_l1005_c7_cb76_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1005_c7_cb76_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1005_c7_cb76_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1005_c7_cb76
tmp16_MUX_uxn_opcodes_h_l1005_c7_cb76 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1005_c7_cb76_cond,
tmp16_MUX_uxn_opcodes_h_l1005_c7_cb76_iftrue,
tmp16_MUX_uxn_opcodes_h_l1005_c7_cb76_iffalse,
tmp16_MUX_uxn_opcodes_h_l1005_c7_cb76_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1009_c11_45fb
BIN_OP_EQ_uxn_opcodes_h_l1009_c11_45fb : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1009_c11_45fb_left,
BIN_OP_EQ_uxn_opcodes_h_l1009_c11_45fb_right,
BIN_OP_EQ_uxn_opcodes_h_l1009_c11_45fb_return_output);

-- n16_MUX_uxn_opcodes_h_l1009_c7_8427
n16_MUX_uxn_opcodes_h_l1009_c7_8427 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1009_c7_8427_cond,
n16_MUX_uxn_opcodes_h_l1009_c7_8427_iftrue,
n16_MUX_uxn_opcodes_h_l1009_c7_8427_iffalse,
n16_MUX_uxn_opcodes_h_l1009_c7_8427_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_8427
result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_8427 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_8427_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_8427_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_8427_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_8427_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_8427
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_8427 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_8427_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_8427_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_8427_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_8427_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_8427
result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_8427 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_8427_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_8427_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_8427_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_8427_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_8427
result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_8427 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_8427_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_8427_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_8427_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_8427_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_8427
result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_8427 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_8427_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_8427_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_8427_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_8427_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1009_c7_8427
result_u8_value_MUX_uxn_opcodes_h_l1009_c7_8427 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1009_c7_8427_cond,
result_u8_value_MUX_uxn_opcodes_h_l1009_c7_8427_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1009_c7_8427_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1009_c7_8427_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1009_c7_8427
tmp16_MUX_uxn_opcodes_h_l1009_c7_8427 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1009_c7_8427_cond,
tmp16_MUX_uxn_opcodes_h_l1009_c7_8427_iftrue,
tmp16_MUX_uxn_opcodes_h_l1009_c7_8427_iffalse,
tmp16_MUX_uxn_opcodes_h_l1009_c7_8427_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1010_c3_7368
BIN_OP_OR_uxn_opcodes_h_l1010_c3_7368 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1010_c3_7368_left,
BIN_OP_OR_uxn_opcodes_h_l1010_c3_7368_right,
BIN_OP_OR_uxn_opcodes_h_l1010_c3_7368_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1011_c11_25eb
BIN_OP_OR_uxn_opcodes_h_l1011_c11_25eb : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1011_c11_25eb_left,
BIN_OP_OR_uxn_opcodes_h_l1011_c11_25eb_right,
BIN_OP_OR_uxn_opcodes_h_l1011_c11_25eb_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1013_c30_7798
sp_relative_shift_uxn_opcodes_h_l1013_c30_7798 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1013_c30_7798_ins,
sp_relative_shift_uxn_opcodes_h_l1013_c30_7798_x,
sp_relative_shift_uxn_opcodes_h_l1013_c30_7798_y,
sp_relative_shift_uxn_opcodes_h_l1013_c30_7798_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1018_c11_eed9
BIN_OP_EQ_uxn_opcodes_h_l1018_c11_eed9 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1018_c11_eed9_left,
BIN_OP_EQ_uxn_opcodes_h_l1018_c11_eed9_right,
BIN_OP_EQ_uxn_opcodes_h_l1018_c11_eed9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_e436
result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_e436 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_e436_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_e436_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_e436_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_e436_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1018_c7_e436
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1018_c7_e436 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1018_c7_e436_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1018_c7_e436_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1018_c7_e436_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1018_c7_e436_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1018_c7_e436
result_is_sp_shift_MUX_uxn_opcodes_h_l1018_c7_e436 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1018_c7_e436_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1018_c7_e436_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1018_c7_e436_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1018_c7_e436_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_e436
result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_e436 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_e436_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_e436_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_e436_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_e436_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1018_c7_e436
result_u8_value_MUX_uxn_opcodes_h_l1018_c7_e436 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1018_c7_e436_cond,
result_u8_value_MUX_uxn_opcodes_h_l1018_c7_e436_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1018_c7_e436_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1018_c7_e436_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1021_c31_0cfc
CONST_SR_8_uxn_opcodes_h_l1021_c31_0cfc : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1021_c31_0cfc_x,
CONST_SR_8_uxn_opcodes_h_l1021_c31_0cfc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1023_c11_32da
BIN_OP_EQ_uxn_opcodes_h_l1023_c11_32da : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1023_c11_32da_left,
BIN_OP_EQ_uxn_opcodes_h_l1023_c11_32da_right,
BIN_OP_EQ_uxn_opcodes_h_l1023_c11_32da_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_867a
result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_867a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_867a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_867a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_867a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_867a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_867a
result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_867a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_867a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_867a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_867a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_867a_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1007_l998_DUPLICATE_ddfe
CONST_SL_8_uint16_t_uxn_opcodes_h_l1007_l998_DUPLICATE_ddfe : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1007_l998_DUPLICATE_ddfe_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1007_l998_DUPLICATE_ddfe_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l988_c6_4147_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l988_c1_ed1f_return_output,
 n16_MUX_uxn_opcodes_h_l988_c2_22b0_return_output,
 t16_MUX_uxn_opcodes_h_l988_c2_22b0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l988_c2_22b0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c2_22b0_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l988_c2_22b0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l988_c2_22b0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c2_22b0_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l988_c2_22b0_return_output,
 tmp16_MUX_uxn_opcodes_h_l988_c2_22b0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l993_c11_77d7_return_output,
 n16_MUX_uxn_opcodes_h_l993_c7_c4f1_return_output,
 t16_MUX_uxn_opcodes_h_l993_c7_c4f1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_c4f1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_c4f1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_c4f1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_c4f1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_c4f1_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l993_c7_c4f1_return_output,
 tmp16_MUX_uxn_opcodes_h_l993_c7_c4f1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l996_c11_5741_return_output,
 n16_MUX_uxn_opcodes_h_l996_c7_4023_return_output,
 t16_MUX_uxn_opcodes_h_l996_c7_4023_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_4023_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_4023_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_4023_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_4023_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_4023_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l996_c7_4023_return_output,
 tmp16_MUX_uxn_opcodes_h_l996_c7_4023_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1001_c11_ad09_return_output,
 n16_MUX_uxn_opcodes_h_l1001_c7_1778_return_output,
 t16_MUX_uxn_opcodes_h_l1001_c7_1778_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_1778_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_1778_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_1778_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_1778_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_1778_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1001_c7_1778_return_output,
 tmp16_MUX_uxn_opcodes_h_l1001_c7_1778_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1002_c3_7846_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1005_c11_27ba_return_output,
 n16_MUX_uxn_opcodes_h_l1005_c7_cb76_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_cb76_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_cb76_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_cb76_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_cb76_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_cb76_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1005_c7_cb76_return_output,
 tmp16_MUX_uxn_opcodes_h_l1005_c7_cb76_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1009_c11_45fb_return_output,
 n16_MUX_uxn_opcodes_h_l1009_c7_8427_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_8427_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_8427_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_8427_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_8427_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_8427_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1009_c7_8427_return_output,
 tmp16_MUX_uxn_opcodes_h_l1009_c7_8427_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1010_c3_7368_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1011_c11_25eb_return_output,
 sp_relative_shift_uxn_opcodes_h_l1013_c30_7798_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1018_c11_eed9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_e436_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1018_c7_e436_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1018_c7_e436_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_e436_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1018_c7_e436_return_output,
 CONST_SR_8_uxn_opcodes_h_l1021_c31_0cfc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1023_c11_32da_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_867a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_867a_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1007_l998_DUPLICATE_ddfe_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c6_4147_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c6_4147_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c6_4147_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l988_c1_ed1f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l988_c1_ed1f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l988_c1_ed1f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l988_c1_ed1f_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l988_c2_22b0_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l988_c2_22b0_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l993_c7_c4f1_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l988_c2_22b0_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l988_c2_22b0_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l988_c2_22b0_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l988_c2_22b0_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l993_c7_c4f1_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l988_c2_22b0_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l988_c2_22b0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l988_c2_22b0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l988_c2_22b0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_c4f1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l988_c2_22b0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l988_c2_22b0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c2_22b0_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l990_c3_8261 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c2_22b0_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_c4f1_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c2_22b0_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c2_22b0_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l988_c2_22b0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l988_c2_22b0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_c4f1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l988_c2_22b0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l988_c2_22b0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l988_c2_22b0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l988_c2_22b0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_c4f1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l988_c2_22b0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l988_c2_22b0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c2_22b0_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c2_22b0_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_c4f1_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c2_22b0_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c2_22b0_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l988_c2_22b0_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l988_c2_22b0_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l993_c7_c4f1_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l988_c2_22b0_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l988_c2_22b0_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l988_c2_22b0_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l988_c2_22b0_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l993_c7_c4f1_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l988_c2_22b0_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l988_c2_22b0_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l989_c3_5bda_uxn_opcodes_h_l989_c3_5bda_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l993_c11_77d7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l993_c11_77d7_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l993_c11_77d7_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l993_c7_c4f1_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l993_c7_c4f1_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l996_c7_4023_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l993_c7_c4f1_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l993_c7_c4f1_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l993_c7_c4f1_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l996_c7_4023_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l993_c7_c4f1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_c4f1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_c4f1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_4023_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_c4f1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_c4f1_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l994_c3_4482 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_c4f1_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_4023_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_c4f1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_c4f1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_c4f1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_4023_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_c4f1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_c4f1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_c4f1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_4023_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_c4f1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_c4f1_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_c4f1_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_4023_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_c4f1_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l993_c7_c4f1_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l993_c7_c4f1_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l996_c7_4023_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l993_c7_c4f1_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l993_c7_c4f1_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l993_c7_c4f1_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l996_c7_4023_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l993_c7_c4f1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l996_c11_5741_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l996_c11_5741_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l996_c11_5741_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l996_c7_4023_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l996_c7_4023_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1001_c7_1778_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l996_c7_4023_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l996_c7_4023_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l996_c7_4023_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1001_c7_1778_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l996_c7_4023_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_4023_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_4023_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_1778_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_4023_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_4023_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l999_c3_43fa : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_4023_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_1778_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_4023_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_4023_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_4023_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_1778_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_4023_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_4023_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_4023_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_1778_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_4023_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_4023_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_4023_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_1778_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_4023_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l996_c7_4023_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l996_c7_4023_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1001_c7_1778_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l996_c7_4023_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l996_c7_4023_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l996_c7_4023_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1001_c7_1778_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l996_c7_4023_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_ad09_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_ad09_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_ad09_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1001_c7_1778_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1001_c7_1778_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1005_c7_cb76_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1001_c7_1778_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1001_c7_1778_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1001_c7_1778_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1001_c7_1778_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_1778_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_1778_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_cb76_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_1778_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_1778_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1003_c3_3017 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_1778_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_cb76_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_1778_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_1778_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_1778_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_cb76_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_1778_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_1778_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_1778_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_cb76_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_1778_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_1778_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_1778_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_cb76_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_1778_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1001_c7_1778_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1001_c7_1778_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1005_c7_cb76_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1001_c7_1778_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1001_c7_1778_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1001_c7_1778_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1005_c7_cb76_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1001_c7_1778_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1002_c3_7846_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1002_c3_7846_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1002_c3_7846_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_27ba_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_27ba_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_27ba_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1005_c7_cb76_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1005_c7_cb76_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1009_c7_8427_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1005_c7_cb76_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_cb76_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_cb76_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_8427_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_cb76_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_cb76_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_cb76_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_8427_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_cb76_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_cb76_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_cb76_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_8427_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_cb76_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_cb76_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_cb76_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_8427_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_cb76_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_cb76_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_cb76_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_8427_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_cb76_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1005_c7_cb76_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1005_c7_cb76_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1009_c7_8427_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1005_c7_cb76_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1005_c7_cb76_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1005_c7_cb76_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1009_c7_8427_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1005_c7_cb76_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_45fb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_45fb_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_45fb_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1009_c7_8427_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1009_c7_8427_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1009_c7_8427_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_8427_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_8427_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_e436_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_8427_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_8427_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1015_c3_e1ec : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_8427_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1018_c7_e436_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_8427_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_8427_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_8427_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1018_c7_e436_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_8427_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_8427_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_8427_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_e436_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_8427_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_8427_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_8427_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_8427_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1009_c7_8427_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1009_c7_8427_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1018_c7_e436_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1009_c7_8427_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1009_c7_8427_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1009_c7_8427_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1009_c7_8427_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1010_c3_7368_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1010_c3_7368_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1010_c3_7368_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1011_c11_25eb_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1011_c11_25eb_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1011_c11_25eb_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1013_c30_7798_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1013_c30_7798_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1013_c30_7798_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1013_c30_7798_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1016_c21_7e7d_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_eed9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_eed9_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_eed9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_e436_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_e436_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_867a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_e436_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1018_c7_e436_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1020_c3_29eb : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1018_c7_e436_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1018_c7_e436_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1018_c7_e436_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1018_c7_e436_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1018_c7_e436_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_e436_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_e436_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_867a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_e436_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1018_c7_e436_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1018_c7_e436_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1018_c7_e436_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1021_c31_0cfc_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1021_c31_0cfc_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1021_c21_511b_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_32da_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_32da_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_32da_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_867a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_867a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_867a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_867a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_867a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_867a_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l996_l993_l1023_l988_l1018_l1005_l1001_DUPLICATE_c820_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l996_l993_l988_l1018_l1005_l1001_DUPLICATE_55b3_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l996_l993_l988_l1009_l1005_l1001_DUPLICATE_6bc0_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l996_l993_l988_l1018_l1005_l1001_DUPLICATE_88f5_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l996_l993_l1023_l1018_l1009_l1005_l1001_DUPLICATE_01ad_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l997_l1010_l1002_l1006_DUPLICATE_4f99_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1007_l998_DUPLICATE_ddfe_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1007_l998_DUPLICATE_ddfe_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1005_l1018_DUPLICATE_d655_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5b93_uxn_opcodes_h_l984_l1028_DUPLICATE_1824_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l990_c3_8261 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c2_22b0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l990_c3_8261;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_32da_right := to_unsigned(7, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_8427_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_8427_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_ad09_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l994_c3_4482 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_c4f1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l994_c3_4482;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_867a_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_45fb_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1003_c3_3017 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_1778_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1003_c3_3017;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c6_4147_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1015_c3_e1ec := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_8427_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1015_c3_e1ec;
     VAR_sp_relative_shift_uxn_opcodes_h_l1013_c30_7798_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_eed9_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l993_c11_77d7_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_867a_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l988_c1_ed1f_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l999_c3_43fa := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_4023_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l999_c3_43fa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l996_c11_5741_right := to_unsigned(2, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1018_c7_e436_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l988_c2_22b0_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_27ba_right := to_unsigned(4, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l1013_c30_7798_y := resize(to_signed(-2, 3), 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1020_c3_29eb := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1018_c7_e436_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1020_c3_29eb;

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l988_c1_ed1f_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l1013_c30_7798_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1010_c3_7368_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1001_c7_1778_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1009_c7_8427_iffalse := n16;
     VAR_n16_MUX_uxn_opcodes_h_l988_c2_22b0_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l993_c7_c4f1_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l996_c7_4023_iftrue := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_ad09_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_27ba_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_45fb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_eed9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_32da_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c6_4147_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l993_c11_77d7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l996_c11_5741_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1002_c3_7846_left := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1011_c11_25eb_right := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1001_c7_1778_iffalse := t16;
     VAR_t16_MUX_uxn_opcodes_h_l988_c2_22b0_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l993_c7_c4f1_iftrue := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1021_c31_0cfc_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1001_c7_1778_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1005_c7_cb76_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1009_c7_8427_iffalse := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l988_c2_22b0_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l993_c7_c4f1_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l996_c7_4023_iftrue := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l993_c11_77d7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l993_c11_77d7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l993_c11_77d7_left;
     BIN_OP_EQ_uxn_opcodes_h_l993_c11_77d7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l993_c11_77d7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l993_c11_77d7_return_output := BIN_OP_EQ_uxn_opcodes_h_l993_c11_77d7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1001_c11_ad09] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1001_c11_ad09_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_ad09_left;
     BIN_OP_EQ_uxn_opcodes_h_l1001_c11_ad09_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_ad09_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_ad09_return_output := BIN_OP_EQ_uxn_opcodes_h_l1001_c11_ad09_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l996_l993_l1023_l988_l1018_l1005_l1001_DUPLICATE_c820 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l996_l993_l1023_l988_l1018_l1005_l1001_DUPLICATE_c820_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1018_c11_eed9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1018_c11_eed9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_eed9_left;
     BIN_OP_EQ_uxn_opcodes_h_l1018_c11_eed9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_eed9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_eed9_return_output := BIN_OP_EQ_uxn_opcodes_h_l1018_c11_eed9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1005_c11_27ba] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1005_c11_27ba_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_27ba_left;
     BIN_OP_EQ_uxn_opcodes_h_l1005_c11_27ba_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_27ba_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_27ba_return_output := BIN_OP_EQ_uxn_opcodes_h_l1005_c11_27ba_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l996_l993_l988_l1018_l1005_l1001_DUPLICATE_88f5 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l996_l993_l988_l1018_l1005_l1001_DUPLICATE_88f5_return_output := result.u8_value;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l997_l1010_l1002_l1006_DUPLICATE_4f99 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l997_l1010_l1002_l1006_DUPLICATE_4f99_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1009_c11_45fb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1009_c11_45fb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_45fb_left;
     BIN_OP_EQ_uxn_opcodes_h_l1009_c11_45fb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_45fb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_45fb_return_output := BIN_OP_EQ_uxn_opcodes_h_l1009_c11_45fb_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l1013_c30_7798] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1013_c30_7798_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1013_c30_7798_ins;
     sp_relative_shift_uxn_opcodes_h_l1013_c30_7798_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1013_c30_7798_x;
     sp_relative_shift_uxn_opcodes_h_l1013_c30_7798_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1013_c30_7798_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1013_c30_7798_return_output := sp_relative_shift_uxn_opcodes_h_l1013_c30_7798_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l996_l993_l988_l1009_l1005_l1001_DUPLICATE_6bc0 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l996_l993_l988_l1009_l1005_l1001_DUPLICATE_6bc0_return_output := result.sp_relative_shift;

     -- CONST_SR_8[uxn_opcodes_h_l1021_c31_0cfc] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1021_c31_0cfc_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1021_c31_0cfc_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1021_c31_0cfc_return_output := CONST_SR_8_uxn_opcodes_h_l1021_c31_0cfc_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l996_l993_l1023_l1018_l1009_l1005_l1001_DUPLICATE_01ad LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l996_l993_l1023_l1018_l1009_l1005_l1001_DUPLICATE_01ad_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l996_c11_5741] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l996_c11_5741_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l996_c11_5741_left;
     BIN_OP_EQ_uxn_opcodes_h_l996_c11_5741_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l996_c11_5741_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l996_c11_5741_return_output := BIN_OP_EQ_uxn_opcodes_h_l996_c11_5741_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1023_c11_32da] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1023_c11_32da_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_32da_left;
     BIN_OP_EQ_uxn_opcodes_h_l1023_c11_32da_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_32da_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_32da_return_output := BIN_OP_EQ_uxn_opcodes_h_l1023_c11_32da_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l996_l993_l988_l1018_l1005_l1001_DUPLICATE_55b3 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l996_l993_l988_l1018_l1005_l1001_DUPLICATE_55b3_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1005_l1018_DUPLICATE_d655 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1005_l1018_DUPLICATE_d655_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l988_c6_4147] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l988_c6_4147_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c6_4147_left;
     BIN_OP_EQ_uxn_opcodes_h_l988_c6_4147_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c6_4147_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c6_4147_return_output := BIN_OP_EQ_uxn_opcodes_h_l988_c6_4147_return_output;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l1001_c7_1778_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_ad09_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_1778_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_ad09_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_1778_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_ad09_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_1778_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_ad09_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_1778_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_ad09_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_1778_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_ad09_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1001_c7_1778_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_ad09_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1001_c7_1778_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_ad09_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1001_c7_1778_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_ad09_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1005_c7_cb76_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_27ba_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_cb76_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_27ba_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_cb76_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_27ba_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_cb76_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_27ba_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_cb76_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_27ba_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_cb76_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_27ba_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1005_c7_cb76_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_27ba_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1005_c7_cb76_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_27ba_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1009_c7_8427_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_45fb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_8427_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_45fb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_8427_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_45fb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_8427_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_45fb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_8427_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_45fb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_8427_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_45fb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1009_c7_8427_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_45fb_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1009_c7_8427_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_45fb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_e436_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_eed9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1018_c7_e436_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_eed9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_e436_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_eed9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1018_c7_e436_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_eed9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1018_c7_e436_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_eed9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_867a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_32da_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_867a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_32da_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l988_c1_ed1f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c6_4147_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l988_c2_22b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c6_4147_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l988_c2_22b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c6_4147_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l988_c2_22b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c6_4147_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l988_c2_22b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c6_4147_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c2_22b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c6_4147_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c2_22b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c6_4147_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l988_c2_22b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c6_4147_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l988_c2_22b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c6_4147_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l988_c2_22b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c6_4147_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l993_c7_c4f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l993_c11_77d7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_c4f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l993_c11_77d7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_c4f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l993_c11_77d7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_c4f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l993_c11_77d7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_c4f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l993_c11_77d7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_c4f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l993_c11_77d7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l993_c7_c4f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l993_c11_77d7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l993_c7_c4f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l993_c11_77d7_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l993_c7_c4f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l993_c11_77d7_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l996_c7_4023_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l996_c11_5741_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_4023_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l996_c11_5741_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_4023_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l996_c11_5741_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_4023_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l996_c11_5741_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_4023_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l996_c11_5741_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_4023_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l996_c11_5741_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l996_c7_4023_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l996_c11_5741_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l996_c7_4023_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l996_c11_5741_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l996_c7_4023_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l996_c11_5741_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1002_c3_7846_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l997_l1010_l1002_l1006_DUPLICATE_4f99_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1010_c3_7368_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l997_l1010_l1002_l1006_DUPLICATE_4f99_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1007_l998_DUPLICATE_ddfe_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l997_l1010_l1002_l1006_DUPLICATE_4f99_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_1778_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l996_l993_l988_l1009_l1005_l1001_DUPLICATE_6bc0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_cb76_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l996_l993_l988_l1009_l1005_l1001_DUPLICATE_6bc0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_8427_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l996_l993_l988_l1009_l1005_l1001_DUPLICATE_6bc0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c2_22b0_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l996_l993_l988_l1009_l1005_l1001_DUPLICATE_6bc0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_c4f1_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l996_l993_l988_l1009_l1005_l1001_DUPLICATE_6bc0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_4023_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l996_l993_l988_l1009_l1005_l1001_DUPLICATE_6bc0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_1778_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l996_l993_l1023_l1018_l1009_l1005_l1001_DUPLICATE_01ad_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_cb76_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l996_l993_l1023_l1018_l1009_l1005_l1001_DUPLICATE_01ad_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_8427_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l996_l993_l1023_l1018_l1009_l1005_l1001_DUPLICATE_01ad_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_e436_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l996_l993_l1023_l1018_l1009_l1005_l1001_DUPLICATE_01ad_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_867a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l996_l993_l1023_l1018_l1009_l1005_l1001_DUPLICATE_01ad_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_c4f1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l996_l993_l1023_l1018_l1009_l1005_l1001_DUPLICATE_01ad_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_4023_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l996_l993_l1023_l1018_l1009_l1005_l1001_DUPLICATE_01ad_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_1778_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l996_l993_l988_l1018_l1005_l1001_DUPLICATE_55b3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_cb76_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l996_l993_l988_l1018_l1005_l1001_DUPLICATE_55b3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1018_c7_e436_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l996_l993_l988_l1018_l1005_l1001_DUPLICATE_55b3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l988_c2_22b0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l996_l993_l988_l1018_l1005_l1001_DUPLICATE_55b3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_c4f1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l996_l993_l988_l1018_l1005_l1001_DUPLICATE_55b3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_4023_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l996_l993_l988_l1018_l1005_l1001_DUPLICATE_55b3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_1778_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l996_l993_l1023_l988_l1018_l1005_l1001_DUPLICATE_c820_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_cb76_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l996_l993_l1023_l988_l1018_l1005_l1001_DUPLICATE_c820_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_e436_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l996_l993_l1023_l988_l1018_l1005_l1001_DUPLICATE_c820_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_867a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l996_l993_l1023_l988_l1018_l1005_l1001_DUPLICATE_c820_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l988_c2_22b0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l996_l993_l1023_l988_l1018_l1005_l1001_DUPLICATE_c820_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_c4f1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l996_l993_l1023_l988_l1018_l1005_l1001_DUPLICATE_c820_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_4023_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l996_l993_l1023_l988_l1018_l1005_l1001_DUPLICATE_c820_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_cb76_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1005_l1018_DUPLICATE_d655_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1018_c7_e436_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1005_l1018_DUPLICATE_d655_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1001_c7_1778_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l996_l993_l988_l1018_l1005_l1001_DUPLICATE_88f5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1005_c7_cb76_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l996_l993_l988_l1018_l1005_l1001_DUPLICATE_88f5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1018_c7_e436_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l996_l993_l988_l1018_l1005_l1001_DUPLICATE_88f5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l988_c2_22b0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l996_l993_l988_l1018_l1005_l1001_DUPLICATE_88f5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l993_c7_c4f1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l996_l993_l988_l1018_l1005_l1001_DUPLICATE_88f5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l996_c7_4023_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l996_l993_l988_l1018_l1005_l1001_DUPLICATE_88f5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_8427_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1013_c30_7798_return_output;
     -- BIN_OP_OR[uxn_opcodes_h_l1002_c3_7846] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1002_c3_7846_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1002_c3_7846_left;
     BIN_OP_OR_uxn_opcodes_h_l1002_c3_7846_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1002_c3_7846_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1002_c3_7846_return_output := BIN_OP_OR_uxn_opcodes_h_l1002_c3_7846_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1009_c7_8427] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_8427_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_8427_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_8427_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_8427_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_8427_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_8427_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_8427_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_8427_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1023_c7_867a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_867a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_867a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_867a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_867a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_867a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_867a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_867a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_867a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1023_c7_867a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_867a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_867a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_867a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_867a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_867a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_867a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_867a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_867a_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1021_c21_511b] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1021_c21_511b_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1021_c31_0cfc_return_output);

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1007_l998_DUPLICATE_ddfe LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1007_l998_DUPLICATE_ddfe_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1007_l998_DUPLICATE_ddfe_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1007_l998_DUPLICATE_ddfe_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1007_l998_DUPLICATE_ddfe_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l988_c1_ed1f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l988_c1_ed1f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l988_c1_ed1f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l988_c1_ed1f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l988_c1_ed1f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l988_c1_ed1f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l988_c1_ed1f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l988_c1_ed1f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l988_c1_ed1f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1018_c7_e436] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1018_c7_e436_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1018_c7_e436_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1018_c7_e436_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1018_c7_e436_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1018_c7_e436_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1018_c7_e436_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1018_c7_e436_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1018_c7_e436_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1018_c7_e436] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1018_c7_e436_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1018_c7_e436_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1018_c7_e436_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1018_c7_e436_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1018_c7_e436_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1018_c7_e436_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1018_c7_e436_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1018_c7_e436_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1010_c3_7368] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1010_c3_7368_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1010_c3_7368_left;
     BIN_OP_OR_uxn_opcodes_h_l1010_c3_7368_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1010_c3_7368_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1010_c3_7368_return_output := BIN_OP_OR_uxn_opcodes_h_l1010_c3_7368_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1001_c7_1778_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1002_c3_7846_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1011_c11_25eb_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1010_c3_7368_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1009_c7_8427_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1010_c3_7368_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1018_c7_e436_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1021_c21_511b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1005_c7_cb76_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1007_l998_DUPLICATE_ddfe_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l996_c7_4023_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1007_l998_DUPLICATE_ddfe_return_output;
     VAR_printf_uxn_opcodes_h_l989_c3_5bda_uxn_opcodes_h_l989_c3_5bda_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l988_c1_ed1f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_e436_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_867a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_8427_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1018_c7_e436_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_e436_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_867a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_cb76_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_8427_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_8427_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1018_c7_e436_return_output;
     -- n16_MUX[uxn_opcodes_h_l1009_c7_8427] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1009_c7_8427_cond <= VAR_n16_MUX_uxn_opcodes_h_l1009_c7_8427_cond;
     n16_MUX_uxn_opcodes_h_l1009_c7_8427_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1009_c7_8427_iftrue;
     n16_MUX_uxn_opcodes_h_l1009_c7_8427_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1009_c7_8427_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1009_c7_8427_return_output := n16_MUX_uxn_opcodes_h_l1009_c7_8427_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1018_c7_e436] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1018_c7_e436_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1018_c7_e436_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1018_c7_e436_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1018_c7_e436_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1018_c7_e436_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1018_c7_e436_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1018_c7_e436_return_output := result_u8_value_MUX_uxn_opcodes_h_l1018_c7_e436_return_output;

     -- t16_MUX[uxn_opcodes_h_l1001_c7_1778] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1001_c7_1778_cond <= VAR_t16_MUX_uxn_opcodes_h_l1001_c7_1778_cond;
     t16_MUX_uxn_opcodes_h_l1001_c7_1778_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1001_c7_1778_iftrue;
     t16_MUX_uxn_opcodes_h_l1001_c7_1778_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1001_c7_1778_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1001_c7_1778_return_output := t16_MUX_uxn_opcodes_h_l1001_c7_1778_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1009_c7_8427] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_8427_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_8427_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_8427_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_8427_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_8427_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_8427_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_8427_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_8427_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1018_c7_e436] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_e436_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_e436_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_e436_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_e436_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_e436_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_e436_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_e436_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_e436_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1005_c7_cb76] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_cb76_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_cb76_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_cb76_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_cb76_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_cb76_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_cb76_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_cb76_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_cb76_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1011_c11_25eb] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1011_c11_25eb_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1011_c11_25eb_left;
     BIN_OP_OR_uxn_opcodes_h_l1011_c11_25eb_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1011_c11_25eb_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1011_c11_25eb_return_output := BIN_OP_OR_uxn_opcodes_h_l1011_c11_25eb_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1018_c7_e436] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_e436_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_e436_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_e436_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_e436_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_e436_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_e436_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_e436_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_e436_return_output;

     -- printf_uxn_opcodes_h_l989_c3_5bda[uxn_opcodes_h_l989_c3_5bda] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l989_c3_5bda_uxn_opcodes_h_l989_c3_5bda_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l989_c3_5bda_uxn_opcodes_h_l989_c3_5bda_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1009_c7_8427] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_8427_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_8427_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_8427_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_8427_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_8427_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_8427_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_8427_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_8427_return_output;

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l1009_c7_8427_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1011_c11_25eb_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1005_c7_cb76_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1009_c7_8427_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_8427_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_e436_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_cb76_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_8427_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_8427_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_e436_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_1778_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_cb76_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_cb76_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_8427_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1009_c7_8427_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1018_c7_e436_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l996_c7_4023_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1001_c7_1778_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1009_c7_8427] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_8427_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_8427_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_8427_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_8427_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_8427_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_8427_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_8427_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_8427_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1009_c7_8427] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1009_c7_8427_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1009_c7_8427_cond;
     tmp16_MUX_uxn_opcodes_h_l1009_c7_8427_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1009_c7_8427_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1009_c7_8427_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1009_c7_8427_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1009_c7_8427_return_output := tmp16_MUX_uxn_opcodes_h_l1009_c7_8427_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1009_c7_8427] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_8427_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_8427_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_8427_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_8427_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_8427_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_8427_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_8427_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_8427_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1001_c7_1778] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_1778_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_1778_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_1778_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_1778_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_1778_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_1778_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_1778_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_1778_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1016_c21_7e7d] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1016_c21_7e7d_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_OR_uxn_opcodes_h_l1011_c11_25eb_return_output);

     -- n16_MUX[uxn_opcodes_h_l1005_c7_cb76] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1005_c7_cb76_cond <= VAR_n16_MUX_uxn_opcodes_h_l1005_c7_cb76_cond;
     n16_MUX_uxn_opcodes_h_l1005_c7_cb76_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1005_c7_cb76_iftrue;
     n16_MUX_uxn_opcodes_h_l1005_c7_cb76_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1005_c7_cb76_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1005_c7_cb76_return_output := n16_MUX_uxn_opcodes_h_l1005_c7_cb76_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1005_c7_cb76] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_cb76_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_cb76_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_cb76_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_cb76_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_cb76_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_cb76_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_cb76_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_cb76_return_output;

     -- t16_MUX[uxn_opcodes_h_l996_c7_4023] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l996_c7_4023_cond <= VAR_t16_MUX_uxn_opcodes_h_l996_c7_4023_cond;
     t16_MUX_uxn_opcodes_h_l996_c7_4023_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l996_c7_4023_iftrue;
     t16_MUX_uxn_opcodes_h_l996_c7_4023_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l996_c7_4023_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l996_c7_4023_return_output := t16_MUX_uxn_opcodes_h_l996_c7_4023_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1005_c7_cb76] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_cb76_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_cb76_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_cb76_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_cb76_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_cb76_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_cb76_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_cb76_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_cb76_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1009_c7_8427_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1016_c21_7e7d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1001_c7_1778_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1005_c7_cb76_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_cb76_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_8427_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_1778_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_cb76_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_cb76_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_8427_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_4023_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_1778_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_1778_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_cb76_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l993_c7_c4f1_iffalse := VAR_t16_MUX_uxn_opcodes_h_l996_c7_4023_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1005_c7_cb76_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1009_c7_8427_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l996_c7_4023] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_4023_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_4023_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_4023_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_4023_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_4023_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_4023_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_4023_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_4023_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1009_c7_8427] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1009_c7_8427_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1009_c7_8427_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1009_c7_8427_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1009_c7_8427_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1009_c7_8427_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1009_c7_8427_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1009_c7_8427_return_output := result_u8_value_MUX_uxn_opcodes_h_l1009_c7_8427_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1005_c7_cb76] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_cb76_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_cb76_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_cb76_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_cb76_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_cb76_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_cb76_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_cb76_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_cb76_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1001_c7_1778] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_1778_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_1778_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_1778_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_1778_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_1778_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_1778_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_1778_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_1778_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1005_c7_cb76] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1005_c7_cb76_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1005_c7_cb76_cond;
     tmp16_MUX_uxn_opcodes_h_l1005_c7_cb76_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1005_c7_cb76_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1005_c7_cb76_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1005_c7_cb76_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1005_c7_cb76_return_output := tmp16_MUX_uxn_opcodes_h_l1005_c7_cb76_return_output;

     -- t16_MUX[uxn_opcodes_h_l993_c7_c4f1] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l993_c7_c4f1_cond <= VAR_t16_MUX_uxn_opcodes_h_l993_c7_c4f1_cond;
     t16_MUX_uxn_opcodes_h_l993_c7_c4f1_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l993_c7_c4f1_iftrue;
     t16_MUX_uxn_opcodes_h_l993_c7_c4f1_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l993_c7_c4f1_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l993_c7_c4f1_return_output := t16_MUX_uxn_opcodes_h_l993_c7_c4f1_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1001_c7_1778] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_1778_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_1778_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_1778_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_1778_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_1778_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_1778_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_1778_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_1778_return_output;

     -- n16_MUX[uxn_opcodes_h_l1001_c7_1778] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1001_c7_1778_cond <= VAR_n16_MUX_uxn_opcodes_h_l1001_c7_1778_cond;
     n16_MUX_uxn_opcodes_h_l1001_c7_1778_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1001_c7_1778_iftrue;
     n16_MUX_uxn_opcodes_h_l1001_c7_1778_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1001_c7_1778_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1001_c7_1778_return_output := n16_MUX_uxn_opcodes_h_l1001_c7_1778_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1005_c7_cb76] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_cb76_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_cb76_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_cb76_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_cb76_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_cb76_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_cb76_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_cb76_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_cb76_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l996_c7_4023_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1001_c7_1778_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_1778_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_cb76_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_4023_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_1778_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_1778_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_cb76_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_c4f1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_4023_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_4023_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_1778_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1005_c7_cb76_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1009_c7_8427_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l988_c2_22b0_iffalse := VAR_t16_MUX_uxn_opcodes_h_l993_c7_c4f1_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1001_c7_1778_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1005_c7_cb76_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1001_c7_1778] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_1778_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_1778_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_1778_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_1778_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_1778_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_1778_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_1778_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_1778_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l993_c7_c4f1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_c4f1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_c4f1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_c4f1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_c4f1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_c4f1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_c4f1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_c4f1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_c4f1_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1005_c7_cb76] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1005_c7_cb76_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1005_c7_cb76_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1005_c7_cb76_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1005_c7_cb76_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1005_c7_cb76_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1005_c7_cb76_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1005_c7_cb76_return_output := result_u8_value_MUX_uxn_opcodes_h_l1005_c7_cb76_return_output;

     -- n16_MUX[uxn_opcodes_h_l996_c7_4023] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l996_c7_4023_cond <= VAR_n16_MUX_uxn_opcodes_h_l996_c7_4023_cond;
     n16_MUX_uxn_opcodes_h_l996_c7_4023_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l996_c7_4023_iftrue;
     n16_MUX_uxn_opcodes_h_l996_c7_4023_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l996_c7_4023_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l996_c7_4023_return_output := n16_MUX_uxn_opcodes_h_l996_c7_4023_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l996_c7_4023] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_4023_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_4023_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_4023_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_4023_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_4023_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_4023_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_4023_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_4023_return_output;

     -- t16_MUX[uxn_opcodes_h_l988_c2_22b0] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l988_c2_22b0_cond <= VAR_t16_MUX_uxn_opcodes_h_l988_c2_22b0_cond;
     t16_MUX_uxn_opcodes_h_l988_c2_22b0_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l988_c2_22b0_iftrue;
     t16_MUX_uxn_opcodes_h_l988_c2_22b0_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l988_c2_22b0_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l988_c2_22b0_return_output := t16_MUX_uxn_opcodes_h_l988_c2_22b0_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1001_c7_1778] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1001_c7_1778_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1001_c7_1778_cond;
     tmp16_MUX_uxn_opcodes_h_l1001_c7_1778_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1001_c7_1778_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1001_c7_1778_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1001_c7_1778_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1001_c7_1778_return_output := tmp16_MUX_uxn_opcodes_h_l1001_c7_1778_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l996_c7_4023] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_4023_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_4023_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_4023_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_4023_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_4023_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_4023_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_4023_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_4023_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1001_c7_1778] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_1778_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_1778_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_1778_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_1778_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_1778_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_1778_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_1778_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_1778_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l993_c7_c4f1_iffalse := VAR_n16_MUX_uxn_opcodes_h_l996_c7_4023_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_4023_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_1778_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_c4f1_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_4023_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_4023_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_1778_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c2_22b0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_c4f1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_c4f1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_4023_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1001_c7_1778_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1005_c7_cb76_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l988_c2_22b0_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l996_c7_4023_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1001_c7_1778_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l988_c2_22b0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c2_22b0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c2_22b0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c2_22b0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c2_22b0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c2_22b0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c2_22b0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c2_22b0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c2_22b0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l996_c7_4023] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_4023_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_4023_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_4023_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_4023_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_4023_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_4023_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_4023_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_4023_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l993_c7_c4f1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_c4f1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_c4f1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_c4f1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_c4f1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_c4f1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_c4f1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_c4f1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_c4f1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l996_c7_4023] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_4023_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_4023_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_4023_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_4023_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_4023_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_4023_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_4023_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_4023_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l993_c7_c4f1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_c4f1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_c4f1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_c4f1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_c4f1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_c4f1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_c4f1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_c4f1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_c4f1_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l996_c7_4023] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l996_c7_4023_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l996_c7_4023_cond;
     tmp16_MUX_uxn_opcodes_h_l996_c7_4023_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l996_c7_4023_iftrue;
     tmp16_MUX_uxn_opcodes_h_l996_c7_4023_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l996_c7_4023_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l996_c7_4023_return_output := tmp16_MUX_uxn_opcodes_h_l996_c7_4023_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1001_c7_1778] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1001_c7_1778_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1001_c7_1778_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1001_c7_1778_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1001_c7_1778_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1001_c7_1778_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1001_c7_1778_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1001_c7_1778_return_output := result_u8_value_MUX_uxn_opcodes_h_l1001_c7_1778_return_output;

     -- n16_MUX[uxn_opcodes_h_l993_c7_c4f1] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l993_c7_c4f1_cond <= VAR_n16_MUX_uxn_opcodes_h_l993_c7_c4f1_cond;
     n16_MUX_uxn_opcodes_h_l993_c7_c4f1_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l993_c7_c4f1_iftrue;
     n16_MUX_uxn_opcodes_h_l993_c7_c4f1_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l993_c7_c4f1_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l993_c7_c4f1_return_output := n16_MUX_uxn_opcodes_h_l993_c7_c4f1_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l988_c2_22b0_iffalse := VAR_n16_MUX_uxn_opcodes_h_l993_c7_c4f1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_c4f1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_4023_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l988_c2_22b0_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_c4f1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_c4f1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_4023_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c2_22b0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_c4f1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l996_c7_4023_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1001_c7_1778_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l993_c7_c4f1_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l996_c7_4023_return_output;
     -- n16_MUX[uxn_opcodes_h_l988_c2_22b0] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l988_c2_22b0_cond <= VAR_n16_MUX_uxn_opcodes_h_l988_c2_22b0_cond;
     n16_MUX_uxn_opcodes_h_l988_c2_22b0_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l988_c2_22b0_iftrue;
     n16_MUX_uxn_opcodes_h_l988_c2_22b0_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l988_c2_22b0_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l988_c2_22b0_return_output := n16_MUX_uxn_opcodes_h_l988_c2_22b0_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l993_c7_c4f1] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l993_c7_c4f1_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l993_c7_c4f1_cond;
     tmp16_MUX_uxn_opcodes_h_l993_c7_c4f1_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l993_c7_c4f1_iftrue;
     tmp16_MUX_uxn_opcodes_h_l993_c7_c4f1_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l993_c7_c4f1_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l993_c7_c4f1_return_output := tmp16_MUX_uxn_opcodes_h_l993_c7_c4f1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l988_c2_22b0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c2_22b0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c2_22b0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c2_22b0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c2_22b0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c2_22b0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c2_22b0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c2_22b0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c2_22b0_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l988_c2_22b0] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l988_c2_22b0_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l988_c2_22b0_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l988_c2_22b0_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l988_c2_22b0_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l988_c2_22b0_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l988_c2_22b0_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l988_c2_22b0_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l988_c2_22b0_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l996_c7_4023] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l996_c7_4023_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l996_c7_4023_cond;
     result_u8_value_MUX_uxn_opcodes_h_l996_c7_4023_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l996_c7_4023_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l996_c7_4023_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l996_c7_4023_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l996_c7_4023_return_output := result_u8_value_MUX_uxn_opcodes_h_l996_c7_4023_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l993_c7_c4f1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_c4f1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_c4f1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_c4f1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_c4f1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_c4f1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_c4f1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_c4f1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_c4f1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l993_c7_c4f1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_c4f1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_c4f1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_c4f1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_c4f1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_c4f1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_c4f1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_c4f1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_c4f1_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l988_c2_22b0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l988_c2_22b0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_c4f1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l988_c2_22b0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_c4f1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l993_c7_c4f1_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l996_c7_4023_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l988_c2_22b0_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l993_c7_c4f1_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l988_c2_22b0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l988_c2_22b0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l988_c2_22b0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l988_c2_22b0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l988_c2_22b0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l988_c2_22b0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l988_c2_22b0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l988_c2_22b0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l988_c2_22b0_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l993_c7_c4f1] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l993_c7_c4f1_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l993_c7_c4f1_cond;
     result_u8_value_MUX_uxn_opcodes_h_l993_c7_c4f1_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l993_c7_c4f1_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l993_c7_c4f1_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l993_c7_c4f1_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l993_c7_c4f1_return_output := result_u8_value_MUX_uxn_opcodes_h_l993_c7_c4f1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l988_c2_22b0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l988_c2_22b0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l988_c2_22b0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l988_c2_22b0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l988_c2_22b0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l988_c2_22b0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l988_c2_22b0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l988_c2_22b0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l988_c2_22b0_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l988_c2_22b0] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l988_c2_22b0_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l988_c2_22b0_cond;
     tmp16_MUX_uxn_opcodes_h_l988_c2_22b0_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l988_c2_22b0_iftrue;
     tmp16_MUX_uxn_opcodes_h_l988_c2_22b0_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l988_c2_22b0_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l988_c2_22b0_return_output := tmp16_MUX_uxn_opcodes_h_l988_c2_22b0_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l988_c2_22b0_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l993_c7_c4f1_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l988_c2_22b0_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l988_c2_22b0] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l988_c2_22b0_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l988_c2_22b0_cond;
     result_u8_value_MUX_uxn_opcodes_h_l988_c2_22b0_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l988_c2_22b0_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l988_c2_22b0_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l988_c2_22b0_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l988_c2_22b0_return_output := result_u8_value_MUX_uxn_opcodes_h_l988_c2_22b0_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_5b93_uxn_opcodes_h_l984_l1028_DUPLICATE_1824 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5b93_uxn_opcodes_h_l984_l1028_DUPLICATE_1824_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_5b93(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l988_c2_22b0_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c2_22b0_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l988_c2_22b0_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l988_c2_22b0_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c2_22b0_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l988_c2_22b0_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5b93_uxn_opcodes_h_l984_l1028_DUPLICATE_1824_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5b93_uxn_opcodes_h_l984_l1028_DUPLICATE_1824_return_output;
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
