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
-- Submodules: 73
entity ldr2_0CLK_6193b0ef is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end ldr2_0CLK_6193b0ef;
architecture arch of ldr2_0CLK_6193b0ef is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1552_c6_4c05]
signal BIN_OP_EQ_uxn_opcodes_h_l1552_c6_4c05_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1552_c6_4c05_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1552_c6_4c05_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1552_c1_a9d5]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1552_c1_a9d5_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1552_c1_a9d5_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1552_c1_a9d5_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1552_c1_a9d5_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1552_c2_7098]
signal t8_MUX_uxn_opcodes_h_l1552_c2_7098_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1552_c2_7098_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1552_c2_7098_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1552_c2_7098_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1552_c2_7098]
signal tmp16_MUX_uxn_opcodes_h_l1552_c2_7098_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1552_c2_7098_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1552_c2_7098_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1552_c2_7098_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1552_c2_7098]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1552_c2_7098_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1552_c2_7098_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1552_c2_7098_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1552_c2_7098_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1552_c2_7098]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1552_c2_7098_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1552_c2_7098_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1552_c2_7098_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1552_c2_7098_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1552_c2_7098]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1552_c2_7098_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1552_c2_7098_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1552_c2_7098_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1552_c2_7098_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1552_c2_7098]
signal result_u8_value_MUX_uxn_opcodes_h_l1552_c2_7098_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1552_c2_7098_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1552_c2_7098_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1552_c2_7098_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1552_c2_7098]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1552_c2_7098_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1552_c2_7098_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1552_c2_7098_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1552_c2_7098_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1552_c2_7098]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1552_c2_7098_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1552_c2_7098_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1552_c2_7098_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1552_c2_7098_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1552_c2_7098]
signal result_u16_value_MUX_uxn_opcodes_h_l1552_c2_7098_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1552_c2_7098_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1552_c2_7098_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1552_c2_7098_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l1553_c3_c9bf[uxn_opcodes_h_l1553_c3_c9bf]
signal printf_uxn_opcodes_h_l1553_c3_c9bf_uxn_opcodes_h_l1553_c3_c9bf_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1557_c11_8f3d]
signal BIN_OP_EQ_uxn_opcodes_h_l1557_c11_8f3d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1557_c11_8f3d_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1557_c11_8f3d_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1557_c7_bc2d]
signal t8_MUX_uxn_opcodes_h_l1557_c7_bc2d_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1557_c7_bc2d_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1557_c7_bc2d_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1557_c7_bc2d_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1557_c7_bc2d]
signal tmp16_MUX_uxn_opcodes_h_l1557_c7_bc2d_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1557_c7_bc2d_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1557_c7_bc2d_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1557_c7_bc2d_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1557_c7_bc2d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1557_c7_bc2d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1557_c7_bc2d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1557_c7_bc2d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1557_c7_bc2d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1557_c7_bc2d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c7_bc2d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c7_bc2d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c7_bc2d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c7_bc2d_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1557_c7_bc2d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c7_bc2d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c7_bc2d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c7_bc2d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c7_bc2d_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1557_c7_bc2d]
signal result_u8_value_MUX_uxn_opcodes_h_l1557_c7_bc2d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1557_c7_bc2d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1557_c7_bc2d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1557_c7_bc2d_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1557_c7_bc2d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1557_c7_bc2d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1557_c7_bc2d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1557_c7_bc2d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1557_c7_bc2d_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1557_c7_bc2d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1557_c7_bc2d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1557_c7_bc2d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1557_c7_bc2d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1557_c7_bc2d_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1557_c7_bc2d]
signal result_u16_value_MUX_uxn_opcodes_h_l1557_c7_bc2d_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1557_c7_bc2d_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1557_c7_bc2d_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1557_c7_bc2d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1560_c11_0f0d]
signal BIN_OP_EQ_uxn_opcodes_h_l1560_c11_0f0d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1560_c11_0f0d_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1560_c11_0f0d_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1560_c7_3e68]
signal t8_MUX_uxn_opcodes_h_l1560_c7_3e68_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1560_c7_3e68_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1560_c7_3e68_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1560_c7_3e68_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1560_c7_3e68]
signal tmp16_MUX_uxn_opcodes_h_l1560_c7_3e68_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1560_c7_3e68_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1560_c7_3e68_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1560_c7_3e68_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1560_c7_3e68]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1560_c7_3e68_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1560_c7_3e68_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1560_c7_3e68_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1560_c7_3e68_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1560_c7_3e68]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c7_3e68_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c7_3e68_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c7_3e68_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c7_3e68_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1560_c7_3e68]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c7_3e68_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c7_3e68_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c7_3e68_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c7_3e68_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1560_c7_3e68]
signal result_u8_value_MUX_uxn_opcodes_h_l1560_c7_3e68_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1560_c7_3e68_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1560_c7_3e68_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1560_c7_3e68_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1560_c7_3e68]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_3e68_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_3e68_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_3e68_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_3e68_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1560_c7_3e68]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c7_3e68_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c7_3e68_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c7_3e68_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c7_3e68_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1560_c7_3e68]
signal result_u16_value_MUX_uxn_opcodes_h_l1560_c7_3e68_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1560_c7_3e68_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1560_c7_3e68_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1560_c7_3e68_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1563_c30_0482]
signal sp_relative_shift_uxn_opcodes_h_l1563_c30_0482_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1563_c30_0482_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1563_c30_0482_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1563_c30_0482_return_output : signed(3 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1564_c22_9760]
signal BIN_OP_PLUS_uxn_opcodes_h_l1564_c22_9760_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1564_c22_9760_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1564_c22_9760_return_output : signed(17 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1566_c11_cc25]
signal BIN_OP_EQ_uxn_opcodes_h_l1566_c11_cc25_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1566_c11_cc25_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1566_c11_cc25_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1566_c7_dd01]
signal tmp16_MUX_uxn_opcodes_h_l1566_c7_dd01_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1566_c7_dd01_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1566_c7_dd01_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1566_c7_dd01_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1566_c7_dd01]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1566_c7_dd01_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1566_c7_dd01_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1566_c7_dd01_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1566_c7_dd01_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1566_c7_dd01]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1566_c7_dd01_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1566_c7_dd01_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1566_c7_dd01_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1566_c7_dd01_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1566_c7_dd01]
signal result_u8_value_MUX_uxn_opcodes_h_l1566_c7_dd01_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1566_c7_dd01_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1566_c7_dd01_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1566_c7_dd01_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1566_c7_dd01]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1566_c7_dd01_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1566_c7_dd01_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1566_c7_dd01_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1566_c7_dd01_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1566_c7_dd01]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1566_c7_dd01_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1566_c7_dd01_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1566_c7_dd01_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1566_c7_dd01_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1566_c7_dd01]
signal result_u16_value_MUX_uxn_opcodes_h_l1566_c7_dd01_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1566_c7_dd01_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1566_c7_dd01_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1566_c7_dd01_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1568_c22_0df6]
signal BIN_OP_PLUS_uxn_opcodes_h_l1568_c22_0df6_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1568_c22_0df6_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1568_c22_0df6_return_output : signed(17 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1568_c22_c000]
signal BIN_OP_PLUS_uxn_opcodes_h_l1568_c22_c000_left : signed(17 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1568_c22_c000_right : signed(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1568_c22_c000_return_output : signed(18 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1570_c11_b50f]
signal BIN_OP_EQ_uxn_opcodes_h_l1570_c11_b50f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1570_c11_b50f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1570_c11_b50f_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1570_c7_af2d]
signal tmp16_MUX_uxn_opcodes_h_l1570_c7_af2d_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1570_c7_af2d_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1570_c7_af2d_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1570_c7_af2d_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1570_c7_af2d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1570_c7_af2d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1570_c7_af2d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1570_c7_af2d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1570_c7_af2d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1570_c7_af2d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_af2d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_af2d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_af2d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_af2d_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1570_c7_af2d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_af2d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_af2d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_af2d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_af2d_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1570_c7_af2d]
signal result_u8_value_MUX_uxn_opcodes_h_l1570_c7_af2d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1570_c7_af2d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1570_c7_af2d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1570_c7_af2d_return_output : unsigned(7 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1572_c3_3dc7]
signal CONST_SL_8_uxn_opcodes_h_l1572_c3_3dc7_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1572_c3_3dc7_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1574_c11_0d88]
signal BIN_OP_EQ_uxn_opcodes_h_l1574_c11_0d88_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1574_c11_0d88_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1574_c11_0d88_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1574_c7_945c]
signal tmp16_MUX_uxn_opcodes_h_l1574_c7_945c_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1574_c7_945c_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1574_c7_945c_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1574_c7_945c_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1574_c7_945c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_945c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_945c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_945c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_945c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1574_c7_945c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_945c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_945c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_945c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_945c_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1574_c7_945c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_945c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_945c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_945c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_945c_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1574_c7_945c]
signal result_u8_value_MUX_uxn_opcodes_h_l1574_c7_945c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1574_c7_945c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1574_c7_945c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1574_c7_945c_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1575_c3_a4a1]
signal BIN_OP_OR_uxn_opcodes_h_l1575_c3_a4a1_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1575_c3_a4a1_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1575_c3_a4a1_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1580_c11_1454]
signal BIN_OP_EQ_uxn_opcodes_h_l1580_c11_1454_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1580_c11_1454_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1580_c11_1454_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1580_c7_d8bd]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1580_c7_d8bd_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1580_c7_d8bd_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1580_c7_d8bd_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1580_c7_d8bd_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1580_c7_d8bd]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1580_c7_d8bd_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1580_c7_d8bd_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1580_c7_d8bd_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1580_c7_d8bd_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1580_c7_d8bd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1580_c7_d8bd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1580_c7_d8bd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1580_c7_d8bd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1580_c7_d8bd_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1580_c7_d8bd]
signal result_u8_value_MUX_uxn_opcodes_h_l1580_c7_d8bd_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1580_c7_d8bd_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1580_c7_d8bd_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1580_c7_d8bd_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1582_c31_c078]
signal CONST_SR_8_uxn_opcodes_h_l1582_c31_c078_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1582_c31_c078_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1584_c11_ffec]
signal BIN_OP_EQ_uxn_opcodes_h_l1584_c11_ffec_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1584_c11_ffec_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1584_c11_ffec_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1584_c7_0373]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1584_c7_0373_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1584_c7_0373_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1584_c7_0373_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1584_c7_0373_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1584_c7_0373]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_0373_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_0373_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_0373_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_0373_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_ff87( ref_toks_0 : opcode_result_t;
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
      base.u8_value := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.is_sp_shift := ref_toks_6;
      base.u16_value := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1552_c6_4c05
BIN_OP_EQ_uxn_opcodes_h_l1552_c6_4c05 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1552_c6_4c05_left,
BIN_OP_EQ_uxn_opcodes_h_l1552_c6_4c05_right,
BIN_OP_EQ_uxn_opcodes_h_l1552_c6_4c05_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1552_c1_a9d5
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1552_c1_a9d5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1552_c1_a9d5_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1552_c1_a9d5_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1552_c1_a9d5_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1552_c1_a9d5_return_output);

-- t8_MUX_uxn_opcodes_h_l1552_c2_7098
t8_MUX_uxn_opcodes_h_l1552_c2_7098 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1552_c2_7098_cond,
t8_MUX_uxn_opcodes_h_l1552_c2_7098_iftrue,
t8_MUX_uxn_opcodes_h_l1552_c2_7098_iffalse,
t8_MUX_uxn_opcodes_h_l1552_c2_7098_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1552_c2_7098
tmp16_MUX_uxn_opcodes_h_l1552_c2_7098 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1552_c2_7098_cond,
tmp16_MUX_uxn_opcodes_h_l1552_c2_7098_iftrue,
tmp16_MUX_uxn_opcodes_h_l1552_c2_7098_iffalse,
tmp16_MUX_uxn_opcodes_h_l1552_c2_7098_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1552_c2_7098
result_is_stack_write_MUX_uxn_opcodes_h_l1552_c2_7098 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1552_c2_7098_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1552_c2_7098_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1552_c2_7098_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1552_c2_7098_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1552_c2_7098
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1552_c2_7098 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1552_c2_7098_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1552_c2_7098_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1552_c2_7098_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1552_c2_7098_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1552_c2_7098
result_sp_relative_shift_MUX_uxn_opcodes_h_l1552_c2_7098 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1552_c2_7098_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1552_c2_7098_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1552_c2_7098_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1552_c2_7098_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1552_c2_7098
result_u8_value_MUX_uxn_opcodes_h_l1552_c2_7098 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1552_c2_7098_cond,
result_u8_value_MUX_uxn_opcodes_h_l1552_c2_7098_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1552_c2_7098_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1552_c2_7098_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1552_c2_7098
result_is_opc_done_MUX_uxn_opcodes_h_l1552_c2_7098 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1552_c2_7098_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1552_c2_7098_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1552_c2_7098_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1552_c2_7098_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1552_c2_7098
result_is_sp_shift_MUX_uxn_opcodes_h_l1552_c2_7098 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1552_c2_7098_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1552_c2_7098_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1552_c2_7098_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1552_c2_7098_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1552_c2_7098
result_u16_value_MUX_uxn_opcodes_h_l1552_c2_7098 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1552_c2_7098_cond,
result_u16_value_MUX_uxn_opcodes_h_l1552_c2_7098_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1552_c2_7098_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1552_c2_7098_return_output);

-- printf_uxn_opcodes_h_l1553_c3_c9bf_uxn_opcodes_h_l1553_c3_c9bf
printf_uxn_opcodes_h_l1553_c3_c9bf_uxn_opcodes_h_l1553_c3_c9bf : entity work.printf_uxn_opcodes_h_l1553_c3_c9bf_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1553_c3_c9bf_uxn_opcodes_h_l1553_c3_c9bf_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1557_c11_8f3d
BIN_OP_EQ_uxn_opcodes_h_l1557_c11_8f3d : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1557_c11_8f3d_left,
BIN_OP_EQ_uxn_opcodes_h_l1557_c11_8f3d_right,
BIN_OP_EQ_uxn_opcodes_h_l1557_c11_8f3d_return_output);

-- t8_MUX_uxn_opcodes_h_l1557_c7_bc2d
t8_MUX_uxn_opcodes_h_l1557_c7_bc2d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1557_c7_bc2d_cond,
t8_MUX_uxn_opcodes_h_l1557_c7_bc2d_iftrue,
t8_MUX_uxn_opcodes_h_l1557_c7_bc2d_iffalse,
t8_MUX_uxn_opcodes_h_l1557_c7_bc2d_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1557_c7_bc2d
tmp16_MUX_uxn_opcodes_h_l1557_c7_bc2d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1557_c7_bc2d_cond,
tmp16_MUX_uxn_opcodes_h_l1557_c7_bc2d_iftrue,
tmp16_MUX_uxn_opcodes_h_l1557_c7_bc2d_iffalse,
tmp16_MUX_uxn_opcodes_h_l1557_c7_bc2d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1557_c7_bc2d
result_is_stack_write_MUX_uxn_opcodes_h_l1557_c7_bc2d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1557_c7_bc2d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1557_c7_bc2d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1557_c7_bc2d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1557_c7_bc2d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c7_bc2d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c7_bc2d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c7_bc2d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c7_bc2d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c7_bc2d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c7_bc2d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c7_bc2d
result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c7_bc2d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c7_bc2d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c7_bc2d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c7_bc2d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c7_bc2d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1557_c7_bc2d
result_u8_value_MUX_uxn_opcodes_h_l1557_c7_bc2d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1557_c7_bc2d_cond,
result_u8_value_MUX_uxn_opcodes_h_l1557_c7_bc2d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1557_c7_bc2d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1557_c7_bc2d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1557_c7_bc2d
result_is_opc_done_MUX_uxn_opcodes_h_l1557_c7_bc2d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1557_c7_bc2d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1557_c7_bc2d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1557_c7_bc2d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1557_c7_bc2d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1557_c7_bc2d
result_is_sp_shift_MUX_uxn_opcodes_h_l1557_c7_bc2d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1557_c7_bc2d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1557_c7_bc2d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1557_c7_bc2d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1557_c7_bc2d_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1557_c7_bc2d
result_u16_value_MUX_uxn_opcodes_h_l1557_c7_bc2d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1557_c7_bc2d_cond,
result_u16_value_MUX_uxn_opcodes_h_l1557_c7_bc2d_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1557_c7_bc2d_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1557_c7_bc2d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1560_c11_0f0d
BIN_OP_EQ_uxn_opcodes_h_l1560_c11_0f0d : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1560_c11_0f0d_left,
BIN_OP_EQ_uxn_opcodes_h_l1560_c11_0f0d_right,
BIN_OP_EQ_uxn_opcodes_h_l1560_c11_0f0d_return_output);

-- t8_MUX_uxn_opcodes_h_l1560_c7_3e68
t8_MUX_uxn_opcodes_h_l1560_c7_3e68 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1560_c7_3e68_cond,
t8_MUX_uxn_opcodes_h_l1560_c7_3e68_iftrue,
t8_MUX_uxn_opcodes_h_l1560_c7_3e68_iffalse,
t8_MUX_uxn_opcodes_h_l1560_c7_3e68_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1560_c7_3e68
tmp16_MUX_uxn_opcodes_h_l1560_c7_3e68 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1560_c7_3e68_cond,
tmp16_MUX_uxn_opcodes_h_l1560_c7_3e68_iftrue,
tmp16_MUX_uxn_opcodes_h_l1560_c7_3e68_iffalse,
tmp16_MUX_uxn_opcodes_h_l1560_c7_3e68_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1560_c7_3e68
result_is_stack_write_MUX_uxn_opcodes_h_l1560_c7_3e68 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1560_c7_3e68_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1560_c7_3e68_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1560_c7_3e68_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1560_c7_3e68_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c7_3e68
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c7_3e68 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c7_3e68_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c7_3e68_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c7_3e68_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c7_3e68_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c7_3e68
result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c7_3e68 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c7_3e68_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c7_3e68_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c7_3e68_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c7_3e68_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1560_c7_3e68
result_u8_value_MUX_uxn_opcodes_h_l1560_c7_3e68 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1560_c7_3e68_cond,
result_u8_value_MUX_uxn_opcodes_h_l1560_c7_3e68_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1560_c7_3e68_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1560_c7_3e68_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_3e68
result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_3e68 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_3e68_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_3e68_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_3e68_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_3e68_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c7_3e68
result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c7_3e68 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c7_3e68_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c7_3e68_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c7_3e68_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c7_3e68_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1560_c7_3e68
result_u16_value_MUX_uxn_opcodes_h_l1560_c7_3e68 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1560_c7_3e68_cond,
result_u16_value_MUX_uxn_opcodes_h_l1560_c7_3e68_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1560_c7_3e68_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1560_c7_3e68_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1563_c30_0482
sp_relative_shift_uxn_opcodes_h_l1563_c30_0482 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1563_c30_0482_ins,
sp_relative_shift_uxn_opcodes_h_l1563_c30_0482_x,
sp_relative_shift_uxn_opcodes_h_l1563_c30_0482_y,
sp_relative_shift_uxn_opcodes_h_l1563_c30_0482_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1564_c22_9760
BIN_OP_PLUS_uxn_opcodes_h_l1564_c22_9760 : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1564_c22_9760_left,
BIN_OP_PLUS_uxn_opcodes_h_l1564_c22_9760_right,
BIN_OP_PLUS_uxn_opcodes_h_l1564_c22_9760_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1566_c11_cc25
BIN_OP_EQ_uxn_opcodes_h_l1566_c11_cc25 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1566_c11_cc25_left,
BIN_OP_EQ_uxn_opcodes_h_l1566_c11_cc25_right,
BIN_OP_EQ_uxn_opcodes_h_l1566_c11_cc25_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1566_c7_dd01
tmp16_MUX_uxn_opcodes_h_l1566_c7_dd01 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1566_c7_dd01_cond,
tmp16_MUX_uxn_opcodes_h_l1566_c7_dd01_iftrue,
tmp16_MUX_uxn_opcodes_h_l1566_c7_dd01_iffalse,
tmp16_MUX_uxn_opcodes_h_l1566_c7_dd01_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1566_c7_dd01
result_is_stack_write_MUX_uxn_opcodes_h_l1566_c7_dd01 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1566_c7_dd01_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1566_c7_dd01_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1566_c7_dd01_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1566_c7_dd01_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1566_c7_dd01
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1566_c7_dd01 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1566_c7_dd01_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1566_c7_dd01_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1566_c7_dd01_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1566_c7_dd01_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1566_c7_dd01
result_u8_value_MUX_uxn_opcodes_h_l1566_c7_dd01 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1566_c7_dd01_cond,
result_u8_value_MUX_uxn_opcodes_h_l1566_c7_dd01_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1566_c7_dd01_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1566_c7_dd01_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1566_c7_dd01
result_is_opc_done_MUX_uxn_opcodes_h_l1566_c7_dd01 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1566_c7_dd01_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1566_c7_dd01_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1566_c7_dd01_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1566_c7_dd01_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1566_c7_dd01
result_is_sp_shift_MUX_uxn_opcodes_h_l1566_c7_dd01 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1566_c7_dd01_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1566_c7_dd01_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1566_c7_dd01_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1566_c7_dd01_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1566_c7_dd01
result_u16_value_MUX_uxn_opcodes_h_l1566_c7_dd01 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1566_c7_dd01_cond,
result_u16_value_MUX_uxn_opcodes_h_l1566_c7_dd01_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1566_c7_dd01_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1566_c7_dd01_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1568_c22_0df6
BIN_OP_PLUS_uxn_opcodes_h_l1568_c22_0df6 : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1568_c22_0df6_left,
BIN_OP_PLUS_uxn_opcodes_h_l1568_c22_0df6_right,
BIN_OP_PLUS_uxn_opcodes_h_l1568_c22_0df6_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1568_c22_c000
BIN_OP_PLUS_uxn_opcodes_h_l1568_c22_c000 : entity work.BIN_OP_PLUS_int18_t_int2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1568_c22_c000_left,
BIN_OP_PLUS_uxn_opcodes_h_l1568_c22_c000_right,
BIN_OP_PLUS_uxn_opcodes_h_l1568_c22_c000_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1570_c11_b50f
BIN_OP_EQ_uxn_opcodes_h_l1570_c11_b50f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1570_c11_b50f_left,
BIN_OP_EQ_uxn_opcodes_h_l1570_c11_b50f_right,
BIN_OP_EQ_uxn_opcodes_h_l1570_c11_b50f_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1570_c7_af2d
tmp16_MUX_uxn_opcodes_h_l1570_c7_af2d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1570_c7_af2d_cond,
tmp16_MUX_uxn_opcodes_h_l1570_c7_af2d_iftrue,
tmp16_MUX_uxn_opcodes_h_l1570_c7_af2d_iffalse,
tmp16_MUX_uxn_opcodes_h_l1570_c7_af2d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1570_c7_af2d
result_is_stack_write_MUX_uxn_opcodes_h_l1570_c7_af2d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1570_c7_af2d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1570_c7_af2d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1570_c7_af2d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1570_c7_af2d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_af2d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_af2d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_af2d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_af2d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_af2d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_af2d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_af2d
result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_af2d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_af2d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_af2d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_af2d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_af2d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1570_c7_af2d
result_u8_value_MUX_uxn_opcodes_h_l1570_c7_af2d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1570_c7_af2d_cond,
result_u8_value_MUX_uxn_opcodes_h_l1570_c7_af2d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1570_c7_af2d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1570_c7_af2d_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1572_c3_3dc7
CONST_SL_8_uxn_opcodes_h_l1572_c3_3dc7 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1572_c3_3dc7_x,
CONST_SL_8_uxn_opcodes_h_l1572_c3_3dc7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1574_c11_0d88
BIN_OP_EQ_uxn_opcodes_h_l1574_c11_0d88 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1574_c11_0d88_left,
BIN_OP_EQ_uxn_opcodes_h_l1574_c11_0d88_right,
BIN_OP_EQ_uxn_opcodes_h_l1574_c11_0d88_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1574_c7_945c
tmp16_MUX_uxn_opcodes_h_l1574_c7_945c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1574_c7_945c_cond,
tmp16_MUX_uxn_opcodes_h_l1574_c7_945c_iftrue,
tmp16_MUX_uxn_opcodes_h_l1574_c7_945c_iffalse,
tmp16_MUX_uxn_opcodes_h_l1574_c7_945c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_945c
result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_945c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_945c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_945c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_945c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_945c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_945c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_945c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_945c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_945c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_945c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_945c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_945c
result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_945c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_945c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_945c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_945c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_945c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1574_c7_945c
result_u8_value_MUX_uxn_opcodes_h_l1574_c7_945c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1574_c7_945c_cond,
result_u8_value_MUX_uxn_opcodes_h_l1574_c7_945c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1574_c7_945c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1574_c7_945c_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1575_c3_a4a1
BIN_OP_OR_uxn_opcodes_h_l1575_c3_a4a1 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1575_c3_a4a1_left,
BIN_OP_OR_uxn_opcodes_h_l1575_c3_a4a1_right,
BIN_OP_OR_uxn_opcodes_h_l1575_c3_a4a1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1580_c11_1454
BIN_OP_EQ_uxn_opcodes_h_l1580_c11_1454 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1580_c11_1454_left,
BIN_OP_EQ_uxn_opcodes_h_l1580_c11_1454_right,
BIN_OP_EQ_uxn_opcodes_h_l1580_c11_1454_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1580_c7_d8bd
result_is_stack_write_MUX_uxn_opcodes_h_l1580_c7_d8bd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1580_c7_d8bd_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1580_c7_d8bd_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1580_c7_d8bd_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1580_c7_d8bd_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1580_c7_d8bd
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1580_c7_d8bd : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1580_c7_d8bd_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1580_c7_d8bd_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1580_c7_d8bd_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1580_c7_d8bd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1580_c7_d8bd
result_is_opc_done_MUX_uxn_opcodes_h_l1580_c7_d8bd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1580_c7_d8bd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1580_c7_d8bd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1580_c7_d8bd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1580_c7_d8bd_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1580_c7_d8bd
result_u8_value_MUX_uxn_opcodes_h_l1580_c7_d8bd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1580_c7_d8bd_cond,
result_u8_value_MUX_uxn_opcodes_h_l1580_c7_d8bd_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1580_c7_d8bd_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1580_c7_d8bd_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1582_c31_c078
CONST_SR_8_uxn_opcodes_h_l1582_c31_c078 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1582_c31_c078_x,
CONST_SR_8_uxn_opcodes_h_l1582_c31_c078_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1584_c11_ffec
BIN_OP_EQ_uxn_opcodes_h_l1584_c11_ffec : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1584_c11_ffec_left,
BIN_OP_EQ_uxn_opcodes_h_l1584_c11_ffec_right,
BIN_OP_EQ_uxn_opcodes_h_l1584_c11_ffec_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1584_c7_0373
result_is_stack_write_MUX_uxn_opcodes_h_l1584_c7_0373 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1584_c7_0373_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1584_c7_0373_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1584_c7_0373_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1584_c7_0373_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_0373
result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_0373 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_0373_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_0373_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_0373_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_0373_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1552_c6_4c05_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1552_c1_a9d5_return_output,
 t8_MUX_uxn_opcodes_h_l1552_c2_7098_return_output,
 tmp16_MUX_uxn_opcodes_h_l1552_c2_7098_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1552_c2_7098_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1552_c2_7098_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1552_c2_7098_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1552_c2_7098_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1552_c2_7098_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1552_c2_7098_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1552_c2_7098_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1557_c11_8f3d_return_output,
 t8_MUX_uxn_opcodes_h_l1557_c7_bc2d_return_output,
 tmp16_MUX_uxn_opcodes_h_l1557_c7_bc2d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1557_c7_bc2d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c7_bc2d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c7_bc2d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1557_c7_bc2d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1557_c7_bc2d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1557_c7_bc2d_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1557_c7_bc2d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1560_c11_0f0d_return_output,
 t8_MUX_uxn_opcodes_h_l1560_c7_3e68_return_output,
 tmp16_MUX_uxn_opcodes_h_l1560_c7_3e68_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1560_c7_3e68_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c7_3e68_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c7_3e68_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1560_c7_3e68_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_3e68_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c7_3e68_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1560_c7_3e68_return_output,
 sp_relative_shift_uxn_opcodes_h_l1563_c30_0482_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1564_c22_9760_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1566_c11_cc25_return_output,
 tmp16_MUX_uxn_opcodes_h_l1566_c7_dd01_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1566_c7_dd01_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1566_c7_dd01_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1566_c7_dd01_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1566_c7_dd01_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1566_c7_dd01_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1566_c7_dd01_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1568_c22_0df6_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1568_c22_c000_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1570_c11_b50f_return_output,
 tmp16_MUX_uxn_opcodes_h_l1570_c7_af2d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1570_c7_af2d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_af2d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_af2d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1570_c7_af2d_return_output,
 CONST_SL_8_uxn_opcodes_h_l1572_c3_3dc7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1574_c11_0d88_return_output,
 tmp16_MUX_uxn_opcodes_h_l1574_c7_945c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_945c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_945c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_945c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1574_c7_945c_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1575_c3_a4a1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1580_c11_1454_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1580_c7_d8bd_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1580_c7_d8bd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1580_c7_d8bd_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1580_c7_d8bd_return_output,
 CONST_SR_8_uxn_opcodes_h_l1582_c31_c078_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1584_c11_ffec_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1584_c7_0373_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_0373_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1552_c6_4c05_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1552_c6_4c05_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1552_c6_4c05_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1552_c1_a9d5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1552_c1_a9d5_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1552_c1_a9d5_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1552_c1_a9d5_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1552_c2_7098_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1552_c2_7098_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1557_c7_bc2d_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1552_c2_7098_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1552_c2_7098_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1552_c2_7098_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1552_c2_7098_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1557_c7_bc2d_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1552_c2_7098_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1552_c2_7098_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1552_c2_7098_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1552_c2_7098_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1557_c7_bc2d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1552_c2_7098_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1552_c2_7098_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1552_c2_7098_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1554_c3_7d73 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1552_c2_7098_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c7_bc2d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1552_c2_7098_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1552_c2_7098_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1552_c2_7098_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1552_c2_7098_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c7_bc2d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1552_c2_7098_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1552_c2_7098_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1552_c2_7098_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1552_c2_7098_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1557_c7_bc2d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1552_c2_7098_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1552_c2_7098_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1552_c2_7098_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1552_c2_7098_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1557_c7_bc2d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1552_c2_7098_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1552_c2_7098_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1552_c2_7098_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1552_c2_7098_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1557_c7_bc2d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1552_c2_7098_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1552_c2_7098_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1552_c2_7098_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1552_c2_7098_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1557_c7_bc2d_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1552_c2_7098_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1552_c2_7098_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1553_c3_c9bf_uxn_opcodes_h_l1553_c3_c9bf_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1557_c11_8f3d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1557_c11_8f3d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1557_c11_8f3d_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1557_c7_bc2d_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1557_c7_bc2d_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1560_c7_3e68_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1557_c7_bc2d_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1557_c7_bc2d_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1557_c7_bc2d_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1560_c7_3e68_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1557_c7_bc2d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1557_c7_bc2d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1557_c7_bc2d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1560_c7_3e68_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1557_c7_bc2d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c7_bc2d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1558_c3_c96a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c7_bc2d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c7_3e68_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c7_bc2d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c7_bc2d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c7_bc2d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c7_3e68_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c7_bc2d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1557_c7_bc2d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1557_c7_bc2d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1560_c7_3e68_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1557_c7_bc2d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1557_c7_bc2d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1557_c7_bc2d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_3e68_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1557_c7_bc2d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1557_c7_bc2d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1557_c7_bc2d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c7_3e68_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1557_c7_bc2d_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1557_c7_bc2d_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1557_c7_bc2d_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1560_c7_3e68_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1557_c7_bc2d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c11_0f0d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c11_0f0d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c11_0f0d_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1560_c7_3e68_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1560_c7_3e68_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1560_c7_3e68_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1560_c7_3e68_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1560_c7_3e68_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1566_c7_dd01_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1560_c7_3e68_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1560_c7_3e68_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1560_c7_3e68_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1566_c7_dd01_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1560_c7_3e68_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c7_3e68_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c7_3e68_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1566_c7_dd01_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c7_3e68_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c7_3e68_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c7_3e68_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c7_3e68_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1560_c7_3e68_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1560_c7_3e68_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1566_c7_dd01_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1560_c7_3e68_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_3e68_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_3e68_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1566_c7_dd01_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_3e68_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c7_3e68_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c7_3e68_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1566_c7_dd01_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c7_3e68_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1560_c7_3e68_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l1564_c3_df69 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1560_c7_3e68_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1566_c7_dd01_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1560_c7_3e68_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1563_c30_0482_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1563_c30_0482_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1563_c30_0482_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1563_c30_0482_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1564_c22_9760_left : signed(16 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l1564_c27_34b5_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1564_c22_9760_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1564_c22_9760_return_output : signed(17 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1566_c11_cc25_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1566_c11_cc25_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1566_c11_cc25_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1566_c7_dd01_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1566_c7_dd01_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1570_c7_af2d_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1566_c7_dd01_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1566_c7_dd01_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1566_c7_dd01_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1570_c7_af2d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1566_c7_dd01_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1566_c7_dd01_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1566_c7_dd01_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_af2d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1566_c7_dd01_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1566_c7_dd01_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1566_c7_dd01_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1570_c7_af2d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1566_c7_dd01_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1566_c7_dd01_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1566_c7_dd01_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_af2d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1566_c7_dd01_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1566_c7_dd01_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1566_c7_dd01_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1566_c7_dd01_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1566_c7_dd01_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l1568_c3_4a86 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1566_c7_dd01_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1566_c7_dd01_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1568_c22_0df6_left : signed(16 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l1568_c27_6f57_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1568_c22_0df6_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1568_c22_0df6_return_output : signed(17 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1568_c22_c000_left : signed(17 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1568_c22_c000_right : signed(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1568_c22_c000_return_output : signed(18 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1570_c11_b50f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1570_c11_b50f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1570_c11_b50f_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1570_c7_af2d_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1570_c7_af2d_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1574_c7_945c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1570_c7_af2d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1570_c7_af2d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1570_c7_af2d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_945c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1570_c7_af2d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_af2d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_af2d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_945c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_af2d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_af2d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_af2d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_945c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_af2d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1570_c7_af2d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1570_c7_af2d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1574_c7_945c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1570_c7_af2d_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1572_c3_3dc7_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1572_c3_3dc7_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_0d88_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_0d88_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_0d88_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1574_c7_945c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1574_c7_945c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1574_c7_945c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_945c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_945c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1580_c7_d8bd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_945c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_945c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1577_c3_3748 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_945c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1580_c7_d8bd_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_945c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_945c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_945c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1580_c7_d8bd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_945c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1574_c7_945c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1574_c7_945c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1580_c7_d8bd_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1574_c7_945c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1575_c3_a4a1_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1575_c3_a4a1_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1575_c3_a4a1_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1578_c21_f511_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1580_c11_1454_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1580_c11_1454_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1580_c11_1454_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1580_c7_d8bd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1580_c7_d8bd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1584_c7_0373_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1580_c7_d8bd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1580_c7_d8bd_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1581_c3_db13 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1580_c7_d8bd_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1580_c7_d8bd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1580_c7_d8bd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1580_c7_d8bd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_0373_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1580_c7_d8bd_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1580_c7_d8bd_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1580_c7_d8bd_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1580_c7_d8bd_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1582_c31_c078_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1582_c31_c078_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1582_c21_4ae3_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1584_c11_ffec_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1584_c11_ffec_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1584_c11_ffec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1584_c7_0373_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1584_c7_0373_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1584_c7_0373_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_0373_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_0373_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_0373_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1566_l1560_l1557_l1584_l1552_l1580_l1570_DUPLICATE_b235_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1560_l1552_l1557_DUPLICATE_ee48_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1566_l1560_l1557_l1552_l1580_l1570_DUPLICATE_ac4c_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1552_l1566_l1557_DUPLICATE_223d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1552_l1566_l1557_DUPLICATE_96ab_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1566_l1560_l1557_l1584_l1580_l1574_l1570_DUPLICATE_ac69_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1560_l1566_l1580_l1570_DUPLICATE_3642_return_output : unsigned(3 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1571_l1575_DUPLICATE_0fd1_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ff87_uxn_opcodes_h_l1589_l1547_DUPLICATE_ca71_return_output : opcode_result_t;
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
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_0373_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1580_c11_1454_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1577_c3_3748 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_945c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1577_c3_3748;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c7_3e68_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_0d88_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1554_c3_7d73 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1552_c2_7098_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1554_c3_7d73;
     VAR_sp_relative_shift_uxn_opcodes_h_l1563_c30_0482_y := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1566_c11_cc25_right := to_unsigned(3, 2);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1568_c22_c000_right := signed(std_logic_vector(resize(to_unsigned(1, 1), 2)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1581_c3_db13 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1580_c7_d8bd_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1581_c3_db13;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1584_c11_ffec_right := to_unsigned(7, 3);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1552_c1_a9d5_iffalse := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1552_c2_7098_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1558_c3_c96a := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c7_bc2d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1558_c3_c96a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1570_c11_b50f_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1557_c11_8f3d_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c11_0f0d_right := to_unsigned(2, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l1563_c30_0482_x := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_945c_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1566_c7_dd01_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1552_c6_4c05_right := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1584_c7_0373_iftrue := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1552_c1_a9d5_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l1563_c30_0482_ins := VAR_ins;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1564_c22_9760_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1568_c22_0df6_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1552_c6_4c05_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1557_c11_8f3d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c11_0f0d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1566_c11_cc25_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1570_c11_b50f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_0d88_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1580_c11_1454_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1584_c11_ffec_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l1560_c7_3e68_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1552_c2_7098_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1557_c7_bc2d_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1560_c7_3e68_iffalse := t8;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1575_c3_a4a1_left := tmp16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1582_c31_c078_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1552_c2_7098_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1557_c7_bc2d_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1560_c7_3e68_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1566_c7_dd01_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1574_c7_945c_iffalse := tmp16;
     -- sp_relative_shift[uxn_opcodes_h_l1563_c30_0482] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1563_c30_0482_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1563_c30_0482_ins;
     sp_relative_shift_uxn_opcodes_h_l1563_c30_0482_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1563_c30_0482_x;
     sp_relative_shift_uxn_opcodes_h_l1563_c30_0482_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1563_c30_0482_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1563_c30_0482_return_output := sp_relative_shift_uxn_opcodes_h_l1563_c30_0482_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1560_l1566_l1580_l1570_DUPLICATE_3642 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1560_l1566_l1580_l1570_DUPLICATE_3642_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1570_c11_b50f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1570_c11_b50f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1570_c11_b50f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1570_c11_b50f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1570_c11_b50f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1570_c11_b50f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1570_c11_b50f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1560_c11_0f0d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1560_c11_0f0d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c11_0f0d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1560_c11_0f0d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c11_0f0d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c11_0f0d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1560_c11_0f0d_return_output;

     -- CAST_TO_int8_t[uxn_opcodes_h_l1568_c27_6f57] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l1568_c27_6f57_return_output := CAST_TO_int8_t_uint8_t(
     t8);

     -- BIN_OP_EQ[uxn_opcodes_h_l1584_c11_ffec] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1584_c11_ffec_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1584_c11_ffec_left;
     BIN_OP_EQ_uxn_opcodes_h_l1584_c11_ffec_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1584_c11_ffec_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1584_c11_ffec_return_output := BIN_OP_EQ_uxn_opcodes_h_l1584_c11_ffec_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1566_l1560_l1557_l1552_l1580_l1570_DUPLICATE_ac4c LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1566_l1560_l1557_l1552_l1580_l1570_DUPLICATE_ac4c_return_output := result.u8_value;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1571_l1575_DUPLICATE_0fd1 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1571_l1575_DUPLICATE_0fd1_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1566_c11_cc25] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1566_c11_cc25_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1566_c11_cc25_left;
     BIN_OP_EQ_uxn_opcodes_h_l1566_c11_cc25_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1566_c11_cc25_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1566_c11_cc25_return_output := BIN_OP_EQ_uxn_opcodes_h_l1566_c11_cc25_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1560_l1552_l1557_DUPLICATE_ee48 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1560_l1552_l1557_DUPLICATE_ee48_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1552_l1566_l1557_DUPLICATE_223d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1552_l1566_l1557_DUPLICATE_223d_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1574_c11_0d88] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1574_c11_0d88_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_0d88_left;
     BIN_OP_EQ_uxn_opcodes_h_l1574_c11_0d88_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_0d88_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_0d88_return_output := BIN_OP_EQ_uxn_opcodes_h_l1574_c11_0d88_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1566_l1560_l1557_l1584_l1552_l1580_l1570_DUPLICATE_b235 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1566_l1560_l1557_l1584_l1552_l1580_l1570_DUPLICATE_b235_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1557_c11_8f3d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1557_c11_8f3d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1557_c11_8f3d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1557_c11_8f3d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1557_c11_8f3d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1557_c11_8f3d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1557_c11_8f3d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1580_c11_1454] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1580_c11_1454_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1580_c11_1454_left;
     BIN_OP_EQ_uxn_opcodes_h_l1580_c11_1454_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1580_c11_1454_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1580_c11_1454_return_output := BIN_OP_EQ_uxn_opcodes_h_l1580_c11_1454_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l1582_c31_c078] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1582_c31_c078_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1582_c31_c078_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1582_c31_c078_return_output := CONST_SR_8_uxn_opcodes_h_l1582_c31_c078_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1566_l1560_l1557_l1584_l1580_l1574_l1570_DUPLICATE_ac69 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1566_l1560_l1557_l1584_l1580_l1574_l1570_DUPLICATE_ac69_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1552_l1566_l1557_DUPLICATE_96ab LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1552_l1566_l1557_DUPLICATE_96ab_return_output := result.u16_value;

     -- CAST_TO_int8_t[uxn_opcodes_h_l1564_c27_34b5] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l1564_c27_34b5_return_output := CAST_TO_int8_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1552_c6_4c05] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1552_c6_4c05_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1552_c6_4c05_left;
     BIN_OP_EQ_uxn_opcodes_h_l1552_c6_4c05_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1552_c6_4c05_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1552_c6_4c05_return_output := BIN_OP_EQ_uxn_opcodes_h_l1552_c6_4c05_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1552_c1_a9d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1552_c6_4c05_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1552_c2_7098_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1552_c6_4c05_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1552_c2_7098_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1552_c6_4c05_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1552_c2_7098_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1552_c6_4c05_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1552_c2_7098_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1552_c6_4c05_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1552_c2_7098_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1552_c6_4c05_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1552_c2_7098_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1552_c6_4c05_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1552_c2_7098_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1552_c6_4c05_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1552_c2_7098_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1552_c6_4c05_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1552_c2_7098_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1552_c6_4c05_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1557_c7_bc2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1557_c11_8f3d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1557_c7_bc2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1557_c11_8f3d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1557_c7_bc2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1557_c11_8f3d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c7_bc2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1557_c11_8f3d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c7_bc2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1557_c11_8f3d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1557_c7_bc2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1557_c11_8f3d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1557_c7_bc2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1557_c11_8f3d_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1557_c7_bc2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1557_c11_8f3d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1557_c7_bc2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1557_c11_8f3d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_3e68_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c11_0f0d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c7_3e68_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c11_0f0d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1560_c7_3e68_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c11_0f0d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c7_3e68_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c11_0f0d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c7_3e68_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c11_0f0d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1560_c7_3e68_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c11_0f0d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1560_c7_3e68_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c11_0f0d_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1560_c7_3e68_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c11_0f0d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1560_c7_3e68_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c11_0f0d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1566_c7_dd01_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1566_c11_cc25_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1566_c7_dd01_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1566_c11_cc25_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1566_c7_dd01_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1566_c11_cc25_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1566_c7_dd01_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1566_c11_cc25_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1566_c7_dd01_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1566_c11_cc25_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1566_c7_dd01_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1566_c11_cc25_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1566_c7_dd01_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1566_c11_cc25_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_af2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1570_c11_b50f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1570_c7_af2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1570_c11_b50f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_af2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1570_c11_b50f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1570_c7_af2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1570_c11_b50f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1570_c7_af2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1570_c11_b50f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_945c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_0d88_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_945c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_0d88_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_945c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_0d88_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1574_c7_945c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_0d88_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1574_c7_945c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_0d88_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1580_c7_d8bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1580_c11_1454_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1580_c7_d8bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1580_c11_1454_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1580_c7_d8bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1580_c11_1454_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1580_c7_d8bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1580_c11_1454_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_0373_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1584_c11_ffec_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1584_c7_0373_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1584_c11_ffec_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1564_c22_9760_right := VAR_CAST_TO_int8_t_uxn_opcodes_h_l1564_c27_34b5_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1568_c22_0df6_right := VAR_CAST_TO_int8_t_uxn_opcodes_h_l1568_c27_6f57_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1575_c3_a4a1_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1571_l1575_DUPLICATE_0fd1_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1572_c3_3dc7_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1571_l1575_DUPLICATE_0fd1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1552_c2_7098_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1560_l1552_l1557_DUPLICATE_ee48_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c7_bc2d_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1560_l1552_l1557_DUPLICATE_ee48_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c7_3e68_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1560_l1552_l1557_DUPLICATE_ee48_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1552_c2_7098_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1552_l1566_l1557_DUPLICATE_96ab_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1557_c7_bc2d_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1552_l1566_l1557_DUPLICATE_96ab_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1566_c7_dd01_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1552_l1566_l1557_DUPLICATE_96ab_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1557_c7_bc2d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1566_l1560_l1557_l1584_l1580_l1574_l1570_DUPLICATE_ac69_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_3e68_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1566_l1560_l1557_l1584_l1580_l1574_l1570_DUPLICATE_ac69_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1566_c7_dd01_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1566_l1560_l1557_l1584_l1580_l1574_l1570_DUPLICATE_ac69_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_af2d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1566_l1560_l1557_l1584_l1580_l1574_l1570_DUPLICATE_ac69_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_945c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1566_l1560_l1557_l1584_l1580_l1574_l1570_DUPLICATE_ac69_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1580_c7_d8bd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1566_l1560_l1557_l1584_l1580_l1574_l1570_DUPLICATE_ac69_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_0373_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1566_l1560_l1557_l1584_l1580_l1574_l1570_DUPLICATE_ac69_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1552_c2_7098_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1552_l1566_l1557_DUPLICATE_223d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1557_c7_bc2d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1552_l1566_l1557_DUPLICATE_223d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1566_c7_dd01_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1552_l1566_l1557_DUPLICATE_223d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1552_c2_7098_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1566_l1560_l1557_l1584_l1552_l1580_l1570_DUPLICATE_b235_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1557_c7_bc2d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1566_l1560_l1557_l1584_l1552_l1580_l1570_DUPLICATE_b235_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1560_c7_3e68_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1566_l1560_l1557_l1584_l1552_l1580_l1570_DUPLICATE_b235_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1566_c7_dd01_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1566_l1560_l1557_l1584_l1552_l1580_l1570_DUPLICATE_b235_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1570_c7_af2d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1566_l1560_l1557_l1584_l1552_l1580_l1570_DUPLICATE_b235_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1580_c7_d8bd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1566_l1560_l1557_l1584_l1552_l1580_l1570_DUPLICATE_b235_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1584_c7_0373_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1566_l1560_l1557_l1584_l1552_l1580_l1570_DUPLICATE_b235_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c7_3e68_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1560_l1566_l1580_l1570_DUPLICATE_3642_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1566_c7_dd01_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1560_l1566_l1580_l1570_DUPLICATE_3642_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_af2d_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1560_l1566_l1580_l1570_DUPLICATE_3642_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1580_c7_d8bd_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1560_l1566_l1580_l1570_DUPLICATE_3642_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1552_c2_7098_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1566_l1560_l1557_l1552_l1580_l1570_DUPLICATE_ac4c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1557_c7_bc2d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1566_l1560_l1557_l1552_l1580_l1570_DUPLICATE_ac4c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1560_c7_3e68_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1566_l1560_l1557_l1552_l1580_l1570_DUPLICATE_ac4c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1566_c7_dd01_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1566_l1560_l1557_l1552_l1580_l1570_DUPLICATE_ac4c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1570_c7_af2d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1566_l1560_l1557_l1552_l1580_l1570_DUPLICATE_ac4c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1580_c7_d8bd_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1566_l1560_l1557_l1552_l1580_l1570_DUPLICATE_ac4c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c7_3e68_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1563_c30_0482_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1552_c1_a9d5] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1552_c1_a9d5_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1552_c1_a9d5_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1552_c1_a9d5_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1552_c1_a9d5_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1552_c1_a9d5_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1552_c1_a9d5_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1552_c1_a9d5_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1552_c1_a9d5_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1575_c3_a4a1] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1575_c3_a4a1_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1575_c3_a4a1_left;
     BIN_OP_OR_uxn_opcodes_h_l1575_c3_a4a1_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1575_c3_a4a1_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1575_c3_a4a1_return_output := BIN_OP_OR_uxn_opcodes_h_l1575_c3_a4a1_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1568_c22_0df6] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1568_c22_0df6_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1568_c22_0df6_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1568_c22_0df6_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1568_c22_0df6_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1568_c22_0df6_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1568_c22_0df6_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1572_c3_3dc7] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1572_c3_3dc7_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1572_c3_3dc7_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1572_c3_3dc7_return_output := CONST_SL_8_uxn_opcodes_h_l1572_c3_3dc7_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1564_c22_9760] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1564_c22_9760_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1564_c22_9760_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1564_c22_9760_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1564_c22_9760_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1564_c22_9760_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1564_c22_9760_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1584_c7_0373] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1584_c7_0373_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1584_c7_0373_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1584_c7_0373_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1584_c7_0373_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1584_c7_0373_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1584_c7_0373_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1584_c7_0373_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1584_c7_0373_return_output;

     -- t8_MUX[uxn_opcodes_h_l1560_c7_3e68] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1560_c7_3e68_cond <= VAR_t8_MUX_uxn_opcodes_h_l1560_c7_3e68_cond;
     t8_MUX_uxn_opcodes_h_l1560_c7_3e68_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1560_c7_3e68_iftrue;
     t8_MUX_uxn_opcodes_h_l1560_c7_3e68_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1560_c7_3e68_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1560_c7_3e68_return_output := t8_MUX_uxn_opcodes_h_l1560_c7_3e68_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1566_c7_dd01] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1566_c7_dd01_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1566_c7_dd01_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1566_c7_dd01_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1566_c7_dd01_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1566_c7_dd01_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1566_c7_dd01_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1566_c7_dd01_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1566_c7_dd01_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1580_c7_d8bd] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1580_c7_d8bd_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1580_c7_d8bd_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1580_c7_d8bd_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1580_c7_d8bd_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1580_c7_d8bd_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1580_c7_d8bd_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1580_c7_d8bd_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1580_c7_d8bd_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1560_c7_3e68] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c7_3e68_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c7_3e68_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c7_3e68_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c7_3e68_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c7_3e68_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c7_3e68_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c7_3e68_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c7_3e68_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1584_c7_0373] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_0373_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_0373_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_0373_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_0373_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_0373_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_0373_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_0373_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_0373_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1582_c21_4ae3] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1582_c21_4ae3_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1582_c31_c078_return_output);

     -- Submodule level 2
     VAR_tmp16_MUX_uxn_opcodes_h_l1574_c7_945c_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1575_c3_a4a1_return_output;
     VAR_result_u16_value_uxn_opcodes_h_l1564_c3_df69 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1564_c22_9760_return_output)),16);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1568_c22_c000_left := VAR_BIN_OP_PLUS_uxn_opcodes_h_l1568_c22_0df6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1580_c7_d8bd_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1582_c21_4ae3_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1570_c7_af2d_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1572_c3_3dc7_return_output;
     VAR_printf_uxn_opcodes_h_l1553_c3_c9bf_uxn_opcodes_h_l1553_c3_c9bf_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1552_c1_a9d5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1580_c7_d8bd_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_0373_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c7_3e68_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1566_c7_dd01_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1580_c7_d8bd_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1584_c7_0373_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c7_bc2d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c7_3e68_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_945c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1580_c7_d8bd_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1557_c7_bc2d_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1560_c7_3e68_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1560_c7_3e68_iftrue := VAR_result_u16_value_uxn_opcodes_h_l1564_c3_df69;
     -- tmp16_MUX[uxn_opcodes_h_l1574_c7_945c] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1574_c7_945c_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1574_c7_945c_cond;
     tmp16_MUX_uxn_opcodes_h_l1574_c7_945c_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1574_c7_945c_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1574_c7_945c_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1574_c7_945c_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1574_c7_945c_return_output := tmp16_MUX_uxn_opcodes_h_l1574_c7_945c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1560_c7_3e68] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c7_3e68_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c7_3e68_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c7_3e68_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c7_3e68_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c7_3e68_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c7_3e68_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c7_3e68_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c7_3e68_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1580_c7_d8bd] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1580_c7_d8bd_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1580_c7_d8bd_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1580_c7_d8bd_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1580_c7_d8bd_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1580_c7_d8bd_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1580_c7_d8bd_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1580_c7_d8bd_return_output := result_u8_value_MUX_uxn_opcodes_h_l1580_c7_d8bd_return_output;

     -- t8_MUX[uxn_opcodes_h_l1557_c7_bc2d] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1557_c7_bc2d_cond <= VAR_t8_MUX_uxn_opcodes_h_l1557_c7_bc2d_cond;
     t8_MUX_uxn_opcodes_h_l1557_c7_bc2d_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1557_c7_bc2d_iftrue;
     t8_MUX_uxn_opcodes_h_l1557_c7_bc2d_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1557_c7_bc2d_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1557_c7_bc2d_return_output := t8_MUX_uxn_opcodes_h_l1557_c7_bc2d_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1578_c21_f511] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1578_c21_f511_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_OR_uxn_opcodes_h_l1575_c3_a4a1_return_output);

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1574_c7_945c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_945c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_945c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_945c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_945c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_945c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_945c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_945c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_945c_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1568_c22_c000] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1568_c22_c000_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1568_c22_c000_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1568_c22_c000_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1568_c22_c000_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1568_c22_c000_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1568_c22_c000_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1580_c7_d8bd] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1580_c7_d8bd_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1580_c7_d8bd_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1580_c7_d8bd_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1580_c7_d8bd_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1580_c7_d8bd_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1580_c7_d8bd_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1580_c7_d8bd_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1580_c7_d8bd_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1580_c7_d8bd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1580_c7_d8bd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1580_c7_d8bd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1580_c7_d8bd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1580_c7_d8bd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1580_c7_d8bd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1580_c7_d8bd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1580_c7_d8bd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1580_c7_d8bd_return_output;

     -- printf_uxn_opcodes_h_l1553_c3_c9bf[uxn_opcodes_h_l1553_c3_c9bf] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1553_c3_c9bf_uxn_opcodes_h_l1553_c3_c9bf_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1553_c3_c9bf_uxn_opcodes_h_l1553_c3_c9bf_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1557_c7_bc2d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c7_bc2d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c7_bc2d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c7_bc2d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c7_bc2d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c7_bc2d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c7_bc2d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c7_bc2d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c7_bc2d_return_output;

     -- Submodule level 3
     VAR_result_u16_value_uxn_opcodes_h_l1568_c3_4a86 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1568_c22_c000_return_output)),16);
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1574_c7_945c_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1578_c21_f511_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_945c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1580_c7_d8bd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1557_c7_bc2d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c7_3e68_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_945c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1580_c7_d8bd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1552_c2_7098_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c7_bc2d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_af2d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_945c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1574_c7_945c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1580_c7_d8bd_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1552_c2_7098_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1557_c7_bc2d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1570_c7_af2d_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1574_c7_945c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1566_c7_dd01_iftrue := VAR_result_u16_value_uxn_opcodes_h_l1568_c3_4a86;
     -- result_u8_value_MUX[uxn_opcodes_h_l1574_c7_945c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1574_c7_945c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1574_c7_945c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1574_c7_945c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1574_c7_945c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1574_c7_945c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1574_c7_945c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1574_c7_945c_return_output := result_u8_value_MUX_uxn_opcodes_h_l1574_c7_945c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1570_c7_af2d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_af2d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_af2d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_af2d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_af2d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_af2d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_af2d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_af2d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_af2d_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1570_c7_af2d] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1570_c7_af2d_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1570_c7_af2d_cond;
     tmp16_MUX_uxn_opcodes_h_l1570_c7_af2d_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1570_c7_af2d_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1570_c7_af2d_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1570_c7_af2d_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1570_c7_af2d_return_output := tmp16_MUX_uxn_opcodes_h_l1570_c7_af2d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1557_c7_bc2d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1557_c7_bc2d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1557_c7_bc2d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1557_c7_bc2d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1557_c7_bc2d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1557_c7_bc2d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1557_c7_bc2d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1557_c7_bc2d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1557_c7_bc2d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1574_c7_945c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_945c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_945c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_945c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_945c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_945c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_945c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_945c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_945c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1552_c2_7098] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1552_c2_7098_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1552_c2_7098_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1552_c2_7098_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1552_c2_7098_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1552_c2_7098_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1552_c2_7098_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1552_c2_7098_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1552_c2_7098_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1566_c7_dd01] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1566_c7_dd01_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1566_c7_dd01_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1566_c7_dd01_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1566_c7_dd01_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1566_c7_dd01_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1566_c7_dd01_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1566_c7_dd01_return_output := result_u16_value_MUX_uxn_opcodes_h_l1566_c7_dd01_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1574_c7_945c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_945c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_945c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_945c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_945c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_945c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_945c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_945c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_945c_return_output;

     -- t8_MUX[uxn_opcodes_h_l1552_c2_7098] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1552_c2_7098_cond <= VAR_t8_MUX_uxn_opcodes_h_l1552_c2_7098_cond;
     t8_MUX_uxn_opcodes_h_l1552_c2_7098_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1552_c2_7098_iftrue;
     t8_MUX_uxn_opcodes_h_l1552_c2_7098_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1552_c2_7098_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1552_c2_7098_return_output := t8_MUX_uxn_opcodes_h_l1552_c2_7098_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_af2d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_945c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1552_c2_7098_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1557_c7_bc2d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1570_c7_af2d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_945c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1566_c7_dd01_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_af2d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1560_c7_3e68_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1566_c7_dd01_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1570_c7_af2d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1574_c7_945c_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1552_c2_7098_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1566_c7_dd01_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1570_c7_af2d_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1570_c7_af2d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_af2d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_af2d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_af2d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_af2d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_af2d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_af2d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_af2d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_af2d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1570_c7_af2d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1570_c7_af2d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1570_c7_af2d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1570_c7_af2d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1570_c7_af2d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1570_c7_af2d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1570_c7_af2d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1570_c7_af2d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1570_c7_af2d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1552_c2_7098] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1552_c2_7098_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1552_c2_7098_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1552_c2_7098_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1552_c2_7098_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1552_c2_7098_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1552_c2_7098_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1552_c2_7098_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1552_c2_7098_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1560_c7_3e68] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1560_c7_3e68_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1560_c7_3e68_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1560_c7_3e68_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1560_c7_3e68_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1560_c7_3e68_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1560_c7_3e68_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1560_c7_3e68_return_output := result_u16_value_MUX_uxn_opcodes_h_l1560_c7_3e68_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1566_c7_dd01] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1566_c7_dd01_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1566_c7_dd01_cond;
     tmp16_MUX_uxn_opcodes_h_l1566_c7_dd01_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1566_c7_dd01_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1566_c7_dd01_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1566_c7_dd01_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1566_c7_dd01_return_output := tmp16_MUX_uxn_opcodes_h_l1566_c7_dd01_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1570_c7_af2d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1570_c7_af2d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1570_c7_af2d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1570_c7_af2d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1570_c7_af2d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1570_c7_af2d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1570_c7_af2d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1570_c7_af2d_return_output := result_u8_value_MUX_uxn_opcodes_h_l1570_c7_af2d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1566_c7_dd01] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1566_c7_dd01_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1566_c7_dd01_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1566_c7_dd01_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1566_c7_dd01_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1566_c7_dd01_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1566_c7_dd01_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1566_c7_dd01_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1566_c7_dd01_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1566_c7_dd01_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_af2d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1566_c7_dd01_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1570_c7_af2d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c7_3e68_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1566_c7_dd01_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1557_c7_bc2d_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1560_c7_3e68_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1566_c7_dd01_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1570_c7_af2d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1560_c7_3e68_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1566_c7_dd01_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1566_c7_dd01] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1566_c7_dd01_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1566_c7_dd01_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1566_c7_dd01_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1566_c7_dd01_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1566_c7_dd01_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1566_c7_dd01_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1566_c7_dd01_return_output := result_u8_value_MUX_uxn_opcodes_h_l1566_c7_dd01_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1560_c7_3e68] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1560_c7_3e68_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1560_c7_3e68_cond;
     tmp16_MUX_uxn_opcodes_h_l1560_c7_3e68_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1560_c7_3e68_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1560_c7_3e68_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1560_c7_3e68_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1560_c7_3e68_return_output := tmp16_MUX_uxn_opcodes_h_l1560_c7_3e68_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1566_c7_dd01] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1566_c7_dd01_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1566_c7_dd01_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1566_c7_dd01_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1566_c7_dd01_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1566_c7_dd01_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1566_c7_dd01_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1566_c7_dd01_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1566_c7_dd01_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1566_c7_dd01] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1566_c7_dd01_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1566_c7_dd01_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1566_c7_dd01_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1566_c7_dd01_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1566_c7_dd01_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1566_c7_dd01_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1566_c7_dd01_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1566_c7_dd01_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1560_c7_3e68] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c7_3e68_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c7_3e68_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c7_3e68_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c7_3e68_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c7_3e68_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c7_3e68_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c7_3e68_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c7_3e68_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1557_c7_bc2d] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1557_c7_bc2d_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1557_c7_bc2d_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1557_c7_bc2d_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1557_c7_bc2d_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1557_c7_bc2d_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1557_c7_bc2d_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1557_c7_bc2d_return_output := result_u16_value_MUX_uxn_opcodes_h_l1557_c7_bc2d_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_3e68_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1566_c7_dd01_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1560_c7_3e68_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1566_c7_dd01_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c7_bc2d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c7_3e68_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1552_c2_7098_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1557_c7_bc2d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1560_c7_3e68_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1566_c7_dd01_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1557_c7_bc2d_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1560_c7_3e68_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1557_c7_bc2d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c7_bc2d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c7_bc2d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c7_bc2d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c7_bc2d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c7_bc2d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c7_bc2d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c7_bc2d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c7_bc2d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1560_c7_3e68] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_3e68_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_3e68_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_3e68_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_3e68_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_3e68_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_3e68_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_3e68_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_3e68_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1557_c7_bc2d] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1557_c7_bc2d_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1557_c7_bc2d_cond;
     tmp16_MUX_uxn_opcodes_h_l1557_c7_bc2d_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1557_c7_bc2d_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1557_c7_bc2d_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1557_c7_bc2d_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1557_c7_bc2d_return_output := tmp16_MUX_uxn_opcodes_h_l1557_c7_bc2d_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1552_c2_7098] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1552_c2_7098_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1552_c2_7098_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1552_c2_7098_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1552_c2_7098_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1552_c2_7098_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1552_c2_7098_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1552_c2_7098_return_output := result_u16_value_MUX_uxn_opcodes_h_l1552_c2_7098_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1560_c7_3e68] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1560_c7_3e68_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1560_c7_3e68_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1560_c7_3e68_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1560_c7_3e68_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1560_c7_3e68_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1560_c7_3e68_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1560_c7_3e68_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1560_c7_3e68_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1560_c7_3e68] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1560_c7_3e68_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1560_c7_3e68_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1560_c7_3e68_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1560_c7_3e68_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1560_c7_3e68_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1560_c7_3e68_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1560_c7_3e68_return_output := result_u8_value_MUX_uxn_opcodes_h_l1560_c7_3e68_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1557_c7_bc2d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_3e68_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1557_c7_bc2d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1560_c7_3e68_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1552_c2_7098_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c7_bc2d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1557_c7_bc2d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1560_c7_3e68_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1552_c2_7098_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1557_c7_bc2d_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1552_c2_7098] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1552_c2_7098_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1552_c2_7098_cond;
     tmp16_MUX_uxn_opcodes_h_l1552_c2_7098_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1552_c2_7098_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1552_c2_7098_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1552_c2_7098_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1552_c2_7098_return_output := tmp16_MUX_uxn_opcodes_h_l1552_c2_7098_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1557_c7_bc2d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1557_c7_bc2d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1557_c7_bc2d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1557_c7_bc2d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1557_c7_bc2d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1557_c7_bc2d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1557_c7_bc2d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1557_c7_bc2d_return_output := result_u8_value_MUX_uxn_opcodes_h_l1557_c7_bc2d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1557_c7_bc2d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1557_c7_bc2d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1557_c7_bc2d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1557_c7_bc2d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1557_c7_bc2d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1557_c7_bc2d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1557_c7_bc2d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1557_c7_bc2d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1557_c7_bc2d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1552_c2_7098] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1552_c2_7098_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1552_c2_7098_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1552_c2_7098_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1552_c2_7098_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1552_c2_7098_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1552_c2_7098_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1552_c2_7098_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1552_c2_7098_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1557_c7_bc2d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1557_c7_bc2d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1557_c7_bc2d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1557_c7_bc2d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1557_c7_bc2d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1557_c7_bc2d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1557_c7_bc2d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1557_c7_bc2d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1557_c7_bc2d_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1552_c2_7098_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1557_c7_bc2d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1552_c2_7098_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1557_c7_bc2d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1552_c2_7098_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1557_c7_bc2d_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1552_c2_7098_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1552_c2_7098] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1552_c2_7098_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1552_c2_7098_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1552_c2_7098_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1552_c2_7098_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1552_c2_7098_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1552_c2_7098_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1552_c2_7098_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1552_c2_7098_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1552_c2_7098] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1552_c2_7098_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1552_c2_7098_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1552_c2_7098_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1552_c2_7098_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1552_c2_7098_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1552_c2_7098_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1552_c2_7098_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1552_c2_7098_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1552_c2_7098] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1552_c2_7098_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1552_c2_7098_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1552_c2_7098_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1552_c2_7098_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1552_c2_7098_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1552_c2_7098_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1552_c2_7098_return_output := result_u8_value_MUX_uxn_opcodes_h_l1552_c2_7098_return_output;

     -- Submodule level 9
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_ff87_uxn_opcodes_h_l1589_l1547_DUPLICATE_ca71 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ff87_uxn_opcodes_h_l1589_l1547_DUPLICATE_ca71_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_ff87(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1552_c2_7098_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1552_c2_7098_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1552_c2_7098_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1552_c2_7098_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1552_c2_7098_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1552_c2_7098_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1552_c2_7098_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ff87_uxn_opcodes_h_l1589_l1547_DUPLICATE_ca71_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ff87_uxn_opcodes_h_l1589_l1547_DUPLICATE_ca71_return_output;
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
