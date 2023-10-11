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
-- Submodules: 57
entity ldr_0CLK_3d5a5eea is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end ldr_0CLK_3d5a5eea;
architecture arch of ldr_0CLK_3d5a5eea is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal tmp8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_tmp8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1728_c6_6cd4]
signal BIN_OP_EQ_uxn_opcodes_h_l1728_c6_6cd4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1728_c6_6cd4_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1728_c6_6cd4_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1728_c1_e91c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1728_c1_e91c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1728_c1_e91c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1728_c1_e91c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1728_c1_e91c_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1728_c2_1016]
signal tmp8_MUX_uxn_opcodes_h_l1728_c2_1016_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1728_c2_1016_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1728_c2_1016_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1728_c2_1016_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1728_c2_1016]
signal t8_MUX_uxn_opcodes_h_l1728_c2_1016_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1728_c2_1016_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1728_c2_1016_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1728_c2_1016_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1728_c2_1016]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1728_c2_1016_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1728_c2_1016_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1728_c2_1016_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1728_c2_1016_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1728_c2_1016]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1728_c2_1016_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1728_c2_1016_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1728_c2_1016_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1728_c2_1016_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1728_c2_1016]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1728_c2_1016_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1728_c2_1016_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1728_c2_1016_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1728_c2_1016_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1728_c2_1016]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1728_c2_1016_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1728_c2_1016_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1728_c2_1016_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1728_c2_1016_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1728_c2_1016]
signal result_stack_value_MUX_uxn_opcodes_h_l1728_c2_1016_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1728_c2_1016_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1728_c2_1016_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1728_c2_1016_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1728_c2_1016]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1728_c2_1016_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1728_c2_1016_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1728_c2_1016_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1728_c2_1016_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1728_c2_1016]
signal result_ram_addr_MUX_uxn_opcodes_h_l1728_c2_1016_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1728_c2_1016_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1728_c2_1016_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1728_c2_1016_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l1729_c3_e792[uxn_opcodes_h_l1729_c3_e792]
signal printf_uxn_opcodes_h_l1729_c3_e792_uxn_opcodes_h_l1729_c3_e792_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1733_c11_5e64]
signal BIN_OP_EQ_uxn_opcodes_h_l1733_c11_5e64_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1733_c11_5e64_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1733_c11_5e64_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1733_c7_b9ce]
signal tmp8_MUX_uxn_opcodes_h_l1733_c7_b9ce_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1733_c7_b9ce_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1733_c7_b9ce_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1733_c7_b9ce_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1733_c7_b9ce]
signal t8_MUX_uxn_opcodes_h_l1733_c7_b9ce_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1733_c7_b9ce_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1733_c7_b9ce_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1733_c7_b9ce_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1733_c7_b9ce]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1733_c7_b9ce_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1733_c7_b9ce_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1733_c7_b9ce_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1733_c7_b9ce_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1733_c7_b9ce]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1733_c7_b9ce_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1733_c7_b9ce_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1733_c7_b9ce_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1733_c7_b9ce_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1733_c7_b9ce]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_b9ce_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_b9ce_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_b9ce_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_b9ce_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1733_c7_b9ce]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_b9ce_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_b9ce_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_b9ce_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_b9ce_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1733_c7_b9ce]
signal result_stack_value_MUX_uxn_opcodes_h_l1733_c7_b9ce_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1733_c7_b9ce_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1733_c7_b9ce_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1733_c7_b9ce_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1733_c7_b9ce]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_b9ce_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_b9ce_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_b9ce_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_b9ce_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1733_c7_b9ce]
signal result_ram_addr_MUX_uxn_opcodes_h_l1733_c7_b9ce_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1733_c7_b9ce_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1733_c7_b9ce_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1733_c7_b9ce_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1736_c11_a54c]
signal BIN_OP_EQ_uxn_opcodes_h_l1736_c11_a54c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1736_c11_a54c_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1736_c11_a54c_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1736_c7_c400]
signal tmp8_MUX_uxn_opcodes_h_l1736_c7_c400_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1736_c7_c400_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1736_c7_c400_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1736_c7_c400_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1736_c7_c400]
signal t8_MUX_uxn_opcodes_h_l1736_c7_c400_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1736_c7_c400_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1736_c7_c400_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1736_c7_c400_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1736_c7_c400]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1736_c7_c400_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1736_c7_c400_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1736_c7_c400_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1736_c7_c400_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1736_c7_c400]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c7_c400_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c7_c400_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c7_c400_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c7_c400_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1736_c7_c400]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c7_c400_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c7_c400_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c7_c400_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c7_c400_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1736_c7_c400]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c7_c400_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c7_c400_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c7_c400_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c7_c400_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1736_c7_c400]
signal result_stack_value_MUX_uxn_opcodes_h_l1736_c7_c400_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1736_c7_c400_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1736_c7_c400_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1736_c7_c400_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1736_c7_c400]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1736_c7_c400_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1736_c7_c400_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1736_c7_c400_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1736_c7_c400_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1736_c7_c400]
signal result_ram_addr_MUX_uxn_opcodes_h_l1736_c7_c400_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1736_c7_c400_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1736_c7_c400_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1736_c7_c400_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1739_c32_ef9f]
signal BIN_OP_AND_uxn_opcodes_h_l1739_c32_ef9f_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1739_c32_ef9f_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1739_c32_ef9f_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1739_c32_7c65]
signal BIN_OP_GT_uxn_opcodes_h_l1739_c32_7c65_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1739_c32_7c65_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1739_c32_7c65_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1739_c32_b1f1]
signal MUX_uxn_opcodes_h_l1739_c32_b1f1_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1739_c32_b1f1_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1739_c32_b1f1_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1739_c32_b1f1_return_output : signed(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1740_c21_5b3b]
signal BIN_OP_PLUS_uxn_opcodes_h_l1740_c21_5b3b_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1740_c21_5b3b_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1740_c21_5b3b_return_output : signed(17 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1742_c11_1b77]
signal BIN_OP_EQ_uxn_opcodes_h_l1742_c11_1b77_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1742_c11_1b77_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1742_c11_1b77_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1742_c7_a48b]
signal tmp8_MUX_uxn_opcodes_h_l1742_c7_a48b_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1742_c7_a48b_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1742_c7_a48b_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1742_c7_a48b_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1742_c7_a48b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_a48b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_a48b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_a48b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_a48b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1742_c7_a48b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1742_c7_a48b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1742_c7_a48b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1742_c7_a48b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1742_c7_a48b_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1742_c7_a48b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1742_c7_a48b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1742_c7_a48b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1742_c7_a48b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1742_c7_a48b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1742_c7_a48b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1742_c7_a48b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1742_c7_a48b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1742_c7_a48b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1742_c7_a48b_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1742_c7_a48b]
signal result_stack_value_MUX_uxn_opcodes_h_l1742_c7_a48b_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1742_c7_a48b_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1742_c7_a48b_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1742_c7_a48b_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1742_c7_a48b]
signal result_ram_addr_MUX_uxn_opcodes_h_l1742_c7_a48b_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1742_c7_a48b_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1742_c7_a48b_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1742_c7_a48b_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1744_c21_b1bd]
signal BIN_OP_PLUS_uxn_opcodes_h_l1744_c21_b1bd_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1744_c21_b1bd_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1744_c21_b1bd_return_output : signed(17 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1746_c11_2ef8]
signal BIN_OP_EQ_uxn_opcodes_h_l1746_c11_2ef8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1746_c11_2ef8_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1746_c11_2ef8_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1746_c7_4dc6]
signal tmp8_MUX_uxn_opcodes_h_l1746_c7_4dc6_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1746_c7_4dc6_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1746_c7_4dc6_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1746_c7_4dc6_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1746_c7_4dc6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1746_c7_4dc6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1746_c7_4dc6_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1746_c7_4dc6_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1746_c7_4dc6_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1746_c7_4dc6]
signal result_stack_value_MUX_uxn_opcodes_h_l1746_c7_4dc6_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1746_c7_4dc6_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1746_c7_4dc6_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1746_c7_4dc6_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1746_c7_4dc6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1746_c7_4dc6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1746_c7_4dc6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1746_c7_4dc6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1746_c7_4dc6_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1746_c7_4dc6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1746_c7_4dc6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1746_c7_4dc6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1746_c7_4dc6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1746_c7_4dc6_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1752_c11_a3c4]
signal BIN_OP_EQ_uxn_opcodes_h_l1752_c11_a3c4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1752_c11_a3c4_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1752_c11_a3c4_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1752_c7_2389]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1752_c7_2389_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1752_c7_2389_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1752_c7_2389_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1752_c7_2389_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1752_c7_2389]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1752_c7_2389_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1752_c7_2389_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1752_c7_2389_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1752_c7_2389_return_output : unsigned(0 downto 0);

function CAST_TO_int8_t_uint8_t( rhs : unsigned) return signed is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : signed(7 downto 0);

begin

      return_output := signed(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_5b20( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : signed;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return opcode_result_t is
 
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
      base.ram_addr := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1728_c6_6cd4
BIN_OP_EQ_uxn_opcodes_h_l1728_c6_6cd4 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1728_c6_6cd4_left,
BIN_OP_EQ_uxn_opcodes_h_l1728_c6_6cd4_right,
BIN_OP_EQ_uxn_opcodes_h_l1728_c6_6cd4_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1728_c1_e91c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1728_c1_e91c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1728_c1_e91c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1728_c1_e91c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1728_c1_e91c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1728_c1_e91c_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1728_c2_1016
tmp8_MUX_uxn_opcodes_h_l1728_c2_1016 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1728_c2_1016_cond,
tmp8_MUX_uxn_opcodes_h_l1728_c2_1016_iftrue,
tmp8_MUX_uxn_opcodes_h_l1728_c2_1016_iffalse,
tmp8_MUX_uxn_opcodes_h_l1728_c2_1016_return_output);

-- t8_MUX_uxn_opcodes_h_l1728_c2_1016
t8_MUX_uxn_opcodes_h_l1728_c2_1016 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1728_c2_1016_cond,
t8_MUX_uxn_opcodes_h_l1728_c2_1016_iftrue,
t8_MUX_uxn_opcodes_h_l1728_c2_1016_iffalse,
t8_MUX_uxn_opcodes_h_l1728_c2_1016_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1728_c2_1016
result_is_stack_write_MUX_uxn_opcodes_h_l1728_c2_1016 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1728_c2_1016_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1728_c2_1016_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1728_c2_1016_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1728_c2_1016_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1728_c2_1016
result_is_sp_shift_MUX_uxn_opcodes_h_l1728_c2_1016 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1728_c2_1016_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1728_c2_1016_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1728_c2_1016_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1728_c2_1016_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1728_c2_1016
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1728_c2_1016 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1728_c2_1016_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1728_c2_1016_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1728_c2_1016_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1728_c2_1016_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1728_c2_1016
result_sp_relative_shift_MUX_uxn_opcodes_h_l1728_c2_1016 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1728_c2_1016_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1728_c2_1016_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1728_c2_1016_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1728_c2_1016_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1728_c2_1016
result_stack_value_MUX_uxn_opcodes_h_l1728_c2_1016 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1728_c2_1016_cond,
result_stack_value_MUX_uxn_opcodes_h_l1728_c2_1016_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1728_c2_1016_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1728_c2_1016_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1728_c2_1016
result_is_opc_done_MUX_uxn_opcodes_h_l1728_c2_1016 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1728_c2_1016_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1728_c2_1016_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1728_c2_1016_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1728_c2_1016_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1728_c2_1016
result_ram_addr_MUX_uxn_opcodes_h_l1728_c2_1016 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1728_c2_1016_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1728_c2_1016_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1728_c2_1016_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1728_c2_1016_return_output);

-- printf_uxn_opcodes_h_l1729_c3_e792_uxn_opcodes_h_l1729_c3_e792
printf_uxn_opcodes_h_l1729_c3_e792_uxn_opcodes_h_l1729_c3_e792 : entity work.printf_uxn_opcodes_h_l1729_c3_e792_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1729_c3_e792_uxn_opcodes_h_l1729_c3_e792_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1733_c11_5e64
BIN_OP_EQ_uxn_opcodes_h_l1733_c11_5e64 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1733_c11_5e64_left,
BIN_OP_EQ_uxn_opcodes_h_l1733_c11_5e64_right,
BIN_OP_EQ_uxn_opcodes_h_l1733_c11_5e64_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1733_c7_b9ce
tmp8_MUX_uxn_opcodes_h_l1733_c7_b9ce : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1733_c7_b9ce_cond,
tmp8_MUX_uxn_opcodes_h_l1733_c7_b9ce_iftrue,
tmp8_MUX_uxn_opcodes_h_l1733_c7_b9ce_iffalse,
tmp8_MUX_uxn_opcodes_h_l1733_c7_b9ce_return_output);

-- t8_MUX_uxn_opcodes_h_l1733_c7_b9ce
t8_MUX_uxn_opcodes_h_l1733_c7_b9ce : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1733_c7_b9ce_cond,
t8_MUX_uxn_opcodes_h_l1733_c7_b9ce_iftrue,
t8_MUX_uxn_opcodes_h_l1733_c7_b9ce_iffalse,
t8_MUX_uxn_opcodes_h_l1733_c7_b9ce_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1733_c7_b9ce
result_is_stack_write_MUX_uxn_opcodes_h_l1733_c7_b9ce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1733_c7_b9ce_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1733_c7_b9ce_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1733_c7_b9ce_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1733_c7_b9ce_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1733_c7_b9ce
result_is_sp_shift_MUX_uxn_opcodes_h_l1733_c7_b9ce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1733_c7_b9ce_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1733_c7_b9ce_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1733_c7_b9ce_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1733_c7_b9ce_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_b9ce
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_b9ce : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_b9ce_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_b9ce_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_b9ce_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_b9ce_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_b9ce
result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_b9ce : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_b9ce_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_b9ce_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_b9ce_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_b9ce_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1733_c7_b9ce
result_stack_value_MUX_uxn_opcodes_h_l1733_c7_b9ce : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1733_c7_b9ce_cond,
result_stack_value_MUX_uxn_opcodes_h_l1733_c7_b9ce_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1733_c7_b9ce_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1733_c7_b9ce_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_b9ce
result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_b9ce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_b9ce_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_b9ce_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_b9ce_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_b9ce_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1733_c7_b9ce
result_ram_addr_MUX_uxn_opcodes_h_l1733_c7_b9ce : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1733_c7_b9ce_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1733_c7_b9ce_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1733_c7_b9ce_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1733_c7_b9ce_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1736_c11_a54c
BIN_OP_EQ_uxn_opcodes_h_l1736_c11_a54c : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1736_c11_a54c_left,
BIN_OP_EQ_uxn_opcodes_h_l1736_c11_a54c_right,
BIN_OP_EQ_uxn_opcodes_h_l1736_c11_a54c_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1736_c7_c400
tmp8_MUX_uxn_opcodes_h_l1736_c7_c400 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1736_c7_c400_cond,
tmp8_MUX_uxn_opcodes_h_l1736_c7_c400_iftrue,
tmp8_MUX_uxn_opcodes_h_l1736_c7_c400_iffalse,
tmp8_MUX_uxn_opcodes_h_l1736_c7_c400_return_output);

-- t8_MUX_uxn_opcodes_h_l1736_c7_c400
t8_MUX_uxn_opcodes_h_l1736_c7_c400 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1736_c7_c400_cond,
t8_MUX_uxn_opcodes_h_l1736_c7_c400_iftrue,
t8_MUX_uxn_opcodes_h_l1736_c7_c400_iffalse,
t8_MUX_uxn_opcodes_h_l1736_c7_c400_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1736_c7_c400
result_is_stack_write_MUX_uxn_opcodes_h_l1736_c7_c400 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1736_c7_c400_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1736_c7_c400_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1736_c7_c400_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1736_c7_c400_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c7_c400
result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c7_c400 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c7_c400_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c7_c400_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c7_c400_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c7_c400_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c7_c400
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c7_c400 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c7_c400_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c7_c400_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c7_c400_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c7_c400_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c7_c400
result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c7_c400 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c7_c400_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c7_c400_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c7_c400_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c7_c400_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1736_c7_c400
result_stack_value_MUX_uxn_opcodes_h_l1736_c7_c400 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1736_c7_c400_cond,
result_stack_value_MUX_uxn_opcodes_h_l1736_c7_c400_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1736_c7_c400_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1736_c7_c400_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1736_c7_c400
result_is_opc_done_MUX_uxn_opcodes_h_l1736_c7_c400 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1736_c7_c400_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1736_c7_c400_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1736_c7_c400_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1736_c7_c400_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1736_c7_c400
result_ram_addr_MUX_uxn_opcodes_h_l1736_c7_c400 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1736_c7_c400_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1736_c7_c400_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1736_c7_c400_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1736_c7_c400_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1739_c32_ef9f
BIN_OP_AND_uxn_opcodes_h_l1739_c32_ef9f : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1739_c32_ef9f_left,
BIN_OP_AND_uxn_opcodes_h_l1739_c32_ef9f_right,
BIN_OP_AND_uxn_opcodes_h_l1739_c32_ef9f_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1739_c32_7c65
BIN_OP_GT_uxn_opcodes_h_l1739_c32_7c65 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1739_c32_7c65_left,
BIN_OP_GT_uxn_opcodes_h_l1739_c32_7c65_right,
BIN_OP_GT_uxn_opcodes_h_l1739_c32_7c65_return_output);

-- MUX_uxn_opcodes_h_l1739_c32_b1f1
MUX_uxn_opcodes_h_l1739_c32_b1f1 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1739_c32_b1f1_cond,
MUX_uxn_opcodes_h_l1739_c32_b1f1_iftrue,
MUX_uxn_opcodes_h_l1739_c32_b1f1_iffalse,
MUX_uxn_opcodes_h_l1739_c32_b1f1_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1740_c21_5b3b
BIN_OP_PLUS_uxn_opcodes_h_l1740_c21_5b3b : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1740_c21_5b3b_left,
BIN_OP_PLUS_uxn_opcodes_h_l1740_c21_5b3b_right,
BIN_OP_PLUS_uxn_opcodes_h_l1740_c21_5b3b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1742_c11_1b77
BIN_OP_EQ_uxn_opcodes_h_l1742_c11_1b77 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1742_c11_1b77_left,
BIN_OP_EQ_uxn_opcodes_h_l1742_c11_1b77_right,
BIN_OP_EQ_uxn_opcodes_h_l1742_c11_1b77_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1742_c7_a48b
tmp8_MUX_uxn_opcodes_h_l1742_c7_a48b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1742_c7_a48b_cond,
tmp8_MUX_uxn_opcodes_h_l1742_c7_a48b_iftrue,
tmp8_MUX_uxn_opcodes_h_l1742_c7_a48b_iffalse,
tmp8_MUX_uxn_opcodes_h_l1742_c7_a48b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_a48b
result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_a48b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_a48b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_a48b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_a48b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_a48b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1742_c7_a48b
result_is_stack_write_MUX_uxn_opcodes_h_l1742_c7_a48b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1742_c7_a48b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1742_c7_a48b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1742_c7_a48b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1742_c7_a48b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1742_c7_a48b
result_is_sp_shift_MUX_uxn_opcodes_h_l1742_c7_a48b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1742_c7_a48b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1742_c7_a48b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1742_c7_a48b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1742_c7_a48b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1742_c7_a48b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1742_c7_a48b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1742_c7_a48b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1742_c7_a48b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1742_c7_a48b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1742_c7_a48b_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1742_c7_a48b
result_stack_value_MUX_uxn_opcodes_h_l1742_c7_a48b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1742_c7_a48b_cond,
result_stack_value_MUX_uxn_opcodes_h_l1742_c7_a48b_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1742_c7_a48b_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1742_c7_a48b_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1742_c7_a48b
result_ram_addr_MUX_uxn_opcodes_h_l1742_c7_a48b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1742_c7_a48b_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1742_c7_a48b_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1742_c7_a48b_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1742_c7_a48b_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1744_c21_b1bd
BIN_OP_PLUS_uxn_opcodes_h_l1744_c21_b1bd : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1744_c21_b1bd_left,
BIN_OP_PLUS_uxn_opcodes_h_l1744_c21_b1bd_right,
BIN_OP_PLUS_uxn_opcodes_h_l1744_c21_b1bd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1746_c11_2ef8
BIN_OP_EQ_uxn_opcodes_h_l1746_c11_2ef8 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1746_c11_2ef8_left,
BIN_OP_EQ_uxn_opcodes_h_l1746_c11_2ef8_right,
BIN_OP_EQ_uxn_opcodes_h_l1746_c11_2ef8_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1746_c7_4dc6
tmp8_MUX_uxn_opcodes_h_l1746_c7_4dc6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1746_c7_4dc6_cond,
tmp8_MUX_uxn_opcodes_h_l1746_c7_4dc6_iftrue,
tmp8_MUX_uxn_opcodes_h_l1746_c7_4dc6_iffalse,
tmp8_MUX_uxn_opcodes_h_l1746_c7_4dc6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1746_c7_4dc6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1746_c7_4dc6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1746_c7_4dc6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1746_c7_4dc6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1746_c7_4dc6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1746_c7_4dc6_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1746_c7_4dc6
result_stack_value_MUX_uxn_opcodes_h_l1746_c7_4dc6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1746_c7_4dc6_cond,
result_stack_value_MUX_uxn_opcodes_h_l1746_c7_4dc6_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1746_c7_4dc6_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1746_c7_4dc6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1746_c7_4dc6
result_is_opc_done_MUX_uxn_opcodes_h_l1746_c7_4dc6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1746_c7_4dc6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1746_c7_4dc6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1746_c7_4dc6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1746_c7_4dc6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1746_c7_4dc6
result_is_stack_write_MUX_uxn_opcodes_h_l1746_c7_4dc6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1746_c7_4dc6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1746_c7_4dc6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1746_c7_4dc6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1746_c7_4dc6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1752_c11_a3c4
BIN_OP_EQ_uxn_opcodes_h_l1752_c11_a3c4 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1752_c11_a3c4_left,
BIN_OP_EQ_uxn_opcodes_h_l1752_c11_a3c4_right,
BIN_OP_EQ_uxn_opcodes_h_l1752_c11_a3c4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1752_c7_2389
result_is_stack_write_MUX_uxn_opcodes_h_l1752_c7_2389 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1752_c7_2389_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1752_c7_2389_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1752_c7_2389_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1752_c7_2389_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1752_c7_2389
result_is_opc_done_MUX_uxn_opcodes_h_l1752_c7_2389 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1752_c7_2389_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1752_c7_2389_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1752_c7_2389_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1752_c7_2389_return_output);



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
 t8,
 tmp8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1728_c6_6cd4_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1728_c1_e91c_return_output,
 tmp8_MUX_uxn_opcodes_h_l1728_c2_1016_return_output,
 t8_MUX_uxn_opcodes_h_l1728_c2_1016_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1728_c2_1016_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1728_c2_1016_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1728_c2_1016_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1728_c2_1016_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1728_c2_1016_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1728_c2_1016_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1728_c2_1016_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1733_c11_5e64_return_output,
 tmp8_MUX_uxn_opcodes_h_l1733_c7_b9ce_return_output,
 t8_MUX_uxn_opcodes_h_l1733_c7_b9ce_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1733_c7_b9ce_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1733_c7_b9ce_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_b9ce_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_b9ce_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1733_c7_b9ce_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_b9ce_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1733_c7_b9ce_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1736_c11_a54c_return_output,
 tmp8_MUX_uxn_opcodes_h_l1736_c7_c400_return_output,
 t8_MUX_uxn_opcodes_h_l1736_c7_c400_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1736_c7_c400_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c7_c400_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c7_c400_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c7_c400_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1736_c7_c400_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1736_c7_c400_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1736_c7_c400_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1739_c32_ef9f_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1739_c32_7c65_return_output,
 MUX_uxn_opcodes_h_l1739_c32_b1f1_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1740_c21_5b3b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1742_c11_1b77_return_output,
 tmp8_MUX_uxn_opcodes_h_l1742_c7_a48b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_a48b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1742_c7_a48b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1742_c7_a48b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1742_c7_a48b_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1742_c7_a48b_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1742_c7_a48b_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1744_c21_b1bd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1746_c11_2ef8_return_output,
 tmp8_MUX_uxn_opcodes_h_l1746_c7_4dc6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1746_c7_4dc6_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1746_c7_4dc6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1746_c7_4dc6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1746_c7_4dc6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1752_c11_a3c4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1752_c7_2389_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1752_c7_2389_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1728_c6_6cd4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1728_c6_6cd4_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1728_c6_6cd4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1728_c1_e91c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1728_c1_e91c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1728_c1_e91c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1728_c1_e91c_iffalse : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1728_c2_1016_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1728_c2_1016_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1733_c7_b9ce_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1728_c2_1016_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1728_c2_1016_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1728_c2_1016_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1728_c2_1016_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1733_c7_b9ce_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1728_c2_1016_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1728_c2_1016_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1728_c2_1016_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1728_c2_1016_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1733_c7_b9ce_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1728_c2_1016_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1728_c2_1016_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1728_c2_1016_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1728_c2_1016_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1733_c7_b9ce_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1728_c2_1016_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1728_c2_1016_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1728_c2_1016_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1730_c3_996e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1728_c2_1016_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_b9ce_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1728_c2_1016_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1728_c2_1016_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1728_c2_1016_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1728_c2_1016_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_b9ce_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1728_c2_1016_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1728_c2_1016_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1728_c2_1016_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1728_c2_1016_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1733_c7_b9ce_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1728_c2_1016_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1728_c2_1016_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1728_c2_1016_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1728_c2_1016_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_b9ce_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1728_c2_1016_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1728_c2_1016_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1728_c2_1016_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1728_c2_1016_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1733_c7_b9ce_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1728_c2_1016_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1728_c2_1016_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1729_c3_e792_uxn_opcodes_h_l1729_c3_e792_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1733_c11_5e64_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1733_c11_5e64_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1733_c11_5e64_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1733_c7_b9ce_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1733_c7_b9ce_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1736_c7_c400_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1733_c7_b9ce_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1733_c7_b9ce_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1733_c7_b9ce_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1736_c7_c400_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1733_c7_b9ce_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1733_c7_b9ce_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1733_c7_b9ce_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1736_c7_c400_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1733_c7_b9ce_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1733_c7_b9ce_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1733_c7_b9ce_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c7_c400_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1733_c7_b9ce_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_b9ce_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1734_c3_8f1f : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_b9ce_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c7_c400_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_b9ce_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_b9ce_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_b9ce_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c7_c400_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_b9ce_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1733_c7_b9ce_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1733_c7_b9ce_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1736_c7_c400_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1733_c7_b9ce_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_b9ce_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_b9ce_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1736_c7_c400_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_b9ce_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1733_c7_b9ce_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1733_c7_b9ce_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1736_c7_c400_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1733_c7_b9ce_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1736_c11_a54c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1736_c11_a54c_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1736_c11_a54c_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1736_c7_c400_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1736_c7_c400_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1742_c7_a48b_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1736_c7_c400_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1736_c7_c400_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1736_c7_c400_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1736_c7_c400_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1736_c7_c400_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1736_c7_c400_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1742_c7_a48b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1736_c7_c400_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c7_c400_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c7_c400_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1742_c7_a48b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c7_c400_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c7_c400_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c7_c400_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1742_c7_a48b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c7_c400_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c7_c400_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c7_c400_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c7_c400_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1736_c7_c400_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1736_c7_c400_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1742_c7_a48b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1736_c7_c400_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1736_c7_c400_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1736_c7_c400_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_a48b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1736_c7_c400_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1736_c7_c400_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l1740_c3_c946 : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1736_c7_c400_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1742_c7_a48b_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1736_c7_c400_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1739_c32_b1f1_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1739_c32_b1f1_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1739_c32_b1f1_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1739_c32_ef9f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1739_c32_ef9f_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1739_c32_ef9f_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1739_c32_7c65_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1739_c32_7c65_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1739_c32_7c65_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1739_c32_b1f1_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1740_c21_5b3b_left : signed(16 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l1740_c26_77e0_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1740_c21_5b3b_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1740_c21_5b3b_return_output : signed(17 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1742_c11_1b77_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1742_c11_1b77_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1742_c11_1b77_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1742_c7_a48b_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1742_c7_a48b_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1746_c7_4dc6_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1742_c7_a48b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_a48b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_a48b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1746_c7_4dc6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_a48b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1742_c7_a48b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1742_c7_a48b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1746_c7_4dc6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1742_c7_a48b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1742_c7_a48b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1742_c7_a48b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1742_c7_a48b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1742_c7_a48b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1742_c7_a48b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1746_c7_4dc6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1742_c7_a48b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1742_c7_a48b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1742_c7_a48b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1746_c7_4dc6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1742_c7_a48b_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1742_c7_a48b_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l1744_c3_060c : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1742_c7_a48b_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1742_c7_a48b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1744_c21_b1bd_left : signed(16 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l1744_c26_6a8e_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1744_c21_b1bd_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1744_c21_b1bd_return_output : signed(17 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1746_c11_2ef8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1746_c11_2ef8_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1746_c11_2ef8_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1746_c7_4dc6_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1746_c7_4dc6_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1746_c7_4dc6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1746_c7_4dc6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1749_c3_c25e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1746_c7_4dc6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1746_c7_4dc6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1746_c7_4dc6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1746_c7_4dc6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1746_c7_4dc6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1746_c7_4dc6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1746_c7_4dc6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1752_c7_2389_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1746_c7_4dc6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1746_c7_4dc6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1746_c7_4dc6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1752_c7_2389_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1746_c7_4dc6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1752_c11_a3c4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1752_c11_a3c4_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1752_c11_a3c4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1752_c7_2389_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1752_c7_2389_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1752_c7_2389_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1752_c7_2389_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1752_c7_2389_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1752_c7_2389_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1736_l1733_l1728_l1752_l1742_DUPLICATE_07e0_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1728_l1742_l1733_DUPLICATE_83e2_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1736_l1728_l1733_DUPLICATE_2c63_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1736_l1733_l1728_l1746_l1742_DUPLICATE_6341_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1728_l1742_l1733_DUPLICATE_b277_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1736_l1733_l1752_l1746_l1742_DUPLICATE_e76f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1736_l1742_l1746_DUPLICATE_f380_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5b20_uxn_opcodes_h_l1757_l1724_DUPLICATE_9840_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_tmp8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_tmp8 := tmp8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_GT_uxn_opcodes_h_l1739_c32_7c65_right := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1752_c7_2389_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1752_c7_2389_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1728_c2_1016_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1734_c3_8f1f := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_b9ce_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1734_c3_8f1f;
     VAR_MUX_uxn_opcodes_h_l1739_c32_b1f1_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1730_c3_996e := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1728_c2_1016_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1730_c3_996e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1752_c11_a3c4_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1746_c11_2ef8_right := to_unsigned(3, 2);
     VAR_MUX_uxn_opcodes_h_l1739_c32_b1f1_iffalse := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1749_c3_c25e := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1746_c7_4dc6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1749_c3_c25e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1733_c11_5e64_right := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c7_c400_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1728_c6_6cd4_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1736_c11_a54c_right := to_unsigned(2, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1742_c7_a48b_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1739_c32_ef9f_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1742_c11_1b77_right := to_unsigned(3, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1746_c7_4dc6_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1728_c1_e91c_iffalse := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1728_c1_e91c_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1739_c32_ef9f_left := VAR_ins;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1740_c21_5b3b_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1744_c21_b1bd_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1728_c6_6cd4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1733_c11_5e64_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1736_c11_a54c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1742_c11_1b77_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1746_c11_2ef8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1752_c11_a3c4_left := VAR_phase;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1746_c7_4dc6_iftrue := VAR_previous_ram_read;
     VAR_tmp8_MUX_uxn_opcodes_h_l1746_c7_4dc6_iftrue := VAR_previous_ram_read;
     VAR_t8_MUX_uxn_opcodes_h_l1736_c7_c400_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1728_c2_1016_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1733_c7_b9ce_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1736_c7_c400_iffalse := t8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1728_c2_1016_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1733_c7_b9ce_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1736_c7_c400_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1742_c7_a48b_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1746_c7_4dc6_iffalse := tmp8;
     -- BIN_OP_EQ[uxn_opcodes_h_l1736_c11_a54c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1736_c11_a54c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1736_c11_a54c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1736_c11_a54c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1736_c11_a54c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1736_c11_a54c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1736_c11_a54c_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1736_l1742_l1746_DUPLICATE_f380 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1736_l1742_l1746_DUPLICATE_f380_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1736_l1733_l1728_l1746_l1742_DUPLICATE_6341 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1736_l1733_l1728_l1746_l1742_DUPLICATE_6341_return_output := result.stack_value;

     -- CAST_TO_int8_t[uxn_opcodes_h_l1744_c26_6a8e] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l1744_c26_6a8e_return_output := CAST_TO_int8_t_uint8_t(
     t8);

     -- BIN_OP_AND[uxn_opcodes_h_l1739_c32_ef9f] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1739_c32_ef9f_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1739_c32_ef9f_left;
     BIN_OP_AND_uxn_opcodes_h_l1739_c32_ef9f_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1739_c32_ef9f_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1739_c32_ef9f_return_output := BIN_OP_AND_uxn_opcodes_h_l1739_c32_ef9f_return_output;

     -- CAST_TO_int8_t[uxn_opcodes_h_l1740_c26_77e0] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l1740_c26_77e0_return_output := CAST_TO_int8_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1728_l1742_l1733_DUPLICATE_b277 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1728_l1742_l1733_DUPLICATE_b277_return_output := result.ram_addr;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1728_l1742_l1733_DUPLICATE_83e2 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1728_l1742_l1733_DUPLICATE_83e2_return_output := result.is_sp_shift;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1736_l1728_l1733_DUPLICATE_2c63 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1736_l1728_l1733_DUPLICATE_2c63_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1733_c11_5e64] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1733_c11_5e64_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1733_c11_5e64_left;
     BIN_OP_EQ_uxn_opcodes_h_l1733_c11_5e64_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1733_c11_5e64_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1733_c11_5e64_return_output := BIN_OP_EQ_uxn_opcodes_h_l1733_c11_5e64_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1752_c11_a3c4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1752_c11_a3c4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1752_c11_a3c4_left;
     BIN_OP_EQ_uxn_opcodes_h_l1752_c11_a3c4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1752_c11_a3c4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1752_c11_a3c4_return_output := BIN_OP_EQ_uxn_opcodes_h_l1752_c11_a3c4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1728_c6_6cd4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1728_c6_6cd4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1728_c6_6cd4_left;
     BIN_OP_EQ_uxn_opcodes_h_l1728_c6_6cd4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1728_c6_6cd4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1728_c6_6cd4_return_output := BIN_OP_EQ_uxn_opcodes_h_l1728_c6_6cd4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1746_c11_2ef8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1746_c11_2ef8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1746_c11_2ef8_left;
     BIN_OP_EQ_uxn_opcodes_h_l1746_c11_2ef8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1746_c11_2ef8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1746_c11_2ef8_return_output := BIN_OP_EQ_uxn_opcodes_h_l1746_c11_2ef8_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1736_l1733_l1728_l1752_l1742_DUPLICATE_07e0 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1736_l1733_l1728_l1752_l1742_DUPLICATE_07e0_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1736_l1733_l1752_l1746_l1742_DUPLICATE_e76f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1736_l1733_l1752_l1746_l1742_DUPLICATE_e76f_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1742_c11_1b77] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1742_c11_1b77_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1742_c11_1b77_left;
     BIN_OP_EQ_uxn_opcodes_h_l1742_c11_1b77_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1742_c11_1b77_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1742_c11_1b77_return_output := BIN_OP_EQ_uxn_opcodes_h_l1742_c11_1b77_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1739_c32_7c65_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1739_c32_ef9f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1728_c1_e91c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1728_c6_6cd4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1728_c2_1016_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1728_c6_6cd4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1728_c2_1016_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1728_c6_6cd4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1728_c2_1016_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1728_c6_6cd4_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1728_c2_1016_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1728_c6_6cd4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1728_c2_1016_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1728_c6_6cd4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1728_c2_1016_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1728_c6_6cd4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1728_c2_1016_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1728_c6_6cd4_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1728_c2_1016_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1728_c6_6cd4_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1728_c2_1016_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1728_c6_6cd4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_b9ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1733_c11_5e64_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1733_c7_b9ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1733_c11_5e64_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1733_c7_b9ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1733_c11_5e64_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1733_c7_b9ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1733_c11_5e64_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_b9ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1733_c11_5e64_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_b9ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1733_c11_5e64_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1733_c7_b9ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1733_c11_5e64_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1733_c7_b9ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1733_c11_5e64_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1733_c7_b9ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1733_c11_5e64_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1736_c7_c400_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1736_c11_a54c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c7_c400_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1736_c11_a54c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1736_c7_c400_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1736_c11_a54c_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1736_c7_c400_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1736_c11_a54c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c7_c400_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1736_c11_a54c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c7_c400_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1736_c11_a54c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1736_c7_c400_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1736_c11_a54c_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1736_c7_c400_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1736_c11_a54c_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1736_c7_c400_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1736_c11_a54c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_a48b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1742_c11_1b77_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1742_c7_a48b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1742_c11_1b77_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1742_c7_a48b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1742_c11_1b77_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1742_c7_a48b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1742_c11_1b77_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1742_c7_a48b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1742_c11_1b77_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1742_c7_a48b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1742_c11_1b77_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1742_c7_a48b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1742_c11_1b77_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1746_c7_4dc6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1746_c11_2ef8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1746_c7_4dc6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1746_c11_2ef8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1746_c7_4dc6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1746_c11_2ef8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1746_c7_4dc6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1746_c11_2ef8_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1746_c7_4dc6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1746_c11_2ef8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1752_c7_2389_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1752_c11_a3c4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1752_c7_2389_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1752_c11_a3c4_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1740_c21_5b3b_right := VAR_CAST_TO_int8_t_uxn_opcodes_h_l1740_c26_77e0_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1744_c21_b1bd_right := VAR_CAST_TO_int8_t_uxn_opcodes_h_l1744_c26_6a8e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1728_c2_1016_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1736_l1728_l1733_DUPLICATE_2c63_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_b9ce_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1736_l1728_l1733_DUPLICATE_2c63_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c7_c400_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1736_l1728_l1733_DUPLICATE_2c63_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1728_c2_1016_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1728_l1742_l1733_DUPLICATE_b277_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1733_c7_b9ce_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1728_l1742_l1733_DUPLICATE_b277_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1742_c7_a48b_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1728_l1742_l1733_DUPLICATE_b277_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_b9ce_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1736_l1733_l1752_l1746_l1742_DUPLICATE_e76f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1736_c7_c400_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1736_l1733_l1752_l1746_l1742_DUPLICATE_e76f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_a48b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1736_l1733_l1752_l1746_l1742_DUPLICATE_e76f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1746_c7_4dc6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1736_l1733_l1752_l1746_l1742_DUPLICATE_e76f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1752_c7_2389_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1736_l1733_l1752_l1746_l1742_DUPLICATE_e76f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1728_c2_1016_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1728_l1742_l1733_DUPLICATE_83e2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1733_c7_b9ce_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1728_l1742_l1733_DUPLICATE_83e2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1742_c7_a48b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1728_l1742_l1733_DUPLICATE_83e2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1728_c2_1016_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1736_l1733_l1728_l1752_l1742_DUPLICATE_07e0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1733_c7_b9ce_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1736_l1733_l1728_l1752_l1742_DUPLICATE_07e0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1736_c7_c400_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1736_l1733_l1728_l1752_l1742_DUPLICATE_07e0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1742_c7_a48b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1736_l1733_l1728_l1752_l1742_DUPLICATE_07e0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1752_c7_2389_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1736_l1733_l1728_l1752_l1742_DUPLICATE_07e0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c7_c400_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1736_l1742_l1746_DUPLICATE_f380_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1742_c7_a48b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1736_l1742_l1746_DUPLICATE_f380_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1746_c7_4dc6_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1736_l1742_l1746_DUPLICATE_f380_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1728_c2_1016_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1736_l1733_l1728_l1746_l1742_DUPLICATE_6341_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1733_c7_b9ce_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1736_l1733_l1728_l1746_l1742_DUPLICATE_6341_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1736_c7_c400_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1736_l1733_l1728_l1746_l1742_DUPLICATE_6341_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1742_c7_a48b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1736_l1733_l1728_l1746_l1742_DUPLICATE_6341_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1746_c7_4dc6_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1736_l1733_l1728_l1746_l1742_DUPLICATE_6341_return_output;
     -- t8_MUX[uxn_opcodes_h_l1736_c7_c400] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1736_c7_c400_cond <= VAR_t8_MUX_uxn_opcodes_h_l1736_c7_c400_cond;
     t8_MUX_uxn_opcodes_h_l1736_c7_c400_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1736_c7_c400_iftrue;
     t8_MUX_uxn_opcodes_h_l1736_c7_c400_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1736_c7_c400_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1736_c7_c400_return_output := t8_MUX_uxn_opcodes_h_l1736_c7_c400_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1746_c7_4dc6] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1746_c7_4dc6_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1746_c7_4dc6_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1746_c7_4dc6_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1746_c7_4dc6_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1746_c7_4dc6_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1746_c7_4dc6_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1746_c7_4dc6_return_output := result_stack_value_MUX_uxn_opcodes_h_l1746_c7_4dc6_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1728_c1_e91c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1728_c1_e91c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1728_c1_e91c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1728_c1_e91c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1728_c1_e91c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1728_c1_e91c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1728_c1_e91c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1728_c1_e91c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1728_c1_e91c_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1739_c32_7c65] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1739_c32_7c65_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1739_c32_7c65_left;
     BIN_OP_GT_uxn_opcodes_h_l1739_c32_7c65_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1739_c32_7c65_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1739_c32_7c65_return_output := BIN_OP_GT_uxn_opcodes_h_l1739_c32_7c65_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1746_c7_4dc6] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1746_c7_4dc6_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1746_c7_4dc6_cond;
     tmp8_MUX_uxn_opcodes_h_l1746_c7_4dc6_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1746_c7_4dc6_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1746_c7_4dc6_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1746_c7_4dc6_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1746_c7_4dc6_return_output := tmp8_MUX_uxn_opcodes_h_l1746_c7_4dc6_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1740_c21_5b3b] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1740_c21_5b3b_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1740_c21_5b3b_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1740_c21_5b3b_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1740_c21_5b3b_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1740_c21_5b3b_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1740_c21_5b3b_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1744_c21_b1bd] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1744_c21_b1bd_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1744_c21_b1bd_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1744_c21_b1bd_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1744_c21_b1bd_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1744_c21_b1bd_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1744_c21_b1bd_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1752_c7_2389] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1752_c7_2389_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1752_c7_2389_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1752_c7_2389_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1752_c7_2389_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1752_c7_2389_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1752_c7_2389_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1752_c7_2389_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1752_c7_2389_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1746_c7_4dc6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1746_c7_4dc6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1746_c7_4dc6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1746_c7_4dc6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1746_c7_4dc6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1746_c7_4dc6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1746_c7_4dc6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1746_c7_4dc6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1746_c7_4dc6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1752_c7_2389] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1752_c7_2389_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1752_c7_2389_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1752_c7_2389_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1752_c7_2389_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1752_c7_2389_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1752_c7_2389_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1752_c7_2389_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1752_c7_2389_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1742_c7_a48b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1742_c7_a48b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1742_c7_a48b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1742_c7_a48b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1742_c7_a48b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1742_c7_a48b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1742_c7_a48b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1742_c7_a48b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1742_c7_a48b_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1739_c32_b1f1_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1739_c32_7c65_return_output;
     VAR_result_ram_addr_uxn_opcodes_h_l1740_c3_c946 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1740_c21_5b3b_return_output)),16);
     VAR_result_ram_addr_uxn_opcodes_h_l1744_c3_060c := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1744_c21_b1bd_return_output)),16);
     VAR_printf_uxn_opcodes_h_l1729_c3_e792_uxn_opcodes_h_l1729_c3_e792_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1728_c1_e91c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1746_c7_4dc6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1752_c7_2389_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c7_c400_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1742_c7_a48b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1746_c7_4dc6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1752_c7_2389_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1742_c7_a48b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1746_c7_4dc6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1742_c7_a48b_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1746_c7_4dc6_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1733_c7_b9ce_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1736_c7_c400_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1742_c7_a48b_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1746_c7_4dc6_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1736_c7_c400_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l1740_c3_c946;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1742_c7_a48b_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l1744_c3_060c;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1742_c7_a48b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1742_c7_a48b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1742_c7_a48b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1742_c7_a48b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1742_c7_a48b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1742_c7_a48b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1742_c7_a48b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1742_c7_a48b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1742_c7_a48b_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1742_c7_a48b] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1742_c7_a48b_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1742_c7_a48b_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1742_c7_a48b_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1742_c7_a48b_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1742_c7_a48b_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1742_c7_a48b_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1742_c7_a48b_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1742_c7_a48b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1736_c7_c400] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c7_c400_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c7_c400_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c7_c400_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c7_c400_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c7_c400_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c7_c400_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c7_c400_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c7_c400_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1742_c7_a48b] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1742_c7_a48b_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1742_c7_a48b_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1742_c7_a48b_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1742_c7_a48b_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1742_c7_a48b_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1742_c7_a48b_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1742_c7_a48b_return_output := result_stack_value_MUX_uxn_opcodes_h_l1742_c7_a48b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1746_c7_4dc6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1746_c7_4dc6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1746_c7_4dc6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1746_c7_4dc6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1746_c7_4dc6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1746_c7_4dc6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1746_c7_4dc6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1746_c7_4dc6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1746_c7_4dc6_return_output;

     -- MUX[uxn_opcodes_h_l1739_c32_b1f1] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1739_c32_b1f1_cond <= VAR_MUX_uxn_opcodes_h_l1739_c32_b1f1_cond;
     MUX_uxn_opcodes_h_l1739_c32_b1f1_iftrue <= VAR_MUX_uxn_opcodes_h_l1739_c32_b1f1_iftrue;
     MUX_uxn_opcodes_h_l1739_c32_b1f1_iffalse <= VAR_MUX_uxn_opcodes_h_l1739_c32_b1f1_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1739_c32_b1f1_return_output := MUX_uxn_opcodes_h_l1739_c32_b1f1_return_output;

     -- printf_uxn_opcodes_h_l1729_c3_e792[uxn_opcodes_h_l1729_c3_e792] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1729_c3_e792_uxn_opcodes_h_l1729_c3_e792_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1729_c3_e792_uxn_opcodes_h_l1729_c3_e792_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- t8_MUX[uxn_opcodes_h_l1733_c7_b9ce] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1733_c7_b9ce_cond <= VAR_t8_MUX_uxn_opcodes_h_l1733_c7_b9ce_cond;
     t8_MUX_uxn_opcodes_h_l1733_c7_b9ce_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1733_c7_b9ce_iftrue;
     t8_MUX_uxn_opcodes_h_l1733_c7_b9ce_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1733_c7_b9ce_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1733_c7_b9ce_return_output := t8_MUX_uxn_opcodes_h_l1733_c7_b9ce_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1746_c7_4dc6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1746_c7_4dc6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1746_c7_4dc6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1746_c7_4dc6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1746_c7_4dc6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1746_c7_4dc6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1746_c7_4dc6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1746_c7_4dc6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1746_c7_4dc6_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1742_c7_a48b] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1742_c7_a48b_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1742_c7_a48b_cond;
     tmp8_MUX_uxn_opcodes_h_l1742_c7_a48b_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1742_c7_a48b_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1742_c7_a48b_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1742_c7_a48b_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1742_c7_a48b_return_output := tmp8_MUX_uxn_opcodes_h_l1742_c7_a48b_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c7_c400_iftrue := VAR_MUX_uxn_opcodes_h_l1739_c32_b1f1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_a48b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1746_c7_4dc6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1733_c7_b9ce_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c7_c400_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1742_c7_a48b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1746_c7_4dc6_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1736_c7_c400_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1742_c7_a48b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c7_c400_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1742_c7_a48b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1736_c7_c400_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1742_c7_a48b_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1728_c2_1016_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1733_c7_b9ce_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1736_c7_c400_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1742_c7_a48b_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1733_c7_b9ce] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1733_c7_b9ce_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1733_c7_b9ce_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1733_c7_b9ce_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1733_c7_b9ce_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1733_c7_b9ce_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1733_c7_b9ce_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1733_c7_b9ce_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1733_c7_b9ce_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1742_c7_a48b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1742_c7_a48b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1742_c7_a48b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1742_c7_a48b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1742_c7_a48b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1742_c7_a48b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1742_c7_a48b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1742_c7_a48b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1742_c7_a48b_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1736_c7_c400] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1736_c7_c400_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1736_c7_c400_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1736_c7_c400_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1736_c7_c400_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1736_c7_c400_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1736_c7_c400_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1736_c7_c400_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1736_c7_c400_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1736_c7_c400] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c7_c400_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c7_c400_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c7_c400_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c7_c400_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c7_c400_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c7_c400_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c7_c400_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c7_c400_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1742_c7_a48b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_a48b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_a48b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_a48b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_a48b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_a48b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_a48b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_a48b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_a48b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1736_c7_c400] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c7_c400_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c7_c400_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c7_c400_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c7_c400_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c7_c400_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c7_c400_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c7_c400_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c7_c400_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1736_c7_c400] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1736_c7_c400_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1736_c7_c400_cond;
     tmp8_MUX_uxn_opcodes_h_l1736_c7_c400_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1736_c7_c400_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1736_c7_c400_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1736_c7_c400_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1736_c7_c400_return_output := tmp8_MUX_uxn_opcodes_h_l1736_c7_c400_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1736_c7_c400] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1736_c7_c400_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1736_c7_c400_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1736_c7_c400_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1736_c7_c400_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1736_c7_c400_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1736_c7_c400_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1736_c7_c400_return_output := result_stack_value_MUX_uxn_opcodes_h_l1736_c7_c400_return_output;

     -- t8_MUX[uxn_opcodes_h_l1728_c2_1016] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1728_c2_1016_cond <= VAR_t8_MUX_uxn_opcodes_h_l1728_c2_1016_cond;
     t8_MUX_uxn_opcodes_h_l1728_c2_1016_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1728_c2_1016_iftrue;
     t8_MUX_uxn_opcodes_h_l1728_c2_1016_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1728_c2_1016_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1728_c2_1016_return_output := t8_MUX_uxn_opcodes_h_l1728_c2_1016_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1736_c7_c400_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_a48b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1728_c2_1016_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1733_c7_b9ce_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1736_c7_c400_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1742_c7_a48b_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1733_c7_b9ce_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1736_c7_c400_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_b9ce_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c7_c400_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_b9ce_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c7_c400_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1733_c7_b9ce_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1736_c7_c400_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1728_c2_1016_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1733_c7_b9ce_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1736_c7_c400_return_output;
     -- result_ram_addr_MUX[uxn_opcodes_h_l1733_c7_b9ce] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1733_c7_b9ce_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1733_c7_b9ce_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1733_c7_b9ce_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1733_c7_b9ce_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1733_c7_b9ce_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1733_c7_b9ce_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1733_c7_b9ce_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1733_c7_b9ce_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1728_c2_1016] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1728_c2_1016_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1728_c2_1016_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1728_c2_1016_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1728_c2_1016_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1728_c2_1016_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1728_c2_1016_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1728_c2_1016_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1728_c2_1016_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1736_c7_c400] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1736_c7_c400_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1736_c7_c400_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1736_c7_c400_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1736_c7_c400_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1736_c7_c400_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1736_c7_c400_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1736_c7_c400_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1736_c7_c400_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1733_c7_b9ce] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_b9ce_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_b9ce_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_b9ce_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_b9ce_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_b9ce_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_b9ce_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_b9ce_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_b9ce_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1733_c7_b9ce] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_b9ce_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_b9ce_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_b9ce_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_b9ce_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_b9ce_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_b9ce_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_b9ce_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_b9ce_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1736_c7_c400] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1736_c7_c400_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1736_c7_c400_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1736_c7_c400_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1736_c7_c400_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1736_c7_c400_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1736_c7_c400_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1736_c7_c400_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1736_c7_c400_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1733_c7_b9ce] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1733_c7_b9ce_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1733_c7_b9ce_cond;
     tmp8_MUX_uxn_opcodes_h_l1733_c7_b9ce_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1733_c7_b9ce_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1733_c7_b9ce_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1733_c7_b9ce_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1733_c7_b9ce_return_output := tmp8_MUX_uxn_opcodes_h_l1733_c7_b9ce_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1733_c7_b9ce] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1733_c7_b9ce_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1733_c7_b9ce_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1733_c7_b9ce_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1733_c7_b9ce_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1733_c7_b9ce_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1733_c7_b9ce_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1733_c7_b9ce_return_output := result_stack_value_MUX_uxn_opcodes_h_l1733_c7_b9ce_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_b9ce_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1736_c7_c400_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1733_c7_b9ce_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1736_c7_c400_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1728_c2_1016_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1733_c7_b9ce_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1728_c2_1016_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_b9ce_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1728_c2_1016_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_b9ce_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1728_c2_1016_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1733_c7_b9ce_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1728_c2_1016_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1733_c7_b9ce_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1728_c2_1016] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1728_c2_1016_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1728_c2_1016_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1728_c2_1016_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1728_c2_1016_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1728_c2_1016_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1728_c2_1016_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1728_c2_1016_return_output := result_stack_value_MUX_uxn_opcodes_h_l1728_c2_1016_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1728_c2_1016] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1728_c2_1016_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1728_c2_1016_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1728_c2_1016_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1728_c2_1016_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1728_c2_1016_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1728_c2_1016_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1728_c2_1016_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1728_c2_1016_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1728_c2_1016] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1728_c2_1016_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1728_c2_1016_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1728_c2_1016_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1728_c2_1016_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1728_c2_1016_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1728_c2_1016_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1728_c2_1016_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1728_c2_1016_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1733_c7_b9ce] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1733_c7_b9ce_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1733_c7_b9ce_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1733_c7_b9ce_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1733_c7_b9ce_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1733_c7_b9ce_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1733_c7_b9ce_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1733_c7_b9ce_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1733_c7_b9ce_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1728_c2_1016] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1728_c2_1016_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1728_c2_1016_cond;
     tmp8_MUX_uxn_opcodes_h_l1728_c2_1016_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1728_c2_1016_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1728_c2_1016_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1728_c2_1016_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1728_c2_1016_return_output := tmp8_MUX_uxn_opcodes_h_l1728_c2_1016_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1728_c2_1016] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1728_c2_1016_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1728_c2_1016_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1728_c2_1016_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1728_c2_1016_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1728_c2_1016_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1728_c2_1016_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1728_c2_1016_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1728_c2_1016_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1733_c7_b9ce] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_b9ce_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_b9ce_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_b9ce_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_b9ce_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_b9ce_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_b9ce_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_b9ce_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_b9ce_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1728_c2_1016_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_b9ce_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1728_c2_1016_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1733_c7_b9ce_return_output;
     REG_VAR_tmp8 := VAR_tmp8_MUX_uxn_opcodes_h_l1728_c2_1016_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1728_c2_1016] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1728_c2_1016_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1728_c2_1016_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1728_c2_1016_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1728_c2_1016_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1728_c2_1016_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1728_c2_1016_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1728_c2_1016_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1728_c2_1016_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1728_c2_1016] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1728_c2_1016_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1728_c2_1016_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1728_c2_1016_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1728_c2_1016_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1728_c2_1016_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1728_c2_1016_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1728_c2_1016_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1728_c2_1016_return_output;

     -- Submodule level 7
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_5b20_uxn_opcodes_h_l1757_l1724_DUPLICATE_9840 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5b20_uxn_opcodes_h_l1757_l1724_DUPLICATE_9840_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_5b20(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1728_c2_1016_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1728_c2_1016_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1728_c2_1016_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1728_c2_1016_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1728_c2_1016_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1728_c2_1016_return_output,
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1728_c2_1016_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5b20_uxn_opcodes_h_l1757_l1724_DUPLICATE_9840_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5b20_uxn_opcodes_h_l1757_l1724_DUPLICATE_9840_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_tmp8 <= REG_VAR_tmp8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     tmp8 <= REG_COMB_tmp8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
