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
-- BIN_OP_EQ[uxn_opcodes_h_l1765_c6_74f8]
signal BIN_OP_EQ_uxn_opcodes_h_l1765_c6_74f8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1765_c6_74f8_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1765_c6_74f8_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1765_c1_a4fc]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1765_c1_a4fc_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1765_c1_a4fc_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1765_c1_a4fc_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1765_c1_a4fc_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1765_c2_c766]
signal tmp16_MUX_uxn_opcodes_h_l1765_c2_c766_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1765_c2_c766_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1765_c2_c766_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1765_c2_c766_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l1765_c2_c766]
signal t8_MUX_uxn_opcodes_h_l1765_c2_c766_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1765_c2_c766_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1765_c2_c766_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1765_c2_c766_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1765_c2_c766]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1765_c2_c766_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1765_c2_c766_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1765_c2_c766_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1765_c2_c766_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1765_c2_c766]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1765_c2_c766_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1765_c2_c766_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1765_c2_c766_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1765_c2_c766_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1765_c2_c766]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1765_c2_c766_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1765_c2_c766_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1765_c2_c766_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1765_c2_c766_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1765_c2_c766]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1765_c2_c766_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1765_c2_c766_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1765_c2_c766_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1765_c2_c766_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1765_c2_c766]
signal result_stack_value_MUX_uxn_opcodes_h_l1765_c2_c766_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1765_c2_c766_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1765_c2_c766_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1765_c2_c766_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1765_c2_c766]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1765_c2_c766_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1765_c2_c766_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1765_c2_c766_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1765_c2_c766_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1765_c2_c766]
signal result_ram_addr_MUX_uxn_opcodes_h_l1765_c2_c766_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1765_c2_c766_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1765_c2_c766_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1765_c2_c766_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l1766_c3_baaf[uxn_opcodes_h_l1766_c3_baaf]
signal printf_uxn_opcodes_h_l1766_c3_baaf_uxn_opcodes_h_l1766_c3_baaf_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1770_c11_1953]
signal BIN_OP_EQ_uxn_opcodes_h_l1770_c11_1953_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1770_c11_1953_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1770_c11_1953_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1770_c7_583d]
signal tmp16_MUX_uxn_opcodes_h_l1770_c7_583d_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1770_c7_583d_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1770_c7_583d_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1770_c7_583d_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l1770_c7_583d]
signal t8_MUX_uxn_opcodes_h_l1770_c7_583d_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1770_c7_583d_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1770_c7_583d_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1770_c7_583d_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1770_c7_583d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1770_c7_583d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1770_c7_583d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1770_c7_583d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1770_c7_583d_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1770_c7_583d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1770_c7_583d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1770_c7_583d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1770_c7_583d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1770_c7_583d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1770_c7_583d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1770_c7_583d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1770_c7_583d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1770_c7_583d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1770_c7_583d_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1770_c7_583d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1770_c7_583d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1770_c7_583d_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1770_c7_583d_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1770_c7_583d_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1770_c7_583d]
signal result_stack_value_MUX_uxn_opcodes_h_l1770_c7_583d_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1770_c7_583d_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1770_c7_583d_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1770_c7_583d_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1770_c7_583d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1770_c7_583d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1770_c7_583d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1770_c7_583d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1770_c7_583d_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1770_c7_583d]
signal result_ram_addr_MUX_uxn_opcodes_h_l1770_c7_583d_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1770_c7_583d_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1770_c7_583d_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1770_c7_583d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1773_c11_79c5]
signal BIN_OP_EQ_uxn_opcodes_h_l1773_c11_79c5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1773_c11_79c5_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1773_c11_79c5_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1773_c7_bde4]
signal tmp16_MUX_uxn_opcodes_h_l1773_c7_bde4_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1773_c7_bde4_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1773_c7_bde4_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1773_c7_bde4_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l1773_c7_bde4]
signal t8_MUX_uxn_opcodes_h_l1773_c7_bde4_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1773_c7_bde4_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1773_c7_bde4_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1773_c7_bde4_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1773_c7_bde4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_bde4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_bde4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_bde4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_bde4_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1773_c7_bde4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1773_c7_bde4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1773_c7_bde4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1773_c7_bde4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1773_c7_bde4_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1773_c7_bde4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_bde4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_bde4_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_bde4_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_bde4_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1773_c7_bde4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_bde4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_bde4_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_bde4_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_bde4_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1773_c7_bde4]
signal result_stack_value_MUX_uxn_opcodes_h_l1773_c7_bde4_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1773_c7_bde4_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1773_c7_bde4_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1773_c7_bde4_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1773_c7_bde4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_bde4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_bde4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_bde4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_bde4_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1773_c7_bde4]
signal result_ram_addr_MUX_uxn_opcodes_h_l1773_c7_bde4_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1773_c7_bde4_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1773_c7_bde4_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1773_c7_bde4_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1776_c32_5e31]
signal BIN_OP_AND_uxn_opcodes_h_l1776_c32_5e31_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1776_c32_5e31_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1776_c32_5e31_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1776_c32_3236]
signal BIN_OP_GT_uxn_opcodes_h_l1776_c32_3236_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1776_c32_3236_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1776_c32_3236_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1776_c32_64a1]
signal MUX_uxn_opcodes_h_l1776_c32_64a1_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1776_c32_64a1_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1776_c32_64a1_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1776_c32_64a1_return_output : signed(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1777_c21_5e7d]
signal BIN_OP_PLUS_uxn_opcodes_h_l1777_c21_5e7d_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1777_c21_5e7d_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1777_c21_5e7d_return_output : signed(17 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1779_c11_e563]
signal BIN_OP_EQ_uxn_opcodes_h_l1779_c11_e563_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1779_c11_e563_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1779_c11_e563_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1779_c7_91d9]
signal tmp16_MUX_uxn_opcodes_h_l1779_c7_91d9_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1779_c7_91d9_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1779_c7_91d9_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1779_c7_91d9_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1779_c7_91d9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_91d9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_91d9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_91d9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_91d9_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1779_c7_91d9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_91d9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_91d9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_91d9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_91d9_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1779_c7_91d9]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_91d9_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_91d9_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_91d9_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_91d9_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1779_c7_91d9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_91d9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_91d9_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_91d9_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_91d9_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1779_c7_91d9]
signal result_stack_value_MUX_uxn_opcodes_h_l1779_c7_91d9_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1779_c7_91d9_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1779_c7_91d9_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1779_c7_91d9_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1779_c7_91d9]
signal result_ram_addr_MUX_uxn_opcodes_h_l1779_c7_91d9_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1779_c7_91d9_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1779_c7_91d9_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1779_c7_91d9_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1783_c11_d38f]
signal BIN_OP_EQ_uxn_opcodes_h_l1783_c11_d38f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1783_c11_d38f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1783_c11_d38f_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1783_c7_a611]
signal tmp16_MUX_uxn_opcodes_h_l1783_c7_a611_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1783_c7_a611_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1783_c7_a611_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1783_c7_a611_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1783_c7_a611]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_a611_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_a611_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_a611_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_a611_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1783_c7_a611]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1783_c7_a611_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1783_c7_a611_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1783_c7_a611_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1783_c7_a611_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1783_c7_a611]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_a611_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_a611_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_a611_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_a611_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1783_c7_a611]
signal result_stack_value_MUX_uxn_opcodes_h_l1783_c7_a611_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1783_c7_a611_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1783_c7_a611_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1783_c7_a611_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1783_c7_a611]
signal result_ram_addr_MUX_uxn_opcodes_h_l1783_c7_a611_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1783_c7_a611_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1783_c7_a611_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1783_c7_a611_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1785_c3_cf74]
signal CONST_SL_8_uxn_opcodes_h_l1785_c3_cf74_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1785_c3_cf74_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1786_c21_27e4]
signal BIN_OP_PLUS_uxn_opcodes_h_l1786_c21_27e4_left : signed(17 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1786_c21_27e4_right : signed(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1786_c21_27e4_return_output : signed(18 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1788_c11_c8c0]
signal BIN_OP_EQ_uxn_opcodes_h_l1788_c11_c8c0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1788_c11_c8c0_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1788_c11_c8c0_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1788_c7_361b]
signal tmp16_MUX_uxn_opcodes_h_l1788_c7_361b_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1788_c7_361b_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1788_c7_361b_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1788_c7_361b_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1788_c7_361b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1788_c7_361b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1788_c7_361b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1788_c7_361b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1788_c7_361b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1788_c7_361b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1788_c7_361b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1788_c7_361b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1788_c7_361b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1788_c7_361b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1788_c7_361b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1788_c7_361b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1788_c7_361b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1788_c7_361b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1788_c7_361b_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1788_c7_361b]
signal result_stack_value_MUX_uxn_opcodes_h_l1788_c7_361b_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1788_c7_361b_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1788_c7_361b_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1788_c7_361b_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1788_c7_361b]
signal result_ram_addr_MUX_uxn_opcodes_h_l1788_c7_361b_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1788_c7_361b_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1788_c7_361b_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1788_c7_361b_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1789_c21_545d]
signal BIN_OP_PLUS_uxn_opcodes_h_l1789_c21_545d_left : signed(17 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1789_c21_545d_right : signed(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1789_c21_545d_return_output : signed(18 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1791_c11_dc50]
signal BIN_OP_EQ_uxn_opcodes_h_l1791_c11_dc50_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1791_c11_dc50_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1791_c11_dc50_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1791_c7_fec2]
signal tmp16_MUX_uxn_opcodes_h_l1791_c7_fec2_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1791_c7_fec2_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1791_c7_fec2_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1791_c7_fec2_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1791_c7_fec2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1791_c7_fec2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1791_c7_fec2_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1791_c7_fec2_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1791_c7_fec2_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1791_c7_fec2]
signal result_stack_value_MUX_uxn_opcodes_h_l1791_c7_fec2_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1791_c7_fec2_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1791_c7_fec2_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1791_c7_fec2_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1791_c7_fec2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1791_c7_fec2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1791_c7_fec2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1791_c7_fec2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1791_c7_fec2_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1791_c7_fec2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1791_c7_fec2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1791_c7_fec2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1791_c7_fec2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1791_c7_fec2_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1792_c3_2181]
signal BIN_OP_OR_uxn_opcodes_h_l1792_c3_2181_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1792_c3_2181_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1792_c3_2181_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1797_c11_c209]
signal BIN_OP_EQ_uxn_opcodes_h_l1797_c11_c209_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1797_c11_c209_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1797_c11_c209_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1797_c7_4eaa]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1797_c7_4eaa_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1797_c7_4eaa_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1797_c7_4eaa_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1797_c7_4eaa_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1797_c7_4eaa]
signal result_stack_value_MUX_uxn_opcodes_h_l1797_c7_4eaa_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1797_c7_4eaa_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1797_c7_4eaa_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1797_c7_4eaa_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1797_c7_4eaa]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_4eaa_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_4eaa_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_4eaa_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_4eaa_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1797_c7_4eaa]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_4eaa_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_4eaa_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_4eaa_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_4eaa_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1799_c34_b63d]
signal CONST_SR_8_uxn_opcodes_h_l1799_c34_b63d_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1799_c34_b63d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1801_c11_8860]
signal BIN_OP_EQ_uxn_opcodes_h_l1801_c11_8860_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1801_c11_8860_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1801_c11_8860_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1801_c7_1ee9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1801_c7_1ee9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1801_c7_1ee9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1801_c7_1ee9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1801_c7_1ee9_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1801_c7_1ee9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1801_c7_1ee9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1801_c7_1ee9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1801_c7_1ee9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1801_c7_1ee9_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1786_l1781_l1789_DUPLICATE_d2e9
signal BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1786_l1781_l1789_DUPLICATE_d2e9_left : signed(16 downto 0);
signal BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1786_l1781_l1789_DUPLICATE_d2e9_right : signed(7 downto 0);
signal BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1786_l1781_l1789_DUPLICATE_d2e9_return_output : signed(17 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l1765_c6_74f8
BIN_OP_EQ_uxn_opcodes_h_l1765_c6_74f8 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1765_c6_74f8_left,
BIN_OP_EQ_uxn_opcodes_h_l1765_c6_74f8_right,
BIN_OP_EQ_uxn_opcodes_h_l1765_c6_74f8_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1765_c1_a4fc
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1765_c1_a4fc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1765_c1_a4fc_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1765_c1_a4fc_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1765_c1_a4fc_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1765_c1_a4fc_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1765_c2_c766
tmp16_MUX_uxn_opcodes_h_l1765_c2_c766 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1765_c2_c766_cond,
tmp16_MUX_uxn_opcodes_h_l1765_c2_c766_iftrue,
tmp16_MUX_uxn_opcodes_h_l1765_c2_c766_iffalse,
tmp16_MUX_uxn_opcodes_h_l1765_c2_c766_return_output);

-- t8_MUX_uxn_opcodes_h_l1765_c2_c766
t8_MUX_uxn_opcodes_h_l1765_c2_c766 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1765_c2_c766_cond,
t8_MUX_uxn_opcodes_h_l1765_c2_c766_iftrue,
t8_MUX_uxn_opcodes_h_l1765_c2_c766_iffalse,
t8_MUX_uxn_opcodes_h_l1765_c2_c766_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1765_c2_c766
result_is_stack_write_MUX_uxn_opcodes_h_l1765_c2_c766 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1765_c2_c766_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1765_c2_c766_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1765_c2_c766_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1765_c2_c766_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1765_c2_c766
result_is_sp_shift_MUX_uxn_opcodes_h_l1765_c2_c766 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1765_c2_c766_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1765_c2_c766_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1765_c2_c766_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1765_c2_c766_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1765_c2_c766
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1765_c2_c766 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1765_c2_c766_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1765_c2_c766_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1765_c2_c766_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1765_c2_c766_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1765_c2_c766
result_sp_relative_shift_MUX_uxn_opcodes_h_l1765_c2_c766 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1765_c2_c766_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1765_c2_c766_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1765_c2_c766_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1765_c2_c766_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1765_c2_c766
result_stack_value_MUX_uxn_opcodes_h_l1765_c2_c766 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1765_c2_c766_cond,
result_stack_value_MUX_uxn_opcodes_h_l1765_c2_c766_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1765_c2_c766_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1765_c2_c766_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1765_c2_c766
result_is_opc_done_MUX_uxn_opcodes_h_l1765_c2_c766 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1765_c2_c766_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1765_c2_c766_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1765_c2_c766_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1765_c2_c766_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1765_c2_c766
result_ram_addr_MUX_uxn_opcodes_h_l1765_c2_c766 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1765_c2_c766_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1765_c2_c766_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1765_c2_c766_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1765_c2_c766_return_output);

-- printf_uxn_opcodes_h_l1766_c3_baaf_uxn_opcodes_h_l1766_c3_baaf
printf_uxn_opcodes_h_l1766_c3_baaf_uxn_opcodes_h_l1766_c3_baaf : entity work.printf_uxn_opcodes_h_l1766_c3_baaf_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1766_c3_baaf_uxn_opcodes_h_l1766_c3_baaf_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1770_c11_1953
BIN_OP_EQ_uxn_opcodes_h_l1770_c11_1953 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1770_c11_1953_left,
BIN_OP_EQ_uxn_opcodes_h_l1770_c11_1953_right,
BIN_OP_EQ_uxn_opcodes_h_l1770_c11_1953_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1770_c7_583d
tmp16_MUX_uxn_opcodes_h_l1770_c7_583d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1770_c7_583d_cond,
tmp16_MUX_uxn_opcodes_h_l1770_c7_583d_iftrue,
tmp16_MUX_uxn_opcodes_h_l1770_c7_583d_iffalse,
tmp16_MUX_uxn_opcodes_h_l1770_c7_583d_return_output);

-- t8_MUX_uxn_opcodes_h_l1770_c7_583d
t8_MUX_uxn_opcodes_h_l1770_c7_583d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1770_c7_583d_cond,
t8_MUX_uxn_opcodes_h_l1770_c7_583d_iftrue,
t8_MUX_uxn_opcodes_h_l1770_c7_583d_iffalse,
t8_MUX_uxn_opcodes_h_l1770_c7_583d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1770_c7_583d
result_is_stack_write_MUX_uxn_opcodes_h_l1770_c7_583d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1770_c7_583d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1770_c7_583d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1770_c7_583d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1770_c7_583d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1770_c7_583d
result_is_sp_shift_MUX_uxn_opcodes_h_l1770_c7_583d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1770_c7_583d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1770_c7_583d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1770_c7_583d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1770_c7_583d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1770_c7_583d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1770_c7_583d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1770_c7_583d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1770_c7_583d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1770_c7_583d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1770_c7_583d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1770_c7_583d
result_sp_relative_shift_MUX_uxn_opcodes_h_l1770_c7_583d : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1770_c7_583d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1770_c7_583d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1770_c7_583d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1770_c7_583d_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1770_c7_583d
result_stack_value_MUX_uxn_opcodes_h_l1770_c7_583d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1770_c7_583d_cond,
result_stack_value_MUX_uxn_opcodes_h_l1770_c7_583d_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1770_c7_583d_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1770_c7_583d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1770_c7_583d
result_is_opc_done_MUX_uxn_opcodes_h_l1770_c7_583d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1770_c7_583d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1770_c7_583d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1770_c7_583d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1770_c7_583d_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1770_c7_583d
result_ram_addr_MUX_uxn_opcodes_h_l1770_c7_583d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1770_c7_583d_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1770_c7_583d_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1770_c7_583d_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1770_c7_583d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1773_c11_79c5
BIN_OP_EQ_uxn_opcodes_h_l1773_c11_79c5 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1773_c11_79c5_left,
BIN_OP_EQ_uxn_opcodes_h_l1773_c11_79c5_right,
BIN_OP_EQ_uxn_opcodes_h_l1773_c11_79c5_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1773_c7_bde4
tmp16_MUX_uxn_opcodes_h_l1773_c7_bde4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1773_c7_bde4_cond,
tmp16_MUX_uxn_opcodes_h_l1773_c7_bde4_iftrue,
tmp16_MUX_uxn_opcodes_h_l1773_c7_bde4_iffalse,
tmp16_MUX_uxn_opcodes_h_l1773_c7_bde4_return_output);

-- t8_MUX_uxn_opcodes_h_l1773_c7_bde4
t8_MUX_uxn_opcodes_h_l1773_c7_bde4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1773_c7_bde4_cond,
t8_MUX_uxn_opcodes_h_l1773_c7_bde4_iftrue,
t8_MUX_uxn_opcodes_h_l1773_c7_bde4_iffalse,
t8_MUX_uxn_opcodes_h_l1773_c7_bde4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_bde4
result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_bde4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_bde4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_bde4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_bde4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_bde4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1773_c7_bde4
result_is_sp_shift_MUX_uxn_opcodes_h_l1773_c7_bde4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1773_c7_bde4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1773_c7_bde4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1773_c7_bde4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1773_c7_bde4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_bde4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_bde4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_bde4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_bde4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_bde4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_bde4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_bde4
result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_bde4 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_bde4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_bde4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_bde4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_bde4_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1773_c7_bde4
result_stack_value_MUX_uxn_opcodes_h_l1773_c7_bde4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1773_c7_bde4_cond,
result_stack_value_MUX_uxn_opcodes_h_l1773_c7_bde4_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1773_c7_bde4_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1773_c7_bde4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_bde4
result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_bde4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_bde4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_bde4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_bde4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_bde4_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1773_c7_bde4
result_ram_addr_MUX_uxn_opcodes_h_l1773_c7_bde4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1773_c7_bde4_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1773_c7_bde4_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1773_c7_bde4_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1773_c7_bde4_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1776_c32_5e31
BIN_OP_AND_uxn_opcodes_h_l1776_c32_5e31 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1776_c32_5e31_left,
BIN_OP_AND_uxn_opcodes_h_l1776_c32_5e31_right,
BIN_OP_AND_uxn_opcodes_h_l1776_c32_5e31_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1776_c32_3236
BIN_OP_GT_uxn_opcodes_h_l1776_c32_3236 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1776_c32_3236_left,
BIN_OP_GT_uxn_opcodes_h_l1776_c32_3236_right,
BIN_OP_GT_uxn_opcodes_h_l1776_c32_3236_return_output);

-- MUX_uxn_opcodes_h_l1776_c32_64a1
MUX_uxn_opcodes_h_l1776_c32_64a1 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1776_c32_64a1_cond,
MUX_uxn_opcodes_h_l1776_c32_64a1_iftrue,
MUX_uxn_opcodes_h_l1776_c32_64a1_iffalse,
MUX_uxn_opcodes_h_l1776_c32_64a1_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1777_c21_5e7d
BIN_OP_PLUS_uxn_opcodes_h_l1777_c21_5e7d : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1777_c21_5e7d_left,
BIN_OP_PLUS_uxn_opcodes_h_l1777_c21_5e7d_right,
BIN_OP_PLUS_uxn_opcodes_h_l1777_c21_5e7d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1779_c11_e563
BIN_OP_EQ_uxn_opcodes_h_l1779_c11_e563 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1779_c11_e563_left,
BIN_OP_EQ_uxn_opcodes_h_l1779_c11_e563_right,
BIN_OP_EQ_uxn_opcodes_h_l1779_c11_e563_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1779_c7_91d9
tmp16_MUX_uxn_opcodes_h_l1779_c7_91d9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1779_c7_91d9_cond,
tmp16_MUX_uxn_opcodes_h_l1779_c7_91d9_iftrue,
tmp16_MUX_uxn_opcodes_h_l1779_c7_91d9_iffalse,
tmp16_MUX_uxn_opcodes_h_l1779_c7_91d9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_91d9
result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_91d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_91d9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_91d9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_91d9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_91d9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_91d9
result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_91d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_91d9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_91d9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_91d9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_91d9_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_91d9
result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_91d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_91d9_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_91d9_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_91d9_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_91d9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_91d9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_91d9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_91d9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_91d9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_91d9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_91d9_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1779_c7_91d9
result_stack_value_MUX_uxn_opcodes_h_l1779_c7_91d9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1779_c7_91d9_cond,
result_stack_value_MUX_uxn_opcodes_h_l1779_c7_91d9_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1779_c7_91d9_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1779_c7_91d9_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1779_c7_91d9
result_ram_addr_MUX_uxn_opcodes_h_l1779_c7_91d9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1779_c7_91d9_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1779_c7_91d9_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1779_c7_91d9_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1779_c7_91d9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1783_c11_d38f
BIN_OP_EQ_uxn_opcodes_h_l1783_c11_d38f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1783_c11_d38f_left,
BIN_OP_EQ_uxn_opcodes_h_l1783_c11_d38f_right,
BIN_OP_EQ_uxn_opcodes_h_l1783_c11_d38f_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1783_c7_a611
tmp16_MUX_uxn_opcodes_h_l1783_c7_a611 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1783_c7_a611_cond,
tmp16_MUX_uxn_opcodes_h_l1783_c7_a611_iftrue,
tmp16_MUX_uxn_opcodes_h_l1783_c7_a611_iffalse,
tmp16_MUX_uxn_opcodes_h_l1783_c7_a611_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_a611
result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_a611 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_a611_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_a611_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_a611_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_a611_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1783_c7_a611
result_is_stack_write_MUX_uxn_opcodes_h_l1783_c7_a611 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1783_c7_a611_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1783_c7_a611_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1783_c7_a611_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1783_c7_a611_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_a611
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_a611 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_a611_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_a611_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_a611_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_a611_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1783_c7_a611
result_stack_value_MUX_uxn_opcodes_h_l1783_c7_a611 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1783_c7_a611_cond,
result_stack_value_MUX_uxn_opcodes_h_l1783_c7_a611_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1783_c7_a611_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1783_c7_a611_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1783_c7_a611
result_ram_addr_MUX_uxn_opcodes_h_l1783_c7_a611 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1783_c7_a611_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1783_c7_a611_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1783_c7_a611_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1783_c7_a611_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1785_c3_cf74
CONST_SL_8_uxn_opcodes_h_l1785_c3_cf74 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1785_c3_cf74_x,
CONST_SL_8_uxn_opcodes_h_l1785_c3_cf74_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1786_c21_27e4
BIN_OP_PLUS_uxn_opcodes_h_l1786_c21_27e4 : entity work.BIN_OP_PLUS_int18_t_int2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1786_c21_27e4_left,
BIN_OP_PLUS_uxn_opcodes_h_l1786_c21_27e4_right,
BIN_OP_PLUS_uxn_opcodes_h_l1786_c21_27e4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1788_c11_c8c0
BIN_OP_EQ_uxn_opcodes_h_l1788_c11_c8c0 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1788_c11_c8c0_left,
BIN_OP_EQ_uxn_opcodes_h_l1788_c11_c8c0_right,
BIN_OP_EQ_uxn_opcodes_h_l1788_c11_c8c0_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1788_c7_361b
tmp16_MUX_uxn_opcodes_h_l1788_c7_361b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1788_c7_361b_cond,
tmp16_MUX_uxn_opcodes_h_l1788_c7_361b_iftrue,
tmp16_MUX_uxn_opcodes_h_l1788_c7_361b_iffalse,
tmp16_MUX_uxn_opcodes_h_l1788_c7_361b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1788_c7_361b
result_is_opc_done_MUX_uxn_opcodes_h_l1788_c7_361b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1788_c7_361b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1788_c7_361b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1788_c7_361b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1788_c7_361b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1788_c7_361b
result_is_stack_write_MUX_uxn_opcodes_h_l1788_c7_361b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1788_c7_361b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1788_c7_361b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1788_c7_361b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1788_c7_361b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1788_c7_361b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1788_c7_361b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1788_c7_361b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1788_c7_361b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1788_c7_361b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1788_c7_361b_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1788_c7_361b
result_stack_value_MUX_uxn_opcodes_h_l1788_c7_361b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1788_c7_361b_cond,
result_stack_value_MUX_uxn_opcodes_h_l1788_c7_361b_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1788_c7_361b_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1788_c7_361b_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1788_c7_361b
result_ram_addr_MUX_uxn_opcodes_h_l1788_c7_361b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1788_c7_361b_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1788_c7_361b_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1788_c7_361b_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1788_c7_361b_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1789_c21_545d
BIN_OP_PLUS_uxn_opcodes_h_l1789_c21_545d : entity work.BIN_OP_PLUS_int18_t_int2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1789_c21_545d_left,
BIN_OP_PLUS_uxn_opcodes_h_l1789_c21_545d_right,
BIN_OP_PLUS_uxn_opcodes_h_l1789_c21_545d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1791_c11_dc50
BIN_OP_EQ_uxn_opcodes_h_l1791_c11_dc50 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1791_c11_dc50_left,
BIN_OP_EQ_uxn_opcodes_h_l1791_c11_dc50_right,
BIN_OP_EQ_uxn_opcodes_h_l1791_c11_dc50_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1791_c7_fec2
tmp16_MUX_uxn_opcodes_h_l1791_c7_fec2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1791_c7_fec2_cond,
tmp16_MUX_uxn_opcodes_h_l1791_c7_fec2_iftrue,
tmp16_MUX_uxn_opcodes_h_l1791_c7_fec2_iffalse,
tmp16_MUX_uxn_opcodes_h_l1791_c7_fec2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1791_c7_fec2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1791_c7_fec2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1791_c7_fec2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1791_c7_fec2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1791_c7_fec2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1791_c7_fec2_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1791_c7_fec2
result_stack_value_MUX_uxn_opcodes_h_l1791_c7_fec2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1791_c7_fec2_cond,
result_stack_value_MUX_uxn_opcodes_h_l1791_c7_fec2_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1791_c7_fec2_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1791_c7_fec2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1791_c7_fec2
result_is_opc_done_MUX_uxn_opcodes_h_l1791_c7_fec2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1791_c7_fec2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1791_c7_fec2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1791_c7_fec2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1791_c7_fec2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1791_c7_fec2
result_is_stack_write_MUX_uxn_opcodes_h_l1791_c7_fec2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1791_c7_fec2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1791_c7_fec2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1791_c7_fec2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1791_c7_fec2_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1792_c3_2181
BIN_OP_OR_uxn_opcodes_h_l1792_c3_2181 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1792_c3_2181_left,
BIN_OP_OR_uxn_opcodes_h_l1792_c3_2181_right,
BIN_OP_OR_uxn_opcodes_h_l1792_c3_2181_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1797_c11_c209
BIN_OP_EQ_uxn_opcodes_h_l1797_c11_c209 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1797_c11_c209_left,
BIN_OP_EQ_uxn_opcodes_h_l1797_c11_c209_right,
BIN_OP_EQ_uxn_opcodes_h_l1797_c11_c209_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1797_c7_4eaa
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1797_c7_4eaa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1797_c7_4eaa_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1797_c7_4eaa_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1797_c7_4eaa_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1797_c7_4eaa_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1797_c7_4eaa
result_stack_value_MUX_uxn_opcodes_h_l1797_c7_4eaa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1797_c7_4eaa_cond,
result_stack_value_MUX_uxn_opcodes_h_l1797_c7_4eaa_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1797_c7_4eaa_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1797_c7_4eaa_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_4eaa
result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_4eaa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_4eaa_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_4eaa_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_4eaa_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_4eaa_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_4eaa
result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_4eaa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_4eaa_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_4eaa_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_4eaa_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_4eaa_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1799_c34_b63d
CONST_SR_8_uxn_opcodes_h_l1799_c34_b63d : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1799_c34_b63d_x,
CONST_SR_8_uxn_opcodes_h_l1799_c34_b63d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1801_c11_8860
BIN_OP_EQ_uxn_opcodes_h_l1801_c11_8860 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1801_c11_8860_left,
BIN_OP_EQ_uxn_opcodes_h_l1801_c11_8860_right,
BIN_OP_EQ_uxn_opcodes_h_l1801_c11_8860_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1801_c7_1ee9
result_is_stack_write_MUX_uxn_opcodes_h_l1801_c7_1ee9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1801_c7_1ee9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1801_c7_1ee9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1801_c7_1ee9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1801_c7_1ee9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1801_c7_1ee9
result_is_opc_done_MUX_uxn_opcodes_h_l1801_c7_1ee9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1801_c7_1ee9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1801_c7_1ee9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1801_c7_1ee9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1801_c7_1ee9_return_output);

-- BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1786_l1781_l1789_DUPLICATE_d2e9
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1786_l1781_l1789_DUPLICATE_d2e9 : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1786_l1781_l1789_DUPLICATE_d2e9_left,
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1786_l1781_l1789_DUPLICATE_d2e9_right,
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1786_l1781_l1789_DUPLICATE_d2e9_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1765_c6_74f8_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1765_c1_a4fc_return_output,
 tmp16_MUX_uxn_opcodes_h_l1765_c2_c766_return_output,
 t8_MUX_uxn_opcodes_h_l1765_c2_c766_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1765_c2_c766_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1765_c2_c766_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1765_c2_c766_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1765_c2_c766_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1765_c2_c766_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1765_c2_c766_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1765_c2_c766_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1770_c11_1953_return_output,
 tmp16_MUX_uxn_opcodes_h_l1770_c7_583d_return_output,
 t8_MUX_uxn_opcodes_h_l1770_c7_583d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1770_c7_583d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1770_c7_583d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1770_c7_583d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1770_c7_583d_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1770_c7_583d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1770_c7_583d_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1770_c7_583d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1773_c11_79c5_return_output,
 tmp16_MUX_uxn_opcodes_h_l1773_c7_bde4_return_output,
 t8_MUX_uxn_opcodes_h_l1773_c7_bde4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_bde4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1773_c7_bde4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_bde4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_bde4_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1773_c7_bde4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_bde4_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1773_c7_bde4_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1776_c32_5e31_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1776_c32_3236_return_output,
 MUX_uxn_opcodes_h_l1776_c32_64a1_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1777_c21_5e7d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1779_c11_e563_return_output,
 tmp16_MUX_uxn_opcodes_h_l1779_c7_91d9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_91d9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_91d9_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_91d9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_91d9_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1779_c7_91d9_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1779_c7_91d9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1783_c11_d38f_return_output,
 tmp16_MUX_uxn_opcodes_h_l1783_c7_a611_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_a611_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1783_c7_a611_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_a611_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1783_c7_a611_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1783_c7_a611_return_output,
 CONST_SL_8_uxn_opcodes_h_l1785_c3_cf74_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1786_c21_27e4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1788_c11_c8c0_return_output,
 tmp16_MUX_uxn_opcodes_h_l1788_c7_361b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1788_c7_361b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1788_c7_361b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1788_c7_361b_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1788_c7_361b_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1788_c7_361b_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1789_c21_545d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1791_c11_dc50_return_output,
 tmp16_MUX_uxn_opcodes_h_l1791_c7_fec2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1791_c7_fec2_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1791_c7_fec2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1791_c7_fec2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1791_c7_fec2_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1792_c3_2181_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1797_c11_c209_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1797_c7_4eaa_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1797_c7_4eaa_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_4eaa_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_4eaa_return_output,
 CONST_SR_8_uxn_opcodes_h_l1799_c34_b63d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1801_c11_8860_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1801_c7_1ee9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1801_c7_1ee9_return_output,
 BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1786_l1781_l1789_DUPLICATE_d2e9_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1765_c6_74f8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1765_c6_74f8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1765_c6_74f8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1765_c1_a4fc_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1765_c1_a4fc_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1765_c1_a4fc_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1765_c1_a4fc_iffalse : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1765_c2_c766_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1765_c2_c766_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1770_c7_583d_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1765_c2_c766_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1765_c2_c766_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1765_c2_c766_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1765_c2_c766_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1770_c7_583d_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1765_c2_c766_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1765_c2_c766_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1765_c2_c766_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1765_c2_c766_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1770_c7_583d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1765_c2_c766_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1765_c2_c766_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1765_c2_c766_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1765_c2_c766_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1770_c7_583d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1765_c2_c766_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1765_c2_c766_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1765_c2_c766_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1767_c3_53dc : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1765_c2_c766_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1770_c7_583d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1765_c2_c766_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1765_c2_c766_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1765_c2_c766_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1765_c2_c766_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1770_c7_583d_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1765_c2_c766_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1765_c2_c766_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1765_c2_c766_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1765_c2_c766_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1770_c7_583d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1765_c2_c766_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1765_c2_c766_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1765_c2_c766_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1765_c2_c766_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1770_c7_583d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1765_c2_c766_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1765_c2_c766_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1765_c2_c766_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1765_c2_c766_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1770_c7_583d_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1765_c2_c766_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1765_c2_c766_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1766_c3_baaf_uxn_opcodes_h_l1766_c3_baaf_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1770_c11_1953_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1770_c11_1953_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1770_c11_1953_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1770_c7_583d_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1770_c7_583d_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1773_c7_bde4_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1770_c7_583d_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1770_c7_583d_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1770_c7_583d_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1773_c7_bde4_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1770_c7_583d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1770_c7_583d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1770_c7_583d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_bde4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1770_c7_583d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1770_c7_583d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1770_c7_583d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1773_c7_bde4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1770_c7_583d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1770_c7_583d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1771_c3_4f2e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1770_c7_583d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_bde4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1770_c7_583d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1770_c7_583d_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1770_c7_583d_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_bde4_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1770_c7_583d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1770_c7_583d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1770_c7_583d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1773_c7_bde4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1770_c7_583d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1770_c7_583d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1770_c7_583d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_bde4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1770_c7_583d_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1770_c7_583d_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1770_c7_583d_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1773_c7_bde4_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1770_c7_583d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_79c5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_79c5_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_79c5_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1773_c7_bde4_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1773_c7_bde4_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1779_c7_91d9_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1773_c7_bde4_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1773_c7_bde4_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1773_c7_bde4_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1773_c7_bde4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_bde4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_bde4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_91d9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_bde4_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1773_c7_bde4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1773_c7_bde4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_91d9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1773_c7_bde4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_bde4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_bde4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_91d9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_bde4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_bde4_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_bde4_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_bde4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1773_c7_bde4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1773_c7_bde4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1779_c7_91d9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1773_c7_bde4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_bde4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_bde4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_91d9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_bde4_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1773_c7_bde4_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l1777_c3_955b : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1773_c7_bde4_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1779_c7_91d9_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1773_c7_bde4_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1776_c32_64a1_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1776_c32_64a1_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1776_c32_64a1_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1776_c32_5e31_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1776_c32_5e31_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1776_c32_5e31_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1776_c32_3236_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1776_c32_3236_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1776_c32_3236_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1776_c32_64a1_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1777_c21_5e7d_left : signed(16 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l1777_c26_2653_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1777_c21_5e7d_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1777_c21_5e7d_return_output : signed(17 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c11_e563_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c11_e563_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c11_e563_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1779_c7_91d9_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1779_c7_91d9_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1783_c7_a611_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1779_c7_91d9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_91d9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_91d9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_a611_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_91d9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_91d9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_91d9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1783_c7_a611_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_91d9_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_91d9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_91d9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_91d9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_91d9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_91d9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_a611_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_91d9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1779_c7_91d9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1779_c7_91d9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1783_c7_a611_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1779_c7_91d9_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1779_c7_91d9_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l1781_c3_63a5 : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1779_c7_91d9_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1783_c7_a611_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1779_c7_91d9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1783_c11_d38f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1783_c11_d38f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1783_c11_d38f_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1783_c7_a611_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1783_c7_a611_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1788_c7_361b_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1783_c7_a611_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_a611_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_a611_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1788_c7_361b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_a611_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1783_c7_a611_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1783_c7_a611_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1788_c7_361b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1783_c7_a611_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_a611_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_a611_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1788_c7_361b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_a611_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1783_c7_a611_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1783_c7_a611_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1788_c7_361b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1783_c7_a611_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1783_c7_a611_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l1786_c3_bbf9 : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1783_c7_a611_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1788_c7_361b_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1783_c7_a611_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1785_c3_cf74_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1785_c3_cf74_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1786_c21_27e4_left : signed(17 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1786_c21_27e4_right : signed(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1786_c21_27e4_return_output : signed(18 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1788_c11_c8c0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1788_c11_c8c0_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1788_c11_c8c0_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1788_c7_361b_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1788_c7_361b_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1791_c7_fec2_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1788_c7_361b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1788_c7_361b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1788_c7_361b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1791_c7_fec2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1788_c7_361b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1788_c7_361b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1788_c7_361b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1791_c7_fec2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1788_c7_361b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1788_c7_361b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1788_c7_361b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1791_c7_fec2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1788_c7_361b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1788_c7_361b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1788_c7_361b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1791_c7_fec2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1788_c7_361b_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1788_c7_361b_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l1789_c3_3595 : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1788_c7_361b_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1788_c7_361b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1789_c21_545d_left : signed(17 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1789_c21_545d_right : signed(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1789_c21_545d_return_output : signed(18 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1791_c11_dc50_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1791_c11_dc50_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1791_c11_dc50_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1791_c7_fec2_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1791_c7_fec2_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1791_c7_fec2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1791_c7_fec2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1794_c3_0f0d : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1791_c7_fec2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1797_c7_4eaa_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1791_c7_fec2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1791_c7_fec2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1791_c7_fec2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1797_c7_4eaa_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1791_c7_fec2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1791_c7_fec2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1791_c7_fec2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_4eaa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1791_c7_fec2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1791_c7_fec2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1791_c7_fec2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_4eaa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1791_c7_fec2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1792_c3_2181_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1792_c3_2181_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1792_c3_2181_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1795_c24_8f1d_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1797_c11_c209_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1797_c11_c209_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1797_c11_c209_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1797_c7_4eaa_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1798_c3_f75c : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1797_c7_4eaa_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1797_c7_4eaa_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1797_c7_4eaa_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1797_c7_4eaa_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1797_c7_4eaa_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_4eaa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_4eaa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1801_c7_1ee9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_4eaa_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_4eaa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_4eaa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1801_c7_1ee9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_4eaa_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1799_c34_b63d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1799_c34_b63d_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1799_c24_5a68_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1801_c11_8860_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1801_c11_8860_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1801_c11_8860_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1801_c7_1ee9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1801_c7_1ee9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1801_c7_1ee9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1801_c7_1ee9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1801_c7_1ee9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1801_c7_1ee9_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1773_l1801_l1770_l1797_l1765_l1788_l1783_l1779_DUPLICATE_5431_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1765_l1779_l1770_DUPLICATE_afa4_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1773_l1765_l1770_DUPLICATE_a963_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1773_l1770_l1797_l1765_l1788_l1783_l1779_DUPLICATE_a14c_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1788_l1765_l1770_DUPLICATE_74b1_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1773_l1801_l1770_l1797_l1791_l1788_l1783_l1779_DUPLICATE_961a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1773_l1797_l1788_l1783_l1779_DUPLICATE_6aac_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1781_l1786_l1789_DUPLICATE_5486_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1786_l1781_l1789_DUPLICATE_d2e9_left : signed(16 downto 0);
 variable VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1786_l1781_l1789_DUPLICATE_d2e9_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1786_l1781_l1789_DUPLICATE_d2e9_return_output : signed(17 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1784_l1792_DUPLICATE_3879_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5b20_uxn_opcodes_h_l1760_l1806_DUPLICATE_cd1f_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1770_c11_1953_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1788_c11_c8c0_right := to_unsigned(5, 3);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1765_c1_a4fc_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1783_c11_d38f_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1798_c3_f75c := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1797_c7_4eaa_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1798_c3_f75c;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1773_c7_bde4_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c11_e563_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1767_c3_53dc := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1765_c2_c766_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1767_c3_53dc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1765_c6_74f8_right := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l1776_c32_3236_right := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1776_c32_64a1_iffalse := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_BIN_OP_AND_uxn_opcodes_h_l1776_c32_5e31_right := to_unsigned(128, 8);
     VAR_MUX_uxn_opcodes_h_l1776_c32_64a1_iftrue := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1786_c21_27e4_right := signed(std_logic_vector(resize(to_unsigned(1, 1), 2)));
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1765_c2_c766_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1801_c7_1ee9_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1801_c11_8860_right := to_unsigned(8, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_79c5_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1797_c11_c209_right := to_unsigned(7, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1794_c3_0f0d := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1791_c7_fec2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1794_c3_0f0d;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1789_c21_545d_right := signed(std_logic_vector(resize(to_unsigned(1, 1), 2)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1771_c3_4f2e := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1770_c7_583d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1771_c3_4f2e;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_91d9_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1801_c7_1ee9_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1791_c11_dc50_right := to_unsigned(6, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1791_c7_fec2_iftrue := to_unsigned(1, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1765_c1_a4fc_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1776_c32_5e31_left := VAR_ins;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1777_c21_5e7d_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1786_l1781_l1789_DUPLICATE_d2e9_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1765_c6_74f8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1770_c11_1953_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_79c5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c11_e563_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1783_c11_d38f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1788_c11_c8c0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1791_c11_dc50_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1797_c11_c209_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1801_c11_8860_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l1773_c7_bde4_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1765_c2_c766_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1770_c7_583d_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1773_c7_bde4_iffalse := t8;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1792_c3_2181_left := tmp16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1799_c34_b63d_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1765_c2_c766_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1770_c7_583d_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1773_c7_bde4_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1779_c7_91d9_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1788_c7_361b_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1791_c7_fec2_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l1797_c11_c209] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1797_c11_c209_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1797_c11_c209_left;
     BIN_OP_EQ_uxn_opcodes_h_l1797_c11_c209_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1797_c11_c209_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1797_c11_c209_return_output := BIN_OP_EQ_uxn_opcodes_h_l1797_c11_c209_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1783_c11_d38f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1783_c11_d38f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1783_c11_d38f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1783_c11_d38f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1783_c11_d38f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1783_c11_d38f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1783_c11_d38f_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l1799_c34_b63d] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1799_c34_b63d_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1799_c34_b63d_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1799_c34_b63d_return_output := CONST_SR_8_uxn_opcodes_h_l1799_c34_b63d_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1773_l1770_l1797_l1765_l1788_l1783_l1779_DUPLICATE_a14c LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1773_l1770_l1797_l1765_l1788_l1783_l1779_DUPLICATE_a14c_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1801_c11_8860] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1801_c11_8860_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1801_c11_8860_left;
     BIN_OP_EQ_uxn_opcodes_h_l1801_c11_8860_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1801_c11_8860_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1801_c11_8860_return_output := BIN_OP_EQ_uxn_opcodes_h_l1801_c11_8860_return_output;

     -- CAST_TO_int8_t[uxn_opcodes_h_l1777_c26_2653] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l1777_c26_2653_return_output := CAST_TO_int8_t_uint8_t(
     VAR_previous_stack_read);

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1784_l1792_DUPLICATE_3879 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1784_l1792_DUPLICATE_3879_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1773_l1797_l1788_l1783_l1779_DUPLICATE_6aac LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1773_l1797_l1788_l1783_l1779_DUPLICATE_6aac_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1779_c11_e563] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1779_c11_e563_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c11_e563_left;
     BIN_OP_EQ_uxn_opcodes_h_l1779_c11_e563_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c11_e563_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c11_e563_return_output := BIN_OP_EQ_uxn_opcodes_h_l1779_c11_e563_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1773_c11_79c5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1773_c11_79c5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_79c5_left;
     BIN_OP_EQ_uxn_opcodes_h_l1773_c11_79c5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_79c5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_79c5_return_output := BIN_OP_EQ_uxn_opcodes_h_l1773_c11_79c5_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1773_l1801_l1770_l1797_l1791_l1788_l1783_l1779_DUPLICATE_961a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1773_l1801_l1770_l1797_l1791_l1788_l1783_l1779_DUPLICATE_961a_return_output := result.is_opc_done;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1773_l1765_l1770_DUPLICATE_a963 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1773_l1765_l1770_DUPLICATE_a963_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1788_c11_c8c0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1788_c11_c8c0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1788_c11_c8c0_left;
     BIN_OP_EQ_uxn_opcodes_h_l1788_c11_c8c0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1788_c11_c8c0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1788_c11_c8c0_return_output := BIN_OP_EQ_uxn_opcodes_h_l1788_c11_c8c0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1765_c6_74f8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1765_c6_74f8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1765_c6_74f8_left;
     BIN_OP_EQ_uxn_opcodes_h_l1765_c6_74f8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1765_c6_74f8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1765_c6_74f8_return_output := BIN_OP_EQ_uxn_opcodes_h_l1765_c6_74f8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1791_c11_dc50] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1791_c11_dc50_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1791_c11_dc50_left;
     BIN_OP_EQ_uxn_opcodes_h_l1791_c11_dc50_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1791_c11_dc50_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1791_c11_dc50_return_output := BIN_OP_EQ_uxn_opcodes_h_l1791_c11_dc50_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1765_l1779_l1770_DUPLICATE_afa4 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1765_l1779_l1770_DUPLICATE_afa4_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1770_c11_1953] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1770_c11_1953_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1770_c11_1953_left;
     BIN_OP_EQ_uxn_opcodes_h_l1770_c11_1953_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1770_c11_1953_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1770_c11_1953_return_output := BIN_OP_EQ_uxn_opcodes_h_l1770_c11_1953_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1773_l1801_l1770_l1797_l1765_l1788_l1783_l1779_DUPLICATE_5431 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1773_l1801_l1770_l1797_l1765_l1788_l1783_l1779_DUPLICATE_5431_return_output := result.is_stack_write;

     -- CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1781_l1786_l1789_DUPLICATE_5486 LATENCY=0
     VAR_CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1781_l1786_l1789_DUPLICATE_5486_return_output := CAST_TO_int8_t_uint8_t(
     t8);

     -- CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1788_l1765_l1770_DUPLICATE_74b1 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1788_l1765_l1770_DUPLICATE_74b1_return_output := result.ram_addr;

     -- BIN_OP_AND[uxn_opcodes_h_l1776_c32_5e31] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1776_c32_5e31_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1776_c32_5e31_left;
     BIN_OP_AND_uxn_opcodes_h_l1776_c32_5e31_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1776_c32_5e31_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1776_c32_5e31_return_output := BIN_OP_AND_uxn_opcodes_h_l1776_c32_5e31_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1776_c32_3236_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1776_c32_5e31_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1765_c1_a4fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1765_c6_74f8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1765_c2_c766_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1765_c6_74f8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1765_c2_c766_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1765_c6_74f8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1765_c2_c766_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1765_c6_74f8_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1765_c2_c766_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1765_c6_74f8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1765_c2_c766_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1765_c6_74f8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1765_c2_c766_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1765_c6_74f8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1765_c2_c766_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1765_c6_74f8_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1765_c2_c766_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1765_c6_74f8_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1765_c2_c766_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1765_c6_74f8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1770_c7_583d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1770_c11_1953_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1770_c7_583d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1770_c11_1953_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1770_c7_583d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1770_c11_1953_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1770_c7_583d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1770_c11_1953_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1770_c7_583d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1770_c11_1953_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1770_c7_583d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1770_c11_1953_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1770_c7_583d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1770_c11_1953_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1770_c7_583d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1770_c11_1953_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1770_c7_583d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1770_c11_1953_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_bde4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_79c5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1773_c7_bde4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_79c5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_bde4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_79c5_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1773_c7_bde4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_79c5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_bde4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_79c5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_bde4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_79c5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1773_c7_bde4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_79c5_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1773_c7_bde4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_79c5_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1773_c7_bde4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_79c5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_91d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c11_e563_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_91d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c11_e563_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_91d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c11_e563_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1779_c7_91d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c11_e563_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_91d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c11_e563_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1779_c7_91d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c11_e563_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1779_c7_91d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c11_e563_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_a611_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1783_c11_d38f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1783_c7_a611_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1783_c11_d38f_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1783_c7_a611_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1783_c11_d38f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_a611_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1783_c11_d38f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1783_c7_a611_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1783_c11_d38f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1783_c7_a611_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1783_c11_d38f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1788_c7_361b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1788_c11_c8c0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1788_c7_361b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1788_c11_c8c0_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1788_c7_361b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1788_c11_c8c0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1788_c7_361b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1788_c11_c8c0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1788_c7_361b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1788_c11_c8c0_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1788_c7_361b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1788_c11_c8c0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1791_c7_fec2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1791_c11_dc50_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1791_c7_fec2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1791_c11_dc50_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1791_c7_fec2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1791_c11_dc50_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1791_c7_fec2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1791_c11_dc50_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1791_c7_fec2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1791_c11_dc50_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_4eaa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1797_c11_c209_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_4eaa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1797_c11_c209_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1797_c7_4eaa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1797_c11_c209_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1797_c7_4eaa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1797_c11_c209_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1801_c7_1ee9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1801_c11_8860_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1801_c7_1ee9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1801_c11_8860_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1777_c21_5e7d_right := VAR_CAST_TO_int8_t_uxn_opcodes_h_l1777_c26_2653_return_output;
     VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1786_l1781_l1789_DUPLICATE_d2e9_right := VAR_CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1781_l1786_l1789_DUPLICATE_5486_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1792_c3_2181_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1784_l1792_DUPLICATE_3879_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1785_c3_cf74_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1784_l1792_DUPLICATE_3879_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1765_c2_c766_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1773_l1765_l1770_DUPLICATE_a963_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1770_c7_583d_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1773_l1765_l1770_DUPLICATE_a963_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_bde4_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1773_l1765_l1770_DUPLICATE_a963_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1765_c2_c766_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1788_l1765_l1770_DUPLICATE_74b1_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1770_c7_583d_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1788_l1765_l1770_DUPLICATE_74b1_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1788_c7_361b_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1788_l1765_l1770_DUPLICATE_74b1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1770_c7_583d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1773_l1801_l1770_l1797_l1791_l1788_l1783_l1779_DUPLICATE_961a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_bde4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1773_l1801_l1770_l1797_l1791_l1788_l1783_l1779_DUPLICATE_961a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_91d9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1773_l1801_l1770_l1797_l1791_l1788_l1783_l1779_DUPLICATE_961a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_a611_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1773_l1801_l1770_l1797_l1791_l1788_l1783_l1779_DUPLICATE_961a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1788_c7_361b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1773_l1801_l1770_l1797_l1791_l1788_l1783_l1779_DUPLICATE_961a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1791_c7_fec2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1773_l1801_l1770_l1797_l1791_l1788_l1783_l1779_DUPLICATE_961a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_4eaa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1773_l1801_l1770_l1797_l1791_l1788_l1783_l1779_DUPLICATE_961a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1801_c7_1ee9_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1773_l1801_l1770_l1797_l1791_l1788_l1783_l1779_DUPLICATE_961a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1765_c2_c766_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1765_l1779_l1770_DUPLICATE_afa4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1770_c7_583d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1765_l1779_l1770_DUPLICATE_afa4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_91d9_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1765_l1779_l1770_DUPLICATE_afa4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1765_c2_c766_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1773_l1801_l1770_l1797_l1765_l1788_l1783_l1779_DUPLICATE_5431_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1770_c7_583d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1773_l1801_l1770_l1797_l1765_l1788_l1783_l1779_DUPLICATE_5431_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_bde4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1773_l1801_l1770_l1797_l1765_l1788_l1783_l1779_DUPLICATE_5431_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_91d9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1773_l1801_l1770_l1797_l1765_l1788_l1783_l1779_DUPLICATE_5431_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1783_c7_a611_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1773_l1801_l1770_l1797_l1765_l1788_l1783_l1779_DUPLICATE_5431_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1788_c7_361b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1773_l1801_l1770_l1797_l1765_l1788_l1783_l1779_DUPLICATE_5431_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_4eaa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1773_l1801_l1770_l1797_l1765_l1788_l1783_l1779_DUPLICATE_5431_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1801_c7_1ee9_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1773_l1801_l1770_l1797_l1765_l1788_l1783_l1779_DUPLICATE_5431_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_bde4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1773_l1797_l1788_l1783_l1779_DUPLICATE_6aac_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_91d9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1773_l1797_l1788_l1783_l1779_DUPLICATE_6aac_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_a611_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1773_l1797_l1788_l1783_l1779_DUPLICATE_6aac_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1788_c7_361b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1773_l1797_l1788_l1783_l1779_DUPLICATE_6aac_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1797_c7_4eaa_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1773_l1797_l1788_l1783_l1779_DUPLICATE_6aac_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1765_c2_c766_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1773_l1770_l1797_l1765_l1788_l1783_l1779_DUPLICATE_a14c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1770_c7_583d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1773_l1770_l1797_l1765_l1788_l1783_l1779_DUPLICATE_a14c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1773_c7_bde4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1773_l1770_l1797_l1765_l1788_l1783_l1779_DUPLICATE_a14c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1779_c7_91d9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1773_l1770_l1797_l1765_l1788_l1783_l1779_DUPLICATE_a14c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1783_c7_a611_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1773_l1770_l1797_l1765_l1788_l1783_l1779_DUPLICATE_a14c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1788_c7_361b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1773_l1770_l1797_l1765_l1788_l1783_l1779_DUPLICATE_a14c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1797_c7_4eaa_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1773_l1770_l1797_l1765_l1788_l1783_l1779_DUPLICATE_a14c_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1801_c7_1ee9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1801_c7_1ee9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1801_c7_1ee9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1801_c7_1ee9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1801_c7_1ee9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1801_c7_1ee9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1801_c7_1ee9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1801_c7_1ee9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1801_c7_1ee9_return_output;

     -- BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1786_l1781_l1789_DUPLICATE_d2e9 LATENCY=0
     -- Inputs
     BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1786_l1781_l1789_DUPLICATE_d2e9_left <= VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1786_l1781_l1789_DUPLICATE_d2e9_left;
     BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1786_l1781_l1789_DUPLICATE_d2e9_right <= VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1786_l1781_l1789_DUPLICATE_d2e9_right;
     -- Outputs
     VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1786_l1781_l1789_DUPLICATE_d2e9_return_output := BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1786_l1781_l1789_DUPLICATE_d2e9_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1765_c1_a4fc] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1765_c1_a4fc_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1765_c1_a4fc_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1765_c1_a4fc_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1765_c1_a4fc_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1765_c1_a4fc_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1765_c1_a4fc_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1765_c1_a4fc_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1765_c1_a4fc_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1779_c7_91d9] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_91d9_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_91d9_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_91d9_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_91d9_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_91d9_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_91d9_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_91d9_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_91d9_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1799_c24_5a68] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1799_c24_5a68_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1799_c34_b63d_return_output);

     -- t8_MUX[uxn_opcodes_h_l1773_c7_bde4] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1773_c7_bde4_cond <= VAR_t8_MUX_uxn_opcodes_h_l1773_c7_bde4_cond;
     t8_MUX_uxn_opcodes_h_l1773_c7_bde4_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1773_c7_bde4_iftrue;
     t8_MUX_uxn_opcodes_h_l1773_c7_bde4_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1773_c7_bde4_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1773_c7_bde4_return_output := t8_MUX_uxn_opcodes_h_l1773_c7_bde4_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1777_c21_5e7d] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1777_c21_5e7d_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1777_c21_5e7d_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1777_c21_5e7d_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1777_c21_5e7d_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1777_c21_5e7d_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1777_c21_5e7d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1801_c7_1ee9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1801_c7_1ee9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1801_c7_1ee9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1801_c7_1ee9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1801_c7_1ee9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1801_c7_1ee9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1801_c7_1ee9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1801_c7_1ee9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1801_c7_1ee9_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1776_c32_3236] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1776_c32_3236_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1776_c32_3236_left;
     BIN_OP_GT_uxn_opcodes_h_l1776_c32_3236_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1776_c32_3236_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1776_c32_3236_return_output := BIN_OP_GT_uxn_opcodes_h_l1776_c32_3236_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1797_c7_4eaa] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1797_c7_4eaa_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1797_c7_4eaa_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1797_c7_4eaa_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1797_c7_4eaa_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1797_c7_4eaa_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1797_c7_4eaa_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1797_c7_4eaa_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1797_c7_4eaa_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1792_c3_2181] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1792_c3_2181_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1792_c3_2181_left;
     BIN_OP_OR_uxn_opcodes_h_l1792_c3_2181_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1792_c3_2181_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1792_c3_2181_return_output := BIN_OP_OR_uxn_opcodes_h_l1792_c3_2181_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1785_c3_cf74] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1785_c3_cf74_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1785_c3_cf74_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1785_c3_cf74_return_output := CONST_SL_8_uxn_opcodes_h_l1785_c3_cf74_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1776_c32_64a1_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1776_c32_3236_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1791_c7_fec2_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1792_c3_2181_return_output;
     VAR_result_ram_addr_uxn_opcodes_h_l1777_c3_955b := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1777_c21_5e7d_return_output)),16);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1786_c21_27e4_left := VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1786_l1781_l1789_DUPLICATE_d2e9_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1789_c21_545d_left := VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1786_l1781_l1789_DUPLICATE_d2e9_return_output;
     VAR_result_ram_addr_uxn_opcodes_h_l1781_c3_63a5 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1786_l1781_l1789_DUPLICATE_d2e9_return_output)),16);
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1797_c7_4eaa_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1799_c24_5a68_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1783_c7_a611_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1785_c3_cf74_return_output;
     VAR_printf_uxn_opcodes_h_l1766_c3_baaf_uxn_opcodes_h_l1766_c3_baaf_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1765_c1_a4fc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_4eaa_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1801_c7_1ee9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1773_c7_bde4_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_91d9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_4eaa_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1801_c7_1ee9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1791_c7_fec2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1797_c7_4eaa_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1770_c7_583d_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1773_c7_bde4_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1773_c7_bde4_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l1777_c3_955b;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1779_c7_91d9_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l1781_c3_63a5;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1797_c7_4eaa] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_4eaa_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_4eaa_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_4eaa_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_4eaa_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_4eaa_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_4eaa_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_4eaa_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_4eaa_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1795_c24_8f1d] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1795_c24_8f1d_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_OR_uxn_opcodes_h_l1792_c3_2181_return_output);

     -- BIN_OP_PLUS[uxn_opcodes_h_l1786_c21_27e4] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1786_c21_27e4_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1786_c21_27e4_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1786_c21_27e4_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1786_c21_27e4_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1786_c21_27e4_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1786_c21_27e4_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1797_c7_4eaa] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1797_c7_4eaa_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1797_c7_4eaa_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1797_c7_4eaa_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1797_c7_4eaa_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1797_c7_4eaa_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1797_c7_4eaa_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1797_c7_4eaa_return_output := result_stack_value_MUX_uxn_opcodes_h_l1797_c7_4eaa_return_output;

     -- printf_uxn_opcodes_h_l1766_c3_baaf[uxn_opcodes_h_l1766_c3_baaf] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1766_c3_baaf_uxn_opcodes_h_l1766_c3_baaf_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1766_c3_baaf_uxn_opcodes_h_l1766_c3_baaf_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1773_c7_bde4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1773_c7_bde4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1773_c7_bde4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1773_c7_bde4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1773_c7_bde4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1773_c7_bde4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1773_c7_bde4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1773_c7_bde4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1773_c7_bde4_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1789_c21_545d] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1789_c21_545d_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1789_c21_545d_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1789_c21_545d_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1789_c21_545d_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1789_c21_545d_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1789_c21_545d_return_output;

     -- MUX[uxn_opcodes_h_l1776_c32_64a1] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1776_c32_64a1_cond <= VAR_MUX_uxn_opcodes_h_l1776_c32_64a1_cond;
     MUX_uxn_opcodes_h_l1776_c32_64a1_iftrue <= VAR_MUX_uxn_opcodes_h_l1776_c32_64a1_iftrue;
     MUX_uxn_opcodes_h_l1776_c32_64a1_iffalse <= VAR_MUX_uxn_opcodes_h_l1776_c32_64a1_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1776_c32_64a1_return_output := MUX_uxn_opcodes_h_l1776_c32_64a1_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1791_c7_fec2] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1791_c7_fec2_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1791_c7_fec2_cond;
     tmp16_MUX_uxn_opcodes_h_l1791_c7_fec2_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1791_c7_fec2_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1791_c7_fec2_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1791_c7_fec2_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1791_c7_fec2_return_output := tmp16_MUX_uxn_opcodes_h_l1791_c7_fec2_return_output;

     -- t8_MUX[uxn_opcodes_h_l1770_c7_583d] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1770_c7_583d_cond <= VAR_t8_MUX_uxn_opcodes_h_l1770_c7_583d_cond;
     t8_MUX_uxn_opcodes_h_l1770_c7_583d_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1770_c7_583d_iftrue;
     t8_MUX_uxn_opcodes_h_l1770_c7_583d_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1770_c7_583d_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1770_c7_583d_return_output := t8_MUX_uxn_opcodes_h_l1770_c7_583d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1797_c7_4eaa] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_4eaa_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_4eaa_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_4eaa_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_4eaa_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_4eaa_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_4eaa_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_4eaa_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_4eaa_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1791_c7_fec2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1791_c7_fec2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1791_c7_fec2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1791_c7_fec2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1791_c7_fec2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1791_c7_fec2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1791_c7_fec2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1791_c7_fec2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1791_c7_fec2_return_output;

     -- Submodule level 3
     VAR_result_ram_addr_uxn_opcodes_h_l1786_c3_bbf9 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1786_c21_27e4_return_output)),16);
     VAR_result_ram_addr_uxn_opcodes_h_l1789_c3_3595 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1789_c21_545d_return_output)),16);
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1791_c7_fec2_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1795_c24_8f1d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_bde4_iftrue := VAR_MUX_uxn_opcodes_h_l1776_c32_64a1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1791_c7_fec2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_4eaa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1770_c7_583d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1773_c7_bde4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1791_c7_fec2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_4eaa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1788_c7_361b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1791_c7_fec2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1791_c7_fec2_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1797_c7_4eaa_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1765_c2_c766_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1770_c7_583d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1788_c7_361b_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1791_c7_fec2_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1783_c7_a611_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l1786_c3_bbf9;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1788_c7_361b_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l1789_c3_3595;
     -- result_ram_addr_MUX[uxn_opcodes_h_l1788_c7_361b] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1788_c7_361b_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1788_c7_361b_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1788_c7_361b_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1788_c7_361b_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1788_c7_361b_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1788_c7_361b_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1788_c7_361b_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1788_c7_361b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1770_c7_583d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1770_c7_583d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1770_c7_583d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1770_c7_583d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1770_c7_583d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1770_c7_583d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1770_c7_583d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1770_c7_583d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1770_c7_583d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1773_c7_bde4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_bde4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_bde4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_bde4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_bde4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_bde4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_bde4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_bde4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_bde4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1788_c7_361b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1788_c7_361b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1788_c7_361b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1788_c7_361b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1788_c7_361b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1788_c7_361b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1788_c7_361b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1788_c7_361b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1788_c7_361b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1791_c7_fec2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1791_c7_fec2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1791_c7_fec2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1791_c7_fec2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1791_c7_fec2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1791_c7_fec2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1791_c7_fec2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1791_c7_fec2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1791_c7_fec2_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1788_c7_361b] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1788_c7_361b_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1788_c7_361b_cond;
     tmp16_MUX_uxn_opcodes_h_l1788_c7_361b_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1788_c7_361b_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1788_c7_361b_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1788_c7_361b_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1788_c7_361b_return_output := tmp16_MUX_uxn_opcodes_h_l1788_c7_361b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1791_c7_fec2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1791_c7_fec2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1791_c7_fec2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1791_c7_fec2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1791_c7_fec2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1791_c7_fec2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1791_c7_fec2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1791_c7_fec2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1791_c7_fec2_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1791_c7_fec2] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1791_c7_fec2_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1791_c7_fec2_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1791_c7_fec2_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1791_c7_fec2_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1791_c7_fec2_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1791_c7_fec2_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1791_c7_fec2_return_output := result_stack_value_MUX_uxn_opcodes_h_l1791_c7_fec2_return_output;

     -- t8_MUX[uxn_opcodes_h_l1765_c2_c766] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1765_c2_c766_cond <= VAR_t8_MUX_uxn_opcodes_h_l1765_c2_c766_cond;
     t8_MUX_uxn_opcodes_h_l1765_c2_c766_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1765_c2_c766_iftrue;
     t8_MUX_uxn_opcodes_h_l1765_c2_c766_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1765_c2_c766_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1765_c2_c766_return_output := t8_MUX_uxn_opcodes_h_l1765_c2_c766_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1788_c7_361b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1791_c7_fec2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1765_c2_c766_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1770_c7_583d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1788_c7_361b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1791_c7_fec2_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1783_c7_a611_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1788_c7_361b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1770_c7_583d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_bde4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_a611_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1788_c7_361b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1788_c7_361b_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1791_c7_fec2_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1765_c2_c766_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1783_c7_a611_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1788_c7_361b_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1765_c2_c766] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1765_c2_c766_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1765_c2_c766_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1765_c2_c766_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1765_c2_c766_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1765_c2_c766_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1765_c2_c766_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1765_c2_c766_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1765_c2_c766_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1783_c7_a611] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_a611_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_a611_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_a611_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_a611_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_a611_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_a611_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_a611_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_a611_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1770_c7_583d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1770_c7_583d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1770_c7_583d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1770_c7_583d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1770_c7_583d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1770_c7_583d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1770_c7_583d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1770_c7_583d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1770_c7_583d_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1783_c7_a611] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1783_c7_a611_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1783_c7_a611_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1783_c7_a611_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1783_c7_a611_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1783_c7_a611_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1783_c7_a611_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1783_c7_a611_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1783_c7_a611_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1788_c7_361b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1788_c7_361b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1788_c7_361b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1788_c7_361b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1788_c7_361b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1788_c7_361b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1788_c7_361b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1788_c7_361b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1788_c7_361b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1788_c7_361b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1788_c7_361b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1788_c7_361b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1788_c7_361b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1788_c7_361b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1788_c7_361b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1788_c7_361b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1788_c7_361b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1788_c7_361b_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1783_c7_a611] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1783_c7_a611_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1783_c7_a611_cond;
     tmp16_MUX_uxn_opcodes_h_l1783_c7_a611_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1783_c7_a611_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1783_c7_a611_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1783_c7_a611_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1783_c7_a611_return_output := tmp16_MUX_uxn_opcodes_h_l1783_c7_a611_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1788_c7_361b] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1788_c7_361b_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1788_c7_361b_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1788_c7_361b_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1788_c7_361b_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1788_c7_361b_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1788_c7_361b_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1788_c7_361b_return_output := result_stack_value_MUX_uxn_opcodes_h_l1788_c7_361b_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_a611_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1788_c7_361b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1783_c7_a611_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1788_c7_361b_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1779_c7_91d9_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1783_c7_a611_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1765_c2_c766_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1770_c7_583d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_91d9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_a611_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1783_c7_a611_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1788_c7_361b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1779_c7_91d9_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1783_c7_a611_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1779_c7_91d9] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1779_c7_91d9_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1779_c7_91d9_cond;
     tmp16_MUX_uxn_opcodes_h_l1779_c7_91d9_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1779_c7_91d9_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1779_c7_91d9_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1779_c7_91d9_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1779_c7_91d9_return_output := tmp16_MUX_uxn_opcodes_h_l1779_c7_91d9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1783_c7_a611] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1783_c7_a611_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1783_c7_a611_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1783_c7_a611_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1783_c7_a611_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1783_c7_a611_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1783_c7_a611_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1783_c7_a611_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1783_c7_a611_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1779_c7_91d9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_91d9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_91d9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_91d9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_91d9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_91d9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_91d9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_91d9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_91d9_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1783_c7_a611] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1783_c7_a611_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1783_c7_a611_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1783_c7_a611_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1783_c7_a611_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1783_c7_a611_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1783_c7_a611_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1783_c7_a611_return_output := result_stack_value_MUX_uxn_opcodes_h_l1783_c7_a611_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1783_c7_a611] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_a611_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_a611_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_a611_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_a611_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_a611_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_a611_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_a611_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_a611_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1765_c2_c766] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1765_c2_c766_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1765_c2_c766_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1765_c2_c766_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1765_c2_c766_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1765_c2_c766_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1765_c2_c766_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1765_c2_c766_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1765_c2_c766_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1779_c7_91d9] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1779_c7_91d9_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1779_c7_91d9_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1779_c7_91d9_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1779_c7_91d9_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1779_c7_91d9_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1779_c7_91d9_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1779_c7_91d9_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1779_c7_91d9_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_91d9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_a611_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_91d9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1783_c7_a611_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1773_c7_bde4_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1779_c7_91d9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_bde4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_91d9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1779_c7_91d9_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1783_c7_a611_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1773_c7_bde4_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1779_c7_91d9_return_output;
     -- result_ram_addr_MUX[uxn_opcodes_h_l1773_c7_bde4] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1773_c7_bde4_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1773_c7_bde4_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1773_c7_bde4_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1773_c7_bde4_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1773_c7_bde4_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1773_c7_bde4_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1773_c7_bde4_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1773_c7_bde4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1779_c7_91d9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_91d9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_91d9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_91d9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_91d9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_91d9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_91d9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_91d9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_91d9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1779_c7_91d9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_91d9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_91d9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_91d9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_91d9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_91d9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_91d9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_91d9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_91d9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1773_c7_bde4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_bde4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_bde4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_bde4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_bde4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_bde4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_bde4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_bde4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_bde4_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1779_c7_91d9] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1779_c7_91d9_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1779_c7_91d9_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1779_c7_91d9_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1779_c7_91d9_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1779_c7_91d9_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1779_c7_91d9_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1779_c7_91d9_return_output := result_stack_value_MUX_uxn_opcodes_h_l1779_c7_91d9_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1773_c7_bde4] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1773_c7_bde4_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1773_c7_bde4_cond;
     tmp16_MUX_uxn_opcodes_h_l1773_c7_bde4_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1773_c7_bde4_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1773_c7_bde4_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1773_c7_bde4_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1773_c7_bde4_return_output := tmp16_MUX_uxn_opcodes_h_l1773_c7_bde4_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_bde4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_91d9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_bde4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_91d9_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1770_c7_583d_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1773_c7_bde4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1770_c7_583d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_bde4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1773_c7_bde4_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1779_c7_91d9_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1770_c7_583d_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1773_c7_bde4_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1770_c7_583d] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1770_c7_583d_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1770_c7_583d_cond;
     tmp16_MUX_uxn_opcodes_h_l1770_c7_583d_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1770_c7_583d_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1770_c7_583d_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1770_c7_583d_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1770_c7_583d_return_output := tmp16_MUX_uxn_opcodes_h_l1770_c7_583d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1773_c7_bde4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_bde4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_bde4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_bde4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_bde4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_bde4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_bde4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_bde4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_bde4_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1773_c7_bde4] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1773_c7_bde4_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1773_c7_bde4_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1773_c7_bde4_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1773_c7_bde4_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1773_c7_bde4_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1773_c7_bde4_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1773_c7_bde4_return_output := result_stack_value_MUX_uxn_opcodes_h_l1773_c7_bde4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1770_c7_583d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1770_c7_583d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1770_c7_583d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1770_c7_583d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1770_c7_583d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1770_c7_583d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1770_c7_583d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1770_c7_583d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1770_c7_583d_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1770_c7_583d] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1770_c7_583d_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1770_c7_583d_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1770_c7_583d_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1770_c7_583d_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1770_c7_583d_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1770_c7_583d_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1770_c7_583d_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1770_c7_583d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1773_c7_bde4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_bde4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_bde4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_bde4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_bde4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_bde4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_bde4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_bde4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_bde4_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1770_c7_583d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_bde4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1770_c7_583d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_bde4_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1765_c2_c766_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1770_c7_583d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1765_c2_c766_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1770_c7_583d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1770_c7_583d_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1773_c7_bde4_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1765_c2_c766_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1770_c7_583d_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1770_c7_583d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1770_c7_583d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1770_c7_583d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1770_c7_583d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1770_c7_583d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1770_c7_583d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1770_c7_583d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1770_c7_583d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1770_c7_583d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1770_c7_583d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1770_c7_583d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1770_c7_583d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1770_c7_583d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1770_c7_583d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1770_c7_583d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1770_c7_583d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1770_c7_583d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1770_c7_583d_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1770_c7_583d] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1770_c7_583d_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1770_c7_583d_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1770_c7_583d_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1770_c7_583d_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1770_c7_583d_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1770_c7_583d_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1770_c7_583d_return_output := result_stack_value_MUX_uxn_opcodes_h_l1770_c7_583d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1765_c2_c766] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1765_c2_c766_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1765_c2_c766_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1765_c2_c766_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1765_c2_c766_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1765_c2_c766_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1765_c2_c766_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1765_c2_c766_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1765_c2_c766_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1765_c2_c766] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1765_c2_c766_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1765_c2_c766_cond;
     tmp16_MUX_uxn_opcodes_h_l1765_c2_c766_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1765_c2_c766_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1765_c2_c766_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1765_c2_c766_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1765_c2_c766_return_output := tmp16_MUX_uxn_opcodes_h_l1765_c2_c766_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1765_c2_c766] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1765_c2_c766_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1765_c2_c766_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1765_c2_c766_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1765_c2_c766_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1765_c2_c766_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1765_c2_c766_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1765_c2_c766_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1765_c2_c766_return_output;

     -- Submodule level 9
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1765_c2_c766_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1770_c7_583d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1765_c2_c766_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1770_c7_583d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1765_c2_c766_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1770_c7_583d_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1765_c2_c766_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1765_c2_c766] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1765_c2_c766_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1765_c2_c766_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1765_c2_c766_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1765_c2_c766_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1765_c2_c766_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1765_c2_c766_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1765_c2_c766_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1765_c2_c766_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1765_c2_c766] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1765_c2_c766_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1765_c2_c766_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1765_c2_c766_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1765_c2_c766_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1765_c2_c766_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1765_c2_c766_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1765_c2_c766_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1765_c2_c766_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1765_c2_c766] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1765_c2_c766_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1765_c2_c766_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1765_c2_c766_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1765_c2_c766_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1765_c2_c766_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1765_c2_c766_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1765_c2_c766_return_output := result_stack_value_MUX_uxn_opcodes_h_l1765_c2_c766_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_5b20_uxn_opcodes_h_l1760_l1806_DUPLICATE_cd1f LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5b20_uxn_opcodes_h_l1760_l1806_DUPLICATE_cd1f_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_5b20(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1765_c2_c766_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1765_c2_c766_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1765_c2_c766_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1765_c2_c766_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1765_c2_c766_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1765_c2_c766_return_output,
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1765_c2_c766_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5b20_uxn_opcodes_h_l1760_l1806_DUPLICATE_cd1f_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5b20_uxn_opcodes_h_l1760_l1806_DUPLICATE_cd1f_return_output;
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
