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
-- Submodules: 58
entity lth2_0CLK_0226dad5 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end lth2_0CLK_0226dad5;
architecture arch of lth2_0CLK_0226dad5 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1896_c6_01f7]
signal BIN_OP_EQ_uxn_opcodes_h_l1896_c6_01f7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1896_c6_01f7_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1896_c6_01f7_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1896_c2_a2b0]
signal n16_MUX_uxn_opcodes_h_l1896_c2_a2b0_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1896_c2_a2b0_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1896_c2_a2b0_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1896_c2_a2b0_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1896_c2_a2b0]
signal t16_MUX_uxn_opcodes_h_l1896_c2_a2b0_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1896_c2_a2b0_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1896_c2_a2b0_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1896_c2_a2b0_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1896_c2_a2b0]
signal result_u8_value_MUX_uxn_opcodes_h_l1896_c2_a2b0_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1896_c2_a2b0_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1896_c2_a2b0_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1896_c2_a2b0_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1896_c2_a2b0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1896_c2_a2b0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1896_c2_a2b0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1896_c2_a2b0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1896_c2_a2b0_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1896_c2_a2b0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1896_c2_a2b0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1896_c2_a2b0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1896_c2_a2b0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1896_c2_a2b0_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1896_c2_a2b0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c2_a2b0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c2_a2b0_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c2_a2b0_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c2_a2b0_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1896_c2_a2b0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1896_c2_a2b0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1896_c2_a2b0_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1896_c2_a2b0_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1896_c2_a2b0_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1903_c11_6eec]
signal BIN_OP_EQ_uxn_opcodes_h_l1903_c11_6eec_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1903_c11_6eec_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1903_c11_6eec_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1903_c7_96e3]
signal n16_MUX_uxn_opcodes_h_l1903_c7_96e3_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1903_c7_96e3_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1903_c7_96e3_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1903_c7_96e3_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1903_c7_96e3]
signal t16_MUX_uxn_opcodes_h_l1903_c7_96e3_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1903_c7_96e3_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1903_c7_96e3_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1903_c7_96e3_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1903_c7_96e3]
signal result_u8_value_MUX_uxn_opcodes_h_l1903_c7_96e3_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1903_c7_96e3_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1903_c7_96e3_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1903_c7_96e3_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1903_c7_96e3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1903_c7_96e3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1903_c7_96e3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1903_c7_96e3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1903_c7_96e3_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1903_c7_96e3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1903_c7_96e3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1903_c7_96e3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1903_c7_96e3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1903_c7_96e3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1903_c7_96e3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c7_96e3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c7_96e3_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c7_96e3_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c7_96e3_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1903_c7_96e3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1903_c7_96e3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1903_c7_96e3_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1903_c7_96e3_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1903_c7_96e3_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1906_c11_8127]
signal BIN_OP_EQ_uxn_opcodes_h_l1906_c11_8127_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1906_c11_8127_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1906_c11_8127_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1906_c7_aac4]
signal n16_MUX_uxn_opcodes_h_l1906_c7_aac4_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1906_c7_aac4_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1906_c7_aac4_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1906_c7_aac4_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1906_c7_aac4]
signal t16_MUX_uxn_opcodes_h_l1906_c7_aac4_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1906_c7_aac4_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1906_c7_aac4_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1906_c7_aac4_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1906_c7_aac4]
signal result_u8_value_MUX_uxn_opcodes_h_l1906_c7_aac4_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1906_c7_aac4_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1906_c7_aac4_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1906_c7_aac4_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1906_c7_aac4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1906_c7_aac4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1906_c7_aac4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1906_c7_aac4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1906_c7_aac4_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1906_c7_aac4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1906_c7_aac4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1906_c7_aac4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1906_c7_aac4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1906_c7_aac4_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1906_c7_aac4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c7_aac4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c7_aac4_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c7_aac4_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c7_aac4_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1906_c7_aac4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c7_aac4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c7_aac4_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c7_aac4_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c7_aac4_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1911_c11_09b2]
signal BIN_OP_EQ_uxn_opcodes_h_l1911_c11_09b2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1911_c11_09b2_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1911_c11_09b2_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1911_c7_bab2]
signal n16_MUX_uxn_opcodes_h_l1911_c7_bab2_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1911_c7_bab2_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1911_c7_bab2_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1911_c7_bab2_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1911_c7_bab2]
signal t16_MUX_uxn_opcodes_h_l1911_c7_bab2_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1911_c7_bab2_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1911_c7_bab2_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1911_c7_bab2_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1911_c7_bab2]
signal result_u8_value_MUX_uxn_opcodes_h_l1911_c7_bab2_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1911_c7_bab2_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1911_c7_bab2_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1911_c7_bab2_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1911_c7_bab2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_bab2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_bab2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_bab2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_bab2_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1911_c7_bab2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_bab2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_bab2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_bab2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_bab2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1911_c7_bab2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_bab2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_bab2_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_bab2_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_bab2_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1911_c7_bab2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_bab2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_bab2_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_bab2_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_bab2_return_output : signed(3 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1912_c3_3834]
signal BIN_OP_OR_uxn_opcodes_h_l1912_c3_3834_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1912_c3_3834_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1912_c3_3834_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1915_c11_c0f6]
signal BIN_OP_EQ_uxn_opcodes_h_l1915_c11_c0f6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1915_c11_c0f6_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1915_c11_c0f6_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1915_c7_4683]
signal n16_MUX_uxn_opcodes_h_l1915_c7_4683_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1915_c7_4683_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1915_c7_4683_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1915_c7_4683_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1915_c7_4683]
signal result_u8_value_MUX_uxn_opcodes_h_l1915_c7_4683_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1915_c7_4683_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1915_c7_4683_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1915_c7_4683_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1915_c7_4683]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1915_c7_4683_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1915_c7_4683_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1915_c7_4683_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1915_c7_4683_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1915_c7_4683]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1915_c7_4683_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1915_c7_4683_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1915_c7_4683_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1915_c7_4683_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1915_c7_4683]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1915_c7_4683_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1915_c7_4683_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1915_c7_4683_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1915_c7_4683_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1915_c7_4683]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1915_c7_4683_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1915_c7_4683_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1915_c7_4683_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1915_c7_4683_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1919_c11_afb2]
signal BIN_OP_EQ_uxn_opcodes_h_l1919_c11_afb2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1919_c11_afb2_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1919_c11_afb2_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1919_c7_a17d]
signal n16_MUX_uxn_opcodes_h_l1919_c7_a17d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1919_c7_a17d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1919_c7_a17d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1919_c7_a17d_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1919_c7_a17d]
signal result_u8_value_MUX_uxn_opcodes_h_l1919_c7_a17d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1919_c7_a17d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1919_c7_a17d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1919_c7_a17d_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1919_c7_a17d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_a17d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_a17d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_a17d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_a17d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1919_c7_a17d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_a17d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_a17d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_a17d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_a17d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1919_c7_a17d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_a17d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_a17d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_a17d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_a17d_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1919_c7_a17d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_a17d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_a17d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_a17d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_a17d_return_output : signed(3 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1920_c3_027a]
signal BIN_OP_OR_uxn_opcodes_h_l1920_c3_027a_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1920_c3_027a_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1920_c3_027a_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1922_c30_4693]
signal sp_relative_shift_uxn_opcodes_h_l1922_c30_4693_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1922_c30_4693_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1922_c30_4693_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1922_c30_4693_return_output : signed(3 downto 0);

-- BIN_OP_LT[uxn_opcodes_h_l1925_c21_f132]
signal BIN_OP_LT_uxn_opcodes_h_l1925_c21_f132_left : unsigned(15 downto 0);
signal BIN_OP_LT_uxn_opcodes_h_l1925_c21_f132_right : unsigned(15 downto 0);
signal BIN_OP_LT_uxn_opcodes_h_l1925_c21_f132_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1925_c21_ef0c]
signal MUX_uxn_opcodes_h_l1925_c21_ef0c_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1925_c21_ef0c_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1925_c21_ef0c_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1925_c21_ef0c_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1927_c11_c692]
signal BIN_OP_EQ_uxn_opcodes_h_l1927_c11_c692_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1927_c11_c692_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1927_c11_c692_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1927_c7_597b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_597b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_597b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_597b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_597b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1927_c7_597b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_597b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_597b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_597b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_597b_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1927_c7_597b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_597b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_597b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_597b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_597b_return_output : signed(3 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1917_l1908_DUPLICATE_f36d
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1917_l1908_DUPLICATE_f36d_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1917_l1908_DUPLICATE_f36d_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_eae7( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : signed) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.u8_value := ref_toks_1;
      base.is_stack_write := ref_toks_2;
      base.is_opc_done := ref_toks_3;
      base.stack_address_sp_offset := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1896_c6_01f7
BIN_OP_EQ_uxn_opcodes_h_l1896_c6_01f7 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1896_c6_01f7_left,
BIN_OP_EQ_uxn_opcodes_h_l1896_c6_01f7_right,
BIN_OP_EQ_uxn_opcodes_h_l1896_c6_01f7_return_output);

-- n16_MUX_uxn_opcodes_h_l1896_c2_a2b0
n16_MUX_uxn_opcodes_h_l1896_c2_a2b0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1896_c2_a2b0_cond,
n16_MUX_uxn_opcodes_h_l1896_c2_a2b0_iftrue,
n16_MUX_uxn_opcodes_h_l1896_c2_a2b0_iffalse,
n16_MUX_uxn_opcodes_h_l1896_c2_a2b0_return_output);

-- t16_MUX_uxn_opcodes_h_l1896_c2_a2b0
t16_MUX_uxn_opcodes_h_l1896_c2_a2b0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1896_c2_a2b0_cond,
t16_MUX_uxn_opcodes_h_l1896_c2_a2b0_iftrue,
t16_MUX_uxn_opcodes_h_l1896_c2_a2b0_iffalse,
t16_MUX_uxn_opcodes_h_l1896_c2_a2b0_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1896_c2_a2b0
result_u8_value_MUX_uxn_opcodes_h_l1896_c2_a2b0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1896_c2_a2b0_cond,
result_u8_value_MUX_uxn_opcodes_h_l1896_c2_a2b0_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1896_c2_a2b0_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1896_c2_a2b0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1896_c2_a2b0
result_is_stack_write_MUX_uxn_opcodes_h_l1896_c2_a2b0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1896_c2_a2b0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1896_c2_a2b0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1896_c2_a2b0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1896_c2_a2b0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1896_c2_a2b0
result_is_opc_done_MUX_uxn_opcodes_h_l1896_c2_a2b0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1896_c2_a2b0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1896_c2_a2b0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1896_c2_a2b0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1896_c2_a2b0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c2_a2b0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c2_a2b0 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c2_a2b0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c2_a2b0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c2_a2b0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c2_a2b0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1896_c2_a2b0
result_sp_relative_shift_MUX_uxn_opcodes_h_l1896_c2_a2b0 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1896_c2_a2b0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1896_c2_a2b0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1896_c2_a2b0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1896_c2_a2b0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1903_c11_6eec
BIN_OP_EQ_uxn_opcodes_h_l1903_c11_6eec : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1903_c11_6eec_left,
BIN_OP_EQ_uxn_opcodes_h_l1903_c11_6eec_right,
BIN_OP_EQ_uxn_opcodes_h_l1903_c11_6eec_return_output);

-- n16_MUX_uxn_opcodes_h_l1903_c7_96e3
n16_MUX_uxn_opcodes_h_l1903_c7_96e3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1903_c7_96e3_cond,
n16_MUX_uxn_opcodes_h_l1903_c7_96e3_iftrue,
n16_MUX_uxn_opcodes_h_l1903_c7_96e3_iffalse,
n16_MUX_uxn_opcodes_h_l1903_c7_96e3_return_output);

-- t16_MUX_uxn_opcodes_h_l1903_c7_96e3
t16_MUX_uxn_opcodes_h_l1903_c7_96e3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1903_c7_96e3_cond,
t16_MUX_uxn_opcodes_h_l1903_c7_96e3_iftrue,
t16_MUX_uxn_opcodes_h_l1903_c7_96e3_iffalse,
t16_MUX_uxn_opcodes_h_l1903_c7_96e3_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1903_c7_96e3
result_u8_value_MUX_uxn_opcodes_h_l1903_c7_96e3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1903_c7_96e3_cond,
result_u8_value_MUX_uxn_opcodes_h_l1903_c7_96e3_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1903_c7_96e3_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1903_c7_96e3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1903_c7_96e3
result_is_stack_write_MUX_uxn_opcodes_h_l1903_c7_96e3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1903_c7_96e3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1903_c7_96e3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1903_c7_96e3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1903_c7_96e3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1903_c7_96e3
result_is_opc_done_MUX_uxn_opcodes_h_l1903_c7_96e3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1903_c7_96e3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1903_c7_96e3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1903_c7_96e3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1903_c7_96e3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c7_96e3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c7_96e3 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c7_96e3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c7_96e3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c7_96e3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c7_96e3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1903_c7_96e3
result_sp_relative_shift_MUX_uxn_opcodes_h_l1903_c7_96e3 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1903_c7_96e3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1903_c7_96e3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1903_c7_96e3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1903_c7_96e3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1906_c11_8127
BIN_OP_EQ_uxn_opcodes_h_l1906_c11_8127 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1906_c11_8127_left,
BIN_OP_EQ_uxn_opcodes_h_l1906_c11_8127_right,
BIN_OP_EQ_uxn_opcodes_h_l1906_c11_8127_return_output);

-- n16_MUX_uxn_opcodes_h_l1906_c7_aac4
n16_MUX_uxn_opcodes_h_l1906_c7_aac4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1906_c7_aac4_cond,
n16_MUX_uxn_opcodes_h_l1906_c7_aac4_iftrue,
n16_MUX_uxn_opcodes_h_l1906_c7_aac4_iffalse,
n16_MUX_uxn_opcodes_h_l1906_c7_aac4_return_output);

-- t16_MUX_uxn_opcodes_h_l1906_c7_aac4
t16_MUX_uxn_opcodes_h_l1906_c7_aac4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1906_c7_aac4_cond,
t16_MUX_uxn_opcodes_h_l1906_c7_aac4_iftrue,
t16_MUX_uxn_opcodes_h_l1906_c7_aac4_iffalse,
t16_MUX_uxn_opcodes_h_l1906_c7_aac4_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1906_c7_aac4
result_u8_value_MUX_uxn_opcodes_h_l1906_c7_aac4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1906_c7_aac4_cond,
result_u8_value_MUX_uxn_opcodes_h_l1906_c7_aac4_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1906_c7_aac4_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1906_c7_aac4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1906_c7_aac4
result_is_stack_write_MUX_uxn_opcodes_h_l1906_c7_aac4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1906_c7_aac4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1906_c7_aac4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1906_c7_aac4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1906_c7_aac4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1906_c7_aac4
result_is_opc_done_MUX_uxn_opcodes_h_l1906_c7_aac4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1906_c7_aac4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1906_c7_aac4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1906_c7_aac4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1906_c7_aac4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c7_aac4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c7_aac4 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c7_aac4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c7_aac4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c7_aac4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c7_aac4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c7_aac4
result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c7_aac4 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c7_aac4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c7_aac4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c7_aac4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c7_aac4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1911_c11_09b2
BIN_OP_EQ_uxn_opcodes_h_l1911_c11_09b2 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1911_c11_09b2_left,
BIN_OP_EQ_uxn_opcodes_h_l1911_c11_09b2_right,
BIN_OP_EQ_uxn_opcodes_h_l1911_c11_09b2_return_output);

-- n16_MUX_uxn_opcodes_h_l1911_c7_bab2
n16_MUX_uxn_opcodes_h_l1911_c7_bab2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1911_c7_bab2_cond,
n16_MUX_uxn_opcodes_h_l1911_c7_bab2_iftrue,
n16_MUX_uxn_opcodes_h_l1911_c7_bab2_iffalse,
n16_MUX_uxn_opcodes_h_l1911_c7_bab2_return_output);

-- t16_MUX_uxn_opcodes_h_l1911_c7_bab2
t16_MUX_uxn_opcodes_h_l1911_c7_bab2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1911_c7_bab2_cond,
t16_MUX_uxn_opcodes_h_l1911_c7_bab2_iftrue,
t16_MUX_uxn_opcodes_h_l1911_c7_bab2_iffalse,
t16_MUX_uxn_opcodes_h_l1911_c7_bab2_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1911_c7_bab2
result_u8_value_MUX_uxn_opcodes_h_l1911_c7_bab2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1911_c7_bab2_cond,
result_u8_value_MUX_uxn_opcodes_h_l1911_c7_bab2_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1911_c7_bab2_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1911_c7_bab2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_bab2
result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_bab2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_bab2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_bab2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_bab2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_bab2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_bab2
result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_bab2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_bab2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_bab2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_bab2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_bab2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_bab2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_bab2 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_bab2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_bab2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_bab2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_bab2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_bab2
result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_bab2 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_bab2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_bab2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_bab2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_bab2_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1912_c3_3834
BIN_OP_OR_uxn_opcodes_h_l1912_c3_3834 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1912_c3_3834_left,
BIN_OP_OR_uxn_opcodes_h_l1912_c3_3834_right,
BIN_OP_OR_uxn_opcodes_h_l1912_c3_3834_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1915_c11_c0f6
BIN_OP_EQ_uxn_opcodes_h_l1915_c11_c0f6 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1915_c11_c0f6_left,
BIN_OP_EQ_uxn_opcodes_h_l1915_c11_c0f6_right,
BIN_OP_EQ_uxn_opcodes_h_l1915_c11_c0f6_return_output);

-- n16_MUX_uxn_opcodes_h_l1915_c7_4683
n16_MUX_uxn_opcodes_h_l1915_c7_4683 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1915_c7_4683_cond,
n16_MUX_uxn_opcodes_h_l1915_c7_4683_iftrue,
n16_MUX_uxn_opcodes_h_l1915_c7_4683_iffalse,
n16_MUX_uxn_opcodes_h_l1915_c7_4683_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1915_c7_4683
result_u8_value_MUX_uxn_opcodes_h_l1915_c7_4683 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1915_c7_4683_cond,
result_u8_value_MUX_uxn_opcodes_h_l1915_c7_4683_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1915_c7_4683_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1915_c7_4683_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1915_c7_4683
result_is_stack_write_MUX_uxn_opcodes_h_l1915_c7_4683 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1915_c7_4683_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1915_c7_4683_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1915_c7_4683_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1915_c7_4683_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1915_c7_4683
result_is_opc_done_MUX_uxn_opcodes_h_l1915_c7_4683 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1915_c7_4683_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1915_c7_4683_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1915_c7_4683_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1915_c7_4683_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1915_c7_4683
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1915_c7_4683 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1915_c7_4683_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1915_c7_4683_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1915_c7_4683_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1915_c7_4683_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1915_c7_4683
result_sp_relative_shift_MUX_uxn_opcodes_h_l1915_c7_4683 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1915_c7_4683_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1915_c7_4683_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1915_c7_4683_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1915_c7_4683_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1919_c11_afb2
BIN_OP_EQ_uxn_opcodes_h_l1919_c11_afb2 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1919_c11_afb2_left,
BIN_OP_EQ_uxn_opcodes_h_l1919_c11_afb2_right,
BIN_OP_EQ_uxn_opcodes_h_l1919_c11_afb2_return_output);

-- n16_MUX_uxn_opcodes_h_l1919_c7_a17d
n16_MUX_uxn_opcodes_h_l1919_c7_a17d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1919_c7_a17d_cond,
n16_MUX_uxn_opcodes_h_l1919_c7_a17d_iftrue,
n16_MUX_uxn_opcodes_h_l1919_c7_a17d_iffalse,
n16_MUX_uxn_opcodes_h_l1919_c7_a17d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1919_c7_a17d
result_u8_value_MUX_uxn_opcodes_h_l1919_c7_a17d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1919_c7_a17d_cond,
result_u8_value_MUX_uxn_opcodes_h_l1919_c7_a17d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1919_c7_a17d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1919_c7_a17d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_a17d
result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_a17d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_a17d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_a17d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_a17d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_a17d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_a17d
result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_a17d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_a17d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_a17d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_a17d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_a17d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_a17d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_a17d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_a17d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_a17d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_a17d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_a17d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_a17d
result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_a17d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_a17d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_a17d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_a17d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_a17d_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1920_c3_027a
BIN_OP_OR_uxn_opcodes_h_l1920_c3_027a : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1920_c3_027a_left,
BIN_OP_OR_uxn_opcodes_h_l1920_c3_027a_right,
BIN_OP_OR_uxn_opcodes_h_l1920_c3_027a_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1922_c30_4693
sp_relative_shift_uxn_opcodes_h_l1922_c30_4693 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1922_c30_4693_ins,
sp_relative_shift_uxn_opcodes_h_l1922_c30_4693_x,
sp_relative_shift_uxn_opcodes_h_l1922_c30_4693_y,
sp_relative_shift_uxn_opcodes_h_l1922_c30_4693_return_output);

-- BIN_OP_LT_uxn_opcodes_h_l1925_c21_f132
BIN_OP_LT_uxn_opcodes_h_l1925_c21_f132 : entity work.BIN_OP_LT_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_LT_uxn_opcodes_h_l1925_c21_f132_left,
BIN_OP_LT_uxn_opcodes_h_l1925_c21_f132_right,
BIN_OP_LT_uxn_opcodes_h_l1925_c21_f132_return_output);

-- MUX_uxn_opcodes_h_l1925_c21_ef0c
MUX_uxn_opcodes_h_l1925_c21_ef0c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1925_c21_ef0c_cond,
MUX_uxn_opcodes_h_l1925_c21_ef0c_iftrue,
MUX_uxn_opcodes_h_l1925_c21_ef0c_iffalse,
MUX_uxn_opcodes_h_l1925_c21_ef0c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1927_c11_c692
BIN_OP_EQ_uxn_opcodes_h_l1927_c11_c692 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1927_c11_c692_left,
BIN_OP_EQ_uxn_opcodes_h_l1927_c11_c692_right,
BIN_OP_EQ_uxn_opcodes_h_l1927_c11_c692_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_597b
result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_597b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_597b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_597b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_597b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_597b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_597b
result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_597b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_597b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_597b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_597b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_597b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_597b
result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_597b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_597b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_597b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_597b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_597b_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1917_l1908_DUPLICATE_f36d
CONST_SL_8_uint16_t_uxn_opcodes_h_l1917_l1908_DUPLICATE_f36d : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1917_l1908_DUPLICATE_f36d_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1917_l1908_DUPLICATE_f36d_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1896_c6_01f7_return_output,
 n16_MUX_uxn_opcodes_h_l1896_c2_a2b0_return_output,
 t16_MUX_uxn_opcodes_h_l1896_c2_a2b0_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1896_c2_a2b0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1896_c2_a2b0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1896_c2_a2b0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c2_a2b0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1896_c2_a2b0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1903_c11_6eec_return_output,
 n16_MUX_uxn_opcodes_h_l1903_c7_96e3_return_output,
 t16_MUX_uxn_opcodes_h_l1903_c7_96e3_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1903_c7_96e3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1903_c7_96e3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1903_c7_96e3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c7_96e3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1903_c7_96e3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1906_c11_8127_return_output,
 n16_MUX_uxn_opcodes_h_l1906_c7_aac4_return_output,
 t16_MUX_uxn_opcodes_h_l1906_c7_aac4_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1906_c7_aac4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1906_c7_aac4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1906_c7_aac4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c7_aac4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c7_aac4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1911_c11_09b2_return_output,
 n16_MUX_uxn_opcodes_h_l1911_c7_bab2_return_output,
 t16_MUX_uxn_opcodes_h_l1911_c7_bab2_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1911_c7_bab2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_bab2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_bab2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_bab2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_bab2_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1912_c3_3834_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1915_c11_c0f6_return_output,
 n16_MUX_uxn_opcodes_h_l1915_c7_4683_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1915_c7_4683_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1915_c7_4683_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1915_c7_4683_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1915_c7_4683_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1915_c7_4683_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1919_c11_afb2_return_output,
 n16_MUX_uxn_opcodes_h_l1919_c7_a17d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1919_c7_a17d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_a17d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_a17d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_a17d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_a17d_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1920_c3_027a_return_output,
 sp_relative_shift_uxn_opcodes_h_l1922_c30_4693_return_output,
 BIN_OP_LT_uxn_opcodes_h_l1925_c21_f132_return_output,
 MUX_uxn_opcodes_h_l1925_c21_ef0c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1927_c11_c692_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_597b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_597b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_597b_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1917_l1908_DUPLICATE_f36d_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1896_c6_01f7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1896_c6_01f7_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1896_c6_01f7_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1896_c2_a2b0_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1896_c2_a2b0_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1903_c7_96e3_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1896_c2_a2b0_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1896_c2_a2b0_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1896_c2_a2b0_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1896_c2_a2b0_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1903_c7_96e3_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1896_c2_a2b0_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1896_c2_a2b0_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1896_c2_a2b0_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1896_c2_a2b0_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1903_c7_96e3_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1896_c2_a2b0_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1896_c2_a2b0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1896_c2_a2b0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1896_c2_a2b0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1903_c7_96e3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1896_c2_a2b0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1896_c2_a2b0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1896_c2_a2b0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1896_c2_a2b0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1903_c7_96e3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1896_c2_a2b0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1896_c2_a2b0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c2_a2b0_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1900_c3_9dce : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c2_a2b0_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c7_96e3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c2_a2b0_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c2_a2b0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1896_c2_a2b0_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1896_c2_a2b0_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1903_c7_96e3_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1896_c2_a2b0_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1896_c2_a2b0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1903_c11_6eec_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1903_c11_6eec_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1903_c11_6eec_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1903_c7_96e3_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1903_c7_96e3_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1906_c7_aac4_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1903_c7_96e3_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1903_c7_96e3_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1903_c7_96e3_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1906_c7_aac4_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1903_c7_96e3_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1903_c7_96e3_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1903_c7_96e3_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1906_c7_aac4_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1903_c7_96e3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1903_c7_96e3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1903_c7_96e3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1906_c7_aac4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1903_c7_96e3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1903_c7_96e3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1903_c7_96e3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1906_c7_aac4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1903_c7_96e3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c7_96e3_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1904_c3_00aa : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c7_96e3_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c7_aac4_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c7_96e3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1903_c7_96e3_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1903_c7_96e3_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c7_aac4_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1903_c7_96e3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1906_c11_8127_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1906_c11_8127_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1906_c11_8127_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1906_c7_aac4_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1906_c7_aac4_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1911_c7_bab2_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1906_c7_aac4_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1906_c7_aac4_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1906_c7_aac4_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1911_c7_bab2_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1906_c7_aac4_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1906_c7_aac4_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1906_c7_aac4_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1911_c7_bab2_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1906_c7_aac4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1906_c7_aac4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1906_c7_aac4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_bab2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1906_c7_aac4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1906_c7_aac4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1906_c7_aac4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_bab2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1906_c7_aac4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c7_aac4_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1909_c3_1dcf : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c7_aac4_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_bab2_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c7_aac4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c7_aac4_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c7_aac4_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_bab2_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c7_aac4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_09b2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_09b2_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_09b2_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1911_c7_bab2_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1911_c7_bab2_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1915_c7_4683_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1911_c7_bab2_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1911_c7_bab2_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1911_c7_bab2_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1911_c7_bab2_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1911_c7_bab2_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1911_c7_bab2_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1915_c7_4683_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1911_c7_bab2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_bab2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_bab2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1915_c7_4683_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_bab2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_bab2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_bab2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1915_c7_4683_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_bab2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_bab2_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1913_c3_8a33 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_bab2_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1915_c7_4683_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_bab2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_bab2_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_bab2_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1915_c7_4683_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_bab2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1912_c3_3834_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1912_c3_3834_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1912_c3_3834_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1915_c11_c0f6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1915_c11_c0f6_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1915_c11_c0f6_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1915_c7_4683_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1915_c7_4683_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1919_c7_a17d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1915_c7_4683_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1915_c7_4683_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1915_c7_4683_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1919_c7_a17d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1915_c7_4683_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1915_c7_4683_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1915_c7_4683_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_a17d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1915_c7_4683_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1915_c7_4683_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1915_c7_4683_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_a17d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1915_c7_4683_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1915_c7_4683_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1915_c7_4683_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_a17d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1915_c7_4683_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1915_c7_4683_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1915_c7_4683_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_a17d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1915_c7_4683_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1919_c11_afb2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1919_c11_afb2_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1919_c11_afb2_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1919_c7_a17d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1919_c7_a17d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1919_c7_a17d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1919_c7_a17d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1919_c7_a17d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1919_c7_a17d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_a17d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_a17d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_597b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_a17d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_a17d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_a17d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_597b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_a17d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_a17d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1924_c3_667e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_a17d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_a17d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_a17d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_a17d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_597b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_a17d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1920_c3_027a_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1920_c3_027a_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1920_c3_027a_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1922_c30_4693_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1922_c30_4693_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1922_c30_4693_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1922_c30_4693_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1925_c21_ef0c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_LT_uxn_opcodes_h_l1925_c21_f132_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_LT_uxn_opcodes_h_l1925_c21_f132_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_LT_uxn_opcodes_h_l1925_c21_f132_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1925_c21_ef0c_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1925_c21_ef0c_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1925_c21_ef0c_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1927_c11_c692_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1927_c11_c692_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1927_c11_c692_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_597b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_597b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_597b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_597b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_597b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_597b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_597b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1928_c3_cc06 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_597b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_597b_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1911_l1906_l1903_l1896_l1919_l1915_DUPLICATE_a21f_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1911_l1906_l1903_l1896_l1927_l1915_DUPLICATE_cd13_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1911_l1906_l1903_l1896_l1927_l1915_DUPLICATE_be85_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1911_l1906_l1903_l1927_l1919_l1915_DUPLICATE_e771_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1920_l1916_l1907_l1912_DUPLICATE_02a0_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1917_l1908_DUPLICATE_f36d_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1917_l1908_DUPLICATE_f36d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1919_l1915_DUPLICATE_de2e_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_eae7_uxn_opcodes_h_l1933_l1892_DUPLICATE_bf2e_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1903_c11_6eec_right := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1922_c30_4693_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1904_c3_00aa := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c7_96e3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1904_c3_00aa;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1928_c3_cc06 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_597b_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1928_c3_cc06;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1896_c6_01f7_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1913_c3_8a33 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_bab2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1913_c3_8a33;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1909_c3_1dcf := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c7_aac4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1909_c3_1dcf;
     VAR_MUX_uxn_opcodes_h_l1925_c21_ef0c_iftrue := resize(to_unsigned(1, 1), 8);
     VAR_sp_relative_shift_uxn_opcodes_h_l1922_c30_4693_y := resize(to_signed(-3, 3), 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1900_c3_9dce := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c2_a2b0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1900_c3_9dce;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1927_c11_c692_right := to_unsigned(6, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_597b_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1919_c11_afb2_right := to_unsigned(5, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_597b_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1925_c21_ef0c_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1924_c3_667e := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_a17d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1924_c3_667e;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_a17d_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1896_c2_a2b0_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_09b2_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1906_c11_8127_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1915_c11_c0f6_right := to_unsigned(4, 3);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1922_c30_4693_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1920_c3_027a_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1896_c2_a2b0_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1903_c7_96e3_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1906_c7_aac4_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1911_c7_bab2_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1919_c7_a17d_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1896_c6_01f7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1903_c11_6eec_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1906_c11_8127_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_09b2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1915_c11_c0f6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1919_c11_afb2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1927_c11_c692_left := VAR_phase;
     VAR_BIN_OP_LT_uxn_opcodes_h_l1925_c21_f132_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1912_c3_3834_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1896_c2_a2b0_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1903_c7_96e3_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1911_c7_bab2_iffalse := t16;
     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1919_l1915_DUPLICATE_de2e LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1919_l1915_DUPLICATE_de2e_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1911_l1906_l1903_l1896_l1927_l1915_DUPLICATE_cd13 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1911_l1906_l1903_l1896_l1927_l1915_DUPLICATE_cd13_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1911_l1906_l1903_l1896_l1919_l1915_DUPLICATE_a21f LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1911_l1906_l1903_l1896_l1919_l1915_DUPLICATE_a21f_return_output := result.u8_value;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1911_l1906_l1903_l1896_l1927_l1915_DUPLICATE_be85 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1911_l1906_l1903_l1896_l1927_l1915_DUPLICATE_be85_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1896_c6_01f7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1896_c6_01f7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1896_c6_01f7_left;
     BIN_OP_EQ_uxn_opcodes_h_l1896_c6_01f7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1896_c6_01f7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1896_c6_01f7_return_output := BIN_OP_EQ_uxn_opcodes_h_l1896_c6_01f7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1906_c11_8127] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1906_c11_8127_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1906_c11_8127_left;
     BIN_OP_EQ_uxn_opcodes_h_l1906_c11_8127_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1906_c11_8127_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1906_c11_8127_return_output := BIN_OP_EQ_uxn_opcodes_h_l1906_c11_8127_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1911_c11_09b2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1911_c11_09b2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_09b2_left;
     BIN_OP_EQ_uxn_opcodes_h_l1911_c11_09b2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_09b2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_09b2_return_output := BIN_OP_EQ_uxn_opcodes_h_l1911_c11_09b2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1927_c11_c692] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1927_c11_c692_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1927_c11_c692_left;
     BIN_OP_EQ_uxn_opcodes_h_l1927_c11_c692_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1927_c11_c692_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1927_c11_c692_return_output := BIN_OP_EQ_uxn_opcodes_h_l1927_c11_c692_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1920_l1916_l1907_l1912_DUPLICATE_02a0 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1920_l1916_l1907_l1912_DUPLICATE_02a0_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1915_c11_c0f6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1915_c11_c0f6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1915_c11_c0f6_left;
     BIN_OP_EQ_uxn_opcodes_h_l1915_c11_c0f6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1915_c11_c0f6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1915_c11_c0f6_return_output := BIN_OP_EQ_uxn_opcodes_h_l1915_c11_c0f6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1919_c11_afb2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1919_c11_afb2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1919_c11_afb2_left;
     BIN_OP_EQ_uxn_opcodes_h_l1919_c11_afb2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1919_c11_afb2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1919_c11_afb2_return_output := BIN_OP_EQ_uxn_opcodes_h_l1919_c11_afb2_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l1922_c30_4693] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1922_c30_4693_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1922_c30_4693_ins;
     sp_relative_shift_uxn_opcodes_h_l1922_c30_4693_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1922_c30_4693_x;
     sp_relative_shift_uxn_opcodes_h_l1922_c30_4693_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1922_c30_4693_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1922_c30_4693_return_output := sp_relative_shift_uxn_opcodes_h_l1922_c30_4693_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1911_l1906_l1903_l1927_l1919_l1915_DUPLICATE_e771 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1911_l1906_l1903_l1927_l1919_l1915_DUPLICATE_e771_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1903_c11_6eec] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1903_c11_6eec_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1903_c11_6eec_left;
     BIN_OP_EQ_uxn_opcodes_h_l1903_c11_6eec_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1903_c11_6eec_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1903_c11_6eec_return_output := BIN_OP_EQ_uxn_opcodes_h_l1903_c11_6eec_return_output;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l1896_c2_a2b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1896_c6_01f7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1896_c2_a2b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1896_c6_01f7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1896_c2_a2b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1896_c6_01f7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1896_c2_a2b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1896_c6_01f7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c2_a2b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1896_c6_01f7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1896_c2_a2b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1896_c6_01f7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1896_c2_a2b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1896_c6_01f7_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1903_c7_96e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1903_c11_6eec_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1903_c7_96e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1903_c11_6eec_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1903_c7_96e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1903_c11_6eec_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1903_c7_96e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1903_c11_6eec_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c7_96e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1903_c11_6eec_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1903_c7_96e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1903_c11_6eec_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1903_c7_96e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1903_c11_6eec_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1906_c7_aac4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1906_c11_8127_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1906_c7_aac4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1906_c11_8127_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1906_c7_aac4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1906_c11_8127_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c7_aac4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1906_c11_8127_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c7_aac4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1906_c11_8127_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1906_c7_aac4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1906_c11_8127_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1906_c7_aac4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1906_c11_8127_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1911_c7_bab2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_09b2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_bab2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_09b2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_bab2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_09b2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_bab2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_09b2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_bab2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_09b2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1911_c7_bab2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_09b2_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1911_c7_bab2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_09b2_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1915_c7_4683_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1915_c11_c0f6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1915_c7_4683_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1915_c11_c0f6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1915_c7_4683_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1915_c11_c0f6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1915_c7_4683_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1915_c11_c0f6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1915_c7_4683_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1915_c11_c0f6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1915_c7_4683_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1915_c11_c0f6_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1919_c7_a17d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1919_c11_afb2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_a17d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1919_c11_afb2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_a17d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1919_c11_afb2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_a17d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1919_c11_afb2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_a17d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1919_c11_afb2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1919_c7_a17d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1919_c11_afb2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_597b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1927_c11_c692_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_597b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1927_c11_c692_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_597b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1927_c11_c692_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1912_c3_3834_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1920_l1916_l1907_l1912_DUPLICATE_02a0_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1920_c3_027a_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1920_l1916_l1907_l1912_DUPLICATE_02a0_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1917_l1908_DUPLICATE_f36d_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1920_l1916_l1907_l1912_DUPLICATE_02a0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1896_c2_a2b0_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1911_l1906_l1903_l1896_l1927_l1915_DUPLICATE_be85_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1903_c7_96e3_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1911_l1906_l1903_l1896_l1927_l1915_DUPLICATE_be85_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c7_aac4_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1911_l1906_l1903_l1896_l1927_l1915_DUPLICATE_be85_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_bab2_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1911_l1906_l1903_l1896_l1927_l1915_DUPLICATE_be85_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1915_c7_4683_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1911_l1906_l1903_l1896_l1927_l1915_DUPLICATE_be85_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_597b_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1911_l1906_l1903_l1896_l1927_l1915_DUPLICATE_be85_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1903_c7_96e3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1911_l1906_l1903_l1927_l1919_l1915_DUPLICATE_e771_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1906_c7_aac4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1911_l1906_l1903_l1927_l1919_l1915_DUPLICATE_e771_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_bab2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1911_l1906_l1903_l1927_l1919_l1915_DUPLICATE_e771_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1915_c7_4683_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1911_l1906_l1903_l1927_l1919_l1915_DUPLICATE_e771_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_a17d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1911_l1906_l1903_l1927_l1919_l1915_DUPLICATE_e771_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_597b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1911_l1906_l1903_l1927_l1919_l1915_DUPLICATE_e771_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1896_c2_a2b0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1911_l1906_l1903_l1896_l1927_l1915_DUPLICATE_cd13_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1903_c7_96e3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1911_l1906_l1903_l1896_l1927_l1915_DUPLICATE_cd13_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1906_c7_aac4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1911_l1906_l1903_l1896_l1927_l1915_DUPLICATE_cd13_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_bab2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1911_l1906_l1903_l1896_l1927_l1915_DUPLICATE_cd13_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1915_c7_4683_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1911_l1906_l1903_l1896_l1927_l1915_DUPLICATE_cd13_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_597b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1911_l1906_l1903_l1896_l1927_l1915_DUPLICATE_cd13_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1915_c7_4683_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1919_l1915_DUPLICATE_de2e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_a17d_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1919_l1915_DUPLICATE_de2e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1896_c2_a2b0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1911_l1906_l1903_l1896_l1919_l1915_DUPLICATE_a21f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1903_c7_96e3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1911_l1906_l1903_l1896_l1919_l1915_DUPLICATE_a21f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1906_c7_aac4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1911_l1906_l1903_l1896_l1919_l1915_DUPLICATE_a21f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1911_c7_bab2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1911_l1906_l1903_l1896_l1919_l1915_DUPLICATE_a21f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1915_c7_4683_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1911_l1906_l1903_l1896_l1919_l1915_DUPLICATE_a21f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1919_c7_a17d_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1911_l1906_l1903_l1896_l1919_l1915_DUPLICATE_a21f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_a17d_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1922_c30_4693_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1919_c7_a17d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_a17d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_a17d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_a17d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_a17d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_a17d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_a17d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_a17d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_a17d_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1912_c3_3834] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1912_c3_3834_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1912_c3_3834_left;
     BIN_OP_OR_uxn_opcodes_h_l1912_c3_3834_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1912_c3_3834_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1912_c3_3834_return_output := BIN_OP_OR_uxn_opcodes_h_l1912_c3_3834_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1917_l1908_DUPLICATE_f36d LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1917_l1908_DUPLICATE_f36d_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1917_l1908_DUPLICATE_f36d_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1917_l1908_DUPLICATE_f36d_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1917_l1908_DUPLICATE_f36d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1927_c7_597b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_597b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_597b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_597b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_597b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_597b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_597b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_597b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_597b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1927_c7_597b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_597b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_597b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_597b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_597b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_597b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_597b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_597b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_597b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1927_c7_597b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_597b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_597b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_597b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_597b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_597b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_597b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_597b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_597b_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1920_c3_027a] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1920_c3_027a_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1920_c3_027a_left;
     BIN_OP_OR_uxn_opcodes_h_l1920_c3_027a_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1920_c3_027a_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1920_c3_027a_return_output := BIN_OP_OR_uxn_opcodes_h_l1920_c3_027a_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1911_c7_bab2_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1912_c3_3834_return_output;
     VAR_BIN_OP_LT_uxn_opcodes_h_l1925_c21_f132_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1920_c3_027a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1919_c7_a17d_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1920_c3_027a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1915_c7_4683_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1917_l1908_DUPLICATE_f36d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1906_c7_aac4_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1917_l1908_DUPLICATE_f36d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_a17d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_597b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_a17d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_597b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_a17d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_597b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1915_c7_4683_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_a17d_return_output;
     -- t16_MUX[uxn_opcodes_h_l1911_c7_bab2] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1911_c7_bab2_cond <= VAR_t16_MUX_uxn_opcodes_h_l1911_c7_bab2_cond;
     t16_MUX_uxn_opcodes_h_l1911_c7_bab2_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1911_c7_bab2_iftrue;
     t16_MUX_uxn_opcodes_h_l1911_c7_bab2_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1911_c7_bab2_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1911_c7_bab2_return_output := t16_MUX_uxn_opcodes_h_l1911_c7_bab2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1919_c7_a17d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_a17d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_a17d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_a17d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_a17d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_a17d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_a17d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_a17d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_a17d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1919_c7_a17d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_a17d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_a17d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_a17d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_a17d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_a17d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_a17d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_a17d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_a17d_return_output;

     -- n16_MUX[uxn_opcodes_h_l1919_c7_a17d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1919_c7_a17d_cond <= VAR_n16_MUX_uxn_opcodes_h_l1919_c7_a17d_cond;
     n16_MUX_uxn_opcodes_h_l1919_c7_a17d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1919_c7_a17d_iftrue;
     n16_MUX_uxn_opcodes_h_l1919_c7_a17d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1919_c7_a17d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1919_c7_a17d_return_output := n16_MUX_uxn_opcodes_h_l1919_c7_a17d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1919_c7_a17d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_a17d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_a17d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_a17d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_a17d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_a17d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_a17d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_a17d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_a17d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1915_c7_4683] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1915_c7_4683_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1915_c7_4683_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1915_c7_4683_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1915_c7_4683_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1915_c7_4683_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1915_c7_4683_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1915_c7_4683_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1915_c7_4683_return_output;

     -- BIN_OP_LT[uxn_opcodes_h_l1925_c21_f132] LATENCY=0
     -- Inputs
     BIN_OP_LT_uxn_opcodes_h_l1925_c21_f132_left <= VAR_BIN_OP_LT_uxn_opcodes_h_l1925_c21_f132_left;
     BIN_OP_LT_uxn_opcodes_h_l1925_c21_f132_right <= VAR_BIN_OP_LT_uxn_opcodes_h_l1925_c21_f132_right;
     -- Outputs
     VAR_BIN_OP_LT_uxn_opcodes_h_l1925_c21_f132_return_output := BIN_OP_LT_uxn_opcodes_h_l1925_c21_f132_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_opcodes_h_l1925_c21_ef0c_cond := VAR_BIN_OP_LT_uxn_opcodes_h_l1925_c21_f132_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1915_c7_4683_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1919_c7_a17d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1915_c7_4683_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_a17d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1915_c7_4683_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_a17d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1915_c7_4683_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_a17d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_bab2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1915_c7_4683_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1906_c7_aac4_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1911_c7_bab2_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1911_c7_bab2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_bab2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_bab2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_bab2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_bab2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_bab2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_bab2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_bab2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_bab2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1915_c7_4683] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1915_c7_4683_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1915_c7_4683_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1915_c7_4683_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1915_c7_4683_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1915_c7_4683_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1915_c7_4683_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1915_c7_4683_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1915_c7_4683_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1915_c7_4683] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1915_c7_4683_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1915_c7_4683_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1915_c7_4683_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1915_c7_4683_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1915_c7_4683_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1915_c7_4683_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1915_c7_4683_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1915_c7_4683_return_output;

     -- MUX[uxn_opcodes_h_l1925_c21_ef0c] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1925_c21_ef0c_cond <= VAR_MUX_uxn_opcodes_h_l1925_c21_ef0c_cond;
     MUX_uxn_opcodes_h_l1925_c21_ef0c_iftrue <= VAR_MUX_uxn_opcodes_h_l1925_c21_ef0c_iftrue;
     MUX_uxn_opcodes_h_l1925_c21_ef0c_iffalse <= VAR_MUX_uxn_opcodes_h_l1925_c21_ef0c_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1925_c21_ef0c_return_output := MUX_uxn_opcodes_h_l1925_c21_ef0c_return_output;

     -- t16_MUX[uxn_opcodes_h_l1906_c7_aac4] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1906_c7_aac4_cond <= VAR_t16_MUX_uxn_opcodes_h_l1906_c7_aac4_cond;
     t16_MUX_uxn_opcodes_h_l1906_c7_aac4_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1906_c7_aac4_iftrue;
     t16_MUX_uxn_opcodes_h_l1906_c7_aac4_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1906_c7_aac4_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1906_c7_aac4_return_output := t16_MUX_uxn_opcodes_h_l1906_c7_aac4_return_output;

     -- n16_MUX[uxn_opcodes_h_l1915_c7_4683] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1915_c7_4683_cond <= VAR_n16_MUX_uxn_opcodes_h_l1915_c7_4683_cond;
     n16_MUX_uxn_opcodes_h_l1915_c7_4683_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1915_c7_4683_iftrue;
     n16_MUX_uxn_opcodes_h_l1915_c7_4683_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1915_c7_4683_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1915_c7_4683_return_output := n16_MUX_uxn_opcodes_h_l1915_c7_4683_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1915_c7_4683] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1915_c7_4683_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1915_c7_4683_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1915_c7_4683_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1915_c7_4683_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1915_c7_4683_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1915_c7_4683_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1915_c7_4683_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1915_c7_4683_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1919_c7_a17d_iftrue := VAR_MUX_uxn_opcodes_h_l1925_c21_ef0c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1911_c7_bab2_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1915_c7_4683_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_bab2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1915_c7_4683_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_bab2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1915_c7_4683_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_bab2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1915_c7_4683_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c7_aac4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_bab2_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1903_c7_96e3_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1906_c7_aac4_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1911_c7_bab2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_bab2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_bab2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_bab2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_bab2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_bab2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_bab2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_bab2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_bab2_return_output;

     -- t16_MUX[uxn_opcodes_h_l1903_c7_96e3] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1903_c7_96e3_cond <= VAR_t16_MUX_uxn_opcodes_h_l1903_c7_96e3_cond;
     t16_MUX_uxn_opcodes_h_l1903_c7_96e3_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1903_c7_96e3_iftrue;
     t16_MUX_uxn_opcodes_h_l1903_c7_96e3_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1903_c7_96e3_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1903_c7_96e3_return_output := t16_MUX_uxn_opcodes_h_l1903_c7_96e3_return_output;

     -- n16_MUX[uxn_opcodes_h_l1911_c7_bab2] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1911_c7_bab2_cond <= VAR_n16_MUX_uxn_opcodes_h_l1911_c7_bab2_cond;
     n16_MUX_uxn_opcodes_h_l1911_c7_bab2_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1911_c7_bab2_iftrue;
     n16_MUX_uxn_opcodes_h_l1911_c7_bab2_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1911_c7_bab2_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1911_c7_bab2_return_output := n16_MUX_uxn_opcodes_h_l1911_c7_bab2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1906_c7_aac4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c7_aac4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c7_aac4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c7_aac4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c7_aac4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c7_aac4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c7_aac4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c7_aac4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c7_aac4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1911_c7_bab2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_bab2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_bab2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_bab2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_bab2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_bab2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_bab2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_bab2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_bab2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1911_c7_bab2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_bab2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_bab2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_bab2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_bab2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_bab2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_bab2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_bab2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_bab2_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1919_c7_a17d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1919_c7_a17d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1919_c7_a17d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1919_c7_a17d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1919_c7_a17d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1919_c7_a17d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1919_c7_a17d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1919_c7_a17d_return_output := result_u8_value_MUX_uxn_opcodes_h_l1919_c7_a17d_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1906_c7_aac4_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1911_c7_bab2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1906_c7_aac4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_bab2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1906_c7_aac4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_bab2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c7_aac4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_bab2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c7_96e3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c7_aac4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1915_c7_4683_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1919_c7_a17d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1896_c2_a2b0_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1903_c7_96e3_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1915_c7_4683] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1915_c7_4683_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1915_c7_4683_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1915_c7_4683_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1915_c7_4683_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1915_c7_4683_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1915_c7_4683_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1915_c7_4683_return_output := result_u8_value_MUX_uxn_opcodes_h_l1915_c7_4683_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1906_c7_aac4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1906_c7_aac4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1906_c7_aac4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1906_c7_aac4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1906_c7_aac4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1906_c7_aac4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1906_c7_aac4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1906_c7_aac4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1906_c7_aac4_return_output;

     -- t16_MUX[uxn_opcodes_h_l1896_c2_a2b0] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1896_c2_a2b0_cond <= VAR_t16_MUX_uxn_opcodes_h_l1896_c2_a2b0_cond;
     t16_MUX_uxn_opcodes_h_l1896_c2_a2b0_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1896_c2_a2b0_iftrue;
     t16_MUX_uxn_opcodes_h_l1896_c2_a2b0_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1896_c2_a2b0_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1896_c2_a2b0_return_output := t16_MUX_uxn_opcodes_h_l1896_c2_a2b0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1903_c7_96e3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c7_96e3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c7_96e3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c7_96e3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c7_96e3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c7_96e3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c7_96e3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c7_96e3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c7_96e3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1906_c7_aac4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c7_aac4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c7_aac4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c7_aac4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c7_aac4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c7_aac4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c7_aac4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c7_aac4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c7_aac4_return_output;

     -- n16_MUX[uxn_opcodes_h_l1906_c7_aac4] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1906_c7_aac4_cond <= VAR_n16_MUX_uxn_opcodes_h_l1906_c7_aac4_cond;
     n16_MUX_uxn_opcodes_h_l1906_c7_aac4_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1906_c7_aac4_iftrue;
     n16_MUX_uxn_opcodes_h_l1906_c7_aac4_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1906_c7_aac4_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1906_c7_aac4_return_output := n16_MUX_uxn_opcodes_h_l1906_c7_aac4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1906_c7_aac4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1906_c7_aac4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1906_c7_aac4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1906_c7_aac4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1906_c7_aac4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1906_c7_aac4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1906_c7_aac4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1906_c7_aac4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1906_c7_aac4_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1903_c7_96e3_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1906_c7_aac4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1903_c7_96e3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1906_c7_aac4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1903_c7_96e3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1906_c7_aac4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1903_c7_96e3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c7_aac4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c2_a2b0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c7_96e3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1911_c7_bab2_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1915_c7_4683_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1896_c2_a2b0_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1903_c7_96e3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1903_c7_96e3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1903_c7_96e3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1903_c7_96e3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1903_c7_96e3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1903_c7_96e3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1903_c7_96e3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1903_c7_96e3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1903_c7_96e3_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1911_c7_bab2] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1911_c7_bab2_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1911_c7_bab2_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1911_c7_bab2_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1911_c7_bab2_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1911_c7_bab2_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1911_c7_bab2_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1911_c7_bab2_return_output := result_u8_value_MUX_uxn_opcodes_h_l1911_c7_bab2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1896_c2_a2b0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c2_a2b0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c2_a2b0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c2_a2b0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c2_a2b0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c2_a2b0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c2_a2b0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c2_a2b0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c2_a2b0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1903_c7_96e3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1903_c7_96e3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1903_c7_96e3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1903_c7_96e3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1903_c7_96e3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1903_c7_96e3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1903_c7_96e3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1903_c7_96e3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1903_c7_96e3_return_output;

     -- n16_MUX[uxn_opcodes_h_l1903_c7_96e3] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1903_c7_96e3_cond <= VAR_n16_MUX_uxn_opcodes_h_l1903_c7_96e3_cond;
     n16_MUX_uxn_opcodes_h_l1903_c7_96e3_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1903_c7_96e3_iftrue;
     n16_MUX_uxn_opcodes_h_l1903_c7_96e3_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1903_c7_96e3_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1903_c7_96e3_return_output := n16_MUX_uxn_opcodes_h_l1903_c7_96e3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1903_c7_96e3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1903_c7_96e3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1903_c7_96e3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1903_c7_96e3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1903_c7_96e3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1903_c7_96e3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1903_c7_96e3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1903_c7_96e3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1903_c7_96e3_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1896_c2_a2b0_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1903_c7_96e3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1896_c2_a2b0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1903_c7_96e3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1896_c2_a2b0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1903_c7_96e3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1896_c2_a2b0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1903_c7_96e3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1906_c7_aac4_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1911_c7_bab2_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1896_c2_a2b0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1896_c2_a2b0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1896_c2_a2b0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1896_c2_a2b0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1896_c2_a2b0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1896_c2_a2b0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1896_c2_a2b0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1896_c2_a2b0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1896_c2_a2b0_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1906_c7_aac4] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1906_c7_aac4_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1906_c7_aac4_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1906_c7_aac4_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1906_c7_aac4_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1906_c7_aac4_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1906_c7_aac4_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1906_c7_aac4_return_output := result_u8_value_MUX_uxn_opcodes_h_l1906_c7_aac4_return_output;

     -- n16_MUX[uxn_opcodes_h_l1896_c2_a2b0] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1896_c2_a2b0_cond <= VAR_n16_MUX_uxn_opcodes_h_l1896_c2_a2b0_cond;
     n16_MUX_uxn_opcodes_h_l1896_c2_a2b0_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1896_c2_a2b0_iftrue;
     n16_MUX_uxn_opcodes_h_l1896_c2_a2b0_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1896_c2_a2b0_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1896_c2_a2b0_return_output := n16_MUX_uxn_opcodes_h_l1896_c2_a2b0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1896_c2_a2b0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1896_c2_a2b0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1896_c2_a2b0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1896_c2_a2b0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1896_c2_a2b0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1896_c2_a2b0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1896_c2_a2b0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1896_c2_a2b0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1896_c2_a2b0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1896_c2_a2b0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1896_c2_a2b0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1896_c2_a2b0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1896_c2_a2b0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1896_c2_a2b0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1896_c2_a2b0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1896_c2_a2b0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1896_c2_a2b0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1896_c2_a2b0_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1896_c2_a2b0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1903_c7_96e3_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1906_c7_aac4_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1903_c7_96e3] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1903_c7_96e3_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1903_c7_96e3_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1903_c7_96e3_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1903_c7_96e3_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1903_c7_96e3_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1903_c7_96e3_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1903_c7_96e3_return_output := result_u8_value_MUX_uxn_opcodes_h_l1903_c7_96e3_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1896_c2_a2b0_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1903_c7_96e3_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1896_c2_a2b0] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1896_c2_a2b0_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1896_c2_a2b0_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1896_c2_a2b0_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1896_c2_a2b0_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1896_c2_a2b0_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1896_c2_a2b0_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1896_c2_a2b0_return_output := result_u8_value_MUX_uxn_opcodes_h_l1896_c2_a2b0_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_eae7_uxn_opcodes_h_l1933_l1892_DUPLICATE_bf2e LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_eae7_uxn_opcodes_h_l1933_l1892_DUPLICATE_bf2e_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_eae7(
     result,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1896_c2_a2b0_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1896_c2_a2b0_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1896_c2_a2b0_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c2_a2b0_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1896_c2_a2b0_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_eae7_uxn_opcodes_h_l1933_l1892_DUPLICATE_bf2e_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_eae7_uxn_opcodes_h_l1933_l1892_DUPLICATE_bf2e_return_output;
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
