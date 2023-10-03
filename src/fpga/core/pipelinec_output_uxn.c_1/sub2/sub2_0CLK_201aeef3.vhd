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
-- Submodules: 123
entity sub2_0CLK_201aeef3 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end sub2_0CLK_201aeef3;
architecture arch of sub2_0CLK_201aeef3 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1693_c6_167e]
signal BIN_OP_EQ_uxn_opcodes_h_l1693_c6_167e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1693_c6_167e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1693_c6_167e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1693_c1_bb3b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1693_c1_bb3b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1693_c1_bb3b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1693_c1_bb3b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1693_c1_bb3b_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1693_c2_73fd]
signal tmp16_MUX_uxn_opcodes_h_l1693_c2_73fd_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1693_c2_73fd_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1693_c2_73fd_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1693_c2_73fd_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1693_c2_73fd]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1693_c2_73fd_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1693_c2_73fd_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1693_c2_73fd_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1693_c2_73fd_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1693_c2_73fd]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1693_c2_73fd_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1693_c2_73fd_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1693_c2_73fd_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1693_c2_73fd_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1693_c2_73fd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1693_c2_73fd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1693_c2_73fd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1693_c2_73fd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1693_c2_73fd_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1693_c2_73fd]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1693_c2_73fd_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1693_c2_73fd_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1693_c2_73fd_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1693_c2_73fd_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1693_c2_73fd]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1693_c2_73fd_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1693_c2_73fd_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1693_c2_73fd_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1693_c2_73fd_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1693_c2_73fd]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1693_c2_73fd_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1693_c2_73fd_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1693_c2_73fd_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1693_c2_73fd_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1693_c2_73fd]
signal result_stack_value_MUX_uxn_opcodes_h_l1693_c2_73fd_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1693_c2_73fd_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1693_c2_73fd_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1693_c2_73fd_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1693_c2_73fd]
signal t16_MUX_uxn_opcodes_h_l1693_c2_73fd_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1693_c2_73fd_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1693_c2_73fd_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1693_c2_73fd_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1693_c2_73fd]
signal n16_MUX_uxn_opcodes_h_l1693_c2_73fd_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1693_c2_73fd_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1693_c2_73fd_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1693_c2_73fd_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l1694_c3_4d0e[uxn_opcodes_h_l1694_c3_4d0e]
signal printf_uxn_opcodes_h_l1694_c3_4d0e_uxn_opcodes_h_l1694_c3_4d0e_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1699_c11_b0ca]
signal BIN_OP_EQ_uxn_opcodes_h_l1699_c11_b0ca_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1699_c11_b0ca_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1699_c11_b0ca_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1699_c7_7f53]
signal tmp16_MUX_uxn_opcodes_h_l1699_c7_7f53_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1699_c7_7f53_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1699_c7_7f53_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1699_c7_7f53_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1699_c7_7f53]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1699_c7_7f53_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1699_c7_7f53_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1699_c7_7f53_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1699_c7_7f53_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1699_c7_7f53]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c7_7f53_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c7_7f53_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c7_7f53_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c7_7f53_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1699_c7_7f53]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_7f53_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_7f53_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_7f53_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_7f53_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1699_c7_7f53]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1699_c7_7f53_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1699_c7_7f53_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1699_c7_7f53_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1699_c7_7f53_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1699_c7_7f53]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1699_c7_7f53_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1699_c7_7f53_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1699_c7_7f53_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1699_c7_7f53_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1699_c7_7f53]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1699_c7_7f53_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1699_c7_7f53_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1699_c7_7f53_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1699_c7_7f53_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1699_c7_7f53]
signal result_stack_value_MUX_uxn_opcodes_h_l1699_c7_7f53_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1699_c7_7f53_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1699_c7_7f53_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1699_c7_7f53_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1699_c7_7f53]
signal t16_MUX_uxn_opcodes_h_l1699_c7_7f53_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1699_c7_7f53_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1699_c7_7f53_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1699_c7_7f53_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1699_c7_7f53]
signal n16_MUX_uxn_opcodes_h_l1699_c7_7f53_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1699_c7_7f53_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1699_c7_7f53_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1699_c7_7f53_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1702_c11_b011]
signal BIN_OP_EQ_uxn_opcodes_h_l1702_c11_b011_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1702_c11_b011_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1702_c11_b011_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1702_c7_4c19]
signal tmp16_MUX_uxn_opcodes_h_l1702_c7_4c19_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1702_c7_4c19_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1702_c7_4c19_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1702_c7_4c19_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1702_c7_4c19]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1702_c7_4c19_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1702_c7_4c19_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1702_c7_4c19_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1702_c7_4c19_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1702_c7_4c19]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1702_c7_4c19_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1702_c7_4c19_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1702_c7_4c19_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1702_c7_4c19_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1702_c7_4c19]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1702_c7_4c19_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1702_c7_4c19_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1702_c7_4c19_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1702_c7_4c19_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1702_c7_4c19]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1702_c7_4c19_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1702_c7_4c19_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1702_c7_4c19_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1702_c7_4c19_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1702_c7_4c19]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1702_c7_4c19_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1702_c7_4c19_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1702_c7_4c19_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1702_c7_4c19_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1702_c7_4c19]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1702_c7_4c19_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1702_c7_4c19_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1702_c7_4c19_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1702_c7_4c19_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1702_c7_4c19]
signal result_stack_value_MUX_uxn_opcodes_h_l1702_c7_4c19_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1702_c7_4c19_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1702_c7_4c19_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1702_c7_4c19_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1702_c7_4c19]
signal t16_MUX_uxn_opcodes_h_l1702_c7_4c19_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1702_c7_4c19_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1702_c7_4c19_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1702_c7_4c19_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1702_c7_4c19]
signal n16_MUX_uxn_opcodes_h_l1702_c7_4c19_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1702_c7_4c19_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1702_c7_4c19_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1702_c7_4c19_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1707_c11_c9d5]
signal BIN_OP_EQ_uxn_opcodes_h_l1707_c11_c9d5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1707_c11_c9d5_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1707_c11_c9d5_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1707_c7_4bae]
signal tmp16_MUX_uxn_opcodes_h_l1707_c7_4bae_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1707_c7_4bae_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1707_c7_4bae_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1707_c7_4bae_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1707_c7_4bae]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1707_c7_4bae_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1707_c7_4bae_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1707_c7_4bae_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1707_c7_4bae_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1707_c7_4bae]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1707_c7_4bae_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1707_c7_4bae_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1707_c7_4bae_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1707_c7_4bae_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1707_c7_4bae]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1707_c7_4bae_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1707_c7_4bae_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1707_c7_4bae_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1707_c7_4bae_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1707_c7_4bae]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1707_c7_4bae_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1707_c7_4bae_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1707_c7_4bae_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1707_c7_4bae_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1707_c7_4bae]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1707_c7_4bae_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1707_c7_4bae_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1707_c7_4bae_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1707_c7_4bae_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1707_c7_4bae]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1707_c7_4bae_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1707_c7_4bae_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1707_c7_4bae_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1707_c7_4bae_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1707_c7_4bae]
signal result_stack_value_MUX_uxn_opcodes_h_l1707_c7_4bae_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1707_c7_4bae_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1707_c7_4bae_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1707_c7_4bae_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1707_c7_4bae]
signal t16_MUX_uxn_opcodes_h_l1707_c7_4bae_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1707_c7_4bae_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1707_c7_4bae_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1707_c7_4bae_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1707_c7_4bae]
signal n16_MUX_uxn_opcodes_h_l1707_c7_4bae_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1707_c7_4bae_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1707_c7_4bae_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1707_c7_4bae_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1710_c11_e056]
signal BIN_OP_EQ_uxn_opcodes_h_l1710_c11_e056_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1710_c11_e056_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1710_c11_e056_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1710_c7_8ba5]
signal tmp16_MUX_uxn_opcodes_h_l1710_c7_8ba5_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1710_c7_8ba5_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1710_c7_8ba5_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1710_c7_8ba5_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1710_c7_8ba5]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1710_c7_8ba5_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1710_c7_8ba5_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1710_c7_8ba5_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1710_c7_8ba5_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1710_c7_8ba5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1710_c7_8ba5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1710_c7_8ba5_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1710_c7_8ba5_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1710_c7_8ba5_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1710_c7_8ba5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_8ba5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_8ba5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_8ba5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_8ba5_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1710_c7_8ba5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_8ba5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_8ba5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_8ba5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_8ba5_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1710_c7_8ba5]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1710_c7_8ba5_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1710_c7_8ba5_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1710_c7_8ba5_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1710_c7_8ba5_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1710_c7_8ba5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_8ba5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_8ba5_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_8ba5_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_8ba5_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1710_c7_8ba5]
signal result_stack_value_MUX_uxn_opcodes_h_l1710_c7_8ba5_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1710_c7_8ba5_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1710_c7_8ba5_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1710_c7_8ba5_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1710_c7_8ba5]
signal t16_MUX_uxn_opcodes_h_l1710_c7_8ba5_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1710_c7_8ba5_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1710_c7_8ba5_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1710_c7_8ba5_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1710_c7_8ba5]
signal n16_MUX_uxn_opcodes_h_l1710_c7_8ba5_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1710_c7_8ba5_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1710_c7_8ba5_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1710_c7_8ba5_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1711_c3_eec9]
signal BIN_OP_OR_uxn_opcodes_h_l1711_c3_eec9_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1711_c3_eec9_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1711_c3_eec9_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1714_c11_46df]
signal BIN_OP_EQ_uxn_opcodes_h_l1714_c11_46df_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1714_c11_46df_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1714_c11_46df_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1714_c7_30bc]
signal tmp16_MUX_uxn_opcodes_h_l1714_c7_30bc_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1714_c7_30bc_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1714_c7_30bc_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1714_c7_30bc_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1714_c7_30bc]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1714_c7_30bc_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1714_c7_30bc_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1714_c7_30bc_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1714_c7_30bc_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1714_c7_30bc]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1714_c7_30bc_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1714_c7_30bc_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1714_c7_30bc_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1714_c7_30bc_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1714_c7_30bc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_30bc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_30bc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_30bc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_30bc_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1714_c7_30bc]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_30bc_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_30bc_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_30bc_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_30bc_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1714_c7_30bc]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1714_c7_30bc_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1714_c7_30bc_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1714_c7_30bc_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1714_c7_30bc_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1714_c7_30bc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1714_c7_30bc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1714_c7_30bc_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1714_c7_30bc_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1714_c7_30bc_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1714_c7_30bc]
signal result_stack_value_MUX_uxn_opcodes_h_l1714_c7_30bc_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1714_c7_30bc_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1714_c7_30bc_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1714_c7_30bc_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l1714_c7_30bc]
signal n16_MUX_uxn_opcodes_h_l1714_c7_30bc_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1714_c7_30bc_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1714_c7_30bc_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1714_c7_30bc_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1717_c11_62b1]
signal BIN_OP_EQ_uxn_opcodes_h_l1717_c11_62b1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1717_c11_62b1_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1717_c11_62b1_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1717_c7_d8c1]
signal tmp16_MUX_uxn_opcodes_h_l1717_c7_d8c1_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1717_c7_d8c1_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1717_c7_d8c1_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1717_c7_d8c1_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1717_c7_d8c1]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1717_c7_d8c1_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1717_c7_d8c1_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1717_c7_d8c1_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1717_c7_d8c1_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1717_c7_d8c1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c7_d8c1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c7_d8c1_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c7_d8c1_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c7_d8c1_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1717_c7_d8c1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1717_c7_d8c1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1717_c7_d8c1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1717_c7_d8c1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1717_c7_d8c1_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1717_c7_d8c1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1717_c7_d8c1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1717_c7_d8c1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1717_c7_d8c1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1717_c7_d8c1_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1717_c7_d8c1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1717_c7_d8c1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1717_c7_d8c1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1717_c7_d8c1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1717_c7_d8c1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1717_c7_d8c1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c7_d8c1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c7_d8c1_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c7_d8c1_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c7_d8c1_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1717_c7_d8c1]
signal result_stack_value_MUX_uxn_opcodes_h_l1717_c7_d8c1_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1717_c7_d8c1_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1717_c7_d8c1_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1717_c7_d8c1_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l1717_c7_d8c1]
signal n16_MUX_uxn_opcodes_h_l1717_c7_d8c1_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1717_c7_d8c1_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1717_c7_d8c1_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1717_c7_d8c1_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1722_c11_0aff]
signal BIN_OP_EQ_uxn_opcodes_h_l1722_c11_0aff_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1722_c11_0aff_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1722_c11_0aff_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1722_c7_19a7]
signal tmp16_MUX_uxn_opcodes_h_l1722_c7_19a7_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1722_c7_19a7_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1722_c7_19a7_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1722_c7_19a7_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1722_c7_19a7]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1722_c7_19a7_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1722_c7_19a7_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1722_c7_19a7_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1722_c7_19a7_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1722_c7_19a7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1722_c7_19a7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1722_c7_19a7_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1722_c7_19a7_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1722_c7_19a7_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1722_c7_19a7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1722_c7_19a7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1722_c7_19a7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1722_c7_19a7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1722_c7_19a7_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1722_c7_19a7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1722_c7_19a7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1722_c7_19a7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1722_c7_19a7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1722_c7_19a7_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1722_c7_19a7]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1722_c7_19a7_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1722_c7_19a7_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1722_c7_19a7_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1722_c7_19a7_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1722_c7_19a7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1722_c7_19a7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1722_c7_19a7_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1722_c7_19a7_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1722_c7_19a7_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1722_c7_19a7]
signal result_stack_value_MUX_uxn_opcodes_h_l1722_c7_19a7_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1722_c7_19a7_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1722_c7_19a7_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1722_c7_19a7_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l1722_c7_19a7]
signal n16_MUX_uxn_opcodes_h_l1722_c7_19a7_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1722_c7_19a7_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1722_c7_19a7_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1722_c7_19a7_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1725_c11_8295]
signal BIN_OP_EQ_uxn_opcodes_h_l1725_c11_8295_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1725_c11_8295_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1725_c11_8295_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1725_c7_d643]
signal tmp16_MUX_uxn_opcodes_h_l1725_c7_d643_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1725_c7_d643_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1725_c7_d643_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1725_c7_d643_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1725_c7_d643]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1725_c7_d643_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1725_c7_d643_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1725_c7_d643_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1725_c7_d643_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1725_c7_d643]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1725_c7_d643_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1725_c7_d643_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1725_c7_d643_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1725_c7_d643_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1725_c7_d643]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1725_c7_d643_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1725_c7_d643_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1725_c7_d643_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1725_c7_d643_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1725_c7_d643]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1725_c7_d643_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1725_c7_d643_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1725_c7_d643_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1725_c7_d643_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1725_c7_d643]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1725_c7_d643_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1725_c7_d643_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1725_c7_d643_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1725_c7_d643_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1725_c7_d643]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1725_c7_d643_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1725_c7_d643_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1725_c7_d643_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1725_c7_d643_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1725_c7_d643]
signal result_stack_value_MUX_uxn_opcodes_h_l1725_c7_d643_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1725_c7_d643_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1725_c7_d643_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1725_c7_d643_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l1725_c7_d643]
signal n16_MUX_uxn_opcodes_h_l1725_c7_d643_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1725_c7_d643_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1725_c7_d643_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1725_c7_d643_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1726_c3_aefa]
signal BIN_OP_OR_uxn_opcodes_h_l1726_c3_aefa_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1726_c3_aefa_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1726_c3_aefa_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l1727_c11_94b7]
signal BIN_OP_MINUS_uxn_opcodes_h_l1727_c11_94b7_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l1727_c11_94b7_right : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l1727_c11_94b7_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1730_c32_6f0c]
signal BIN_OP_AND_uxn_opcodes_h_l1730_c32_6f0c_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1730_c32_6f0c_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1730_c32_6f0c_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1730_c32_9a6b]
signal BIN_OP_GT_uxn_opcodes_h_l1730_c32_9a6b_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1730_c32_9a6b_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1730_c32_9a6b_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1730_c32_07a6]
signal MUX_uxn_opcodes_h_l1730_c32_07a6_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1730_c32_07a6_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1730_c32_07a6_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1730_c32_07a6_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1732_c11_e3f5]
signal BIN_OP_EQ_uxn_opcodes_h_l1732_c11_e3f5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1732_c11_e3f5_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1732_c11_e3f5_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1732_c7_fb6f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1732_c7_fb6f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1732_c7_fb6f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1732_c7_fb6f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1732_c7_fb6f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1732_c7_fb6f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1732_c7_fb6f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1732_c7_fb6f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1732_c7_fb6f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1732_c7_fb6f_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1732_c7_fb6f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1732_c7_fb6f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1732_c7_fb6f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1732_c7_fb6f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1732_c7_fb6f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1732_c7_fb6f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1732_c7_fb6f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1732_c7_fb6f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1732_c7_fb6f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1732_c7_fb6f_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1732_c7_fb6f]
signal result_stack_value_MUX_uxn_opcodes_h_l1732_c7_fb6f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1732_c7_fb6f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1732_c7_fb6f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1732_c7_fb6f_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1738_c11_91fa]
signal BIN_OP_EQ_uxn_opcodes_h_l1738_c11_91fa_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1738_c11_91fa_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1738_c11_91fa_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1738_c7_467a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1738_c7_467a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1738_c7_467a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1738_c7_467a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1738_c7_467a_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1738_c7_467a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1738_c7_467a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1738_c7_467a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1738_c7_467a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1738_c7_467a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1738_c7_467a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_467a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_467a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_467a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_467a_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1738_c7_467a]
signal result_stack_value_MUX_uxn_opcodes_h_l1738_c7_467a_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1738_c7_467a_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1738_c7_467a_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1738_c7_467a_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1740_c34_66c0]
signal CONST_SR_8_uxn_opcodes_h_l1740_c34_66c0_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1740_c34_66c0_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1742_c11_fa64]
signal BIN_OP_EQ_uxn_opcodes_h_l1742_c11_fa64_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1742_c11_fa64_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1742_c11_fa64_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1742_c7_1931]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1742_c7_1931_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1742_c7_1931_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1742_c7_1931_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1742_c7_1931_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1742_c7_1931]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_1931_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_1931_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_1931_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_1931_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1704_l1719_DUPLICATE_9152
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1704_l1719_DUPLICATE_9152_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1704_l1719_DUPLICATE_9152_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_28d7( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : signed;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_stack_read := ref_toks_1;
      base.sp_relative_shift := ref_toks_2;
      base.is_opc_done := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.is_sp_shift := ref_toks_5;
      base.stack_address_sp_offset := ref_toks_6;
      base.stack_value := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1693_c6_167e
BIN_OP_EQ_uxn_opcodes_h_l1693_c6_167e : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1693_c6_167e_left,
BIN_OP_EQ_uxn_opcodes_h_l1693_c6_167e_right,
BIN_OP_EQ_uxn_opcodes_h_l1693_c6_167e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1693_c1_bb3b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1693_c1_bb3b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1693_c1_bb3b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1693_c1_bb3b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1693_c1_bb3b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1693_c1_bb3b_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1693_c2_73fd
tmp16_MUX_uxn_opcodes_h_l1693_c2_73fd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1693_c2_73fd_cond,
tmp16_MUX_uxn_opcodes_h_l1693_c2_73fd_iftrue,
tmp16_MUX_uxn_opcodes_h_l1693_c2_73fd_iffalse,
tmp16_MUX_uxn_opcodes_h_l1693_c2_73fd_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1693_c2_73fd
result_is_stack_read_MUX_uxn_opcodes_h_l1693_c2_73fd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1693_c2_73fd_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1693_c2_73fd_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1693_c2_73fd_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1693_c2_73fd_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1693_c2_73fd
result_sp_relative_shift_MUX_uxn_opcodes_h_l1693_c2_73fd : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1693_c2_73fd_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1693_c2_73fd_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1693_c2_73fd_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1693_c2_73fd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1693_c2_73fd
result_is_opc_done_MUX_uxn_opcodes_h_l1693_c2_73fd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1693_c2_73fd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1693_c2_73fd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1693_c2_73fd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1693_c2_73fd_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1693_c2_73fd
result_is_stack_write_MUX_uxn_opcodes_h_l1693_c2_73fd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1693_c2_73fd_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1693_c2_73fd_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1693_c2_73fd_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1693_c2_73fd_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1693_c2_73fd
result_is_sp_shift_MUX_uxn_opcodes_h_l1693_c2_73fd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1693_c2_73fd_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1693_c2_73fd_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1693_c2_73fd_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1693_c2_73fd_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1693_c2_73fd
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1693_c2_73fd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1693_c2_73fd_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1693_c2_73fd_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1693_c2_73fd_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1693_c2_73fd_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1693_c2_73fd
result_stack_value_MUX_uxn_opcodes_h_l1693_c2_73fd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1693_c2_73fd_cond,
result_stack_value_MUX_uxn_opcodes_h_l1693_c2_73fd_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1693_c2_73fd_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1693_c2_73fd_return_output);

-- t16_MUX_uxn_opcodes_h_l1693_c2_73fd
t16_MUX_uxn_opcodes_h_l1693_c2_73fd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1693_c2_73fd_cond,
t16_MUX_uxn_opcodes_h_l1693_c2_73fd_iftrue,
t16_MUX_uxn_opcodes_h_l1693_c2_73fd_iffalse,
t16_MUX_uxn_opcodes_h_l1693_c2_73fd_return_output);

-- n16_MUX_uxn_opcodes_h_l1693_c2_73fd
n16_MUX_uxn_opcodes_h_l1693_c2_73fd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1693_c2_73fd_cond,
n16_MUX_uxn_opcodes_h_l1693_c2_73fd_iftrue,
n16_MUX_uxn_opcodes_h_l1693_c2_73fd_iffalse,
n16_MUX_uxn_opcodes_h_l1693_c2_73fd_return_output);

-- printf_uxn_opcodes_h_l1694_c3_4d0e_uxn_opcodes_h_l1694_c3_4d0e
printf_uxn_opcodes_h_l1694_c3_4d0e_uxn_opcodes_h_l1694_c3_4d0e : entity work.printf_uxn_opcodes_h_l1694_c3_4d0e_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1694_c3_4d0e_uxn_opcodes_h_l1694_c3_4d0e_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1699_c11_b0ca
BIN_OP_EQ_uxn_opcodes_h_l1699_c11_b0ca : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1699_c11_b0ca_left,
BIN_OP_EQ_uxn_opcodes_h_l1699_c11_b0ca_right,
BIN_OP_EQ_uxn_opcodes_h_l1699_c11_b0ca_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1699_c7_7f53
tmp16_MUX_uxn_opcodes_h_l1699_c7_7f53 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1699_c7_7f53_cond,
tmp16_MUX_uxn_opcodes_h_l1699_c7_7f53_iftrue,
tmp16_MUX_uxn_opcodes_h_l1699_c7_7f53_iffalse,
tmp16_MUX_uxn_opcodes_h_l1699_c7_7f53_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1699_c7_7f53
result_is_stack_read_MUX_uxn_opcodes_h_l1699_c7_7f53 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1699_c7_7f53_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1699_c7_7f53_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1699_c7_7f53_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1699_c7_7f53_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c7_7f53
result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c7_7f53 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c7_7f53_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c7_7f53_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c7_7f53_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c7_7f53_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_7f53
result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_7f53 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_7f53_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_7f53_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_7f53_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_7f53_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1699_c7_7f53
result_is_stack_write_MUX_uxn_opcodes_h_l1699_c7_7f53 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1699_c7_7f53_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1699_c7_7f53_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1699_c7_7f53_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1699_c7_7f53_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1699_c7_7f53
result_is_sp_shift_MUX_uxn_opcodes_h_l1699_c7_7f53 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1699_c7_7f53_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1699_c7_7f53_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1699_c7_7f53_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1699_c7_7f53_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1699_c7_7f53
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1699_c7_7f53 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1699_c7_7f53_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1699_c7_7f53_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1699_c7_7f53_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1699_c7_7f53_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1699_c7_7f53
result_stack_value_MUX_uxn_opcodes_h_l1699_c7_7f53 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1699_c7_7f53_cond,
result_stack_value_MUX_uxn_opcodes_h_l1699_c7_7f53_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1699_c7_7f53_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1699_c7_7f53_return_output);

-- t16_MUX_uxn_opcodes_h_l1699_c7_7f53
t16_MUX_uxn_opcodes_h_l1699_c7_7f53 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1699_c7_7f53_cond,
t16_MUX_uxn_opcodes_h_l1699_c7_7f53_iftrue,
t16_MUX_uxn_opcodes_h_l1699_c7_7f53_iffalse,
t16_MUX_uxn_opcodes_h_l1699_c7_7f53_return_output);

-- n16_MUX_uxn_opcodes_h_l1699_c7_7f53
n16_MUX_uxn_opcodes_h_l1699_c7_7f53 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1699_c7_7f53_cond,
n16_MUX_uxn_opcodes_h_l1699_c7_7f53_iftrue,
n16_MUX_uxn_opcodes_h_l1699_c7_7f53_iffalse,
n16_MUX_uxn_opcodes_h_l1699_c7_7f53_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1702_c11_b011
BIN_OP_EQ_uxn_opcodes_h_l1702_c11_b011 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1702_c11_b011_left,
BIN_OP_EQ_uxn_opcodes_h_l1702_c11_b011_right,
BIN_OP_EQ_uxn_opcodes_h_l1702_c11_b011_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1702_c7_4c19
tmp16_MUX_uxn_opcodes_h_l1702_c7_4c19 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1702_c7_4c19_cond,
tmp16_MUX_uxn_opcodes_h_l1702_c7_4c19_iftrue,
tmp16_MUX_uxn_opcodes_h_l1702_c7_4c19_iffalse,
tmp16_MUX_uxn_opcodes_h_l1702_c7_4c19_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1702_c7_4c19
result_is_stack_read_MUX_uxn_opcodes_h_l1702_c7_4c19 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1702_c7_4c19_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1702_c7_4c19_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1702_c7_4c19_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1702_c7_4c19_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1702_c7_4c19
result_sp_relative_shift_MUX_uxn_opcodes_h_l1702_c7_4c19 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1702_c7_4c19_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1702_c7_4c19_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1702_c7_4c19_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1702_c7_4c19_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1702_c7_4c19
result_is_opc_done_MUX_uxn_opcodes_h_l1702_c7_4c19 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1702_c7_4c19_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1702_c7_4c19_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1702_c7_4c19_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1702_c7_4c19_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1702_c7_4c19
result_is_stack_write_MUX_uxn_opcodes_h_l1702_c7_4c19 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1702_c7_4c19_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1702_c7_4c19_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1702_c7_4c19_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1702_c7_4c19_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1702_c7_4c19
result_is_sp_shift_MUX_uxn_opcodes_h_l1702_c7_4c19 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1702_c7_4c19_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1702_c7_4c19_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1702_c7_4c19_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1702_c7_4c19_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1702_c7_4c19
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1702_c7_4c19 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1702_c7_4c19_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1702_c7_4c19_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1702_c7_4c19_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1702_c7_4c19_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1702_c7_4c19
result_stack_value_MUX_uxn_opcodes_h_l1702_c7_4c19 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1702_c7_4c19_cond,
result_stack_value_MUX_uxn_opcodes_h_l1702_c7_4c19_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1702_c7_4c19_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1702_c7_4c19_return_output);

-- t16_MUX_uxn_opcodes_h_l1702_c7_4c19
t16_MUX_uxn_opcodes_h_l1702_c7_4c19 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1702_c7_4c19_cond,
t16_MUX_uxn_opcodes_h_l1702_c7_4c19_iftrue,
t16_MUX_uxn_opcodes_h_l1702_c7_4c19_iffalse,
t16_MUX_uxn_opcodes_h_l1702_c7_4c19_return_output);

-- n16_MUX_uxn_opcodes_h_l1702_c7_4c19
n16_MUX_uxn_opcodes_h_l1702_c7_4c19 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1702_c7_4c19_cond,
n16_MUX_uxn_opcodes_h_l1702_c7_4c19_iftrue,
n16_MUX_uxn_opcodes_h_l1702_c7_4c19_iffalse,
n16_MUX_uxn_opcodes_h_l1702_c7_4c19_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1707_c11_c9d5
BIN_OP_EQ_uxn_opcodes_h_l1707_c11_c9d5 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1707_c11_c9d5_left,
BIN_OP_EQ_uxn_opcodes_h_l1707_c11_c9d5_right,
BIN_OP_EQ_uxn_opcodes_h_l1707_c11_c9d5_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1707_c7_4bae
tmp16_MUX_uxn_opcodes_h_l1707_c7_4bae : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1707_c7_4bae_cond,
tmp16_MUX_uxn_opcodes_h_l1707_c7_4bae_iftrue,
tmp16_MUX_uxn_opcodes_h_l1707_c7_4bae_iffalse,
tmp16_MUX_uxn_opcodes_h_l1707_c7_4bae_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1707_c7_4bae
result_is_stack_read_MUX_uxn_opcodes_h_l1707_c7_4bae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1707_c7_4bae_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1707_c7_4bae_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1707_c7_4bae_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1707_c7_4bae_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1707_c7_4bae
result_sp_relative_shift_MUX_uxn_opcodes_h_l1707_c7_4bae : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1707_c7_4bae_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1707_c7_4bae_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1707_c7_4bae_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1707_c7_4bae_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1707_c7_4bae
result_is_opc_done_MUX_uxn_opcodes_h_l1707_c7_4bae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1707_c7_4bae_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1707_c7_4bae_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1707_c7_4bae_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1707_c7_4bae_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1707_c7_4bae
result_is_stack_write_MUX_uxn_opcodes_h_l1707_c7_4bae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1707_c7_4bae_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1707_c7_4bae_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1707_c7_4bae_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1707_c7_4bae_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1707_c7_4bae
result_is_sp_shift_MUX_uxn_opcodes_h_l1707_c7_4bae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1707_c7_4bae_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1707_c7_4bae_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1707_c7_4bae_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1707_c7_4bae_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1707_c7_4bae
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1707_c7_4bae : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1707_c7_4bae_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1707_c7_4bae_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1707_c7_4bae_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1707_c7_4bae_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1707_c7_4bae
result_stack_value_MUX_uxn_opcodes_h_l1707_c7_4bae : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1707_c7_4bae_cond,
result_stack_value_MUX_uxn_opcodes_h_l1707_c7_4bae_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1707_c7_4bae_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1707_c7_4bae_return_output);

-- t16_MUX_uxn_opcodes_h_l1707_c7_4bae
t16_MUX_uxn_opcodes_h_l1707_c7_4bae : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1707_c7_4bae_cond,
t16_MUX_uxn_opcodes_h_l1707_c7_4bae_iftrue,
t16_MUX_uxn_opcodes_h_l1707_c7_4bae_iffalse,
t16_MUX_uxn_opcodes_h_l1707_c7_4bae_return_output);

-- n16_MUX_uxn_opcodes_h_l1707_c7_4bae
n16_MUX_uxn_opcodes_h_l1707_c7_4bae : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1707_c7_4bae_cond,
n16_MUX_uxn_opcodes_h_l1707_c7_4bae_iftrue,
n16_MUX_uxn_opcodes_h_l1707_c7_4bae_iffalse,
n16_MUX_uxn_opcodes_h_l1707_c7_4bae_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1710_c11_e056
BIN_OP_EQ_uxn_opcodes_h_l1710_c11_e056 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1710_c11_e056_left,
BIN_OP_EQ_uxn_opcodes_h_l1710_c11_e056_right,
BIN_OP_EQ_uxn_opcodes_h_l1710_c11_e056_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1710_c7_8ba5
tmp16_MUX_uxn_opcodes_h_l1710_c7_8ba5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1710_c7_8ba5_cond,
tmp16_MUX_uxn_opcodes_h_l1710_c7_8ba5_iftrue,
tmp16_MUX_uxn_opcodes_h_l1710_c7_8ba5_iffalse,
tmp16_MUX_uxn_opcodes_h_l1710_c7_8ba5_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1710_c7_8ba5
result_is_stack_read_MUX_uxn_opcodes_h_l1710_c7_8ba5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1710_c7_8ba5_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1710_c7_8ba5_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1710_c7_8ba5_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1710_c7_8ba5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1710_c7_8ba5
result_sp_relative_shift_MUX_uxn_opcodes_h_l1710_c7_8ba5 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1710_c7_8ba5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1710_c7_8ba5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1710_c7_8ba5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1710_c7_8ba5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_8ba5
result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_8ba5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_8ba5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_8ba5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_8ba5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_8ba5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_8ba5
result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_8ba5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_8ba5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_8ba5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_8ba5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_8ba5_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1710_c7_8ba5
result_is_sp_shift_MUX_uxn_opcodes_h_l1710_c7_8ba5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1710_c7_8ba5_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1710_c7_8ba5_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1710_c7_8ba5_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1710_c7_8ba5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_8ba5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_8ba5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_8ba5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_8ba5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_8ba5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_8ba5_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1710_c7_8ba5
result_stack_value_MUX_uxn_opcodes_h_l1710_c7_8ba5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1710_c7_8ba5_cond,
result_stack_value_MUX_uxn_opcodes_h_l1710_c7_8ba5_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1710_c7_8ba5_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1710_c7_8ba5_return_output);

-- t16_MUX_uxn_opcodes_h_l1710_c7_8ba5
t16_MUX_uxn_opcodes_h_l1710_c7_8ba5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1710_c7_8ba5_cond,
t16_MUX_uxn_opcodes_h_l1710_c7_8ba5_iftrue,
t16_MUX_uxn_opcodes_h_l1710_c7_8ba5_iffalse,
t16_MUX_uxn_opcodes_h_l1710_c7_8ba5_return_output);

-- n16_MUX_uxn_opcodes_h_l1710_c7_8ba5
n16_MUX_uxn_opcodes_h_l1710_c7_8ba5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1710_c7_8ba5_cond,
n16_MUX_uxn_opcodes_h_l1710_c7_8ba5_iftrue,
n16_MUX_uxn_opcodes_h_l1710_c7_8ba5_iffalse,
n16_MUX_uxn_opcodes_h_l1710_c7_8ba5_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1711_c3_eec9
BIN_OP_OR_uxn_opcodes_h_l1711_c3_eec9 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1711_c3_eec9_left,
BIN_OP_OR_uxn_opcodes_h_l1711_c3_eec9_right,
BIN_OP_OR_uxn_opcodes_h_l1711_c3_eec9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1714_c11_46df
BIN_OP_EQ_uxn_opcodes_h_l1714_c11_46df : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1714_c11_46df_left,
BIN_OP_EQ_uxn_opcodes_h_l1714_c11_46df_right,
BIN_OP_EQ_uxn_opcodes_h_l1714_c11_46df_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1714_c7_30bc
tmp16_MUX_uxn_opcodes_h_l1714_c7_30bc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1714_c7_30bc_cond,
tmp16_MUX_uxn_opcodes_h_l1714_c7_30bc_iftrue,
tmp16_MUX_uxn_opcodes_h_l1714_c7_30bc_iffalse,
tmp16_MUX_uxn_opcodes_h_l1714_c7_30bc_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1714_c7_30bc
result_is_stack_read_MUX_uxn_opcodes_h_l1714_c7_30bc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1714_c7_30bc_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1714_c7_30bc_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1714_c7_30bc_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1714_c7_30bc_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1714_c7_30bc
result_sp_relative_shift_MUX_uxn_opcodes_h_l1714_c7_30bc : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1714_c7_30bc_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1714_c7_30bc_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1714_c7_30bc_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1714_c7_30bc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_30bc
result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_30bc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_30bc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_30bc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_30bc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_30bc_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_30bc
result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_30bc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_30bc_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_30bc_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_30bc_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_30bc_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1714_c7_30bc
result_is_sp_shift_MUX_uxn_opcodes_h_l1714_c7_30bc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1714_c7_30bc_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1714_c7_30bc_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1714_c7_30bc_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1714_c7_30bc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1714_c7_30bc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1714_c7_30bc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1714_c7_30bc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1714_c7_30bc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1714_c7_30bc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1714_c7_30bc_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1714_c7_30bc
result_stack_value_MUX_uxn_opcodes_h_l1714_c7_30bc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1714_c7_30bc_cond,
result_stack_value_MUX_uxn_opcodes_h_l1714_c7_30bc_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1714_c7_30bc_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1714_c7_30bc_return_output);

-- n16_MUX_uxn_opcodes_h_l1714_c7_30bc
n16_MUX_uxn_opcodes_h_l1714_c7_30bc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1714_c7_30bc_cond,
n16_MUX_uxn_opcodes_h_l1714_c7_30bc_iftrue,
n16_MUX_uxn_opcodes_h_l1714_c7_30bc_iffalse,
n16_MUX_uxn_opcodes_h_l1714_c7_30bc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1717_c11_62b1
BIN_OP_EQ_uxn_opcodes_h_l1717_c11_62b1 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1717_c11_62b1_left,
BIN_OP_EQ_uxn_opcodes_h_l1717_c11_62b1_right,
BIN_OP_EQ_uxn_opcodes_h_l1717_c11_62b1_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1717_c7_d8c1
tmp16_MUX_uxn_opcodes_h_l1717_c7_d8c1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1717_c7_d8c1_cond,
tmp16_MUX_uxn_opcodes_h_l1717_c7_d8c1_iftrue,
tmp16_MUX_uxn_opcodes_h_l1717_c7_d8c1_iffalse,
tmp16_MUX_uxn_opcodes_h_l1717_c7_d8c1_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1717_c7_d8c1
result_is_stack_read_MUX_uxn_opcodes_h_l1717_c7_d8c1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1717_c7_d8c1_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1717_c7_d8c1_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1717_c7_d8c1_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1717_c7_d8c1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c7_d8c1
result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c7_d8c1 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c7_d8c1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c7_d8c1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c7_d8c1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c7_d8c1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1717_c7_d8c1
result_is_opc_done_MUX_uxn_opcodes_h_l1717_c7_d8c1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1717_c7_d8c1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1717_c7_d8c1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1717_c7_d8c1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1717_c7_d8c1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1717_c7_d8c1
result_is_stack_write_MUX_uxn_opcodes_h_l1717_c7_d8c1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1717_c7_d8c1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1717_c7_d8c1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1717_c7_d8c1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1717_c7_d8c1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1717_c7_d8c1
result_is_sp_shift_MUX_uxn_opcodes_h_l1717_c7_d8c1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1717_c7_d8c1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1717_c7_d8c1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1717_c7_d8c1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1717_c7_d8c1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c7_d8c1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c7_d8c1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c7_d8c1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c7_d8c1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c7_d8c1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c7_d8c1_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1717_c7_d8c1
result_stack_value_MUX_uxn_opcodes_h_l1717_c7_d8c1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1717_c7_d8c1_cond,
result_stack_value_MUX_uxn_opcodes_h_l1717_c7_d8c1_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1717_c7_d8c1_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1717_c7_d8c1_return_output);

-- n16_MUX_uxn_opcodes_h_l1717_c7_d8c1
n16_MUX_uxn_opcodes_h_l1717_c7_d8c1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1717_c7_d8c1_cond,
n16_MUX_uxn_opcodes_h_l1717_c7_d8c1_iftrue,
n16_MUX_uxn_opcodes_h_l1717_c7_d8c1_iffalse,
n16_MUX_uxn_opcodes_h_l1717_c7_d8c1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1722_c11_0aff
BIN_OP_EQ_uxn_opcodes_h_l1722_c11_0aff : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1722_c11_0aff_left,
BIN_OP_EQ_uxn_opcodes_h_l1722_c11_0aff_right,
BIN_OP_EQ_uxn_opcodes_h_l1722_c11_0aff_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1722_c7_19a7
tmp16_MUX_uxn_opcodes_h_l1722_c7_19a7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1722_c7_19a7_cond,
tmp16_MUX_uxn_opcodes_h_l1722_c7_19a7_iftrue,
tmp16_MUX_uxn_opcodes_h_l1722_c7_19a7_iffalse,
tmp16_MUX_uxn_opcodes_h_l1722_c7_19a7_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1722_c7_19a7
result_is_stack_read_MUX_uxn_opcodes_h_l1722_c7_19a7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1722_c7_19a7_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1722_c7_19a7_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1722_c7_19a7_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1722_c7_19a7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1722_c7_19a7
result_sp_relative_shift_MUX_uxn_opcodes_h_l1722_c7_19a7 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1722_c7_19a7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1722_c7_19a7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1722_c7_19a7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1722_c7_19a7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1722_c7_19a7
result_is_opc_done_MUX_uxn_opcodes_h_l1722_c7_19a7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1722_c7_19a7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1722_c7_19a7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1722_c7_19a7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1722_c7_19a7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1722_c7_19a7
result_is_stack_write_MUX_uxn_opcodes_h_l1722_c7_19a7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1722_c7_19a7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1722_c7_19a7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1722_c7_19a7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1722_c7_19a7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1722_c7_19a7
result_is_sp_shift_MUX_uxn_opcodes_h_l1722_c7_19a7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1722_c7_19a7_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1722_c7_19a7_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1722_c7_19a7_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1722_c7_19a7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1722_c7_19a7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1722_c7_19a7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1722_c7_19a7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1722_c7_19a7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1722_c7_19a7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1722_c7_19a7_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1722_c7_19a7
result_stack_value_MUX_uxn_opcodes_h_l1722_c7_19a7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1722_c7_19a7_cond,
result_stack_value_MUX_uxn_opcodes_h_l1722_c7_19a7_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1722_c7_19a7_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1722_c7_19a7_return_output);

-- n16_MUX_uxn_opcodes_h_l1722_c7_19a7
n16_MUX_uxn_opcodes_h_l1722_c7_19a7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1722_c7_19a7_cond,
n16_MUX_uxn_opcodes_h_l1722_c7_19a7_iftrue,
n16_MUX_uxn_opcodes_h_l1722_c7_19a7_iffalse,
n16_MUX_uxn_opcodes_h_l1722_c7_19a7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1725_c11_8295
BIN_OP_EQ_uxn_opcodes_h_l1725_c11_8295 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1725_c11_8295_left,
BIN_OP_EQ_uxn_opcodes_h_l1725_c11_8295_right,
BIN_OP_EQ_uxn_opcodes_h_l1725_c11_8295_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1725_c7_d643
tmp16_MUX_uxn_opcodes_h_l1725_c7_d643 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1725_c7_d643_cond,
tmp16_MUX_uxn_opcodes_h_l1725_c7_d643_iftrue,
tmp16_MUX_uxn_opcodes_h_l1725_c7_d643_iffalse,
tmp16_MUX_uxn_opcodes_h_l1725_c7_d643_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1725_c7_d643
result_is_stack_read_MUX_uxn_opcodes_h_l1725_c7_d643 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1725_c7_d643_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1725_c7_d643_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1725_c7_d643_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1725_c7_d643_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1725_c7_d643
result_sp_relative_shift_MUX_uxn_opcodes_h_l1725_c7_d643 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1725_c7_d643_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1725_c7_d643_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1725_c7_d643_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1725_c7_d643_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1725_c7_d643
result_is_opc_done_MUX_uxn_opcodes_h_l1725_c7_d643 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1725_c7_d643_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1725_c7_d643_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1725_c7_d643_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1725_c7_d643_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1725_c7_d643
result_is_stack_write_MUX_uxn_opcodes_h_l1725_c7_d643 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1725_c7_d643_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1725_c7_d643_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1725_c7_d643_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1725_c7_d643_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1725_c7_d643
result_is_sp_shift_MUX_uxn_opcodes_h_l1725_c7_d643 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1725_c7_d643_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1725_c7_d643_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1725_c7_d643_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1725_c7_d643_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1725_c7_d643
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1725_c7_d643 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1725_c7_d643_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1725_c7_d643_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1725_c7_d643_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1725_c7_d643_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1725_c7_d643
result_stack_value_MUX_uxn_opcodes_h_l1725_c7_d643 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1725_c7_d643_cond,
result_stack_value_MUX_uxn_opcodes_h_l1725_c7_d643_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1725_c7_d643_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1725_c7_d643_return_output);

-- n16_MUX_uxn_opcodes_h_l1725_c7_d643
n16_MUX_uxn_opcodes_h_l1725_c7_d643 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1725_c7_d643_cond,
n16_MUX_uxn_opcodes_h_l1725_c7_d643_iftrue,
n16_MUX_uxn_opcodes_h_l1725_c7_d643_iffalse,
n16_MUX_uxn_opcodes_h_l1725_c7_d643_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1726_c3_aefa
BIN_OP_OR_uxn_opcodes_h_l1726_c3_aefa : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1726_c3_aefa_left,
BIN_OP_OR_uxn_opcodes_h_l1726_c3_aefa_right,
BIN_OP_OR_uxn_opcodes_h_l1726_c3_aefa_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l1727_c11_94b7
BIN_OP_MINUS_uxn_opcodes_h_l1727_c11_94b7 : entity work.BIN_OP_MINUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l1727_c11_94b7_left,
BIN_OP_MINUS_uxn_opcodes_h_l1727_c11_94b7_right,
BIN_OP_MINUS_uxn_opcodes_h_l1727_c11_94b7_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1730_c32_6f0c
BIN_OP_AND_uxn_opcodes_h_l1730_c32_6f0c : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1730_c32_6f0c_left,
BIN_OP_AND_uxn_opcodes_h_l1730_c32_6f0c_right,
BIN_OP_AND_uxn_opcodes_h_l1730_c32_6f0c_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1730_c32_9a6b
BIN_OP_GT_uxn_opcodes_h_l1730_c32_9a6b : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1730_c32_9a6b_left,
BIN_OP_GT_uxn_opcodes_h_l1730_c32_9a6b_right,
BIN_OP_GT_uxn_opcodes_h_l1730_c32_9a6b_return_output);

-- MUX_uxn_opcodes_h_l1730_c32_07a6
MUX_uxn_opcodes_h_l1730_c32_07a6 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1730_c32_07a6_cond,
MUX_uxn_opcodes_h_l1730_c32_07a6_iftrue,
MUX_uxn_opcodes_h_l1730_c32_07a6_iffalse,
MUX_uxn_opcodes_h_l1730_c32_07a6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1732_c11_e3f5
BIN_OP_EQ_uxn_opcodes_h_l1732_c11_e3f5 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1732_c11_e3f5_left,
BIN_OP_EQ_uxn_opcodes_h_l1732_c11_e3f5_right,
BIN_OP_EQ_uxn_opcodes_h_l1732_c11_e3f5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1732_c7_fb6f
result_is_stack_write_MUX_uxn_opcodes_h_l1732_c7_fb6f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1732_c7_fb6f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1732_c7_fb6f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1732_c7_fb6f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1732_c7_fb6f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1732_c7_fb6f
result_is_opc_done_MUX_uxn_opcodes_h_l1732_c7_fb6f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1732_c7_fb6f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1732_c7_fb6f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1732_c7_fb6f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1732_c7_fb6f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1732_c7_fb6f
result_is_sp_shift_MUX_uxn_opcodes_h_l1732_c7_fb6f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1732_c7_fb6f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1732_c7_fb6f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1732_c7_fb6f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1732_c7_fb6f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1732_c7_fb6f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1732_c7_fb6f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1732_c7_fb6f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1732_c7_fb6f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1732_c7_fb6f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1732_c7_fb6f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1732_c7_fb6f
result_stack_value_MUX_uxn_opcodes_h_l1732_c7_fb6f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1732_c7_fb6f_cond,
result_stack_value_MUX_uxn_opcodes_h_l1732_c7_fb6f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1732_c7_fb6f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1732_c7_fb6f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1738_c11_91fa
BIN_OP_EQ_uxn_opcodes_h_l1738_c11_91fa : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1738_c11_91fa_left,
BIN_OP_EQ_uxn_opcodes_h_l1738_c11_91fa_right,
BIN_OP_EQ_uxn_opcodes_h_l1738_c11_91fa_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1738_c7_467a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1738_c7_467a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1738_c7_467a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1738_c7_467a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1738_c7_467a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1738_c7_467a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1738_c7_467a
result_is_stack_write_MUX_uxn_opcodes_h_l1738_c7_467a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1738_c7_467a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1738_c7_467a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1738_c7_467a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1738_c7_467a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_467a
result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_467a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_467a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_467a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_467a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_467a_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1738_c7_467a
result_stack_value_MUX_uxn_opcodes_h_l1738_c7_467a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1738_c7_467a_cond,
result_stack_value_MUX_uxn_opcodes_h_l1738_c7_467a_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1738_c7_467a_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1738_c7_467a_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1740_c34_66c0
CONST_SR_8_uxn_opcodes_h_l1740_c34_66c0 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1740_c34_66c0_x,
CONST_SR_8_uxn_opcodes_h_l1740_c34_66c0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1742_c11_fa64
BIN_OP_EQ_uxn_opcodes_h_l1742_c11_fa64 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1742_c11_fa64_left,
BIN_OP_EQ_uxn_opcodes_h_l1742_c11_fa64_right,
BIN_OP_EQ_uxn_opcodes_h_l1742_c11_fa64_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1742_c7_1931
result_is_stack_write_MUX_uxn_opcodes_h_l1742_c7_1931 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1742_c7_1931_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1742_c7_1931_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1742_c7_1931_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1742_c7_1931_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_1931
result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_1931 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_1931_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_1931_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_1931_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_1931_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1704_l1719_DUPLICATE_9152
CONST_SL_8_uint16_t_uxn_opcodes_h_l1704_l1719_DUPLICATE_9152 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1704_l1719_DUPLICATE_9152_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1704_l1719_DUPLICATE_9152_return_output);



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
 t16,
 n16,
 tmp16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1693_c6_167e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1693_c1_bb3b_return_output,
 tmp16_MUX_uxn_opcodes_h_l1693_c2_73fd_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1693_c2_73fd_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1693_c2_73fd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1693_c2_73fd_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1693_c2_73fd_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1693_c2_73fd_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1693_c2_73fd_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1693_c2_73fd_return_output,
 t16_MUX_uxn_opcodes_h_l1693_c2_73fd_return_output,
 n16_MUX_uxn_opcodes_h_l1693_c2_73fd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1699_c11_b0ca_return_output,
 tmp16_MUX_uxn_opcodes_h_l1699_c7_7f53_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1699_c7_7f53_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c7_7f53_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_7f53_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1699_c7_7f53_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1699_c7_7f53_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1699_c7_7f53_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1699_c7_7f53_return_output,
 t16_MUX_uxn_opcodes_h_l1699_c7_7f53_return_output,
 n16_MUX_uxn_opcodes_h_l1699_c7_7f53_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1702_c11_b011_return_output,
 tmp16_MUX_uxn_opcodes_h_l1702_c7_4c19_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1702_c7_4c19_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1702_c7_4c19_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1702_c7_4c19_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1702_c7_4c19_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1702_c7_4c19_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1702_c7_4c19_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1702_c7_4c19_return_output,
 t16_MUX_uxn_opcodes_h_l1702_c7_4c19_return_output,
 n16_MUX_uxn_opcodes_h_l1702_c7_4c19_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1707_c11_c9d5_return_output,
 tmp16_MUX_uxn_opcodes_h_l1707_c7_4bae_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1707_c7_4bae_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1707_c7_4bae_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1707_c7_4bae_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1707_c7_4bae_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1707_c7_4bae_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1707_c7_4bae_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1707_c7_4bae_return_output,
 t16_MUX_uxn_opcodes_h_l1707_c7_4bae_return_output,
 n16_MUX_uxn_opcodes_h_l1707_c7_4bae_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1710_c11_e056_return_output,
 tmp16_MUX_uxn_opcodes_h_l1710_c7_8ba5_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1710_c7_8ba5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1710_c7_8ba5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_8ba5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_8ba5_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1710_c7_8ba5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_8ba5_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1710_c7_8ba5_return_output,
 t16_MUX_uxn_opcodes_h_l1710_c7_8ba5_return_output,
 n16_MUX_uxn_opcodes_h_l1710_c7_8ba5_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1711_c3_eec9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1714_c11_46df_return_output,
 tmp16_MUX_uxn_opcodes_h_l1714_c7_30bc_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1714_c7_30bc_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1714_c7_30bc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_30bc_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_30bc_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1714_c7_30bc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1714_c7_30bc_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1714_c7_30bc_return_output,
 n16_MUX_uxn_opcodes_h_l1714_c7_30bc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1717_c11_62b1_return_output,
 tmp16_MUX_uxn_opcodes_h_l1717_c7_d8c1_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1717_c7_d8c1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c7_d8c1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1717_c7_d8c1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1717_c7_d8c1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1717_c7_d8c1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c7_d8c1_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1717_c7_d8c1_return_output,
 n16_MUX_uxn_opcodes_h_l1717_c7_d8c1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1722_c11_0aff_return_output,
 tmp16_MUX_uxn_opcodes_h_l1722_c7_19a7_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1722_c7_19a7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1722_c7_19a7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1722_c7_19a7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1722_c7_19a7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1722_c7_19a7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1722_c7_19a7_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1722_c7_19a7_return_output,
 n16_MUX_uxn_opcodes_h_l1722_c7_19a7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1725_c11_8295_return_output,
 tmp16_MUX_uxn_opcodes_h_l1725_c7_d643_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1725_c7_d643_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1725_c7_d643_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1725_c7_d643_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1725_c7_d643_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1725_c7_d643_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1725_c7_d643_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1725_c7_d643_return_output,
 n16_MUX_uxn_opcodes_h_l1725_c7_d643_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1726_c3_aefa_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l1727_c11_94b7_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1730_c32_6f0c_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1730_c32_9a6b_return_output,
 MUX_uxn_opcodes_h_l1730_c32_07a6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1732_c11_e3f5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1732_c7_fb6f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1732_c7_fb6f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1732_c7_fb6f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1732_c7_fb6f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1732_c7_fb6f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1738_c11_91fa_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1738_c7_467a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1738_c7_467a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_467a_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1738_c7_467a_return_output,
 CONST_SR_8_uxn_opcodes_h_l1740_c34_66c0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1742_c11_fa64_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1742_c7_1931_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_1931_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1704_l1719_DUPLICATE_9152_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1693_c6_167e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1693_c6_167e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1693_c6_167e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1693_c1_bb3b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1693_c1_bb3b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1693_c1_bb3b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1693_c1_bb3b_iffalse : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1693_c2_73fd_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1693_c2_73fd_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1699_c7_7f53_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1693_c2_73fd_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1693_c2_73fd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1693_c2_73fd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1693_c2_73fd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1699_c7_7f53_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1693_c2_73fd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1693_c2_73fd_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1693_c2_73fd_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1693_c2_73fd_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c7_7f53_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1693_c2_73fd_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1693_c2_73fd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1693_c2_73fd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1693_c2_73fd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_7f53_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1693_c2_73fd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1693_c2_73fd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1693_c2_73fd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1693_c2_73fd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1699_c7_7f53_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1693_c2_73fd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1693_c2_73fd_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1693_c2_73fd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1693_c2_73fd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1699_c7_7f53_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1693_c2_73fd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1693_c2_73fd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1693_c2_73fd_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1696_c3_069a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1693_c2_73fd_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1699_c7_7f53_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1693_c2_73fd_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1693_c2_73fd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1693_c2_73fd_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1693_c2_73fd_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1699_c7_7f53_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1693_c2_73fd_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1693_c2_73fd_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1693_c2_73fd_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1693_c2_73fd_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1699_c7_7f53_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1693_c2_73fd_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1693_c2_73fd_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1693_c2_73fd_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1693_c2_73fd_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1699_c7_7f53_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1693_c2_73fd_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1693_c2_73fd_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1694_c3_4d0e_uxn_opcodes_h_l1694_c3_4d0e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1699_c11_b0ca_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1699_c11_b0ca_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1699_c11_b0ca_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1699_c7_7f53_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1699_c7_7f53_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1702_c7_4c19_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1699_c7_7f53_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1699_c7_7f53_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1699_c7_7f53_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1702_c7_4c19_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1699_c7_7f53_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c7_7f53_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c7_7f53_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1702_c7_4c19_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c7_7f53_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_7f53_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_7f53_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1702_c7_4c19_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_7f53_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1699_c7_7f53_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1699_c7_7f53_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1702_c7_4c19_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1699_c7_7f53_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1699_c7_7f53_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1699_c7_7f53_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1702_c7_4c19_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1699_c7_7f53_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1699_c7_7f53_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1700_c3_423f : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1699_c7_7f53_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1702_c7_4c19_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1699_c7_7f53_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1699_c7_7f53_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1699_c7_7f53_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1702_c7_4c19_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1699_c7_7f53_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1699_c7_7f53_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1699_c7_7f53_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1702_c7_4c19_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1699_c7_7f53_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1699_c7_7f53_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1699_c7_7f53_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1702_c7_4c19_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1699_c7_7f53_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1702_c11_b011_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1702_c11_b011_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1702_c11_b011_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1702_c7_4c19_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1702_c7_4c19_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1707_c7_4bae_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1702_c7_4c19_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1702_c7_4c19_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1702_c7_4c19_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1707_c7_4bae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1702_c7_4c19_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1702_c7_4c19_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1702_c7_4c19_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1707_c7_4bae_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1702_c7_4c19_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1702_c7_4c19_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1702_c7_4c19_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1707_c7_4bae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1702_c7_4c19_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1702_c7_4c19_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1702_c7_4c19_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1707_c7_4bae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1702_c7_4c19_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1702_c7_4c19_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1702_c7_4c19_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1707_c7_4bae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1702_c7_4c19_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1702_c7_4c19_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1705_c3_968a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1702_c7_4c19_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1707_c7_4bae_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1702_c7_4c19_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1702_c7_4c19_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1702_c7_4c19_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1707_c7_4bae_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1702_c7_4c19_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1702_c7_4c19_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1702_c7_4c19_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1707_c7_4bae_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1702_c7_4c19_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1702_c7_4c19_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1702_c7_4c19_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1707_c7_4bae_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1702_c7_4c19_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1707_c11_c9d5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1707_c11_c9d5_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1707_c11_c9d5_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1707_c7_4bae_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1707_c7_4bae_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1710_c7_8ba5_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1707_c7_4bae_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1707_c7_4bae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1707_c7_4bae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1710_c7_8ba5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1707_c7_4bae_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1707_c7_4bae_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1707_c7_4bae_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1710_c7_8ba5_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1707_c7_4bae_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1707_c7_4bae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1707_c7_4bae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_8ba5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1707_c7_4bae_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1707_c7_4bae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1707_c7_4bae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_8ba5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1707_c7_4bae_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1707_c7_4bae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1707_c7_4bae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1710_c7_8ba5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1707_c7_4bae_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1707_c7_4bae_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1708_c3_187f : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1707_c7_4bae_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_8ba5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1707_c7_4bae_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1707_c7_4bae_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1707_c7_4bae_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1710_c7_8ba5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1707_c7_4bae_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1707_c7_4bae_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1707_c7_4bae_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1710_c7_8ba5_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1707_c7_4bae_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1707_c7_4bae_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1707_c7_4bae_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1710_c7_8ba5_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1707_c7_4bae_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1710_c11_e056_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1710_c11_e056_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1710_c11_e056_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1710_c7_8ba5_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1710_c7_8ba5_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1714_c7_30bc_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1710_c7_8ba5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1710_c7_8ba5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1710_c7_8ba5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1714_c7_30bc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1710_c7_8ba5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1710_c7_8ba5_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1710_c7_8ba5_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1714_c7_30bc_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1710_c7_8ba5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_8ba5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_8ba5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_30bc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_8ba5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_8ba5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_8ba5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_30bc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_8ba5_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1710_c7_8ba5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1710_c7_8ba5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1714_c7_30bc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1710_c7_8ba5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_8ba5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1712_c3_d7b2 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_8ba5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1714_c7_30bc_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_8ba5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1710_c7_8ba5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1710_c7_8ba5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1714_c7_30bc_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1710_c7_8ba5_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1710_c7_8ba5_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1710_c7_8ba5_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1710_c7_8ba5_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1710_c7_8ba5_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1710_c7_8ba5_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1714_c7_30bc_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1710_c7_8ba5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1711_c3_eec9_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1711_c3_eec9_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1711_c3_eec9_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1714_c11_46df_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1714_c11_46df_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1714_c11_46df_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1714_c7_30bc_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1714_c7_30bc_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1717_c7_d8c1_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1714_c7_30bc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1714_c7_30bc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1714_c7_30bc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1717_c7_d8c1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1714_c7_30bc_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1714_c7_30bc_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1714_c7_30bc_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c7_d8c1_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1714_c7_30bc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_30bc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_30bc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1717_c7_d8c1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_30bc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_30bc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_30bc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1717_c7_d8c1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_30bc_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1714_c7_30bc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1714_c7_30bc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1717_c7_d8c1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1714_c7_30bc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1714_c7_30bc_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1715_c3_8eff : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1714_c7_30bc_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c7_d8c1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1714_c7_30bc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1714_c7_30bc_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1714_c7_30bc_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1717_c7_d8c1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1714_c7_30bc_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1714_c7_30bc_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1714_c7_30bc_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1717_c7_d8c1_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1714_c7_30bc_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c11_62b1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c11_62b1_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c11_62b1_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1717_c7_d8c1_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1717_c7_d8c1_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1722_c7_19a7_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1717_c7_d8c1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1717_c7_d8c1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1717_c7_d8c1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1722_c7_19a7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1717_c7_d8c1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c7_d8c1_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c7_d8c1_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1722_c7_19a7_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c7_d8c1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1717_c7_d8c1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1717_c7_d8c1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1722_c7_19a7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1717_c7_d8c1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1717_c7_d8c1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1717_c7_d8c1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1722_c7_19a7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1717_c7_d8c1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1717_c7_d8c1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1717_c7_d8c1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1722_c7_19a7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1717_c7_d8c1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c7_d8c1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1720_c3_d629 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c7_d8c1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1722_c7_19a7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c7_d8c1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1717_c7_d8c1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1717_c7_d8c1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1722_c7_19a7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1717_c7_d8c1_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1717_c7_d8c1_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1717_c7_d8c1_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1722_c7_19a7_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1717_c7_d8c1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1722_c11_0aff_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1722_c11_0aff_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1722_c11_0aff_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1722_c7_19a7_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1722_c7_19a7_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1725_c7_d643_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1722_c7_19a7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1722_c7_19a7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1722_c7_19a7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1725_c7_d643_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1722_c7_19a7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1722_c7_19a7_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1722_c7_19a7_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1725_c7_d643_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1722_c7_19a7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1722_c7_19a7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1722_c7_19a7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1725_c7_d643_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1722_c7_19a7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1722_c7_19a7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1722_c7_19a7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1725_c7_d643_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1722_c7_19a7_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1722_c7_19a7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1722_c7_19a7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1725_c7_d643_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1722_c7_19a7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1722_c7_19a7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1723_c3_4f2b : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1722_c7_19a7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1725_c7_d643_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1722_c7_19a7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1722_c7_19a7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1722_c7_19a7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1725_c7_d643_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1722_c7_19a7_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1722_c7_19a7_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1722_c7_19a7_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1725_c7_d643_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1722_c7_19a7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1725_c11_8295_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1725_c11_8295_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1725_c11_8295_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1725_c7_d643_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1725_c7_d643_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1725_c7_d643_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1725_c7_d643_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1725_c7_d643_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1725_c7_d643_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1725_c7_d643_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1725_c7_d643_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1725_c7_d643_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1725_c7_d643_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1725_c7_d643_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1732_c7_fb6f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1725_c7_d643_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1725_c7_d643_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1725_c7_d643_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1732_c7_fb6f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1725_c7_d643_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1725_c7_d643_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1725_c7_d643_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1732_c7_fb6f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1725_c7_d643_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1725_c7_d643_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1725_c7_d643_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1732_c7_fb6f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1725_c7_d643_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1725_c7_d643_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1725_c7_d643_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1732_c7_fb6f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1725_c7_d643_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1725_c7_d643_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1725_c7_d643_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1725_c7_d643_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1726_c3_aefa_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1726_c3_aefa_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1726_c3_aefa_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l1727_c11_94b7_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l1727_c11_94b7_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l1727_c11_94b7_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1730_c32_07a6_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1730_c32_07a6_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1730_c32_07a6_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1730_c32_6f0c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1730_c32_6f0c_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1730_c32_6f0c_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1730_c32_9a6b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1730_c32_9a6b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1730_c32_9a6b_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1730_c32_07a6_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1732_c11_e3f5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1732_c11_e3f5_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1732_c11_e3f5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1732_c7_fb6f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1732_c7_fb6f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1738_c7_467a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1732_c7_fb6f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1732_c7_fb6f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1732_c7_fb6f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_467a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1732_c7_fb6f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1732_c7_fb6f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1732_c7_fb6f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1732_c7_fb6f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1732_c7_fb6f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1735_c3_a917 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1732_c7_fb6f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1738_c7_467a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1732_c7_fb6f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1732_c7_fb6f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1732_c7_fb6f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1738_c7_467a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1732_c7_fb6f_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1736_c24_c500_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1738_c11_91fa_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1738_c11_91fa_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1738_c11_91fa_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1738_c7_467a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1739_c3_e6bc : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1738_c7_467a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1738_c7_467a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1738_c7_467a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1738_c7_467a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1742_c7_1931_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1738_c7_467a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_467a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_467a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_1931_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_467a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1738_c7_467a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1738_c7_467a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1738_c7_467a_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1740_c34_66c0_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1740_c34_66c0_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1740_c24_7974_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1742_c11_fa64_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1742_c11_fa64_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1742_c11_fa64_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1742_c7_1931_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1742_c7_1931_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1742_c7_1931_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_1931_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_1931_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_1931_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1699_l1722_l1693_l1717_l1714_l1710_l1707_l1702_l1725_DUPLICATE_3741_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1699_l1722_l1693_l1717_l1714_l1742_l1710_l1738_l1707_l1702_l1725_DUPLICATE_48e0_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1699_l1722_l1693_l1717_l1714_l1710_l1707_l1732_l1702_DUPLICATE_5dd0_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1699_l1722_l1693_l1717_l1714_l1710_l1738_l1707_l1702_l1725_DUPLICATE_6c9b_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1699_l1722_l1717_l1714_l1710_l1707_l1702_l1725_DUPLICATE_a308_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1699_l1722_l1717_l1714_l1742_l1710_l1738_l1707_l1732_l1702_l1725_DUPLICATE_1ab6_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1711_l1726_l1703_l1718_DUPLICATE_bfdc_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1704_l1719_DUPLICATE_9152_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1704_l1719_DUPLICATE_9152_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1738_l1725_DUPLICATE_004a_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_28d7_uxn_opcodes_h_l1747_l1689_DUPLICATE_15b8_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1705_c3_968a := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1702_c7_4c19_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1705_c3_968a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1742_c11_fa64_right := to_unsigned(11, 4);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_1931_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1732_c7_fb6f_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1725_c11_8295_right := to_unsigned(8, 4);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1725_c7_d643_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c11_62b1_right := to_unsigned(6, 3);
     VAR_BIN_OP_GT_uxn_opcodes_h_l1730_c32_9a6b_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1707_c11_c9d5_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1739_c3_e6bc := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1738_c7_467a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1739_c3_e6bc;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1712_c3_d7b2 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_8ba5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1712_c3_d7b2;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1710_c11_e056_right := to_unsigned(4, 3);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1693_c1_bb3b_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1730_c32_07a6_iffalse := resize(to_signed(-2, 3), 8);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1693_c2_73fd_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1725_c7_d643_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1693_c2_73fd_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1696_c3_069a := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1693_c2_73fd_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1696_c3_069a;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1708_c3_187f := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1707_c7_4bae_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1708_c3_187f;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1715_c3_8eff := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1714_c7_30bc_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1715_c3_8eff;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1700_c3_423f := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1699_c7_7f53_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1700_c3_423f;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1732_c11_e3f5_right := to_unsigned(9, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1722_c11_0aff_right := to_unsigned(7, 3);
     VAR_MUX_uxn_opcodes_h_l1730_c32_07a6_iftrue := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1732_c7_fb6f_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1742_c7_1931_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1735_c3_a917 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1732_c7_fb6f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1735_c3_a917;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1699_c11_b0ca_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1693_c6_167e_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1738_c11_91fa_right := to_unsigned(10, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1702_c11_b011_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1723_c3_4f2b := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1722_c7_19a7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1723_c3_4f2b;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1720_c3_d629 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c7_d8c1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1720_c3_d629;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1714_c11_46df_right := to_unsigned(5, 3);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1730_c32_6f0c_right := to_unsigned(128, 8);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1693_c1_bb3b_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1730_c32_6f0c_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1726_c3_aefa_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1693_c2_73fd_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1699_c7_7f53_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1702_c7_4c19_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1707_c7_4bae_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1710_c7_8ba5_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1714_c7_30bc_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1722_c7_19a7_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1725_c7_d643_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1693_c6_167e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1699_c11_b0ca_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1702_c11_b011_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1707_c11_c9d5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1710_c11_e056_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1714_c11_46df_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c11_62b1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1722_c11_0aff_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1725_c11_8295_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1732_c11_e3f5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1738_c11_91fa_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1742_c11_fa64_left := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l1727_c11_94b7_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1711_c3_eec9_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1693_c2_73fd_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1699_c7_7f53_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1707_c7_4bae_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1710_c7_8ba5_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1740_c34_66c0_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1693_c2_73fd_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1699_c7_7f53_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1702_c7_4c19_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1707_c7_4bae_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1710_c7_8ba5_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1714_c7_30bc_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1717_c7_d8c1_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1722_c7_19a7_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1725_c7_d643_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l1732_c11_e3f5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1732_c11_e3f5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1732_c11_e3f5_left;
     BIN_OP_EQ_uxn_opcodes_h_l1732_c11_e3f5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1732_c11_e3f5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1732_c11_e3f5_return_output := BIN_OP_EQ_uxn_opcodes_h_l1732_c11_e3f5_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1699_l1722_l1717_l1714_l1710_l1707_l1702_l1725_DUPLICATE_a308 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1699_l1722_l1717_l1714_l1710_l1707_l1702_l1725_DUPLICATE_a308_return_output := result.is_stack_read;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1699_l1722_l1717_l1714_l1742_l1710_l1738_l1707_l1732_l1702_l1725_DUPLICATE_1ab6 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1699_l1722_l1717_l1714_l1742_l1710_l1738_l1707_l1732_l1702_l1725_DUPLICATE_1ab6_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1725_c11_8295] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1725_c11_8295_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1725_c11_8295_left;
     BIN_OP_EQ_uxn_opcodes_h_l1725_c11_8295_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1725_c11_8295_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1725_c11_8295_return_output := BIN_OP_EQ_uxn_opcodes_h_l1725_c11_8295_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1693_c6_167e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1693_c6_167e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1693_c6_167e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1693_c6_167e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1693_c6_167e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1693_c6_167e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1693_c6_167e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1710_c11_e056] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1710_c11_e056_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1710_c11_e056_left;
     BIN_OP_EQ_uxn_opcodes_h_l1710_c11_e056_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1710_c11_e056_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1710_c11_e056_return_output := BIN_OP_EQ_uxn_opcodes_h_l1710_c11_e056_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1736_c24_c500] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1736_c24_c500_return_output := CAST_TO_uint8_t_uint16_t(
     tmp16);

     -- BIN_OP_EQ[uxn_opcodes_h_l1738_c11_91fa] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1738_c11_91fa_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1738_c11_91fa_left;
     BIN_OP_EQ_uxn_opcodes_h_l1738_c11_91fa_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1738_c11_91fa_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1738_c11_91fa_return_output := BIN_OP_EQ_uxn_opcodes_h_l1738_c11_91fa_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1699_l1722_l1693_l1717_l1714_l1710_l1738_l1707_l1702_l1725_DUPLICATE_6c9b LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1699_l1722_l1693_l1717_l1714_l1710_l1738_l1707_l1702_l1725_DUPLICATE_6c9b_return_output := result.stack_value;

     -- CONST_SR_8[uxn_opcodes_h_l1740_c34_66c0] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1740_c34_66c0_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1740_c34_66c0_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1740_c34_66c0_return_output := CONST_SR_8_uxn_opcodes_h_l1740_c34_66c0_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1699_l1722_l1693_l1717_l1714_l1742_l1710_l1738_l1707_l1702_l1725_DUPLICATE_48e0 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1699_l1722_l1693_l1717_l1714_l1742_l1710_l1738_l1707_l1702_l1725_DUPLICATE_48e0_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1707_c11_c9d5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1707_c11_c9d5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1707_c11_c9d5_left;
     BIN_OP_EQ_uxn_opcodes_h_l1707_c11_c9d5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1707_c11_c9d5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1707_c11_c9d5_return_output := BIN_OP_EQ_uxn_opcodes_h_l1707_c11_c9d5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1699_c11_b0ca] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1699_c11_b0ca_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1699_c11_b0ca_left;
     BIN_OP_EQ_uxn_opcodes_h_l1699_c11_b0ca_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1699_c11_b0ca_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1699_c11_b0ca_return_output := BIN_OP_EQ_uxn_opcodes_h_l1699_c11_b0ca_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1699_l1722_l1693_l1717_l1714_l1710_l1707_l1702_l1725_DUPLICATE_3741 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1699_l1722_l1693_l1717_l1714_l1710_l1707_l1702_l1725_DUPLICATE_3741_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1702_c11_b011] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1702_c11_b011_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1702_c11_b011_left;
     BIN_OP_EQ_uxn_opcodes_h_l1702_c11_b011_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1702_c11_b011_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1702_c11_b011_return_output := BIN_OP_EQ_uxn_opcodes_h_l1702_c11_b011_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l1730_c32_6f0c] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1730_c32_6f0c_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1730_c32_6f0c_left;
     BIN_OP_AND_uxn_opcodes_h_l1730_c32_6f0c_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1730_c32_6f0c_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1730_c32_6f0c_return_output := BIN_OP_AND_uxn_opcodes_h_l1730_c32_6f0c_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1738_l1725_DUPLICATE_004a LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1738_l1725_DUPLICATE_004a_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1722_c11_0aff] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1722_c11_0aff_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1722_c11_0aff_left;
     BIN_OP_EQ_uxn_opcodes_h_l1722_c11_0aff_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1722_c11_0aff_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1722_c11_0aff_return_output := BIN_OP_EQ_uxn_opcodes_h_l1722_c11_0aff_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1711_l1726_l1703_l1718_DUPLICATE_bfdc LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1711_l1726_l1703_l1718_DUPLICATE_bfdc_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1699_l1722_l1693_l1717_l1714_l1710_l1707_l1732_l1702_DUPLICATE_5dd0 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1699_l1722_l1693_l1717_l1714_l1710_l1707_l1732_l1702_DUPLICATE_5dd0_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1717_c11_62b1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1717_c11_62b1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c11_62b1_left;
     BIN_OP_EQ_uxn_opcodes_h_l1717_c11_62b1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c11_62b1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c11_62b1_return_output := BIN_OP_EQ_uxn_opcodes_h_l1717_c11_62b1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1742_c11_fa64] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1742_c11_fa64_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1742_c11_fa64_left;
     BIN_OP_EQ_uxn_opcodes_h_l1742_c11_fa64_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1742_c11_fa64_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1742_c11_fa64_return_output := BIN_OP_EQ_uxn_opcodes_h_l1742_c11_fa64_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1714_c11_46df] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1714_c11_46df_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1714_c11_46df_left;
     BIN_OP_EQ_uxn_opcodes_h_l1714_c11_46df_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1714_c11_46df_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1714_c11_46df_return_output := BIN_OP_EQ_uxn_opcodes_h_l1714_c11_46df_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1730_c32_9a6b_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1730_c32_6f0c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1693_c1_bb3b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1693_c6_167e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1693_c2_73fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1693_c6_167e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1693_c2_73fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1693_c6_167e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1693_c2_73fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1693_c6_167e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1693_c2_73fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1693_c6_167e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1693_c2_73fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1693_c6_167e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1693_c2_73fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1693_c6_167e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1693_c2_73fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1693_c6_167e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1693_c2_73fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1693_c6_167e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1693_c2_73fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1693_c6_167e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1693_c2_73fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1693_c6_167e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1699_c7_7f53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1699_c11_b0ca_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_7f53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1699_c11_b0ca_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1699_c7_7f53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1699_c11_b0ca_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1699_c7_7f53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1699_c11_b0ca_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1699_c7_7f53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1699_c11_b0ca_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c7_7f53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1699_c11_b0ca_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1699_c7_7f53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1699_c11_b0ca_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1699_c7_7f53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1699_c11_b0ca_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1699_c7_7f53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1699_c11_b0ca_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1699_c7_7f53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1699_c11_b0ca_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1702_c7_4c19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1702_c11_b011_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1702_c7_4c19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1702_c11_b011_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1702_c7_4c19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1702_c11_b011_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1702_c7_4c19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1702_c11_b011_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1702_c7_4c19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1702_c11_b011_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1702_c7_4c19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1702_c11_b011_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1702_c7_4c19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1702_c11_b011_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1702_c7_4c19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1702_c11_b011_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1702_c7_4c19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1702_c11_b011_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1702_c7_4c19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1702_c11_b011_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1707_c7_4bae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1707_c11_c9d5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1707_c7_4bae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1707_c11_c9d5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1707_c7_4bae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1707_c11_c9d5_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1707_c7_4bae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1707_c11_c9d5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1707_c7_4bae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1707_c11_c9d5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1707_c7_4bae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1707_c11_c9d5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1707_c7_4bae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1707_c11_c9d5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1707_c7_4bae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1707_c11_c9d5_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1707_c7_4bae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1707_c11_c9d5_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1707_c7_4bae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1707_c11_c9d5_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1710_c7_8ba5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1710_c11_e056_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_8ba5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1710_c11_e056_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1710_c7_8ba5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1710_c11_e056_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1710_c7_8ba5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1710_c11_e056_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_8ba5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1710_c11_e056_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1710_c7_8ba5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1710_c11_e056_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_8ba5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1710_c11_e056_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1710_c7_8ba5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1710_c11_e056_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1710_c7_8ba5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1710_c11_e056_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1710_c7_8ba5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1710_c11_e056_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1714_c7_30bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1714_c11_46df_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_30bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1714_c11_46df_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1714_c7_30bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1714_c11_46df_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1714_c7_30bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1714_c11_46df_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_30bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1714_c11_46df_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1714_c7_30bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1714_c11_46df_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1714_c7_30bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1714_c11_46df_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1714_c7_30bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1714_c11_46df_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1714_c7_30bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1714_c11_46df_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1717_c7_d8c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c11_62b1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1717_c7_d8c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c11_62b1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1717_c7_d8c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c11_62b1_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1717_c7_d8c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c11_62b1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1717_c7_d8c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c11_62b1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c7_d8c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c11_62b1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c7_d8c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c11_62b1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1717_c7_d8c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c11_62b1_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1717_c7_d8c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c11_62b1_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1722_c7_19a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1722_c11_0aff_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1722_c7_19a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1722_c11_0aff_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1722_c7_19a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1722_c11_0aff_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1722_c7_19a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1722_c11_0aff_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1722_c7_19a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1722_c11_0aff_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1722_c7_19a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1722_c11_0aff_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1722_c7_19a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1722_c11_0aff_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1722_c7_19a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1722_c11_0aff_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1722_c7_19a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1722_c11_0aff_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1725_c7_d643_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1725_c11_8295_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1725_c7_d643_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1725_c11_8295_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1725_c7_d643_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1725_c11_8295_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1725_c7_d643_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1725_c11_8295_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1725_c7_d643_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1725_c11_8295_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1725_c7_d643_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1725_c11_8295_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1725_c7_d643_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1725_c11_8295_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1725_c7_d643_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1725_c11_8295_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1725_c7_d643_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1725_c11_8295_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1732_c7_fb6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1732_c11_e3f5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1732_c7_fb6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1732_c11_e3f5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1732_c7_fb6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1732_c11_e3f5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1732_c7_fb6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1732_c11_e3f5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1732_c7_fb6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1732_c11_e3f5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_467a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1738_c11_91fa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1738_c7_467a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1738_c11_91fa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1738_c7_467a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1738_c11_91fa_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1738_c7_467a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1738_c11_91fa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_1931_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1742_c11_fa64_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1742_c7_1931_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1742_c11_fa64_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1711_c3_eec9_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1711_l1726_l1703_l1718_DUPLICATE_bfdc_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1726_c3_aefa_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1711_l1726_l1703_l1718_DUPLICATE_bfdc_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1704_l1719_DUPLICATE_9152_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1711_l1726_l1703_l1718_DUPLICATE_bfdc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1732_c7_fb6f_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1736_c24_c500_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1693_c2_73fd_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1699_l1722_l1693_l1717_l1714_l1710_l1707_l1702_l1725_DUPLICATE_3741_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c7_7f53_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1699_l1722_l1693_l1717_l1714_l1710_l1707_l1702_l1725_DUPLICATE_3741_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1702_c7_4c19_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1699_l1722_l1693_l1717_l1714_l1710_l1707_l1702_l1725_DUPLICATE_3741_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1707_c7_4bae_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1699_l1722_l1693_l1717_l1714_l1710_l1707_l1702_l1725_DUPLICATE_3741_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1710_c7_8ba5_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1699_l1722_l1693_l1717_l1714_l1710_l1707_l1702_l1725_DUPLICATE_3741_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1714_c7_30bc_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1699_l1722_l1693_l1717_l1714_l1710_l1707_l1702_l1725_DUPLICATE_3741_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c7_d8c1_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1699_l1722_l1693_l1717_l1714_l1710_l1707_l1702_l1725_DUPLICATE_3741_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1722_c7_19a7_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1699_l1722_l1693_l1717_l1714_l1710_l1707_l1702_l1725_DUPLICATE_3741_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1725_c7_d643_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1699_l1722_l1693_l1717_l1714_l1710_l1707_l1702_l1725_DUPLICATE_3741_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_7f53_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1699_l1722_l1717_l1714_l1742_l1710_l1738_l1707_l1732_l1702_l1725_DUPLICATE_1ab6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1702_c7_4c19_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1699_l1722_l1717_l1714_l1742_l1710_l1738_l1707_l1732_l1702_l1725_DUPLICATE_1ab6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1707_c7_4bae_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1699_l1722_l1717_l1714_l1742_l1710_l1738_l1707_l1732_l1702_l1725_DUPLICATE_1ab6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_8ba5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1699_l1722_l1717_l1714_l1742_l1710_l1738_l1707_l1732_l1702_l1725_DUPLICATE_1ab6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_30bc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1699_l1722_l1717_l1714_l1742_l1710_l1738_l1707_l1732_l1702_l1725_DUPLICATE_1ab6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1717_c7_d8c1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1699_l1722_l1717_l1714_l1742_l1710_l1738_l1707_l1732_l1702_l1725_DUPLICATE_1ab6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1722_c7_19a7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1699_l1722_l1717_l1714_l1742_l1710_l1738_l1707_l1732_l1702_l1725_DUPLICATE_1ab6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1725_c7_d643_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1699_l1722_l1717_l1714_l1742_l1710_l1738_l1707_l1732_l1702_l1725_DUPLICATE_1ab6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1732_c7_fb6f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1699_l1722_l1717_l1714_l1742_l1710_l1738_l1707_l1732_l1702_l1725_DUPLICATE_1ab6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_467a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1699_l1722_l1717_l1714_l1742_l1710_l1738_l1707_l1732_l1702_l1725_DUPLICATE_1ab6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_1931_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1699_l1722_l1717_l1714_l1742_l1710_l1738_l1707_l1732_l1702_l1725_DUPLICATE_1ab6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1693_c2_73fd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1699_l1722_l1693_l1717_l1714_l1710_l1707_l1732_l1702_DUPLICATE_5dd0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1699_c7_7f53_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1699_l1722_l1693_l1717_l1714_l1710_l1707_l1732_l1702_DUPLICATE_5dd0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1702_c7_4c19_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1699_l1722_l1693_l1717_l1714_l1710_l1707_l1732_l1702_DUPLICATE_5dd0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1707_c7_4bae_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1699_l1722_l1693_l1717_l1714_l1710_l1707_l1732_l1702_DUPLICATE_5dd0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1710_c7_8ba5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1699_l1722_l1693_l1717_l1714_l1710_l1707_l1732_l1702_DUPLICATE_5dd0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1714_c7_30bc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1699_l1722_l1693_l1717_l1714_l1710_l1707_l1732_l1702_DUPLICATE_5dd0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1717_c7_d8c1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1699_l1722_l1693_l1717_l1714_l1710_l1707_l1732_l1702_DUPLICATE_5dd0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1722_c7_19a7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1699_l1722_l1693_l1717_l1714_l1710_l1707_l1732_l1702_DUPLICATE_5dd0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1732_c7_fb6f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1699_l1722_l1693_l1717_l1714_l1710_l1707_l1732_l1702_DUPLICATE_5dd0_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1699_c7_7f53_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1699_l1722_l1717_l1714_l1710_l1707_l1702_l1725_DUPLICATE_a308_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1702_c7_4c19_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1699_l1722_l1717_l1714_l1710_l1707_l1702_l1725_DUPLICATE_a308_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1707_c7_4bae_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1699_l1722_l1717_l1714_l1710_l1707_l1702_l1725_DUPLICATE_a308_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1710_c7_8ba5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1699_l1722_l1717_l1714_l1710_l1707_l1702_l1725_DUPLICATE_a308_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1714_c7_30bc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1699_l1722_l1717_l1714_l1710_l1707_l1702_l1725_DUPLICATE_a308_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1717_c7_d8c1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1699_l1722_l1717_l1714_l1710_l1707_l1702_l1725_DUPLICATE_a308_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1722_c7_19a7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1699_l1722_l1717_l1714_l1710_l1707_l1702_l1725_DUPLICATE_a308_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1725_c7_d643_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1699_l1722_l1717_l1714_l1710_l1707_l1702_l1725_DUPLICATE_a308_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1693_c2_73fd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1699_l1722_l1693_l1717_l1714_l1742_l1710_l1738_l1707_l1702_l1725_DUPLICATE_48e0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1699_c7_7f53_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1699_l1722_l1693_l1717_l1714_l1742_l1710_l1738_l1707_l1702_l1725_DUPLICATE_48e0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1702_c7_4c19_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1699_l1722_l1693_l1717_l1714_l1742_l1710_l1738_l1707_l1702_l1725_DUPLICATE_48e0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1707_c7_4bae_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1699_l1722_l1693_l1717_l1714_l1742_l1710_l1738_l1707_l1702_l1725_DUPLICATE_48e0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_8ba5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1699_l1722_l1693_l1717_l1714_l1742_l1710_l1738_l1707_l1702_l1725_DUPLICATE_48e0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_30bc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1699_l1722_l1693_l1717_l1714_l1742_l1710_l1738_l1707_l1702_l1725_DUPLICATE_48e0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1717_c7_d8c1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1699_l1722_l1693_l1717_l1714_l1742_l1710_l1738_l1707_l1702_l1725_DUPLICATE_48e0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1722_c7_19a7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1699_l1722_l1693_l1717_l1714_l1742_l1710_l1738_l1707_l1702_l1725_DUPLICATE_48e0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1725_c7_d643_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1699_l1722_l1693_l1717_l1714_l1742_l1710_l1738_l1707_l1702_l1725_DUPLICATE_48e0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1738_c7_467a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1699_l1722_l1693_l1717_l1714_l1742_l1710_l1738_l1707_l1702_l1725_DUPLICATE_48e0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1742_c7_1931_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1699_l1722_l1693_l1717_l1714_l1742_l1710_l1738_l1707_l1702_l1725_DUPLICATE_48e0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1725_c7_d643_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1738_l1725_DUPLICATE_004a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1738_c7_467a_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1738_l1725_DUPLICATE_004a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1693_c2_73fd_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1699_l1722_l1693_l1717_l1714_l1710_l1738_l1707_l1702_l1725_DUPLICATE_6c9b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1699_c7_7f53_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1699_l1722_l1693_l1717_l1714_l1710_l1738_l1707_l1702_l1725_DUPLICATE_6c9b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1702_c7_4c19_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1699_l1722_l1693_l1717_l1714_l1710_l1738_l1707_l1702_l1725_DUPLICATE_6c9b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1707_c7_4bae_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1699_l1722_l1693_l1717_l1714_l1710_l1738_l1707_l1702_l1725_DUPLICATE_6c9b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1710_c7_8ba5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1699_l1722_l1693_l1717_l1714_l1710_l1738_l1707_l1702_l1725_DUPLICATE_6c9b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1714_c7_30bc_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1699_l1722_l1693_l1717_l1714_l1710_l1738_l1707_l1702_l1725_DUPLICATE_6c9b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1717_c7_d8c1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1699_l1722_l1693_l1717_l1714_l1710_l1738_l1707_l1702_l1725_DUPLICATE_6c9b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1722_c7_19a7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1699_l1722_l1693_l1717_l1714_l1710_l1738_l1707_l1702_l1725_DUPLICATE_6c9b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1725_c7_d643_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1699_l1722_l1693_l1717_l1714_l1710_l1738_l1707_l1702_l1725_DUPLICATE_6c9b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1738_c7_467a_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1699_l1722_l1693_l1717_l1714_l1710_l1738_l1707_l1702_l1725_DUPLICATE_6c9b_return_output;
     -- CAST_TO_uint8_t[uxn_opcodes_h_l1740_c24_7974] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1740_c24_7974_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1740_c34_66c0_return_output);

     -- BIN_OP_OR[uxn_opcodes_h_l1726_c3_aefa] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1726_c3_aefa_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1726_c3_aefa_left;
     BIN_OP_OR_uxn_opcodes_h_l1726_c3_aefa_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1726_c3_aefa_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1726_c3_aefa_return_output := BIN_OP_OR_uxn_opcodes_h_l1726_c3_aefa_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1742_c7_1931] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1742_c7_1931_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1742_c7_1931_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1742_c7_1931_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1742_c7_1931_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1742_c7_1931_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1742_c7_1931_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1742_c7_1931_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1742_c7_1931_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1704_l1719_DUPLICATE_9152 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1704_l1719_DUPLICATE_9152_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1704_l1719_DUPLICATE_9152_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1704_l1719_DUPLICATE_9152_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1704_l1719_DUPLICATE_9152_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1711_c3_eec9] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1711_c3_eec9_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1711_c3_eec9_left;
     BIN_OP_OR_uxn_opcodes_h_l1711_c3_eec9_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1711_c3_eec9_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1711_c3_eec9_return_output := BIN_OP_OR_uxn_opcodes_h_l1711_c3_eec9_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1693_c1_bb3b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1693_c1_bb3b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1693_c1_bb3b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1693_c1_bb3b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1693_c1_bb3b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1693_c1_bb3b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1693_c1_bb3b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1693_c1_bb3b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1693_c1_bb3b_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1730_c32_9a6b] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1730_c32_9a6b_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1730_c32_9a6b_left;
     BIN_OP_GT_uxn_opcodes_h_l1730_c32_9a6b_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1730_c32_9a6b_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1730_c32_9a6b_return_output := BIN_OP_GT_uxn_opcodes_h_l1730_c32_9a6b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1742_c7_1931] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_1931_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_1931_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_1931_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_1931_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_1931_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_1931_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_1931_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_1931_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1738_c7_467a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1738_c7_467a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1738_c7_467a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1738_c7_467a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1738_c7_467a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1738_c7_467a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1738_c7_467a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1738_c7_467a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1738_c7_467a_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1725_c7_d643] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1725_c7_d643_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1725_c7_d643_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1725_c7_d643_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1725_c7_d643_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1725_c7_d643_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1725_c7_d643_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1725_c7_d643_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1725_c7_d643_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1732_c7_fb6f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1732_c7_fb6f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1732_c7_fb6f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1732_c7_fb6f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1732_c7_fb6f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1732_c7_fb6f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1732_c7_fb6f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1732_c7_fb6f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1732_c7_fb6f_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1730_c32_07a6_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1730_c32_9a6b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1710_c7_8ba5_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1711_c3_eec9_return_output;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l1727_c11_94b7_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1726_c3_aefa_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1725_c7_d643_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1726_c3_aefa_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1738_c7_467a_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1740_c24_7974_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1717_c7_d8c1_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1704_l1719_DUPLICATE_9152_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1702_c7_4c19_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1704_l1719_DUPLICATE_9152_return_output;
     VAR_printf_uxn_opcodes_h_l1694_c3_4d0e_uxn_opcodes_h_l1694_c3_4d0e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1693_c1_bb3b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_467a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_1931_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1725_c7_d643_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1732_c7_fb6f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1722_c7_19a7_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1725_c7_d643_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1738_c7_467a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1742_c7_1931_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1732_c7_fb6f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1738_c7_467a_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1738_c7_467a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_467a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_467a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_467a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_467a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_467a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_467a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_467a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_467a_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1722_c7_19a7] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1722_c7_19a7_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1722_c7_19a7_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1722_c7_19a7_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1722_c7_19a7_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1722_c7_19a7_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1722_c7_19a7_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1722_c7_19a7_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1722_c7_19a7_return_output;

     -- MUX[uxn_opcodes_h_l1730_c32_07a6] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1730_c32_07a6_cond <= VAR_MUX_uxn_opcodes_h_l1730_c32_07a6_cond;
     MUX_uxn_opcodes_h_l1730_c32_07a6_iftrue <= VAR_MUX_uxn_opcodes_h_l1730_c32_07a6_iftrue;
     MUX_uxn_opcodes_h_l1730_c32_07a6_iffalse <= VAR_MUX_uxn_opcodes_h_l1730_c32_07a6_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1730_c32_07a6_return_output := MUX_uxn_opcodes_h_l1730_c32_07a6_return_output;

     -- t16_MUX[uxn_opcodes_h_l1710_c7_8ba5] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1710_c7_8ba5_cond <= VAR_t16_MUX_uxn_opcodes_h_l1710_c7_8ba5_cond;
     t16_MUX_uxn_opcodes_h_l1710_c7_8ba5_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1710_c7_8ba5_iftrue;
     t16_MUX_uxn_opcodes_h_l1710_c7_8ba5_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1710_c7_8ba5_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1710_c7_8ba5_return_output := t16_MUX_uxn_opcodes_h_l1710_c7_8ba5_return_output;

     -- BIN_OP_MINUS[uxn_opcodes_h_l1727_c11_94b7] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l1727_c11_94b7_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l1727_c11_94b7_left;
     BIN_OP_MINUS_uxn_opcodes_h_l1727_c11_94b7_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l1727_c11_94b7_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l1727_c11_94b7_return_output := BIN_OP_MINUS_uxn_opcodes_h_l1727_c11_94b7_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1725_c7_d643] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1725_c7_d643_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1725_c7_d643_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1725_c7_d643_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1725_c7_d643_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1725_c7_d643_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1725_c7_d643_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1725_c7_d643_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1725_c7_d643_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1738_c7_467a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1738_c7_467a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1738_c7_467a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1738_c7_467a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1738_c7_467a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1738_c7_467a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1738_c7_467a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1738_c7_467a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1738_c7_467a_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1738_c7_467a] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1738_c7_467a_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1738_c7_467a_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1738_c7_467a_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1738_c7_467a_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1738_c7_467a_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1738_c7_467a_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1738_c7_467a_return_output := result_stack_value_MUX_uxn_opcodes_h_l1738_c7_467a_return_output;

     -- printf_uxn_opcodes_h_l1694_c3_4d0e[uxn_opcodes_h_l1694_c3_4d0e] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1694_c3_4d0e_uxn_opcodes_h_l1694_c3_4d0e_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1694_c3_4d0e_uxn_opcodes_h_l1694_c3_4d0e_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- n16_MUX[uxn_opcodes_h_l1725_c7_d643] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1725_c7_d643_cond <= VAR_n16_MUX_uxn_opcodes_h_l1725_c7_d643_cond;
     n16_MUX_uxn_opcodes_h_l1725_c7_d643_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1725_c7_d643_iftrue;
     n16_MUX_uxn_opcodes_h_l1725_c7_d643_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1725_c7_d643_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1725_c7_d643_return_output := n16_MUX_uxn_opcodes_h_l1725_c7_d643_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1732_c7_fb6f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1732_c7_fb6f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1732_c7_fb6f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1732_c7_fb6f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1732_c7_fb6f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1732_c7_fb6f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1732_c7_fb6f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1732_c7_fb6f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1732_c7_fb6f_return_output;

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l1725_c7_d643_iftrue := VAR_BIN_OP_MINUS_uxn_opcodes_h_l1727_c11_94b7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1725_c7_d643_iftrue := VAR_MUX_uxn_opcodes_h_l1730_c32_07a6_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1722_c7_19a7_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1725_c7_d643_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1732_c7_fb6f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_467a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1722_c7_19a7_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1725_c7_d643_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1717_c7_d8c1_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1722_c7_19a7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1732_c7_fb6f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1738_c7_467a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1725_c7_d643_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1732_c7_fb6f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1732_c7_fb6f_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1738_c7_467a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1707_c7_4bae_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1710_c7_8ba5_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1725_c7_d643] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1725_c7_d643_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1725_c7_d643_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1725_c7_d643_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1725_c7_d643_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1725_c7_d643_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1725_c7_d643_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1725_c7_d643_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1725_c7_d643_return_output;

     -- t16_MUX[uxn_opcodes_h_l1707_c7_4bae] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1707_c7_4bae_cond <= VAR_t16_MUX_uxn_opcodes_h_l1707_c7_4bae_cond;
     t16_MUX_uxn_opcodes_h_l1707_c7_4bae_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1707_c7_4bae_iftrue;
     t16_MUX_uxn_opcodes_h_l1707_c7_4bae_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1707_c7_4bae_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1707_c7_4bae_return_output := t16_MUX_uxn_opcodes_h_l1707_c7_4bae_return_output;

     -- n16_MUX[uxn_opcodes_h_l1722_c7_19a7] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1722_c7_19a7_cond <= VAR_n16_MUX_uxn_opcodes_h_l1722_c7_19a7_cond;
     n16_MUX_uxn_opcodes_h_l1722_c7_19a7_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1722_c7_19a7_iftrue;
     n16_MUX_uxn_opcodes_h_l1722_c7_19a7_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1722_c7_19a7_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1722_c7_19a7_return_output := n16_MUX_uxn_opcodes_h_l1722_c7_19a7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1732_c7_fb6f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1732_c7_fb6f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1732_c7_fb6f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1732_c7_fb6f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1732_c7_fb6f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1732_c7_fb6f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1732_c7_fb6f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1732_c7_fb6f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1732_c7_fb6f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1722_c7_19a7] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1722_c7_19a7_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1722_c7_19a7_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1722_c7_19a7_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1722_c7_19a7_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1722_c7_19a7_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1722_c7_19a7_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1722_c7_19a7_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1722_c7_19a7_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1717_c7_d8c1] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1717_c7_d8c1_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1717_c7_d8c1_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1717_c7_d8c1_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1717_c7_d8c1_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1717_c7_d8c1_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1717_c7_d8c1_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1717_c7_d8c1_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1717_c7_d8c1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1725_c7_d643] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1725_c7_d643_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1725_c7_d643_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1725_c7_d643_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1725_c7_d643_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1725_c7_d643_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1725_c7_d643_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1725_c7_d643_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1725_c7_d643_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1732_c7_fb6f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1732_c7_fb6f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1732_c7_fb6f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1732_c7_fb6f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1732_c7_fb6f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1732_c7_fb6f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1732_c7_fb6f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1732_c7_fb6f_return_output := result_stack_value_MUX_uxn_opcodes_h_l1732_c7_fb6f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1732_c7_fb6f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1732_c7_fb6f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1732_c7_fb6f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1732_c7_fb6f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1732_c7_fb6f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1732_c7_fb6f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1732_c7_fb6f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1732_c7_fb6f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1732_c7_fb6f_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1725_c7_d643] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1725_c7_d643_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1725_c7_d643_cond;
     tmp16_MUX_uxn_opcodes_h_l1725_c7_d643_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1725_c7_d643_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1725_c7_d643_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1725_c7_d643_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1725_c7_d643_return_output := tmp16_MUX_uxn_opcodes_h_l1725_c7_d643_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l1717_c7_d8c1_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1722_c7_19a7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1725_c7_d643_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1732_c7_fb6f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1717_c7_d8c1_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1722_c7_19a7_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1714_c7_30bc_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1717_c7_d8c1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1725_c7_d643_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1732_c7_fb6f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1722_c7_19a7_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1725_c7_d643_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1722_c7_19a7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1725_c7_d643_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1725_c7_d643_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1732_c7_fb6f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1702_c7_4c19_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1707_c7_4bae_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1722_c7_19a7_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1725_c7_d643_return_output;
     -- t16_MUX[uxn_opcodes_h_l1702_c7_4c19] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1702_c7_4c19_cond <= VAR_t16_MUX_uxn_opcodes_h_l1702_c7_4c19_cond;
     t16_MUX_uxn_opcodes_h_l1702_c7_4c19_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1702_c7_4c19_iftrue;
     t16_MUX_uxn_opcodes_h_l1702_c7_4c19_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1702_c7_4c19_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1702_c7_4c19_return_output := t16_MUX_uxn_opcodes_h_l1702_c7_4c19_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1722_c7_19a7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1722_c7_19a7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1722_c7_19a7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1722_c7_19a7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1722_c7_19a7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1722_c7_19a7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1722_c7_19a7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1722_c7_19a7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1722_c7_19a7_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1717_c7_d8c1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1717_c7_d8c1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1717_c7_d8c1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1717_c7_d8c1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1717_c7_d8c1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1717_c7_d8c1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1717_c7_d8c1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1717_c7_d8c1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1717_c7_d8c1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1725_c7_d643] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1725_c7_d643_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1725_c7_d643_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1725_c7_d643_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1725_c7_d643_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1725_c7_d643_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1725_c7_d643_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1725_c7_d643_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1725_c7_d643_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1722_c7_19a7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1722_c7_19a7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1722_c7_19a7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1722_c7_19a7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1722_c7_19a7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1722_c7_19a7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1722_c7_19a7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1722_c7_19a7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1722_c7_19a7_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1725_c7_d643] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1725_c7_d643_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1725_c7_d643_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1725_c7_d643_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1725_c7_d643_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1725_c7_d643_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1725_c7_d643_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1725_c7_d643_return_output := result_stack_value_MUX_uxn_opcodes_h_l1725_c7_d643_return_output;

     -- n16_MUX[uxn_opcodes_h_l1717_c7_d8c1] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1717_c7_d8c1_cond <= VAR_n16_MUX_uxn_opcodes_h_l1717_c7_d8c1_cond;
     n16_MUX_uxn_opcodes_h_l1717_c7_d8c1_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1717_c7_d8c1_iftrue;
     n16_MUX_uxn_opcodes_h_l1717_c7_d8c1_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1717_c7_d8c1_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1717_c7_d8c1_return_output := n16_MUX_uxn_opcodes_h_l1717_c7_d8c1_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1722_c7_19a7] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1722_c7_19a7_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1722_c7_19a7_cond;
     tmp16_MUX_uxn_opcodes_h_l1722_c7_19a7_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1722_c7_19a7_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1722_c7_19a7_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1722_c7_19a7_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1722_c7_19a7_return_output := tmp16_MUX_uxn_opcodes_h_l1722_c7_19a7_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1714_c7_30bc] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1714_c7_30bc_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1714_c7_30bc_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1714_c7_30bc_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1714_c7_30bc_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1714_c7_30bc_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1714_c7_30bc_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1714_c7_30bc_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1714_c7_30bc_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1725_c7_d643] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1725_c7_d643_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1725_c7_d643_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1725_c7_d643_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1725_c7_d643_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1725_c7_d643_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1725_c7_d643_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1725_c7_d643_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1725_c7_d643_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1714_c7_30bc_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1717_c7_d8c1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1722_c7_19a7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1725_c7_d643_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1714_c7_30bc_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1717_c7_d8c1_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1710_c7_8ba5_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1714_c7_30bc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1722_c7_19a7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1725_c7_d643_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c7_d8c1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1722_c7_19a7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c7_d8c1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1722_c7_19a7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1722_c7_19a7_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1725_c7_d643_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1699_c7_7f53_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1702_c7_4c19_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1717_c7_d8c1_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1722_c7_19a7_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1722_c7_19a7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1722_c7_19a7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1722_c7_19a7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1722_c7_19a7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1722_c7_19a7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1722_c7_19a7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1722_c7_19a7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1722_c7_19a7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1722_c7_19a7_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1714_c7_30bc] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1714_c7_30bc_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1714_c7_30bc_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1714_c7_30bc_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1714_c7_30bc_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1714_c7_30bc_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1714_c7_30bc_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1714_c7_30bc_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1714_c7_30bc_return_output;

     -- n16_MUX[uxn_opcodes_h_l1714_c7_30bc] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1714_c7_30bc_cond <= VAR_n16_MUX_uxn_opcodes_h_l1714_c7_30bc_cond;
     n16_MUX_uxn_opcodes_h_l1714_c7_30bc_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1714_c7_30bc_iftrue;
     n16_MUX_uxn_opcodes_h_l1714_c7_30bc_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1714_c7_30bc_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1714_c7_30bc_return_output := n16_MUX_uxn_opcodes_h_l1714_c7_30bc_return_output;

     -- t16_MUX[uxn_opcodes_h_l1699_c7_7f53] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1699_c7_7f53_cond <= VAR_t16_MUX_uxn_opcodes_h_l1699_c7_7f53_cond;
     t16_MUX_uxn_opcodes_h_l1699_c7_7f53_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1699_c7_7f53_iftrue;
     t16_MUX_uxn_opcodes_h_l1699_c7_7f53_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1699_c7_7f53_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1699_c7_7f53_return_output := t16_MUX_uxn_opcodes_h_l1699_c7_7f53_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1717_c7_d8c1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c7_d8c1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c7_d8c1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c7_d8c1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c7_d8c1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c7_d8c1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c7_d8c1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c7_d8c1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c7_d8c1_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1717_c7_d8c1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c7_d8c1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c7_d8c1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c7_d8c1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c7_d8c1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c7_d8c1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c7_d8c1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c7_d8c1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c7_d8c1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1722_c7_19a7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1722_c7_19a7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1722_c7_19a7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1722_c7_19a7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1722_c7_19a7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1722_c7_19a7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1722_c7_19a7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1722_c7_19a7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1722_c7_19a7_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1722_c7_19a7] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1722_c7_19a7_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1722_c7_19a7_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1722_c7_19a7_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1722_c7_19a7_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1722_c7_19a7_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1722_c7_19a7_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1722_c7_19a7_return_output := result_stack_value_MUX_uxn_opcodes_h_l1722_c7_19a7_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1710_c7_8ba5] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1710_c7_8ba5_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1710_c7_8ba5_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1710_c7_8ba5_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1710_c7_8ba5_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1710_c7_8ba5_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1710_c7_8ba5_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1710_c7_8ba5_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1710_c7_8ba5_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1717_c7_d8c1] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1717_c7_d8c1_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1717_c7_d8c1_cond;
     tmp16_MUX_uxn_opcodes_h_l1717_c7_d8c1_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1717_c7_d8c1_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1717_c7_d8c1_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1717_c7_d8c1_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1717_c7_d8c1_return_output := tmp16_MUX_uxn_opcodes_h_l1717_c7_d8c1_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1710_c7_8ba5_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1714_c7_30bc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1717_c7_d8c1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1722_c7_19a7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1710_c7_8ba5_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1714_c7_30bc_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1707_c7_4bae_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1710_c7_8ba5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1717_c7_d8c1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1722_c7_19a7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1714_c7_30bc_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c7_d8c1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1714_c7_30bc_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c7_d8c1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1717_c7_d8c1_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1722_c7_19a7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1693_c2_73fd_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1699_c7_7f53_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1714_c7_30bc_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1717_c7_d8c1_return_output;
     -- t16_MUX[uxn_opcodes_h_l1693_c2_73fd] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1693_c2_73fd_cond <= VAR_t16_MUX_uxn_opcodes_h_l1693_c2_73fd_cond;
     t16_MUX_uxn_opcodes_h_l1693_c2_73fd_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1693_c2_73fd_iftrue;
     t16_MUX_uxn_opcodes_h_l1693_c2_73fd_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1693_c2_73fd_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1693_c2_73fd_return_output := t16_MUX_uxn_opcodes_h_l1693_c2_73fd_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1710_c7_8ba5] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1710_c7_8ba5_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1710_c7_8ba5_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1710_c7_8ba5_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1710_c7_8ba5_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1710_c7_8ba5_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1710_c7_8ba5_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1710_c7_8ba5_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1710_c7_8ba5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1717_c7_d8c1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1717_c7_d8c1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1717_c7_d8c1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1717_c7_d8c1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1717_c7_d8c1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1717_c7_d8c1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1717_c7_d8c1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1717_c7_d8c1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1717_c7_d8c1_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1707_c7_4bae] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1707_c7_4bae_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1707_c7_4bae_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1707_c7_4bae_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1707_c7_4bae_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1707_c7_4bae_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1707_c7_4bae_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1707_c7_4bae_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1707_c7_4bae_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1717_c7_d8c1] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1717_c7_d8c1_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1717_c7_d8c1_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1717_c7_d8c1_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1717_c7_d8c1_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1717_c7_d8c1_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1717_c7_d8c1_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1717_c7_d8c1_return_output := result_stack_value_MUX_uxn_opcodes_h_l1717_c7_d8c1_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1714_c7_30bc] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1714_c7_30bc_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1714_c7_30bc_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1714_c7_30bc_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1714_c7_30bc_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1714_c7_30bc_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1714_c7_30bc_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1714_c7_30bc_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1714_c7_30bc_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1714_c7_30bc] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1714_c7_30bc_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1714_c7_30bc_cond;
     tmp16_MUX_uxn_opcodes_h_l1714_c7_30bc_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1714_c7_30bc_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1714_c7_30bc_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1714_c7_30bc_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1714_c7_30bc_return_output := tmp16_MUX_uxn_opcodes_h_l1714_c7_30bc_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1717_c7_d8c1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1717_c7_d8c1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1717_c7_d8c1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1717_c7_d8c1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1717_c7_d8c1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1717_c7_d8c1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1717_c7_d8c1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1717_c7_d8c1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1717_c7_d8c1_return_output;

     -- n16_MUX[uxn_opcodes_h_l1710_c7_8ba5] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1710_c7_8ba5_cond <= VAR_n16_MUX_uxn_opcodes_h_l1710_c7_8ba5_cond;
     n16_MUX_uxn_opcodes_h_l1710_c7_8ba5_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1710_c7_8ba5_iftrue;
     n16_MUX_uxn_opcodes_h_l1710_c7_8ba5_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1710_c7_8ba5_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1710_c7_8ba5_return_output := n16_MUX_uxn_opcodes_h_l1710_c7_8ba5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1714_c7_30bc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1714_c7_30bc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1714_c7_30bc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1714_c7_30bc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1714_c7_30bc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1714_c7_30bc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1714_c7_30bc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1714_c7_30bc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1714_c7_30bc_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1707_c7_4bae_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1710_c7_8ba5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_30bc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1717_c7_d8c1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1707_c7_4bae_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1710_c7_8ba5_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1702_c7_4c19_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1707_c7_4bae_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_30bc_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1717_c7_d8c1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1710_c7_8ba5_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1714_c7_30bc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_8ba5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1714_c7_30bc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1714_c7_30bc_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1717_c7_d8c1_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1693_c2_73fd_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1710_c7_8ba5_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1714_c7_30bc_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l1702_c7_4c19] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1702_c7_4c19_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1702_c7_4c19_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1702_c7_4c19_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1702_c7_4c19_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1702_c7_4c19_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1702_c7_4c19_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1702_c7_4c19_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1702_c7_4c19_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1714_c7_30bc] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1714_c7_30bc_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1714_c7_30bc_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1714_c7_30bc_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1714_c7_30bc_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1714_c7_30bc_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1714_c7_30bc_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1714_c7_30bc_return_output := result_stack_value_MUX_uxn_opcodes_h_l1714_c7_30bc_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1710_c7_8ba5] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1710_c7_8ba5_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1710_c7_8ba5_cond;
     tmp16_MUX_uxn_opcodes_h_l1710_c7_8ba5_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1710_c7_8ba5_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1710_c7_8ba5_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1710_c7_8ba5_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1710_c7_8ba5_return_output := tmp16_MUX_uxn_opcodes_h_l1710_c7_8ba5_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1710_c7_8ba5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1710_c7_8ba5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1710_c7_8ba5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1710_c7_8ba5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1710_c7_8ba5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1710_c7_8ba5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1710_c7_8ba5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1710_c7_8ba5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1710_c7_8ba5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1710_c7_8ba5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_8ba5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_8ba5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_8ba5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_8ba5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_8ba5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_8ba5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_8ba5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_8ba5_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1707_c7_4bae] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1707_c7_4bae_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1707_c7_4bae_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1707_c7_4bae_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1707_c7_4bae_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1707_c7_4bae_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1707_c7_4bae_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1707_c7_4bae_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1707_c7_4bae_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1714_c7_30bc] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_30bc_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_30bc_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_30bc_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_30bc_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_30bc_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_30bc_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_30bc_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_30bc_return_output;

     -- n16_MUX[uxn_opcodes_h_l1707_c7_4bae] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1707_c7_4bae_cond <= VAR_n16_MUX_uxn_opcodes_h_l1707_c7_4bae_cond;
     n16_MUX_uxn_opcodes_h_l1707_c7_4bae_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1707_c7_4bae_iftrue;
     n16_MUX_uxn_opcodes_h_l1707_c7_4bae_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1707_c7_4bae_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1707_c7_4bae_return_output := n16_MUX_uxn_opcodes_h_l1707_c7_4bae_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1714_c7_30bc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_30bc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_30bc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_30bc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_30bc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_30bc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_30bc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_30bc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_30bc_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l1702_c7_4c19_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1707_c7_4bae_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_8ba5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_30bc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1702_c7_4c19_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1707_c7_4bae_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1699_c7_7f53_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1702_c7_4c19_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_8ba5_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_30bc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1707_c7_4bae_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1710_c7_8ba5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1707_c7_4bae_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_8ba5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1710_c7_8ba5_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1714_c7_30bc_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1707_c7_4bae_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1710_c7_8ba5_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1707_c7_4bae] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1707_c7_4bae_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1707_c7_4bae_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1707_c7_4bae_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1707_c7_4bae_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1707_c7_4bae_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1707_c7_4bae_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1707_c7_4bae_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1707_c7_4bae_return_output;

     -- n16_MUX[uxn_opcodes_h_l1702_c7_4c19] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1702_c7_4c19_cond <= VAR_n16_MUX_uxn_opcodes_h_l1702_c7_4c19_cond;
     n16_MUX_uxn_opcodes_h_l1702_c7_4c19_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1702_c7_4c19_iftrue;
     n16_MUX_uxn_opcodes_h_l1702_c7_4c19_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1702_c7_4c19_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1702_c7_4c19_return_output := n16_MUX_uxn_opcodes_h_l1702_c7_4c19_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1710_c7_8ba5] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1710_c7_8ba5_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1710_c7_8ba5_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1710_c7_8ba5_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1710_c7_8ba5_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1710_c7_8ba5_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1710_c7_8ba5_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1710_c7_8ba5_return_output := result_stack_value_MUX_uxn_opcodes_h_l1710_c7_8ba5_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1702_c7_4c19] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1702_c7_4c19_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1702_c7_4c19_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1702_c7_4c19_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1702_c7_4c19_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1702_c7_4c19_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1702_c7_4c19_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1702_c7_4c19_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1702_c7_4c19_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1707_c7_4bae] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1707_c7_4bae_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1707_c7_4bae_cond;
     tmp16_MUX_uxn_opcodes_h_l1707_c7_4bae_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1707_c7_4bae_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1707_c7_4bae_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1707_c7_4bae_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1707_c7_4bae_return_output := tmp16_MUX_uxn_opcodes_h_l1707_c7_4bae_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1707_c7_4bae] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1707_c7_4bae_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1707_c7_4bae_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1707_c7_4bae_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1707_c7_4bae_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1707_c7_4bae_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1707_c7_4bae_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1707_c7_4bae_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1707_c7_4bae_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1710_c7_8ba5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_8ba5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_8ba5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_8ba5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_8ba5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_8ba5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_8ba5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_8ba5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_8ba5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1710_c7_8ba5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_8ba5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_8ba5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_8ba5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_8ba5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_8ba5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_8ba5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_8ba5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_8ba5_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1699_c7_7f53] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1699_c7_7f53_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1699_c7_7f53_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1699_c7_7f53_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1699_c7_7f53_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1699_c7_7f53_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1699_c7_7f53_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1699_c7_7f53_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1699_c7_7f53_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l1699_c7_7f53_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1702_c7_4c19_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1707_c7_4bae_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_8ba5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1699_c7_7f53_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1702_c7_4c19_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1693_c2_73fd_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1699_c7_7f53_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1707_c7_4bae_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_8ba5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1702_c7_4c19_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1707_c7_4bae_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1702_c7_4c19_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1707_c7_4bae_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1707_c7_4bae_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1710_c7_8ba5_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1702_c7_4c19_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1707_c7_4bae_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l1693_c2_73fd] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1693_c2_73fd_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1693_c2_73fd_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1693_c2_73fd_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1693_c2_73fd_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1693_c2_73fd_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1693_c2_73fd_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1693_c2_73fd_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1693_c2_73fd_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1702_c7_4c19] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1702_c7_4c19_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1702_c7_4c19_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1702_c7_4c19_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1702_c7_4c19_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1702_c7_4c19_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1702_c7_4c19_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1702_c7_4c19_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1702_c7_4c19_return_output;

     -- n16_MUX[uxn_opcodes_h_l1699_c7_7f53] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1699_c7_7f53_cond <= VAR_n16_MUX_uxn_opcodes_h_l1699_c7_7f53_cond;
     n16_MUX_uxn_opcodes_h_l1699_c7_7f53_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1699_c7_7f53_iftrue;
     n16_MUX_uxn_opcodes_h_l1699_c7_7f53_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1699_c7_7f53_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1699_c7_7f53_return_output := n16_MUX_uxn_opcodes_h_l1699_c7_7f53_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1707_c7_4bae] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1707_c7_4bae_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1707_c7_4bae_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1707_c7_4bae_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1707_c7_4bae_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1707_c7_4bae_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1707_c7_4bae_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1707_c7_4bae_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1707_c7_4bae_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1707_c7_4bae] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1707_c7_4bae_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1707_c7_4bae_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1707_c7_4bae_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1707_c7_4bae_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1707_c7_4bae_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1707_c7_4bae_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1707_c7_4bae_return_output := result_stack_value_MUX_uxn_opcodes_h_l1707_c7_4bae_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1699_c7_7f53] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1699_c7_7f53_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1699_c7_7f53_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1699_c7_7f53_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1699_c7_7f53_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1699_c7_7f53_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1699_c7_7f53_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1699_c7_7f53_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1699_c7_7f53_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1702_c7_4c19] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1702_c7_4c19_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1702_c7_4c19_cond;
     tmp16_MUX_uxn_opcodes_h_l1702_c7_4c19_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1702_c7_4c19_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1702_c7_4c19_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1702_c7_4c19_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1702_c7_4c19_return_output := tmp16_MUX_uxn_opcodes_h_l1702_c7_4c19_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1707_c7_4bae] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1707_c7_4bae_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1707_c7_4bae_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1707_c7_4bae_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1707_c7_4bae_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1707_c7_4bae_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1707_c7_4bae_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1707_c7_4bae_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1707_c7_4bae_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1702_c7_4c19] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1702_c7_4c19_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1702_c7_4c19_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1702_c7_4c19_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1702_c7_4c19_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1702_c7_4c19_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1702_c7_4c19_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1702_c7_4c19_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1702_c7_4c19_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l1693_c2_73fd_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1699_c7_7f53_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1702_c7_4c19_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1707_c7_4bae_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1693_c2_73fd_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1699_c7_7f53_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1702_c7_4c19_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1707_c7_4bae_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c7_7f53_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1702_c7_4c19_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1699_c7_7f53_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1702_c7_4c19_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1702_c7_4c19_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1707_c7_4bae_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1699_c7_7f53_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1702_c7_4c19_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1699_c7_7f53] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1699_c7_7f53_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1699_c7_7f53_cond;
     tmp16_MUX_uxn_opcodes_h_l1699_c7_7f53_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1699_c7_7f53_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1699_c7_7f53_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1699_c7_7f53_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1699_c7_7f53_return_output := tmp16_MUX_uxn_opcodes_h_l1699_c7_7f53_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1699_c7_7f53] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c7_7f53_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c7_7f53_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c7_7f53_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c7_7f53_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c7_7f53_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c7_7f53_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c7_7f53_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c7_7f53_return_output;

     -- n16_MUX[uxn_opcodes_h_l1693_c2_73fd] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1693_c2_73fd_cond <= VAR_n16_MUX_uxn_opcodes_h_l1693_c2_73fd_cond;
     n16_MUX_uxn_opcodes_h_l1693_c2_73fd_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1693_c2_73fd_iftrue;
     n16_MUX_uxn_opcodes_h_l1693_c2_73fd_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1693_c2_73fd_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1693_c2_73fd_return_output := n16_MUX_uxn_opcodes_h_l1693_c2_73fd_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1699_c7_7f53] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1699_c7_7f53_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1699_c7_7f53_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1699_c7_7f53_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1699_c7_7f53_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1699_c7_7f53_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1699_c7_7f53_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1699_c7_7f53_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1699_c7_7f53_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1693_c2_73fd] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1693_c2_73fd_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1693_c2_73fd_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1693_c2_73fd_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1693_c2_73fd_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1693_c2_73fd_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1693_c2_73fd_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1693_c2_73fd_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1693_c2_73fd_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1702_c7_4c19] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1702_c7_4c19_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1702_c7_4c19_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1702_c7_4c19_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1702_c7_4c19_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1702_c7_4c19_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1702_c7_4c19_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1702_c7_4c19_return_output := result_stack_value_MUX_uxn_opcodes_h_l1702_c7_4c19_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1702_c7_4c19] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1702_c7_4c19_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1702_c7_4c19_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1702_c7_4c19_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1702_c7_4c19_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1702_c7_4c19_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1702_c7_4c19_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1702_c7_4c19_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1702_c7_4c19_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1702_c7_4c19] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1702_c7_4c19_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1702_c7_4c19_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1702_c7_4c19_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1702_c7_4c19_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1702_c7_4c19_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1702_c7_4c19_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1702_c7_4c19_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1702_c7_4c19_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1693_c2_73fd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_7f53_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1702_c7_4c19_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1699_c7_7f53_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1702_c7_4c19_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1693_c2_73fd_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c7_7f53_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1693_c2_73fd_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1699_c7_7f53_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1699_c7_7f53_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1702_c7_4c19_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1693_c2_73fd_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1699_c7_7f53_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1693_c2_73fd] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1693_c2_73fd_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1693_c2_73fd_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1693_c2_73fd_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1693_c2_73fd_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1693_c2_73fd_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1693_c2_73fd_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1693_c2_73fd_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1693_c2_73fd_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1699_c7_7f53] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1699_c7_7f53_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1699_c7_7f53_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1699_c7_7f53_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1699_c7_7f53_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1699_c7_7f53_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1699_c7_7f53_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1699_c7_7f53_return_output := result_stack_value_MUX_uxn_opcodes_h_l1699_c7_7f53_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1693_c2_73fd] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1693_c2_73fd_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1693_c2_73fd_cond;
     tmp16_MUX_uxn_opcodes_h_l1693_c2_73fd_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1693_c2_73fd_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1693_c2_73fd_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1693_c2_73fd_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1693_c2_73fd_return_output := tmp16_MUX_uxn_opcodes_h_l1693_c2_73fd_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1693_c2_73fd] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1693_c2_73fd_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1693_c2_73fd_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1693_c2_73fd_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1693_c2_73fd_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1693_c2_73fd_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1693_c2_73fd_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1693_c2_73fd_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1693_c2_73fd_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1699_c7_7f53] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_7f53_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_7f53_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_7f53_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_7f53_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_7f53_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_7f53_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_7f53_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_7f53_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1699_c7_7f53] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1699_c7_7f53_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1699_c7_7f53_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1699_c7_7f53_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1699_c7_7f53_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1699_c7_7f53_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1699_c7_7f53_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1699_c7_7f53_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1699_c7_7f53_return_output;

     -- Submodule level 12
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1693_c2_73fd_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_7f53_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1693_c2_73fd_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1699_c7_7f53_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1693_c2_73fd_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1699_c7_7f53_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1693_c2_73fd_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1693_c2_73fd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1693_c2_73fd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1693_c2_73fd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1693_c2_73fd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1693_c2_73fd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1693_c2_73fd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1693_c2_73fd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1693_c2_73fd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1693_c2_73fd_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1693_c2_73fd] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1693_c2_73fd_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1693_c2_73fd_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1693_c2_73fd_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1693_c2_73fd_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1693_c2_73fd_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1693_c2_73fd_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1693_c2_73fd_return_output := result_stack_value_MUX_uxn_opcodes_h_l1693_c2_73fd_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1693_c2_73fd] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1693_c2_73fd_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1693_c2_73fd_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1693_c2_73fd_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1693_c2_73fd_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1693_c2_73fd_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1693_c2_73fd_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1693_c2_73fd_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1693_c2_73fd_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_28d7_uxn_opcodes_h_l1747_l1689_DUPLICATE_15b8 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_28d7_uxn_opcodes_h_l1747_l1689_DUPLICATE_15b8_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_28d7(
     result,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1693_c2_73fd_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1693_c2_73fd_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1693_c2_73fd_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1693_c2_73fd_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1693_c2_73fd_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1693_c2_73fd_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1693_c2_73fd_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_28d7_uxn_opcodes_h_l1747_l1689_DUPLICATE_15b8_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_28d7_uxn_opcodes_h_l1747_l1689_DUPLICATE_15b8_return_output;
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
