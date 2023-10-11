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
-- Submodules: 84
entity ldr2_0CLK_77d0ca3d is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end ldr2_0CLK_77d0ca3d;
architecture arch of ldr2_0CLK_77d0ca3d is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal tmp16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_tmp16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1761_c6_ec2f]
signal BIN_OP_EQ_uxn_opcodes_h_l1761_c6_ec2f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1761_c6_ec2f_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1761_c6_ec2f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1761_c1_592c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1761_c1_592c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1761_c1_592c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1761_c1_592c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1761_c1_592c_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1761_c2_1f2c]
signal t8_MUX_uxn_opcodes_h_l1761_c2_1f2c_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1761_c2_1f2c_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1761_c2_1f2c_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1761_c2_1f2c_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1761_c2_1f2c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1761_c2_1f2c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1761_c2_1f2c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1761_c2_1f2c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1761_c2_1f2c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1761_c2_1f2c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c2_1f2c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c2_1f2c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c2_1f2c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c2_1f2c_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1761_c2_1f2c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c2_1f2c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c2_1f2c_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c2_1f2c_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c2_1f2c_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1761_c2_1f2c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1761_c2_1f2c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1761_c2_1f2c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1761_c2_1f2c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1761_c2_1f2c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1761_c2_1f2c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1761_c2_1f2c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1761_c2_1f2c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1761_c2_1f2c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1761_c2_1f2c_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1761_c2_1f2c]
signal result_ram_addr_MUX_uxn_opcodes_h_l1761_c2_1f2c_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1761_c2_1f2c_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1761_c2_1f2c_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1761_c2_1f2c_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1761_c2_1f2c]
signal result_stack_value_MUX_uxn_opcodes_h_l1761_c2_1f2c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1761_c2_1f2c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1761_c2_1f2c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1761_c2_1f2c_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1761_c2_1f2c]
signal tmp16_MUX_uxn_opcodes_h_l1761_c2_1f2c_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1761_c2_1f2c_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1761_c2_1f2c_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1761_c2_1f2c_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l1762_c3_2eae[uxn_opcodes_h_l1762_c3_2eae]
signal printf_uxn_opcodes_h_l1762_c3_2eae_uxn_opcodes_h_l1762_c3_2eae_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1766_c11_06bc]
signal BIN_OP_EQ_uxn_opcodes_h_l1766_c11_06bc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1766_c11_06bc_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1766_c11_06bc_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1766_c7_36c5]
signal t8_MUX_uxn_opcodes_h_l1766_c7_36c5_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1766_c7_36c5_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1766_c7_36c5_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1766_c7_36c5_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1766_c7_36c5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_36c5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_36c5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_36c5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_36c5_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1766_c7_36c5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_36c5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_36c5_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_36c5_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_36c5_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1766_c7_36c5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_36c5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_36c5_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_36c5_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_36c5_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1766_c7_36c5]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_36c5_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_36c5_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_36c5_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_36c5_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1766_c7_36c5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_36c5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_36c5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_36c5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_36c5_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1766_c7_36c5]
signal result_ram_addr_MUX_uxn_opcodes_h_l1766_c7_36c5_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1766_c7_36c5_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1766_c7_36c5_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1766_c7_36c5_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1766_c7_36c5]
signal result_stack_value_MUX_uxn_opcodes_h_l1766_c7_36c5_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1766_c7_36c5_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1766_c7_36c5_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1766_c7_36c5_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1766_c7_36c5]
signal tmp16_MUX_uxn_opcodes_h_l1766_c7_36c5_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1766_c7_36c5_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1766_c7_36c5_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1766_c7_36c5_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1769_c11_b737]
signal BIN_OP_EQ_uxn_opcodes_h_l1769_c11_b737_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1769_c11_b737_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1769_c11_b737_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1769_c7_a0a6]
signal t8_MUX_uxn_opcodes_h_l1769_c7_a0a6_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1769_c7_a0a6_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1769_c7_a0a6_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1769_c7_a0a6_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1769_c7_a0a6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1769_c7_a0a6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1769_c7_a0a6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1769_c7_a0a6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1769_c7_a0a6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1769_c7_a0a6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1769_c7_a0a6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1769_c7_a0a6_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1769_c7_a0a6_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1769_c7_a0a6_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1769_c7_a0a6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1769_c7_a0a6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1769_c7_a0a6_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1769_c7_a0a6_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1769_c7_a0a6_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1769_c7_a0a6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1769_c7_a0a6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1769_c7_a0a6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1769_c7_a0a6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1769_c7_a0a6_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1769_c7_a0a6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1769_c7_a0a6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1769_c7_a0a6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1769_c7_a0a6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1769_c7_a0a6_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1769_c7_a0a6]
signal result_ram_addr_MUX_uxn_opcodes_h_l1769_c7_a0a6_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1769_c7_a0a6_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1769_c7_a0a6_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1769_c7_a0a6_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1769_c7_a0a6]
signal result_stack_value_MUX_uxn_opcodes_h_l1769_c7_a0a6_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1769_c7_a0a6_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1769_c7_a0a6_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1769_c7_a0a6_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1769_c7_a0a6]
signal tmp16_MUX_uxn_opcodes_h_l1769_c7_a0a6_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1769_c7_a0a6_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1769_c7_a0a6_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1769_c7_a0a6_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1772_c32_a2f3]
signal BIN_OP_AND_uxn_opcodes_h_l1772_c32_a2f3_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1772_c32_a2f3_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1772_c32_a2f3_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1772_c32_aa2c]
signal BIN_OP_GT_uxn_opcodes_h_l1772_c32_aa2c_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1772_c32_aa2c_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1772_c32_aa2c_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1772_c32_2ddb]
signal MUX_uxn_opcodes_h_l1772_c32_2ddb_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1772_c32_2ddb_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1772_c32_2ddb_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1772_c32_2ddb_return_output : signed(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1773_c21_ca8e]
signal BIN_OP_PLUS_uxn_opcodes_h_l1773_c21_ca8e_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1773_c21_ca8e_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1773_c21_ca8e_return_output : signed(17 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1775_c11_1ad1]
signal BIN_OP_EQ_uxn_opcodes_h_l1775_c11_1ad1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1775_c11_1ad1_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1775_c11_1ad1_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1775_c7_8714]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_8714_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_8714_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_8714_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_8714_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1775_c7_8714]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_8714_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_8714_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_8714_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_8714_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1775_c7_8714]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_8714_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_8714_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_8714_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_8714_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1775_c7_8714]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_8714_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_8714_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_8714_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_8714_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1775_c7_8714]
signal result_ram_addr_MUX_uxn_opcodes_h_l1775_c7_8714_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1775_c7_8714_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1775_c7_8714_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1775_c7_8714_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1775_c7_8714]
signal result_stack_value_MUX_uxn_opcodes_h_l1775_c7_8714_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1775_c7_8714_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1775_c7_8714_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1775_c7_8714_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1775_c7_8714]
signal tmp16_MUX_uxn_opcodes_h_l1775_c7_8714_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1775_c7_8714_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1775_c7_8714_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1775_c7_8714_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1779_c11_3a40]
signal BIN_OP_EQ_uxn_opcodes_h_l1779_c11_3a40_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1779_c11_3a40_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1779_c11_3a40_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1779_c7_d4ad]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_d4ad_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_d4ad_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_d4ad_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_d4ad_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1779_c7_d4ad]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_d4ad_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_d4ad_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_d4ad_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_d4ad_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1779_c7_d4ad]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_d4ad_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_d4ad_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_d4ad_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_d4ad_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1779_c7_d4ad]
signal result_ram_addr_MUX_uxn_opcodes_h_l1779_c7_d4ad_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1779_c7_d4ad_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1779_c7_d4ad_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1779_c7_d4ad_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1779_c7_d4ad]
signal result_stack_value_MUX_uxn_opcodes_h_l1779_c7_d4ad_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1779_c7_d4ad_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1779_c7_d4ad_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1779_c7_d4ad_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1779_c7_d4ad]
signal tmp16_MUX_uxn_opcodes_h_l1779_c7_d4ad_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1779_c7_d4ad_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1779_c7_d4ad_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1779_c7_d4ad_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1781_c3_40c5]
signal CONST_SL_8_uxn_opcodes_h_l1781_c3_40c5_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1781_c3_40c5_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1782_c21_5f55]
signal BIN_OP_PLUS_uxn_opcodes_h_l1782_c21_5f55_left : signed(17 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1782_c21_5f55_right : signed(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1782_c21_5f55_return_output : signed(18 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1784_c11_870c]
signal BIN_OP_EQ_uxn_opcodes_h_l1784_c11_870c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1784_c11_870c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1784_c11_870c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1784_c7_0a3e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1784_c7_0a3e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1784_c7_0a3e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1784_c7_0a3e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1784_c7_0a3e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1784_c7_0a3e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1784_c7_0a3e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1784_c7_0a3e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1784_c7_0a3e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1784_c7_0a3e_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1784_c7_0a3e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1784_c7_0a3e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1784_c7_0a3e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1784_c7_0a3e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1784_c7_0a3e_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1784_c7_0a3e]
signal result_ram_addr_MUX_uxn_opcodes_h_l1784_c7_0a3e_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1784_c7_0a3e_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1784_c7_0a3e_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1784_c7_0a3e_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1784_c7_0a3e]
signal result_stack_value_MUX_uxn_opcodes_h_l1784_c7_0a3e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1784_c7_0a3e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1784_c7_0a3e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1784_c7_0a3e_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1784_c7_0a3e]
signal tmp16_MUX_uxn_opcodes_h_l1784_c7_0a3e_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1784_c7_0a3e_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1784_c7_0a3e_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1784_c7_0a3e_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1785_c21_2a71]
signal BIN_OP_PLUS_uxn_opcodes_h_l1785_c21_2a71_left : signed(17 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1785_c21_2a71_right : signed(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1785_c21_2a71_return_output : signed(18 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1787_c11_ebd3]
signal BIN_OP_EQ_uxn_opcodes_h_l1787_c11_ebd3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1787_c11_ebd3_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1787_c11_ebd3_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1787_c7_9ace]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1787_c7_9ace_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1787_c7_9ace_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1787_c7_9ace_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1787_c7_9ace_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1787_c7_9ace]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1787_c7_9ace_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1787_c7_9ace_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1787_c7_9ace_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1787_c7_9ace_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1787_c7_9ace]
signal result_stack_value_MUX_uxn_opcodes_h_l1787_c7_9ace_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1787_c7_9ace_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1787_c7_9ace_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1787_c7_9ace_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1787_c7_9ace]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_9ace_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_9ace_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_9ace_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_9ace_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1787_c7_9ace]
signal tmp16_MUX_uxn_opcodes_h_l1787_c7_9ace_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1787_c7_9ace_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1787_c7_9ace_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1787_c7_9ace_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1788_c3_da21]
signal BIN_OP_OR_uxn_opcodes_h_l1788_c3_da21_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1788_c3_da21_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1788_c3_da21_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1793_c11_af2a]
signal BIN_OP_EQ_uxn_opcodes_h_l1793_c11_af2a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1793_c11_af2a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1793_c11_af2a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1793_c7_fc5e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1793_c7_fc5e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1793_c7_fc5e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1793_c7_fc5e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1793_c7_fc5e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1793_c7_fc5e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1793_c7_fc5e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1793_c7_fc5e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1793_c7_fc5e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1793_c7_fc5e_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1793_c7_fc5e]
signal result_stack_value_MUX_uxn_opcodes_h_l1793_c7_fc5e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1793_c7_fc5e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1793_c7_fc5e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1793_c7_fc5e_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1793_c7_fc5e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1793_c7_fc5e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1793_c7_fc5e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1793_c7_fc5e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1793_c7_fc5e_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1795_c34_3833]
signal CONST_SR_8_uxn_opcodes_h_l1795_c34_3833_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1795_c34_3833_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1797_c11_0315]
signal BIN_OP_EQ_uxn_opcodes_h_l1797_c11_0315_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1797_c11_0315_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1797_c11_0315_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1797_c7_f229]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_f229_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_f229_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_f229_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_f229_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1797_c7_f229]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_f229_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_f229_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_f229_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_f229_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1785_l1782_l1777_DUPLICATE_511c
signal BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1785_l1782_l1777_DUPLICATE_511c_left : signed(16 downto 0);
signal BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1785_l1782_l1777_DUPLICATE_511c_right : signed(7 downto 0);
signal BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1785_l1782_l1777_DUPLICATE_511c_return_output : signed(17 downto 0);

function CAST_TO_int8_t_uint8_t( rhs : unsigned) return signed is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : signed(7 downto 0);

begin

      return_output := signed(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_3413( ref_toks_0 : opcode_result_t;
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
      base.is_stack_write := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_sp_shift := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.ram_addr := ref_toks_6;
      base.stack_value := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1761_c6_ec2f
BIN_OP_EQ_uxn_opcodes_h_l1761_c6_ec2f : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1761_c6_ec2f_left,
BIN_OP_EQ_uxn_opcodes_h_l1761_c6_ec2f_right,
BIN_OP_EQ_uxn_opcodes_h_l1761_c6_ec2f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1761_c1_592c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1761_c1_592c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1761_c1_592c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1761_c1_592c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1761_c1_592c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1761_c1_592c_return_output);

-- t8_MUX_uxn_opcodes_h_l1761_c2_1f2c
t8_MUX_uxn_opcodes_h_l1761_c2_1f2c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1761_c2_1f2c_cond,
t8_MUX_uxn_opcodes_h_l1761_c2_1f2c_iftrue,
t8_MUX_uxn_opcodes_h_l1761_c2_1f2c_iffalse,
t8_MUX_uxn_opcodes_h_l1761_c2_1f2c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1761_c2_1f2c
result_is_stack_write_MUX_uxn_opcodes_h_l1761_c2_1f2c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1761_c2_1f2c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1761_c2_1f2c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1761_c2_1f2c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1761_c2_1f2c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c2_1f2c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c2_1f2c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c2_1f2c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c2_1f2c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c2_1f2c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c2_1f2c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c2_1f2c
result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c2_1f2c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c2_1f2c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c2_1f2c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c2_1f2c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c2_1f2c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1761_c2_1f2c
result_is_sp_shift_MUX_uxn_opcodes_h_l1761_c2_1f2c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1761_c2_1f2c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1761_c2_1f2c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1761_c2_1f2c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1761_c2_1f2c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1761_c2_1f2c
result_is_opc_done_MUX_uxn_opcodes_h_l1761_c2_1f2c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1761_c2_1f2c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1761_c2_1f2c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1761_c2_1f2c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1761_c2_1f2c_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1761_c2_1f2c
result_ram_addr_MUX_uxn_opcodes_h_l1761_c2_1f2c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1761_c2_1f2c_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1761_c2_1f2c_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1761_c2_1f2c_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1761_c2_1f2c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1761_c2_1f2c
result_stack_value_MUX_uxn_opcodes_h_l1761_c2_1f2c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1761_c2_1f2c_cond,
result_stack_value_MUX_uxn_opcodes_h_l1761_c2_1f2c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1761_c2_1f2c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1761_c2_1f2c_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1761_c2_1f2c
tmp16_MUX_uxn_opcodes_h_l1761_c2_1f2c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1761_c2_1f2c_cond,
tmp16_MUX_uxn_opcodes_h_l1761_c2_1f2c_iftrue,
tmp16_MUX_uxn_opcodes_h_l1761_c2_1f2c_iffalse,
tmp16_MUX_uxn_opcodes_h_l1761_c2_1f2c_return_output);

-- printf_uxn_opcodes_h_l1762_c3_2eae_uxn_opcodes_h_l1762_c3_2eae
printf_uxn_opcodes_h_l1762_c3_2eae_uxn_opcodes_h_l1762_c3_2eae : entity work.printf_uxn_opcodes_h_l1762_c3_2eae_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1762_c3_2eae_uxn_opcodes_h_l1762_c3_2eae_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1766_c11_06bc
BIN_OP_EQ_uxn_opcodes_h_l1766_c11_06bc : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1766_c11_06bc_left,
BIN_OP_EQ_uxn_opcodes_h_l1766_c11_06bc_right,
BIN_OP_EQ_uxn_opcodes_h_l1766_c11_06bc_return_output);

-- t8_MUX_uxn_opcodes_h_l1766_c7_36c5
t8_MUX_uxn_opcodes_h_l1766_c7_36c5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1766_c7_36c5_cond,
t8_MUX_uxn_opcodes_h_l1766_c7_36c5_iftrue,
t8_MUX_uxn_opcodes_h_l1766_c7_36c5_iffalse,
t8_MUX_uxn_opcodes_h_l1766_c7_36c5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_36c5
result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_36c5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_36c5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_36c5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_36c5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_36c5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_36c5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_36c5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_36c5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_36c5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_36c5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_36c5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_36c5
result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_36c5 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_36c5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_36c5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_36c5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_36c5_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_36c5
result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_36c5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_36c5_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_36c5_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_36c5_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_36c5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_36c5
result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_36c5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_36c5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_36c5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_36c5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_36c5_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1766_c7_36c5
result_ram_addr_MUX_uxn_opcodes_h_l1766_c7_36c5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1766_c7_36c5_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1766_c7_36c5_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1766_c7_36c5_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1766_c7_36c5_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1766_c7_36c5
result_stack_value_MUX_uxn_opcodes_h_l1766_c7_36c5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1766_c7_36c5_cond,
result_stack_value_MUX_uxn_opcodes_h_l1766_c7_36c5_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1766_c7_36c5_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1766_c7_36c5_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1766_c7_36c5
tmp16_MUX_uxn_opcodes_h_l1766_c7_36c5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1766_c7_36c5_cond,
tmp16_MUX_uxn_opcodes_h_l1766_c7_36c5_iftrue,
tmp16_MUX_uxn_opcodes_h_l1766_c7_36c5_iffalse,
tmp16_MUX_uxn_opcodes_h_l1766_c7_36c5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1769_c11_b737
BIN_OP_EQ_uxn_opcodes_h_l1769_c11_b737 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1769_c11_b737_left,
BIN_OP_EQ_uxn_opcodes_h_l1769_c11_b737_right,
BIN_OP_EQ_uxn_opcodes_h_l1769_c11_b737_return_output);

-- t8_MUX_uxn_opcodes_h_l1769_c7_a0a6
t8_MUX_uxn_opcodes_h_l1769_c7_a0a6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1769_c7_a0a6_cond,
t8_MUX_uxn_opcodes_h_l1769_c7_a0a6_iftrue,
t8_MUX_uxn_opcodes_h_l1769_c7_a0a6_iffalse,
t8_MUX_uxn_opcodes_h_l1769_c7_a0a6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1769_c7_a0a6
result_is_stack_write_MUX_uxn_opcodes_h_l1769_c7_a0a6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1769_c7_a0a6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1769_c7_a0a6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1769_c7_a0a6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1769_c7_a0a6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1769_c7_a0a6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1769_c7_a0a6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1769_c7_a0a6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1769_c7_a0a6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1769_c7_a0a6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1769_c7_a0a6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1769_c7_a0a6
result_sp_relative_shift_MUX_uxn_opcodes_h_l1769_c7_a0a6 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1769_c7_a0a6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1769_c7_a0a6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1769_c7_a0a6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1769_c7_a0a6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1769_c7_a0a6
result_is_sp_shift_MUX_uxn_opcodes_h_l1769_c7_a0a6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1769_c7_a0a6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1769_c7_a0a6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1769_c7_a0a6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1769_c7_a0a6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1769_c7_a0a6
result_is_opc_done_MUX_uxn_opcodes_h_l1769_c7_a0a6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1769_c7_a0a6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1769_c7_a0a6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1769_c7_a0a6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1769_c7_a0a6_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1769_c7_a0a6
result_ram_addr_MUX_uxn_opcodes_h_l1769_c7_a0a6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1769_c7_a0a6_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1769_c7_a0a6_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1769_c7_a0a6_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1769_c7_a0a6_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1769_c7_a0a6
result_stack_value_MUX_uxn_opcodes_h_l1769_c7_a0a6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1769_c7_a0a6_cond,
result_stack_value_MUX_uxn_opcodes_h_l1769_c7_a0a6_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1769_c7_a0a6_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1769_c7_a0a6_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1769_c7_a0a6
tmp16_MUX_uxn_opcodes_h_l1769_c7_a0a6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1769_c7_a0a6_cond,
tmp16_MUX_uxn_opcodes_h_l1769_c7_a0a6_iftrue,
tmp16_MUX_uxn_opcodes_h_l1769_c7_a0a6_iffalse,
tmp16_MUX_uxn_opcodes_h_l1769_c7_a0a6_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1772_c32_a2f3
BIN_OP_AND_uxn_opcodes_h_l1772_c32_a2f3 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1772_c32_a2f3_left,
BIN_OP_AND_uxn_opcodes_h_l1772_c32_a2f3_right,
BIN_OP_AND_uxn_opcodes_h_l1772_c32_a2f3_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1772_c32_aa2c
BIN_OP_GT_uxn_opcodes_h_l1772_c32_aa2c : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1772_c32_aa2c_left,
BIN_OP_GT_uxn_opcodes_h_l1772_c32_aa2c_right,
BIN_OP_GT_uxn_opcodes_h_l1772_c32_aa2c_return_output);

-- MUX_uxn_opcodes_h_l1772_c32_2ddb
MUX_uxn_opcodes_h_l1772_c32_2ddb : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1772_c32_2ddb_cond,
MUX_uxn_opcodes_h_l1772_c32_2ddb_iftrue,
MUX_uxn_opcodes_h_l1772_c32_2ddb_iffalse,
MUX_uxn_opcodes_h_l1772_c32_2ddb_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1773_c21_ca8e
BIN_OP_PLUS_uxn_opcodes_h_l1773_c21_ca8e : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1773_c21_ca8e_left,
BIN_OP_PLUS_uxn_opcodes_h_l1773_c21_ca8e_right,
BIN_OP_PLUS_uxn_opcodes_h_l1773_c21_ca8e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1775_c11_1ad1
BIN_OP_EQ_uxn_opcodes_h_l1775_c11_1ad1 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1775_c11_1ad1_left,
BIN_OP_EQ_uxn_opcodes_h_l1775_c11_1ad1_right,
BIN_OP_EQ_uxn_opcodes_h_l1775_c11_1ad1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_8714
result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_8714 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_8714_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_8714_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_8714_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_8714_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_8714
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_8714 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_8714_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_8714_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_8714_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_8714_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_8714
result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_8714 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_8714_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_8714_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_8714_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_8714_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_8714
result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_8714 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_8714_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_8714_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_8714_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_8714_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1775_c7_8714
result_ram_addr_MUX_uxn_opcodes_h_l1775_c7_8714 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1775_c7_8714_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1775_c7_8714_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1775_c7_8714_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1775_c7_8714_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1775_c7_8714
result_stack_value_MUX_uxn_opcodes_h_l1775_c7_8714 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1775_c7_8714_cond,
result_stack_value_MUX_uxn_opcodes_h_l1775_c7_8714_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1775_c7_8714_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1775_c7_8714_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1775_c7_8714
tmp16_MUX_uxn_opcodes_h_l1775_c7_8714 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1775_c7_8714_cond,
tmp16_MUX_uxn_opcodes_h_l1775_c7_8714_iftrue,
tmp16_MUX_uxn_opcodes_h_l1775_c7_8714_iffalse,
tmp16_MUX_uxn_opcodes_h_l1775_c7_8714_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1779_c11_3a40
BIN_OP_EQ_uxn_opcodes_h_l1779_c11_3a40 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1779_c11_3a40_left,
BIN_OP_EQ_uxn_opcodes_h_l1779_c11_3a40_right,
BIN_OP_EQ_uxn_opcodes_h_l1779_c11_3a40_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_d4ad
result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_d4ad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_d4ad_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_d4ad_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_d4ad_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_d4ad_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_d4ad
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_d4ad : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_d4ad_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_d4ad_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_d4ad_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_d4ad_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_d4ad
result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_d4ad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_d4ad_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_d4ad_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_d4ad_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_d4ad_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1779_c7_d4ad
result_ram_addr_MUX_uxn_opcodes_h_l1779_c7_d4ad : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1779_c7_d4ad_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1779_c7_d4ad_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1779_c7_d4ad_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1779_c7_d4ad_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1779_c7_d4ad
result_stack_value_MUX_uxn_opcodes_h_l1779_c7_d4ad : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1779_c7_d4ad_cond,
result_stack_value_MUX_uxn_opcodes_h_l1779_c7_d4ad_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1779_c7_d4ad_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1779_c7_d4ad_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1779_c7_d4ad
tmp16_MUX_uxn_opcodes_h_l1779_c7_d4ad : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1779_c7_d4ad_cond,
tmp16_MUX_uxn_opcodes_h_l1779_c7_d4ad_iftrue,
tmp16_MUX_uxn_opcodes_h_l1779_c7_d4ad_iffalse,
tmp16_MUX_uxn_opcodes_h_l1779_c7_d4ad_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1781_c3_40c5
CONST_SL_8_uxn_opcodes_h_l1781_c3_40c5 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1781_c3_40c5_x,
CONST_SL_8_uxn_opcodes_h_l1781_c3_40c5_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1782_c21_5f55
BIN_OP_PLUS_uxn_opcodes_h_l1782_c21_5f55 : entity work.BIN_OP_PLUS_int18_t_int2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1782_c21_5f55_left,
BIN_OP_PLUS_uxn_opcodes_h_l1782_c21_5f55_right,
BIN_OP_PLUS_uxn_opcodes_h_l1782_c21_5f55_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1784_c11_870c
BIN_OP_EQ_uxn_opcodes_h_l1784_c11_870c : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1784_c11_870c_left,
BIN_OP_EQ_uxn_opcodes_h_l1784_c11_870c_right,
BIN_OP_EQ_uxn_opcodes_h_l1784_c11_870c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1784_c7_0a3e
result_is_stack_write_MUX_uxn_opcodes_h_l1784_c7_0a3e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1784_c7_0a3e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1784_c7_0a3e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1784_c7_0a3e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1784_c7_0a3e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1784_c7_0a3e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1784_c7_0a3e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1784_c7_0a3e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1784_c7_0a3e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1784_c7_0a3e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1784_c7_0a3e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1784_c7_0a3e
result_is_opc_done_MUX_uxn_opcodes_h_l1784_c7_0a3e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1784_c7_0a3e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1784_c7_0a3e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1784_c7_0a3e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1784_c7_0a3e_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1784_c7_0a3e
result_ram_addr_MUX_uxn_opcodes_h_l1784_c7_0a3e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1784_c7_0a3e_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1784_c7_0a3e_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1784_c7_0a3e_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1784_c7_0a3e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1784_c7_0a3e
result_stack_value_MUX_uxn_opcodes_h_l1784_c7_0a3e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1784_c7_0a3e_cond,
result_stack_value_MUX_uxn_opcodes_h_l1784_c7_0a3e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1784_c7_0a3e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1784_c7_0a3e_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1784_c7_0a3e
tmp16_MUX_uxn_opcodes_h_l1784_c7_0a3e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1784_c7_0a3e_cond,
tmp16_MUX_uxn_opcodes_h_l1784_c7_0a3e_iftrue,
tmp16_MUX_uxn_opcodes_h_l1784_c7_0a3e_iffalse,
tmp16_MUX_uxn_opcodes_h_l1784_c7_0a3e_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1785_c21_2a71
BIN_OP_PLUS_uxn_opcodes_h_l1785_c21_2a71 : entity work.BIN_OP_PLUS_int18_t_int2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1785_c21_2a71_left,
BIN_OP_PLUS_uxn_opcodes_h_l1785_c21_2a71_right,
BIN_OP_PLUS_uxn_opcodes_h_l1785_c21_2a71_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1787_c11_ebd3
BIN_OP_EQ_uxn_opcodes_h_l1787_c11_ebd3 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1787_c11_ebd3_left,
BIN_OP_EQ_uxn_opcodes_h_l1787_c11_ebd3_right,
BIN_OP_EQ_uxn_opcodes_h_l1787_c11_ebd3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1787_c7_9ace
result_is_stack_write_MUX_uxn_opcodes_h_l1787_c7_9ace : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1787_c7_9ace_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1787_c7_9ace_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1787_c7_9ace_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1787_c7_9ace_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1787_c7_9ace
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1787_c7_9ace : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1787_c7_9ace_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1787_c7_9ace_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1787_c7_9ace_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1787_c7_9ace_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1787_c7_9ace
result_stack_value_MUX_uxn_opcodes_h_l1787_c7_9ace : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1787_c7_9ace_cond,
result_stack_value_MUX_uxn_opcodes_h_l1787_c7_9ace_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1787_c7_9ace_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1787_c7_9ace_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_9ace
result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_9ace : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_9ace_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_9ace_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_9ace_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_9ace_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1787_c7_9ace
tmp16_MUX_uxn_opcodes_h_l1787_c7_9ace : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1787_c7_9ace_cond,
tmp16_MUX_uxn_opcodes_h_l1787_c7_9ace_iftrue,
tmp16_MUX_uxn_opcodes_h_l1787_c7_9ace_iffalse,
tmp16_MUX_uxn_opcodes_h_l1787_c7_9ace_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1788_c3_da21
BIN_OP_OR_uxn_opcodes_h_l1788_c3_da21 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1788_c3_da21_left,
BIN_OP_OR_uxn_opcodes_h_l1788_c3_da21_right,
BIN_OP_OR_uxn_opcodes_h_l1788_c3_da21_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1793_c11_af2a
BIN_OP_EQ_uxn_opcodes_h_l1793_c11_af2a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1793_c11_af2a_left,
BIN_OP_EQ_uxn_opcodes_h_l1793_c11_af2a_right,
BIN_OP_EQ_uxn_opcodes_h_l1793_c11_af2a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1793_c7_fc5e
result_is_stack_write_MUX_uxn_opcodes_h_l1793_c7_fc5e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1793_c7_fc5e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1793_c7_fc5e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1793_c7_fc5e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1793_c7_fc5e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1793_c7_fc5e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1793_c7_fc5e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1793_c7_fc5e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1793_c7_fc5e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1793_c7_fc5e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1793_c7_fc5e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1793_c7_fc5e
result_stack_value_MUX_uxn_opcodes_h_l1793_c7_fc5e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1793_c7_fc5e_cond,
result_stack_value_MUX_uxn_opcodes_h_l1793_c7_fc5e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1793_c7_fc5e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1793_c7_fc5e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1793_c7_fc5e
result_is_opc_done_MUX_uxn_opcodes_h_l1793_c7_fc5e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1793_c7_fc5e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1793_c7_fc5e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1793_c7_fc5e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1793_c7_fc5e_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1795_c34_3833
CONST_SR_8_uxn_opcodes_h_l1795_c34_3833 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1795_c34_3833_x,
CONST_SR_8_uxn_opcodes_h_l1795_c34_3833_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1797_c11_0315
BIN_OP_EQ_uxn_opcodes_h_l1797_c11_0315 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1797_c11_0315_left,
BIN_OP_EQ_uxn_opcodes_h_l1797_c11_0315_right,
BIN_OP_EQ_uxn_opcodes_h_l1797_c11_0315_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_f229
result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_f229 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_f229_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_f229_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_f229_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_f229_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_f229
result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_f229 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_f229_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_f229_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_f229_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_f229_return_output);

-- BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1785_l1782_l1777_DUPLICATE_511c
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1785_l1782_l1777_DUPLICATE_511c : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1785_l1782_l1777_DUPLICATE_511c_left,
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1785_l1782_l1777_DUPLICATE_511c_right,
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1785_l1782_l1777_DUPLICATE_511c_return_output);



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
 tmp16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1761_c6_ec2f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1761_c1_592c_return_output,
 t8_MUX_uxn_opcodes_h_l1761_c2_1f2c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1761_c2_1f2c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c2_1f2c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c2_1f2c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1761_c2_1f2c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1761_c2_1f2c_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1761_c2_1f2c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1761_c2_1f2c_return_output,
 tmp16_MUX_uxn_opcodes_h_l1761_c2_1f2c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1766_c11_06bc_return_output,
 t8_MUX_uxn_opcodes_h_l1766_c7_36c5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_36c5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_36c5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_36c5_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_36c5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_36c5_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1766_c7_36c5_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1766_c7_36c5_return_output,
 tmp16_MUX_uxn_opcodes_h_l1766_c7_36c5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1769_c11_b737_return_output,
 t8_MUX_uxn_opcodes_h_l1769_c7_a0a6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1769_c7_a0a6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1769_c7_a0a6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1769_c7_a0a6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1769_c7_a0a6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1769_c7_a0a6_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1769_c7_a0a6_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1769_c7_a0a6_return_output,
 tmp16_MUX_uxn_opcodes_h_l1769_c7_a0a6_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1772_c32_a2f3_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1772_c32_aa2c_return_output,
 MUX_uxn_opcodes_h_l1772_c32_2ddb_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1773_c21_ca8e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1775_c11_1ad1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_8714_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_8714_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_8714_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_8714_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1775_c7_8714_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1775_c7_8714_return_output,
 tmp16_MUX_uxn_opcodes_h_l1775_c7_8714_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1779_c11_3a40_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_d4ad_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_d4ad_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_d4ad_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1779_c7_d4ad_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1779_c7_d4ad_return_output,
 tmp16_MUX_uxn_opcodes_h_l1779_c7_d4ad_return_output,
 CONST_SL_8_uxn_opcodes_h_l1781_c3_40c5_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1782_c21_5f55_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1784_c11_870c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1784_c7_0a3e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1784_c7_0a3e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1784_c7_0a3e_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1784_c7_0a3e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1784_c7_0a3e_return_output,
 tmp16_MUX_uxn_opcodes_h_l1784_c7_0a3e_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1785_c21_2a71_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1787_c11_ebd3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1787_c7_9ace_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1787_c7_9ace_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1787_c7_9ace_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_9ace_return_output,
 tmp16_MUX_uxn_opcodes_h_l1787_c7_9ace_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1788_c3_da21_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1793_c11_af2a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1793_c7_fc5e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1793_c7_fc5e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1793_c7_fc5e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1793_c7_fc5e_return_output,
 CONST_SR_8_uxn_opcodes_h_l1795_c34_3833_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1797_c11_0315_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_f229_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_f229_return_output,
 BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1785_l1782_l1777_DUPLICATE_511c_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1761_c6_ec2f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1761_c6_ec2f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1761_c6_ec2f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1761_c1_592c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1761_c1_592c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1761_c1_592c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1761_c1_592c_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1761_c2_1f2c_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1761_c2_1f2c_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1766_c7_36c5_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1761_c2_1f2c_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1761_c2_1f2c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1761_c2_1f2c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1761_c2_1f2c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_36c5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1761_c2_1f2c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1761_c2_1f2c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c2_1f2c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1763_c3_ae65 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c2_1f2c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_36c5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c2_1f2c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c2_1f2c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c2_1f2c_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c2_1f2c_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_36c5_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c2_1f2c_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c2_1f2c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1761_c2_1f2c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1761_c2_1f2c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_36c5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1761_c2_1f2c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1761_c2_1f2c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1761_c2_1f2c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1761_c2_1f2c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_36c5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1761_c2_1f2c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1761_c2_1f2c_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1761_c2_1f2c_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1761_c2_1f2c_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1766_c7_36c5_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1761_c2_1f2c_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1761_c2_1f2c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1761_c2_1f2c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1761_c2_1f2c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1766_c7_36c5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1761_c2_1f2c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1761_c2_1f2c_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1761_c2_1f2c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1761_c2_1f2c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1766_c7_36c5_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1761_c2_1f2c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1761_c2_1f2c_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1762_c3_2eae_uxn_opcodes_h_l1762_c3_2eae_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1766_c11_06bc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1766_c11_06bc_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1766_c11_06bc_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1766_c7_36c5_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1766_c7_36c5_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1769_c7_a0a6_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1766_c7_36c5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_36c5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_36c5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1769_c7_a0a6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_36c5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_36c5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1767_c3_f6a7 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_36c5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1769_c7_a0a6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_36c5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_36c5_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_36c5_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1769_c7_a0a6_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_36c5_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_36c5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_36c5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1769_c7_a0a6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_36c5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_36c5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_36c5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1769_c7_a0a6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_36c5_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1766_c7_36c5_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1766_c7_36c5_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1769_c7_a0a6_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1766_c7_36c5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1766_c7_36c5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1766_c7_36c5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1769_c7_a0a6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1766_c7_36c5_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1766_c7_36c5_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1766_c7_36c5_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1769_c7_a0a6_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1766_c7_36c5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1769_c11_b737_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1769_c11_b737_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1769_c11_b737_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1769_c7_a0a6_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1769_c7_a0a6_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1769_c7_a0a6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1769_c7_a0a6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1769_c7_a0a6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_8714_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1769_c7_a0a6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1769_c7_a0a6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1769_c7_a0a6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_8714_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1769_c7_a0a6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1769_c7_a0a6_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1769_c7_a0a6_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1769_c7_a0a6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1769_c7_a0a6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1769_c7_a0a6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_8714_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1769_c7_a0a6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1769_c7_a0a6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1769_c7_a0a6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_8714_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1769_c7_a0a6_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1769_c7_a0a6_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l1773_c3_3093 : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1769_c7_a0a6_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1775_c7_8714_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1769_c7_a0a6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1769_c7_a0a6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1769_c7_a0a6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1775_c7_8714_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1769_c7_a0a6_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1769_c7_a0a6_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1769_c7_a0a6_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1775_c7_8714_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1769_c7_a0a6_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1772_c32_2ddb_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1772_c32_2ddb_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1772_c32_2ddb_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1772_c32_a2f3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1772_c32_a2f3_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1772_c32_a2f3_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1772_c32_aa2c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1772_c32_aa2c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1772_c32_aa2c_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1772_c32_2ddb_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1773_c21_ca8e_left : signed(16 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l1773_c26_c159_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1773_c21_ca8e_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1773_c21_ca8e_return_output : signed(17 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1775_c11_1ad1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1775_c11_1ad1_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1775_c11_1ad1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_8714_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_8714_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_d4ad_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_8714_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_8714_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_8714_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_d4ad_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_8714_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_8714_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_8714_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_8714_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_8714_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_8714_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_d4ad_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_8714_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1775_c7_8714_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l1777_c3_a170 : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1775_c7_8714_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1779_c7_d4ad_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1775_c7_8714_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1775_c7_8714_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1775_c7_8714_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1779_c7_d4ad_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1775_c7_8714_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1775_c7_8714_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1775_c7_8714_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1779_c7_d4ad_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1775_c7_8714_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c11_3a40_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c11_3a40_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c11_3a40_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_d4ad_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_d4ad_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1784_c7_0a3e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_d4ad_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_d4ad_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_d4ad_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1784_c7_0a3e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_d4ad_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_d4ad_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_d4ad_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1784_c7_0a3e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_d4ad_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1779_c7_d4ad_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l1782_c3_d5df : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1779_c7_d4ad_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1784_c7_0a3e_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1779_c7_d4ad_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1779_c7_d4ad_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1779_c7_d4ad_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1784_c7_0a3e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1779_c7_d4ad_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1779_c7_d4ad_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1779_c7_d4ad_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1784_c7_0a3e_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1779_c7_d4ad_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1781_c3_40c5_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1781_c3_40c5_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1782_c21_5f55_left : signed(17 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1782_c21_5f55_right : signed(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1782_c21_5f55_return_output : signed(18 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1784_c11_870c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1784_c11_870c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1784_c11_870c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1784_c7_0a3e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1784_c7_0a3e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1787_c7_9ace_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1784_c7_0a3e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1784_c7_0a3e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1784_c7_0a3e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1787_c7_9ace_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1784_c7_0a3e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1784_c7_0a3e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1784_c7_0a3e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_9ace_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1784_c7_0a3e_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1784_c7_0a3e_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l1785_c3_60dd : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1784_c7_0a3e_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1784_c7_0a3e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1784_c7_0a3e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1784_c7_0a3e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1787_c7_9ace_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1784_c7_0a3e_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1784_c7_0a3e_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1784_c7_0a3e_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1787_c7_9ace_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1784_c7_0a3e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1785_c21_2a71_left : signed(17 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1785_c21_2a71_right : signed(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1785_c21_2a71_return_output : signed(18 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1787_c11_ebd3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1787_c11_ebd3_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1787_c11_ebd3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1787_c7_9ace_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1787_c7_9ace_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1793_c7_fc5e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1787_c7_9ace_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1787_c7_9ace_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1790_c3_810f : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1787_c7_9ace_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1793_c7_fc5e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1787_c7_9ace_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1787_c7_9ace_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1787_c7_9ace_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1793_c7_fc5e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1787_c7_9ace_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_9ace_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_9ace_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1793_c7_fc5e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_9ace_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1787_c7_9ace_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1787_c7_9ace_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1787_c7_9ace_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1788_c3_da21_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1788_c3_da21_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1788_c3_da21_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1791_c24_c501_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1793_c11_af2a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1793_c11_af2a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1793_c11_af2a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1793_c7_fc5e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1793_c7_fc5e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_f229_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1793_c7_fc5e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1793_c7_fc5e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1794_c3_1a87 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1793_c7_fc5e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1793_c7_fc5e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1793_c7_fc5e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1793_c7_fc5e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1793_c7_fc5e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1793_c7_fc5e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1793_c7_fc5e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_f229_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1793_c7_fc5e_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1795_c34_3833_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1795_c34_3833_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1795_c24_0794_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1797_c11_0315_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1797_c11_0315_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1797_c11_0315_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_f229_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_f229_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_f229_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_f229_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_f229_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_f229_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1775_l1769_l1797_l1766_l1793_l1761_l1784_l1779_DUPLICATE_22d0_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1769_l1761_l1766_DUPLICATE_db8d_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1761_l1775_l1766_DUPLICATE_3aa3_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1784_l1761_l1766_DUPLICATE_3280_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1775_l1769_l1766_l1793_l1761_l1784_l1779_DUPLICATE_065c_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1775_l1769_l1797_l1766_l1793_l1787_l1784_l1779_DUPLICATE_d59f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1775_l1769_l1793_l1784_l1779_DUPLICATE_35c5_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1777_l1785_l1782_DUPLICATE_c57f_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1785_l1782_l1777_DUPLICATE_511c_left : signed(16 downto 0);
 variable VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1785_l1782_l1777_DUPLICATE_511c_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1785_l1782_l1777_DUPLICATE_511c_return_output : signed(17 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1780_l1788_DUPLICATE_bb24_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3413_uxn_opcodes_h_l1802_l1756_DUPLICATE_59a4_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_tmp16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_tmp16 := tmp16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1766_c11_06bc_right := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l1772_c32_2ddb_iffalse := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_f229_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1793_c11_af2a_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1784_c11_870c_right := to_unsigned(5, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1769_c7_a0a6_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_f229_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1782_c21_5f55_right := signed(std_logic_vector(resize(to_unsigned(1, 1), 2)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1790_c3_810f := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1787_c7_9ace_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1790_c3_810f;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1772_c32_a2f3_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c11_3a40_right := to_unsigned(4, 3);
     VAR_BIN_OP_GT_uxn_opcodes_h_l1772_c32_aa2c_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1794_c3_1a87 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1793_c7_fc5e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1794_c3_1a87;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1797_c11_0315_right := to_unsigned(8, 4);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1761_c1_592c_iffalse := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1761_c2_1f2c_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1763_c3_ae65 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c2_1f2c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1763_c3_ae65;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1787_c7_9ace_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1787_c11_ebd3_right := to_unsigned(6, 3);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1785_c21_2a71_right := signed(std_logic_vector(resize(to_unsigned(1, 1), 2)));
     VAR_MUX_uxn_opcodes_h_l1772_c32_2ddb_iftrue := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1767_c3_f6a7 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_36c5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1767_c3_f6a7;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1769_c11_b737_right := to_unsigned(2, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_8714_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1761_c6_ec2f_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1775_c11_1ad1_right := to_unsigned(3, 2);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1761_c1_592c_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1772_c32_a2f3_left := VAR_ins;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1773_c21_ca8e_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1785_l1782_l1777_DUPLICATE_511c_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1761_c6_ec2f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1766_c11_06bc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1769_c11_b737_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1775_c11_1ad1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c11_3a40_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1784_c11_870c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1787_c11_ebd3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1793_c11_af2a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1797_c11_0315_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l1769_c7_a0a6_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1761_c2_1f2c_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1766_c7_36c5_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1769_c7_a0a6_iffalse := t8;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1788_c3_da21_left := tmp16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1795_c34_3833_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1761_c2_1f2c_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1766_c7_36c5_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1769_c7_a0a6_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1775_c7_8714_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1784_c7_0a3e_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1787_c7_9ace_iffalse := tmp16;
     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1775_l1769_l1766_l1793_l1761_l1784_l1779_DUPLICATE_065c LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1775_l1769_l1766_l1793_l1761_l1784_l1779_DUPLICATE_065c_return_output := result.stack_value;

     -- CAST_TO_int8_t[uxn_opcodes_h_l1773_c26_c159] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l1773_c26_c159_return_output := CAST_TO_int8_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_SR_8[uxn_opcodes_h_l1795_c34_3833] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1795_c34_3833_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1795_c34_3833_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1795_c34_3833_return_output := CONST_SR_8_uxn_opcodes_h_l1795_c34_3833_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1793_c11_af2a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1793_c11_af2a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1793_c11_af2a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1793_c11_af2a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1793_c11_af2a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1793_c11_af2a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1793_c11_af2a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1769_c11_b737] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1769_c11_b737_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1769_c11_b737_left;
     BIN_OP_EQ_uxn_opcodes_h_l1769_c11_b737_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1769_c11_b737_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1769_c11_b737_return_output := BIN_OP_EQ_uxn_opcodes_h_l1769_c11_b737_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1775_l1769_l1793_l1784_l1779_DUPLICATE_35c5 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1775_l1769_l1793_l1784_l1779_DUPLICATE_35c5_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1775_c11_1ad1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1775_c11_1ad1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1775_c11_1ad1_left;
     BIN_OP_EQ_uxn_opcodes_h_l1775_c11_1ad1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1775_c11_1ad1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1775_c11_1ad1_return_output := BIN_OP_EQ_uxn_opcodes_h_l1775_c11_1ad1_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l1772_c32_a2f3] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1772_c32_a2f3_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1772_c32_a2f3_left;
     BIN_OP_AND_uxn_opcodes_h_l1772_c32_a2f3_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1772_c32_a2f3_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1772_c32_a2f3_return_output := BIN_OP_AND_uxn_opcodes_h_l1772_c32_a2f3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1779_c11_3a40] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1779_c11_3a40_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c11_3a40_left;
     BIN_OP_EQ_uxn_opcodes_h_l1779_c11_3a40_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c11_3a40_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c11_3a40_return_output := BIN_OP_EQ_uxn_opcodes_h_l1779_c11_3a40_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1784_c11_870c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1784_c11_870c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1784_c11_870c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1784_c11_870c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1784_c11_870c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1784_c11_870c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1784_c11_870c_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1775_l1769_l1797_l1766_l1793_l1787_l1784_l1779_DUPLICATE_d59f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1775_l1769_l1797_l1766_l1793_l1787_l1784_l1779_DUPLICATE_d59f_return_output := result.is_opc_done;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1769_l1761_l1766_DUPLICATE_db8d LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1769_l1761_l1766_DUPLICATE_db8d_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1784_l1761_l1766_DUPLICATE_3280 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1784_l1761_l1766_DUPLICATE_3280_return_output := result.ram_addr;

     -- BIN_OP_EQ[uxn_opcodes_h_l1766_c11_06bc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1766_c11_06bc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1766_c11_06bc_left;
     BIN_OP_EQ_uxn_opcodes_h_l1766_c11_06bc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1766_c11_06bc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1766_c11_06bc_return_output := BIN_OP_EQ_uxn_opcodes_h_l1766_c11_06bc_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1787_c11_ebd3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1787_c11_ebd3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1787_c11_ebd3_left;
     BIN_OP_EQ_uxn_opcodes_h_l1787_c11_ebd3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1787_c11_ebd3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1787_c11_ebd3_return_output := BIN_OP_EQ_uxn_opcodes_h_l1787_c11_ebd3_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1780_l1788_DUPLICATE_bb24 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1780_l1788_DUPLICATE_bb24_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1777_l1785_l1782_DUPLICATE_c57f LATENCY=0
     VAR_CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1777_l1785_l1782_DUPLICATE_c57f_return_output := CAST_TO_int8_t_uint8_t(
     t8);

     -- BIN_OP_EQ[uxn_opcodes_h_l1761_c6_ec2f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1761_c6_ec2f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1761_c6_ec2f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1761_c6_ec2f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1761_c6_ec2f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1761_c6_ec2f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1761_c6_ec2f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1797_c11_0315] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1797_c11_0315_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1797_c11_0315_left;
     BIN_OP_EQ_uxn_opcodes_h_l1797_c11_0315_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1797_c11_0315_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1797_c11_0315_return_output := BIN_OP_EQ_uxn_opcodes_h_l1797_c11_0315_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1775_l1769_l1797_l1766_l1793_l1761_l1784_l1779_DUPLICATE_22d0 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1775_l1769_l1797_l1766_l1793_l1761_l1784_l1779_DUPLICATE_22d0_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1761_l1775_l1766_DUPLICATE_3aa3 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1761_l1775_l1766_DUPLICATE_3aa3_return_output := result.is_sp_shift;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1772_c32_aa2c_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1772_c32_a2f3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1761_c1_592c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1761_c6_ec2f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1761_c2_1f2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1761_c6_ec2f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1761_c2_1f2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1761_c6_ec2f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1761_c2_1f2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1761_c6_ec2f_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1761_c2_1f2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1761_c6_ec2f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c2_1f2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1761_c6_ec2f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c2_1f2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1761_c6_ec2f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1761_c2_1f2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1761_c6_ec2f_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1761_c2_1f2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1761_c6_ec2f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1761_c2_1f2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1761_c6_ec2f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_36c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1766_c11_06bc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_36c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1766_c11_06bc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_36c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1766_c11_06bc_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1766_c7_36c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1766_c11_06bc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_36c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1766_c11_06bc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_36c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1766_c11_06bc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1766_c7_36c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1766_c11_06bc_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1766_c7_36c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1766_c11_06bc_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1766_c7_36c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1766_c11_06bc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1769_c7_a0a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1769_c11_b737_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1769_c7_a0a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1769_c11_b737_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1769_c7_a0a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1769_c11_b737_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1769_c7_a0a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1769_c11_b737_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1769_c7_a0a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1769_c11_b737_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1769_c7_a0a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1769_c11_b737_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1769_c7_a0a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1769_c11_b737_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1769_c7_a0a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1769_c11_b737_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1769_c7_a0a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1769_c11_b737_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_8714_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1775_c11_1ad1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_8714_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1775_c11_1ad1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_8714_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1775_c11_1ad1_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1775_c7_8714_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1775_c11_1ad1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_8714_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1775_c11_1ad1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1775_c7_8714_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1775_c11_1ad1_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1775_c7_8714_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1775_c11_1ad1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_d4ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c11_3a40_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_d4ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c11_3a40_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1779_c7_d4ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c11_3a40_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_d4ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c11_3a40_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1779_c7_d4ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c11_3a40_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1779_c7_d4ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c11_3a40_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1784_c7_0a3e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1784_c11_870c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1784_c7_0a3e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1784_c11_870c_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1784_c7_0a3e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1784_c11_870c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1784_c7_0a3e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1784_c11_870c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1784_c7_0a3e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1784_c11_870c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1784_c7_0a3e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1784_c11_870c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_9ace_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1787_c11_ebd3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1787_c7_9ace_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1787_c11_ebd3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1787_c7_9ace_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1787_c11_ebd3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1787_c7_9ace_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1787_c11_ebd3_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1787_c7_9ace_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1787_c11_ebd3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1793_c7_fc5e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1793_c11_af2a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1793_c7_fc5e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1793_c11_af2a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1793_c7_fc5e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1793_c11_af2a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1793_c7_fc5e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1793_c11_af2a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_f229_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1797_c11_0315_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_f229_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1797_c11_0315_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1773_c21_ca8e_right := VAR_CAST_TO_int8_t_uxn_opcodes_h_l1773_c26_c159_return_output;
     VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1785_l1782_l1777_DUPLICATE_511c_right := VAR_CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1777_l1785_l1782_DUPLICATE_c57f_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1788_c3_da21_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1780_l1788_DUPLICATE_bb24_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1781_c3_40c5_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1780_l1788_DUPLICATE_bb24_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c2_1f2c_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1769_l1761_l1766_DUPLICATE_db8d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_36c5_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1769_l1761_l1766_DUPLICATE_db8d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1769_c7_a0a6_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1769_l1761_l1766_DUPLICATE_db8d_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1761_c2_1f2c_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1784_l1761_l1766_DUPLICATE_3280_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1766_c7_36c5_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1784_l1761_l1766_DUPLICATE_3280_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1784_c7_0a3e_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1784_l1761_l1766_DUPLICATE_3280_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_36c5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1775_l1769_l1797_l1766_l1793_l1787_l1784_l1779_DUPLICATE_d59f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1769_c7_a0a6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1775_l1769_l1797_l1766_l1793_l1787_l1784_l1779_DUPLICATE_d59f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_8714_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1775_l1769_l1797_l1766_l1793_l1787_l1784_l1779_DUPLICATE_d59f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_d4ad_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1775_l1769_l1797_l1766_l1793_l1787_l1784_l1779_DUPLICATE_d59f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1784_c7_0a3e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1775_l1769_l1797_l1766_l1793_l1787_l1784_l1779_DUPLICATE_d59f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_9ace_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1775_l1769_l1797_l1766_l1793_l1787_l1784_l1779_DUPLICATE_d59f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1793_c7_fc5e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1775_l1769_l1797_l1766_l1793_l1787_l1784_l1779_DUPLICATE_d59f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_f229_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1775_l1769_l1797_l1766_l1793_l1787_l1784_l1779_DUPLICATE_d59f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1761_c2_1f2c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1761_l1775_l1766_DUPLICATE_3aa3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_36c5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1761_l1775_l1766_DUPLICATE_3aa3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_8714_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1761_l1775_l1766_DUPLICATE_3aa3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1761_c2_1f2c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1775_l1769_l1797_l1766_l1793_l1761_l1784_l1779_DUPLICATE_22d0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_36c5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1775_l1769_l1797_l1766_l1793_l1761_l1784_l1779_DUPLICATE_22d0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1769_c7_a0a6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1775_l1769_l1797_l1766_l1793_l1761_l1784_l1779_DUPLICATE_22d0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_8714_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1775_l1769_l1797_l1766_l1793_l1761_l1784_l1779_DUPLICATE_22d0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_d4ad_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1775_l1769_l1797_l1766_l1793_l1761_l1784_l1779_DUPLICATE_22d0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1784_c7_0a3e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1775_l1769_l1797_l1766_l1793_l1761_l1784_l1779_DUPLICATE_22d0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1793_c7_fc5e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1775_l1769_l1797_l1766_l1793_l1761_l1784_l1779_DUPLICATE_22d0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_f229_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1775_l1769_l1797_l1766_l1793_l1761_l1784_l1779_DUPLICATE_22d0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1769_c7_a0a6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1775_l1769_l1793_l1784_l1779_DUPLICATE_35c5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_8714_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1775_l1769_l1793_l1784_l1779_DUPLICATE_35c5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_d4ad_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1775_l1769_l1793_l1784_l1779_DUPLICATE_35c5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1784_c7_0a3e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1775_l1769_l1793_l1784_l1779_DUPLICATE_35c5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1793_c7_fc5e_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1775_l1769_l1793_l1784_l1779_DUPLICATE_35c5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1761_c2_1f2c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1775_l1769_l1766_l1793_l1761_l1784_l1779_DUPLICATE_065c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1766_c7_36c5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1775_l1769_l1766_l1793_l1761_l1784_l1779_DUPLICATE_065c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1769_c7_a0a6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1775_l1769_l1766_l1793_l1761_l1784_l1779_DUPLICATE_065c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1775_c7_8714_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1775_l1769_l1766_l1793_l1761_l1784_l1779_DUPLICATE_065c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1779_c7_d4ad_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1775_l1769_l1766_l1793_l1761_l1784_l1779_DUPLICATE_065c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1784_c7_0a3e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1775_l1769_l1766_l1793_l1761_l1784_l1779_DUPLICATE_065c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1793_c7_fc5e_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1775_l1769_l1766_l1793_l1761_l1784_l1779_DUPLICATE_065c_return_output;
     -- BIN_OP_GT[uxn_opcodes_h_l1772_c32_aa2c] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1772_c32_aa2c_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1772_c32_aa2c_left;
     BIN_OP_GT_uxn_opcodes_h_l1772_c32_aa2c_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1772_c32_aa2c_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1772_c32_aa2c_return_output := BIN_OP_GT_uxn_opcodes_h_l1772_c32_aa2c_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1795_c24_0794] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1795_c24_0794_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1795_c34_3833_return_output);

     -- CONST_SL_8[uxn_opcodes_h_l1781_c3_40c5] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1781_c3_40c5_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1781_c3_40c5_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1781_c3_40c5_return_output := CONST_SL_8_uxn_opcodes_h_l1781_c3_40c5_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1775_c7_8714] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_8714_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_8714_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_8714_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_8714_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_8714_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_8714_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_8714_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_8714_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1797_c7_f229] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_f229_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_f229_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_f229_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_f229_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_f229_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_f229_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_f229_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_f229_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1793_c7_fc5e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1793_c7_fc5e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1793_c7_fc5e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1793_c7_fc5e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1793_c7_fc5e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1793_c7_fc5e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1793_c7_fc5e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1793_c7_fc5e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1793_c7_fc5e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1797_c7_f229] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_f229_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_f229_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_f229_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_f229_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_f229_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_f229_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_f229_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_f229_return_output;

     -- t8_MUX[uxn_opcodes_h_l1769_c7_a0a6] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1769_c7_a0a6_cond <= VAR_t8_MUX_uxn_opcodes_h_l1769_c7_a0a6_cond;
     t8_MUX_uxn_opcodes_h_l1769_c7_a0a6_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1769_c7_a0a6_iftrue;
     t8_MUX_uxn_opcodes_h_l1769_c7_a0a6_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1769_c7_a0a6_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1769_c7_a0a6_return_output := t8_MUX_uxn_opcodes_h_l1769_c7_a0a6_return_output;

     -- BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1785_l1782_l1777_DUPLICATE_511c LATENCY=0
     -- Inputs
     BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1785_l1782_l1777_DUPLICATE_511c_left <= VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1785_l1782_l1777_DUPLICATE_511c_left;
     BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1785_l1782_l1777_DUPLICATE_511c_right <= VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1785_l1782_l1777_DUPLICATE_511c_right;
     -- Outputs
     VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1785_l1782_l1777_DUPLICATE_511c_return_output := BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1785_l1782_l1777_DUPLICATE_511c_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1773_c21_ca8e] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1773_c21_ca8e_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1773_c21_ca8e_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1773_c21_ca8e_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1773_c21_ca8e_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1773_c21_ca8e_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1773_c21_ca8e_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1788_c3_da21] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1788_c3_da21_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1788_c3_da21_left;
     BIN_OP_OR_uxn_opcodes_h_l1788_c3_da21_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1788_c3_da21_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1788_c3_da21_return_output := BIN_OP_OR_uxn_opcodes_h_l1788_c3_da21_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1761_c1_592c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1761_c1_592c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1761_c1_592c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1761_c1_592c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1761_c1_592c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1761_c1_592c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1761_c1_592c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1761_c1_592c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1761_c1_592c_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1772_c32_2ddb_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1772_c32_aa2c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1787_c7_9ace_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1788_c3_da21_return_output;
     VAR_result_ram_addr_uxn_opcodes_h_l1773_c3_3093 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1773_c21_ca8e_return_output)),16);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1782_c21_5f55_left := VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1785_l1782_l1777_DUPLICATE_511c_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1785_c21_2a71_left := VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1785_l1782_l1777_DUPLICATE_511c_return_output;
     VAR_result_ram_addr_uxn_opcodes_h_l1777_c3_a170 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1785_l1782_l1777_DUPLICATE_511c_return_output)),16);
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1793_c7_fc5e_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1795_c24_0794_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1779_c7_d4ad_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1781_c3_40c5_return_output;
     VAR_printf_uxn_opcodes_h_l1762_c3_2eae_uxn_opcodes_h_l1762_c3_2eae_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1761_c1_592c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1793_c7_fc5e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_f229_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1769_c7_a0a6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_8714_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1793_c7_fc5e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_f229_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1787_c7_9ace_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1793_c7_fc5e_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1766_c7_36c5_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1769_c7_a0a6_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1769_c7_a0a6_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l1773_c3_3093;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1775_c7_8714_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l1777_c3_a170;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1793_c7_fc5e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1793_c7_fc5e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1793_c7_fc5e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1793_c7_fc5e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1793_c7_fc5e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1793_c7_fc5e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1793_c7_fc5e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1793_c7_fc5e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1793_c7_fc5e_return_output;

     -- MUX[uxn_opcodes_h_l1772_c32_2ddb] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1772_c32_2ddb_cond <= VAR_MUX_uxn_opcodes_h_l1772_c32_2ddb_cond;
     MUX_uxn_opcodes_h_l1772_c32_2ddb_iftrue <= VAR_MUX_uxn_opcodes_h_l1772_c32_2ddb_iftrue;
     MUX_uxn_opcodes_h_l1772_c32_2ddb_iffalse <= VAR_MUX_uxn_opcodes_h_l1772_c32_2ddb_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1772_c32_2ddb_return_output := MUX_uxn_opcodes_h_l1772_c32_2ddb_return_output;

     -- printf_uxn_opcodes_h_l1762_c3_2eae[uxn_opcodes_h_l1762_c3_2eae] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1762_c3_2eae_uxn_opcodes_h_l1762_c3_2eae_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1762_c3_2eae_uxn_opcodes_h_l1762_c3_2eae_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- BIN_OP_PLUS[uxn_opcodes_h_l1785_c21_2a71] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1785_c21_2a71_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1785_c21_2a71_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1785_c21_2a71_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1785_c21_2a71_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1785_c21_2a71_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1785_c21_2a71_return_output;

     -- t8_MUX[uxn_opcodes_h_l1766_c7_36c5] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1766_c7_36c5_cond <= VAR_t8_MUX_uxn_opcodes_h_l1766_c7_36c5_cond;
     t8_MUX_uxn_opcodes_h_l1766_c7_36c5_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1766_c7_36c5_iftrue;
     t8_MUX_uxn_opcodes_h_l1766_c7_36c5_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1766_c7_36c5_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1766_c7_36c5_return_output := t8_MUX_uxn_opcodes_h_l1766_c7_36c5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1787_c7_9ace] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1787_c7_9ace_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1787_c7_9ace_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1787_c7_9ace_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1787_c7_9ace_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1787_c7_9ace_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1787_c7_9ace_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1787_c7_9ace_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1787_c7_9ace_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1769_c7_a0a6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1769_c7_a0a6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1769_c7_a0a6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1769_c7_a0a6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1769_c7_a0a6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1769_c7_a0a6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1769_c7_a0a6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1769_c7_a0a6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1769_c7_a0a6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1793_c7_fc5e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1793_c7_fc5e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1793_c7_fc5e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1793_c7_fc5e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1793_c7_fc5e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1793_c7_fc5e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1793_c7_fc5e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1793_c7_fc5e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1793_c7_fc5e_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1793_c7_fc5e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1793_c7_fc5e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1793_c7_fc5e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1793_c7_fc5e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1793_c7_fc5e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1793_c7_fc5e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1793_c7_fc5e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1793_c7_fc5e_return_output := result_stack_value_MUX_uxn_opcodes_h_l1793_c7_fc5e_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1782_c21_5f55] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1782_c21_5f55_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1782_c21_5f55_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1782_c21_5f55_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1782_c21_5f55_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1782_c21_5f55_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1782_c21_5f55_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1791_c24_c501] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1791_c24_c501_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_OR_uxn_opcodes_h_l1788_c3_da21_return_output);

     -- tmp16_MUX[uxn_opcodes_h_l1787_c7_9ace] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1787_c7_9ace_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1787_c7_9ace_cond;
     tmp16_MUX_uxn_opcodes_h_l1787_c7_9ace_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1787_c7_9ace_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1787_c7_9ace_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1787_c7_9ace_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1787_c7_9ace_return_output := tmp16_MUX_uxn_opcodes_h_l1787_c7_9ace_return_output;

     -- Submodule level 3
     VAR_result_ram_addr_uxn_opcodes_h_l1782_c3_d5df := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1782_c21_5f55_return_output)),16);
     VAR_result_ram_addr_uxn_opcodes_h_l1785_c3_60dd := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1785_c21_2a71_return_output)),16);
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1787_c7_9ace_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1791_c24_c501_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1769_c7_a0a6_iftrue := VAR_MUX_uxn_opcodes_h_l1772_c32_2ddb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_9ace_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1793_c7_fc5e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_36c5_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1769_c7_a0a6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1787_c7_9ace_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1793_c7_fc5e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1784_c7_0a3e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1787_c7_9ace_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1787_c7_9ace_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1793_c7_fc5e_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1761_c2_1f2c_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1766_c7_36c5_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1784_c7_0a3e_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1787_c7_9ace_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1779_c7_d4ad_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l1782_c3_d5df;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1784_c7_0a3e_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l1785_c3_60dd;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1787_c7_9ace] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_9ace_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_9ace_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_9ace_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_9ace_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_9ace_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_9ace_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_9ace_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_9ace_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1787_c7_9ace] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1787_c7_9ace_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1787_c7_9ace_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1787_c7_9ace_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1787_c7_9ace_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1787_c7_9ace_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1787_c7_9ace_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1787_c7_9ace_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1787_c7_9ace_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1766_c7_36c5] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_36c5_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_36c5_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_36c5_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_36c5_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_36c5_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_36c5_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_36c5_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_36c5_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1784_c7_0a3e] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1784_c7_0a3e_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1784_c7_0a3e_cond;
     tmp16_MUX_uxn_opcodes_h_l1784_c7_0a3e_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1784_c7_0a3e_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1784_c7_0a3e_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1784_c7_0a3e_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1784_c7_0a3e_return_output := tmp16_MUX_uxn_opcodes_h_l1784_c7_0a3e_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1784_c7_0a3e] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1784_c7_0a3e_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1784_c7_0a3e_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1784_c7_0a3e_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1784_c7_0a3e_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1784_c7_0a3e_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1784_c7_0a3e_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1784_c7_0a3e_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1784_c7_0a3e_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1787_c7_9ace] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1787_c7_9ace_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1787_c7_9ace_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1787_c7_9ace_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1787_c7_9ace_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1787_c7_9ace_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1787_c7_9ace_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1787_c7_9ace_return_output := result_stack_value_MUX_uxn_opcodes_h_l1787_c7_9ace_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1769_c7_a0a6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1769_c7_a0a6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1769_c7_a0a6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1769_c7_a0a6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1769_c7_a0a6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1769_c7_a0a6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1769_c7_a0a6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1769_c7_a0a6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1769_c7_a0a6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1784_c7_0a3e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1784_c7_0a3e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1784_c7_0a3e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1784_c7_0a3e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1784_c7_0a3e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1784_c7_0a3e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1784_c7_0a3e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1784_c7_0a3e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1784_c7_0a3e_return_output;

     -- t8_MUX[uxn_opcodes_h_l1761_c2_1f2c] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1761_c2_1f2c_cond <= VAR_t8_MUX_uxn_opcodes_h_l1761_c2_1f2c_cond;
     t8_MUX_uxn_opcodes_h_l1761_c2_1f2c_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1761_c2_1f2c_iftrue;
     t8_MUX_uxn_opcodes_h_l1761_c2_1f2c_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1761_c2_1f2c_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1761_c2_1f2c_return_output := t8_MUX_uxn_opcodes_h_l1761_c2_1f2c_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1784_c7_0a3e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_9ace_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1761_c2_1f2c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_36c5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1784_c7_0a3e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1787_c7_9ace_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1779_c7_d4ad_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1784_c7_0a3e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_36c5_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1769_c7_a0a6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_d4ad_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1784_c7_0a3e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1784_c7_0a3e_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1787_c7_9ace_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1761_c2_1f2c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1779_c7_d4ad_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1784_c7_0a3e_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1784_c7_0a3e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1784_c7_0a3e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1784_c7_0a3e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1784_c7_0a3e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1784_c7_0a3e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1784_c7_0a3e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1784_c7_0a3e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1784_c7_0a3e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1784_c7_0a3e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1761_c2_1f2c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1761_c2_1f2c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1761_c2_1f2c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1761_c2_1f2c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1761_c2_1f2c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1761_c2_1f2c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1761_c2_1f2c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1761_c2_1f2c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1761_c2_1f2c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1784_c7_0a3e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1784_c7_0a3e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1784_c7_0a3e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1784_c7_0a3e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1784_c7_0a3e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1784_c7_0a3e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1784_c7_0a3e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1784_c7_0a3e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1784_c7_0a3e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1779_c7_d4ad] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_d4ad_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_d4ad_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_d4ad_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_d4ad_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_d4ad_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_d4ad_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_d4ad_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_d4ad_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1779_c7_d4ad] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1779_c7_d4ad_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1779_c7_d4ad_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1779_c7_d4ad_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1779_c7_d4ad_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1779_c7_d4ad_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1779_c7_d4ad_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1779_c7_d4ad_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1779_c7_d4ad_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1784_c7_0a3e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1784_c7_0a3e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1784_c7_0a3e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1784_c7_0a3e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1784_c7_0a3e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1784_c7_0a3e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1784_c7_0a3e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1784_c7_0a3e_return_output := result_stack_value_MUX_uxn_opcodes_h_l1784_c7_0a3e_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1779_c7_d4ad] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1779_c7_d4ad_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1779_c7_d4ad_cond;
     tmp16_MUX_uxn_opcodes_h_l1779_c7_d4ad_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1779_c7_d4ad_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1779_c7_d4ad_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1779_c7_d4ad_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1779_c7_d4ad_return_output := tmp16_MUX_uxn_opcodes_h_l1779_c7_d4ad_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1766_c7_36c5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_36c5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_36c5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_36c5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_36c5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_36c5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_36c5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_36c5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_36c5_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_d4ad_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1784_c7_0a3e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_d4ad_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1784_c7_0a3e_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1775_c7_8714_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1779_c7_d4ad_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c2_1f2c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_36c5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_8714_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_d4ad_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1779_c7_d4ad_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1784_c7_0a3e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1775_c7_8714_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1779_c7_d4ad_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1779_c7_d4ad] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_d4ad_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_d4ad_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_d4ad_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_d4ad_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_d4ad_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_d4ad_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_d4ad_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_d4ad_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1779_c7_d4ad] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1779_c7_d4ad_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1779_c7_d4ad_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1779_c7_d4ad_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1779_c7_d4ad_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1779_c7_d4ad_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1779_c7_d4ad_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1779_c7_d4ad_return_output := result_stack_value_MUX_uxn_opcodes_h_l1779_c7_d4ad_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1775_c7_8714] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_8714_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_8714_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_8714_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_8714_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_8714_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_8714_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_8714_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_8714_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1761_c2_1f2c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c2_1f2c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c2_1f2c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c2_1f2c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c2_1f2c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c2_1f2c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c2_1f2c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c2_1f2c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c2_1f2c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1779_c7_d4ad] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_d4ad_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_d4ad_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_d4ad_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_d4ad_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_d4ad_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_d4ad_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_d4ad_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_d4ad_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1775_c7_8714] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1775_c7_8714_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1775_c7_8714_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1775_c7_8714_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1775_c7_8714_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1775_c7_8714_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1775_c7_8714_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1775_c7_8714_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1775_c7_8714_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1775_c7_8714] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1775_c7_8714_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1775_c7_8714_cond;
     tmp16_MUX_uxn_opcodes_h_l1775_c7_8714_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1775_c7_8714_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1775_c7_8714_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1775_c7_8714_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1775_c7_8714_return_output := tmp16_MUX_uxn_opcodes_h_l1775_c7_8714_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_8714_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_d4ad_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_8714_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_d4ad_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1769_c7_a0a6_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1775_c7_8714_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1769_c7_a0a6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_8714_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1775_c7_8714_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1779_c7_d4ad_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1769_c7_a0a6_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1775_c7_8714_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1769_c7_a0a6] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1769_c7_a0a6_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1769_c7_a0a6_cond;
     tmp16_MUX_uxn_opcodes_h_l1769_c7_a0a6_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1769_c7_a0a6_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1769_c7_a0a6_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1769_c7_a0a6_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1769_c7_a0a6_return_output := tmp16_MUX_uxn_opcodes_h_l1769_c7_a0a6_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1769_c7_a0a6] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1769_c7_a0a6_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1769_c7_a0a6_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1769_c7_a0a6_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1769_c7_a0a6_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1769_c7_a0a6_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1769_c7_a0a6_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1769_c7_a0a6_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1769_c7_a0a6_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1775_c7_8714] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1775_c7_8714_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1775_c7_8714_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1775_c7_8714_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1775_c7_8714_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1775_c7_8714_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1775_c7_8714_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1775_c7_8714_return_output := result_stack_value_MUX_uxn_opcodes_h_l1775_c7_8714_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1775_c7_8714] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_8714_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_8714_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_8714_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_8714_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_8714_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_8714_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_8714_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_8714_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1769_c7_a0a6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1769_c7_a0a6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1769_c7_a0a6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1769_c7_a0a6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1769_c7_a0a6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1769_c7_a0a6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1769_c7_a0a6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1769_c7_a0a6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1769_c7_a0a6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1775_c7_8714] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_8714_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_8714_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_8714_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_8714_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_8714_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_8714_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_8714_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_8714_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1769_c7_a0a6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_8714_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1769_c7_a0a6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_8714_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1766_c7_36c5_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1769_c7_a0a6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_36c5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1769_c7_a0a6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1769_c7_a0a6_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1775_c7_8714_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1766_c7_36c5_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1769_c7_a0a6_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1769_c7_a0a6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1769_c7_a0a6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1769_c7_a0a6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1769_c7_a0a6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1769_c7_a0a6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1769_c7_a0a6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1769_c7_a0a6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1769_c7_a0a6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1769_c7_a0a6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1769_c7_a0a6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1769_c7_a0a6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1769_c7_a0a6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1769_c7_a0a6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1769_c7_a0a6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1769_c7_a0a6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1769_c7_a0a6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1769_c7_a0a6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1769_c7_a0a6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1766_c7_36c5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_36c5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_36c5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_36c5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_36c5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_36c5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_36c5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_36c5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_36c5_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1766_c7_36c5] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1766_c7_36c5_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1766_c7_36c5_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1766_c7_36c5_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1766_c7_36c5_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1766_c7_36c5_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1766_c7_36c5_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1766_c7_36c5_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1766_c7_36c5_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1769_c7_a0a6] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1769_c7_a0a6_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1769_c7_a0a6_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1769_c7_a0a6_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1769_c7_a0a6_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1769_c7_a0a6_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1769_c7_a0a6_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1769_c7_a0a6_return_output := result_stack_value_MUX_uxn_opcodes_h_l1769_c7_a0a6_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1766_c7_36c5] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1766_c7_36c5_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1766_c7_36c5_cond;
     tmp16_MUX_uxn_opcodes_h_l1766_c7_36c5_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1766_c7_36c5_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1766_c7_36c5_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1766_c7_36c5_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1766_c7_36c5_return_output := tmp16_MUX_uxn_opcodes_h_l1766_c7_36c5_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_36c5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1769_c7_a0a6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_36c5_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1769_c7_a0a6_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1761_c2_1f2c_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1766_c7_36c5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c2_1f2c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_36c5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1766_c7_36c5_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1769_c7_a0a6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1761_c2_1f2c_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1766_c7_36c5_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1761_c2_1f2c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c2_1f2c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c2_1f2c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c2_1f2c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c2_1f2c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c2_1f2c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c2_1f2c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c2_1f2c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c2_1f2c_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1766_c7_36c5] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1766_c7_36c5_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1766_c7_36c5_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1766_c7_36c5_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1766_c7_36c5_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1766_c7_36c5_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1766_c7_36c5_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1766_c7_36c5_return_output := result_stack_value_MUX_uxn_opcodes_h_l1766_c7_36c5_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1766_c7_36c5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_36c5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_36c5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_36c5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_36c5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_36c5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_36c5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_36c5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_36c5_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1761_c2_1f2c] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1761_c2_1f2c_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1761_c2_1f2c_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1761_c2_1f2c_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1761_c2_1f2c_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1761_c2_1f2c_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1761_c2_1f2c_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1761_c2_1f2c_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1761_c2_1f2c_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1761_c2_1f2c] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1761_c2_1f2c_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1761_c2_1f2c_cond;
     tmp16_MUX_uxn_opcodes_h_l1761_c2_1f2c_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1761_c2_1f2c_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1761_c2_1f2c_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1761_c2_1f2c_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1761_c2_1f2c_return_output := tmp16_MUX_uxn_opcodes_h_l1761_c2_1f2c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1766_c7_36c5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_36c5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_36c5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_36c5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_36c5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_36c5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_36c5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_36c5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_36c5_return_output;

     -- Submodule level 9
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1761_c2_1f2c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_36c5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1761_c2_1f2c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_36c5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1761_c2_1f2c_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1766_c7_36c5_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1761_c2_1f2c_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1761_c2_1f2c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1761_c2_1f2c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1761_c2_1f2c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1761_c2_1f2c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1761_c2_1f2c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1761_c2_1f2c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1761_c2_1f2c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1761_c2_1f2c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1761_c2_1f2c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1761_c2_1f2c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1761_c2_1f2c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1761_c2_1f2c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1761_c2_1f2c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1761_c2_1f2c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1761_c2_1f2c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1761_c2_1f2c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1761_c2_1f2c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1761_c2_1f2c_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1761_c2_1f2c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1761_c2_1f2c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1761_c2_1f2c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1761_c2_1f2c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1761_c2_1f2c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1761_c2_1f2c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1761_c2_1f2c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1761_c2_1f2c_return_output := result_stack_value_MUX_uxn_opcodes_h_l1761_c2_1f2c_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_3413_uxn_opcodes_h_l1802_l1756_DUPLICATE_59a4 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3413_uxn_opcodes_h_l1802_l1756_DUPLICATE_59a4_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3413(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1761_c2_1f2c_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c2_1f2c_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c2_1f2c_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1761_c2_1f2c_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1761_c2_1f2c_return_output,
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1761_c2_1f2c_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1761_c2_1f2c_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3413_uxn_opcodes_h_l1802_l1756_DUPLICATE_59a4_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3413_uxn_opcodes_h_l1802_l1756_DUPLICATE_59a4_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_tmp16 <= REG_VAR_tmp16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     tmp16 <= REG_COMB_tmp16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
