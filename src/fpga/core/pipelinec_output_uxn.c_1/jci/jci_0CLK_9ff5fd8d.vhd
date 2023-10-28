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
-- Submodules: 63
entity jci_0CLK_9ff5fd8d is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end jci_0CLK_9ff5fd8d;
architecture arch of jci_0CLK_9ff5fd8d is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal tmp16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_tmp16 : unsigned(15 downto 0);
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l71_c6_cd4b]
signal BIN_OP_EQ_uxn_opcodes_h_l71_c6_cd4b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l71_c6_cd4b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l71_c6_cd4b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l71_c1_c934]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l71_c1_c934_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l71_c1_c934_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l71_c1_c934_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l71_c1_c934_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l71_c2_98f7]
signal tmp16_MUX_uxn_opcodes_h_l71_c2_98f7_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l71_c2_98f7_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l71_c2_98f7_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l71_c2_98f7_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l71_c2_98f7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_98f7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_98f7_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_98f7_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_98f7_return_output : unsigned(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l71_c2_98f7]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_98f7_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_98f7_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_98f7_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_98f7_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l71_c2_98f7]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l71_c2_98f7_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l71_c2_98f7_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l71_c2_98f7_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l71_c2_98f7_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l71_c2_98f7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_98f7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_98f7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_98f7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_98f7_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l71_c2_98f7]
signal result_u16_value_MUX_uxn_opcodes_h_l71_c2_98f7_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l71_c2_98f7_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l71_c2_98f7_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l71_c2_98f7_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l71_c2_98f7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_98f7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_98f7_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_98f7_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_98f7_return_output : signed(3 downto 0);

-- t8_MUX[uxn_opcodes_h_l71_c2_98f7]
signal t8_MUX_uxn_opcodes_h_l71_c2_98f7_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l71_c2_98f7_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l71_c2_98f7_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l71_c2_98f7_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l72_c3_362f[uxn_opcodes_h_l72_c3_362f]
signal printf_uxn_opcodes_h_l72_c3_362f_uxn_opcodes_h_l72_c3_362f_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l76_c11_078e]
signal BIN_OP_EQ_uxn_opcodes_h_l76_c11_078e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l76_c11_078e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l76_c11_078e_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l76_c7_f0e6]
signal tmp16_MUX_uxn_opcodes_h_l76_c7_f0e6_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l76_c7_f0e6_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l76_c7_f0e6_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l76_c7_f0e6_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l76_c7_f0e6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_f0e6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_f0e6_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_f0e6_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_f0e6_return_output : unsigned(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l76_c7_f0e6]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_f0e6_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_f0e6_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_f0e6_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_f0e6_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l76_c7_f0e6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_f0e6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_f0e6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_f0e6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_f0e6_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l76_c7_f0e6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_f0e6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_f0e6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_f0e6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_f0e6_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l76_c7_f0e6]
signal result_u16_value_MUX_uxn_opcodes_h_l76_c7_f0e6_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l76_c7_f0e6_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l76_c7_f0e6_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l76_c7_f0e6_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l76_c7_f0e6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_f0e6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_f0e6_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_f0e6_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_f0e6_return_output : signed(3 downto 0);

-- t8_MUX[uxn_opcodes_h_l76_c7_f0e6]
signal t8_MUX_uxn_opcodes_h_l76_c7_f0e6_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l76_c7_f0e6_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l76_c7_f0e6_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l76_c7_f0e6_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l79_c11_790e]
signal BIN_OP_EQ_uxn_opcodes_h_l79_c11_790e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l79_c11_790e_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l79_c11_790e_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l79_c7_077f]
signal tmp16_MUX_uxn_opcodes_h_l79_c7_077f_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l79_c7_077f_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l79_c7_077f_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l79_c7_077f_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l79_c7_077f]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_077f_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_077f_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_077f_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_077f_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l79_c7_077f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_077f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_077f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_077f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_077f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l79_c7_077f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_077f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_077f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_077f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_077f_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l79_c7_077f]
signal result_u16_value_MUX_uxn_opcodes_h_l79_c7_077f_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l79_c7_077f_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l79_c7_077f_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l79_c7_077f_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l79_c7_077f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_077f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_077f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_077f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_077f_return_output : signed(3 downto 0);

-- t8_MUX[uxn_opcodes_h_l79_c7_077f]
signal t8_MUX_uxn_opcodes_h_l79_c7_077f_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l79_c7_077f_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l79_c7_077f_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l79_c7_077f_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l85_c11_aa2b]
signal BIN_OP_EQ_uxn_opcodes_h_l85_c11_aa2b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l85_c11_aa2b_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l85_c11_aa2b_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l85_c7_5d1f]
signal tmp16_MUX_uxn_opcodes_h_l85_c7_5d1f_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l85_c7_5d1f_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l85_c7_5d1f_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l85_c7_5d1f_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l85_c7_5d1f]
signal result_u16_value_MUX_uxn_opcodes_h_l85_c7_5d1f_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l85_c7_5d1f_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l85_c7_5d1f_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l85_c7_5d1f_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l85_c7_5d1f]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_5d1f_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_5d1f_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_5d1f_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_5d1f_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l85_c7_5d1f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_5d1f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_5d1f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_5d1f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_5d1f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l85_c7_5d1f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_5d1f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_5d1f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_5d1f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_5d1f_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l89_c11_2e69]
signal BIN_OP_EQ_uxn_opcodes_h_l89_c11_2e69_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l89_c11_2e69_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l89_c11_2e69_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l89_c7_027a]
signal tmp16_MUX_uxn_opcodes_h_l89_c7_027a_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l89_c7_027a_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l89_c7_027a_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l89_c7_027a_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l89_c7_027a]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_027a_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_027a_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_027a_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_027a_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l89_c7_027a]
signal result_u16_value_MUX_uxn_opcodes_h_l89_c7_027a_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l89_c7_027a_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l89_c7_027a_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l89_c7_027a_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l89_c7_027a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_027a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_027a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_027a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_027a_return_output : unsigned(0 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l91_c3_eb61]
signal CONST_SL_8_uxn_opcodes_h_l91_c3_eb61_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l91_c3_eb61_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l92_c22_0efb]
signal BIN_OP_PLUS_uxn_opcodes_h_l92_c22_0efb_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l92_c22_0efb_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l92_c22_0efb_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l94_c11_8a50]
signal BIN_OP_EQ_uxn_opcodes_h_l94_c11_8a50_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l94_c11_8a50_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l94_c11_8a50_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l94_c7_9007]
signal tmp16_MUX_uxn_opcodes_h_l94_c7_9007_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l94_c7_9007_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l94_c7_9007_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l94_c7_9007_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l94_c7_9007]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_9007_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_9007_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_9007_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_9007_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l94_c7_9007]
signal result_u16_value_MUX_uxn_opcodes_h_l94_c7_9007_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l94_c7_9007_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l94_c7_9007_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l94_c7_9007_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l94_c7_9007]
signal result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_9007_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_9007_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_9007_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_9007_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l95_c22_7e00]
signal BIN_OP_PLUS_uxn_opcodes_h_l95_c22_7e00_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l95_c22_7e00_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l95_c22_7e00_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l97_c11_84cf]
signal BIN_OP_EQ_uxn_opcodes_h_l97_c11_84cf_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l97_c11_84cf_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l97_c11_84cf_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l97_c7_072e]
signal tmp16_MUX_uxn_opcodes_h_l97_c7_072e_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l97_c7_072e_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l97_c7_072e_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l97_c7_072e_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l97_c7_072e]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l97_c7_072e_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l97_c7_072e_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l97_c7_072e_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l97_c7_072e_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l97_c7_072e]
signal result_u16_value_MUX_uxn_opcodes_h_l97_c7_072e_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l97_c7_072e_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l97_c7_072e_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l97_c7_072e_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l97_c7_072e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l97_c7_072e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l97_c7_072e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l97_c7_072e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l97_c7_072e_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l98_c3_d738]
signal BIN_OP_OR_uxn_opcodes_h_l98_c3_d738_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l98_c3_d738_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l98_c3_d738_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l100_c22_1d0b]
signal BIN_OP_EQ_uxn_opcodes_h_l100_c22_1d0b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l100_c22_1d0b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l100_c22_1d0b_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l100_c32_dd08]
signal BIN_OP_PLUS_uxn_opcodes_h_l100_c32_dd08_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l100_c32_dd08_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l100_c32_dd08_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l100_c42_b570]
signal BIN_OP_PLUS_uxn_opcodes_h_l100_c42_b570_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l100_c42_b570_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l100_c42_b570_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l100_c42_75ea]
signal BIN_OP_PLUS_uxn_opcodes_h_l100_c42_75ea_left : unsigned(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l100_c42_75ea_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l100_c42_75ea_return_output : unsigned(17 downto 0);

-- MUX[uxn_opcodes_h_l100_c22_d62f]
signal MUX_uxn_opcodes_h_l100_c22_d62f_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l100_c22_d62f_iftrue : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l100_c22_d62f_iffalse : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l100_c22_d62f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l102_c11_8a85]
signal BIN_OP_EQ_uxn_opcodes_h_l102_c11_8a85_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l102_c11_8a85_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l102_c11_8a85_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l102_c7_76f2]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l102_c7_76f2_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l102_c7_76f2_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l102_c7_76f2_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l102_c7_76f2_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l102_c7_76f2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l102_c7_76f2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l102_c7_76f2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l102_c7_76f2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l102_c7_76f2_return_output : unsigned(0 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_8040( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : signed) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.stack_address_sp_offset := ref_toks_1;
      base.is_pc_updated := ref_toks_2;
      base.is_sp_shift := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.u16_value := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l71_c6_cd4b
BIN_OP_EQ_uxn_opcodes_h_l71_c6_cd4b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l71_c6_cd4b_left,
BIN_OP_EQ_uxn_opcodes_h_l71_c6_cd4b_right,
BIN_OP_EQ_uxn_opcodes_h_l71_c6_cd4b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l71_c1_c934
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l71_c1_c934 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l71_c1_c934_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l71_c1_c934_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l71_c1_c934_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l71_c1_c934_return_output);

-- tmp16_MUX_uxn_opcodes_h_l71_c2_98f7
tmp16_MUX_uxn_opcodes_h_l71_c2_98f7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l71_c2_98f7_cond,
tmp16_MUX_uxn_opcodes_h_l71_c2_98f7_iftrue,
tmp16_MUX_uxn_opcodes_h_l71_c2_98f7_iffalse,
tmp16_MUX_uxn_opcodes_h_l71_c2_98f7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_98f7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_98f7 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_98f7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_98f7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_98f7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_98f7_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_98f7
result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_98f7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_98f7_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_98f7_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_98f7_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_98f7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l71_c2_98f7
result_is_sp_shift_MUX_uxn_opcodes_h_l71_c2_98f7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l71_c2_98f7_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l71_c2_98f7_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l71_c2_98f7_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l71_c2_98f7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_98f7
result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_98f7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_98f7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_98f7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_98f7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_98f7_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l71_c2_98f7
result_u16_value_MUX_uxn_opcodes_h_l71_c2_98f7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l71_c2_98f7_cond,
result_u16_value_MUX_uxn_opcodes_h_l71_c2_98f7_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l71_c2_98f7_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l71_c2_98f7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_98f7
result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_98f7 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_98f7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_98f7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_98f7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_98f7_return_output);

-- t8_MUX_uxn_opcodes_h_l71_c2_98f7
t8_MUX_uxn_opcodes_h_l71_c2_98f7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l71_c2_98f7_cond,
t8_MUX_uxn_opcodes_h_l71_c2_98f7_iftrue,
t8_MUX_uxn_opcodes_h_l71_c2_98f7_iffalse,
t8_MUX_uxn_opcodes_h_l71_c2_98f7_return_output);

-- printf_uxn_opcodes_h_l72_c3_362f_uxn_opcodes_h_l72_c3_362f
printf_uxn_opcodes_h_l72_c3_362f_uxn_opcodes_h_l72_c3_362f : entity work.printf_uxn_opcodes_h_l72_c3_362f_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l72_c3_362f_uxn_opcodes_h_l72_c3_362f_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l76_c11_078e
BIN_OP_EQ_uxn_opcodes_h_l76_c11_078e : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l76_c11_078e_left,
BIN_OP_EQ_uxn_opcodes_h_l76_c11_078e_right,
BIN_OP_EQ_uxn_opcodes_h_l76_c11_078e_return_output);

-- tmp16_MUX_uxn_opcodes_h_l76_c7_f0e6
tmp16_MUX_uxn_opcodes_h_l76_c7_f0e6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l76_c7_f0e6_cond,
tmp16_MUX_uxn_opcodes_h_l76_c7_f0e6_iftrue,
tmp16_MUX_uxn_opcodes_h_l76_c7_f0e6_iffalse,
tmp16_MUX_uxn_opcodes_h_l76_c7_f0e6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_f0e6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_f0e6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_f0e6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_f0e6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_f0e6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_f0e6_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_f0e6
result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_f0e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_f0e6_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_f0e6_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_f0e6_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_f0e6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_f0e6
result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_f0e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_f0e6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_f0e6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_f0e6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_f0e6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_f0e6
result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_f0e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_f0e6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_f0e6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_f0e6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_f0e6_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l76_c7_f0e6
result_u16_value_MUX_uxn_opcodes_h_l76_c7_f0e6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l76_c7_f0e6_cond,
result_u16_value_MUX_uxn_opcodes_h_l76_c7_f0e6_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l76_c7_f0e6_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l76_c7_f0e6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_f0e6
result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_f0e6 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_f0e6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_f0e6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_f0e6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_f0e6_return_output);

-- t8_MUX_uxn_opcodes_h_l76_c7_f0e6
t8_MUX_uxn_opcodes_h_l76_c7_f0e6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l76_c7_f0e6_cond,
t8_MUX_uxn_opcodes_h_l76_c7_f0e6_iftrue,
t8_MUX_uxn_opcodes_h_l76_c7_f0e6_iffalse,
t8_MUX_uxn_opcodes_h_l76_c7_f0e6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l79_c11_790e
BIN_OP_EQ_uxn_opcodes_h_l79_c11_790e : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l79_c11_790e_left,
BIN_OP_EQ_uxn_opcodes_h_l79_c11_790e_right,
BIN_OP_EQ_uxn_opcodes_h_l79_c11_790e_return_output);

-- tmp16_MUX_uxn_opcodes_h_l79_c7_077f
tmp16_MUX_uxn_opcodes_h_l79_c7_077f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l79_c7_077f_cond,
tmp16_MUX_uxn_opcodes_h_l79_c7_077f_iftrue,
tmp16_MUX_uxn_opcodes_h_l79_c7_077f_iffalse,
tmp16_MUX_uxn_opcodes_h_l79_c7_077f_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_077f
result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_077f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_077f_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_077f_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_077f_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_077f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_077f
result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_077f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_077f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_077f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_077f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_077f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_077f
result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_077f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_077f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_077f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_077f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_077f_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l79_c7_077f
result_u16_value_MUX_uxn_opcodes_h_l79_c7_077f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l79_c7_077f_cond,
result_u16_value_MUX_uxn_opcodes_h_l79_c7_077f_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l79_c7_077f_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l79_c7_077f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_077f
result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_077f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_077f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_077f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_077f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_077f_return_output);

-- t8_MUX_uxn_opcodes_h_l79_c7_077f
t8_MUX_uxn_opcodes_h_l79_c7_077f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l79_c7_077f_cond,
t8_MUX_uxn_opcodes_h_l79_c7_077f_iftrue,
t8_MUX_uxn_opcodes_h_l79_c7_077f_iffalse,
t8_MUX_uxn_opcodes_h_l79_c7_077f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l85_c11_aa2b
BIN_OP_EQ_uxn_opcodes_h_l85_c11_aa2b : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l85_c11_aa2b_left,
BIN_OP_EQ_uxn_opcodes_h_l85_c11_aa2b_right,
BIN_OP_EQ_uxn_opcodes_h_l85_c11_aa2b_return_output);

-- tmp16_MUX_uxn_opcodes_h_l85_c7_5d1f
tmp16_MUX_uxn_opcodes_h_l85_c7_5d1f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l85_c7_5d1f_cond,
tmp16_MUX_uxn_opcodes_h_l85_c7_5d1f_iftrue,
tmp16_MUX_uxn_opcodes_h_l85_c7_5d1f_iffalse,
tmp16_MUX_uxn_opcodes_h_l85_c7_5d1f_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l85_c7_5d1f
result_u16_value_MUX_uxn_opcodes_h_l85_c7_5d1f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l85_c7_5d1f_cond,
result_u16_value_MUX_uxn_opcodes_h_l85_c7_5d1f_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l85_c7_5d1f_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l85_c7_5d1f_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_5d1f
result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_5d1f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_5d1f_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_5d1f_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_5d1f_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_5d1f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_5d1f
result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_5d1f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_5d1f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_5d1f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_5d1f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_5d1f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_5d1f
result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_5d1f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_5d1f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_5d1f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_5d1f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_5d1f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l89_c11_2e69
BIN_OP_EQ_uxn_opcodes_h_l89_c11_2e69 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l89_c11_2e69_left,
BIN_OP_EQ_uxn_opcodes_h_l89_c11_2e69_right,
BIN_OP_EQ_uxn_opcodes_h_l89_c11_2e69_return_output);

-- tmp16_MUX_uxn_opcodes_h_l89_c7_027a
tmp16_MUX_uxn_opcodes_h_l89_c7_027a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l89_c7_027a_cond,
tmp16_MUX_uxn_opcodes_h_l89_c7_027a_iftrue,
tmp16_MUX_uxn_opcodes_h_l89_c7_027a_iffalse,
tmp16_MUX_uxn_opcodes_h_l89_c7_027a_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_027a
result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_027a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_027a_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_027a_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_027a_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_027a_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l89_c7_027a
result_u16_value_MUX_uxn_opcodes_h_l89_c7_027a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l89_c7_027a_cond,
result_u16_value_MUX_uxn_opcodes_h_l89_c7_027a_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l89_c7_027a_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l89_c7_027a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_027a
result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_027a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_027a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_027a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_027a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_027a_return_output);

-- CONST_SL_8_uxn_opcodes_h_l91_c3_eb61
CONST_SL_8_uxn_opcodes_h_l91_c3_eb61 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l91_c3_eb61_x,
CONST_SL_8_uxn_opcodes_h_l91_c3_eb61_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l92_c22_0efb
BIN_OP_PLUS_uxn_opcodes_h_l92_c22_0efb : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l92_c22_0efb_left,
BIN_OP_PLUS_uxn_opcodes_h_l92_c22_0efb_right,
BIN_OP_PLUS_uxn_opcodes_h_l92_c22_0efb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l94_c11_8a50
BIN_OP_EQ_uxn_opcodes_h_l94_c11_8a50 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l94_c11_8a50_left,
BIN_OP_EQ_uxn_opcodes_h_l94_c11_8a50_right,
BIN_OP_EQ_uxn_opcodes_h_l94_c11_8a50_return_output);

-- tmp16_MUX_uxn_opcodes_h_l94_c7_9007
tmp16_MUX_uxn_opcodes_h_l94_c7_9007 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l94_c7_9007_cond,
tmp16_MUX_uxn_opcodes_h_l94_c7_9007_iftrue,
tmp16_MUX_uxn_opcodes_h_l94_c7_9007_iffalse,
tmp16_MUX_uxn_opcodes_h_l94_c7_9007_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_9007
result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_9007 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_9007_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_9007_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_9007_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_9007_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l94_c7_9007
result_u16_value_MUX_uxn_opcodes_h_l94_c7_9007 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l94_c7_9007_cond,
result_u16_value_MUX_uxn_opcodes_h_l94_c7_9007_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l94_c7_9007_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l94_c7_9007_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_9007
result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_9007 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_9007_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_9007_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_9007_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_9007_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l95_c22_7e00
BIN_OP_PLUS_uxn_opcodes_h_l95_c22_7e00 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l95_c22_7e00_left,
BIN_OP_PLUS_uxn_opcodes_h_l95_c22_7e00_right,
BIN_OP_PLUS_uxn_opcodes_h_l95_c22_7e00_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l97_c11_84cf
BIN_OP_EQ_uxn_opcodes_h_l97_c11_84cf : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l97_c11_84cf_left,
BIN_OP_EQ_uxn_opcodes_h_l97_c11_84cf_right,
BIN_OP_EQ_uxn_opcodes_h_l97_c11_84cf_return_output);

-- tmp16_MUX_uxn_opcodes_h_l97_c7_072e
tmp16_MUX_uxn_opcodes_h_l97_c7_072e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l97_c7_072e_cond,
tmp16_MUX_uxn_opcodes_h_l97_c7_072e_iftrue,
tmp16_MUX_uxn_opcodes_h_l97_c7_072e_iffalse,
tmp16_MUX_uxn_opcodes_h_l97_c7_072e_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l97_c7_072e
result_is_pc_updated_MUX_uxn_opcodes_h_l97_c7_072e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l97_c7_072e_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l97_c7_072e_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l97_c7_072e_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l97_c7_072e_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l97_c7_072e
result_u16_value_MUX_uxn_opcodes_h_l97_c7_072e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l97_c7_072e_cond,
result_u16_value_MUX_uxn_opcodes_h_l97_c7_072e_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l97_c7_072e_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l97_c7_072e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l97_c7_072e
result_is_opc_done_MUX_uxn_opcodes_h_l97_c7_072e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l97_c7_072e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l97_c7_072e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l97_c7_072e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l97_c7_072e_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l98_c3_d738
BIN_OP_OR_uxn_opcodes_h_l98_c3_d738 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l98_c3_d738_left,
BIN_OP_OR_uxn_opcodes_h_l98_c3_d738_right,
BIN_OP_OR_uxn_opcodes_h_l98_c3_d738_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l100_c22_1d0b
BIN_OP_EQ_uxn_opcodes_h_l100_c22_1d0b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l100_c22_1d0b_left,
BIN_OP_EQ_uxn_opcodes_h_l100_c22_1d0b_right,
BIN_OP_EQ_uxn_opcodes_h_l100_c22_1d0b_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l100_c32_dd08
BIN_OP_PLUS_uxn_opcodes_h_l100_c32_dd08 : entity work.BIN_OP_PLUS_uint16_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l100_c32_dd08_left,
BIN_OP_PLUS_uxn_opcodes_h_l100_c32_dd08_right,
BIN_OP_PLUS_uxn_opcodes_h_l100_c32_dd08_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l100_c42_b570
BIN_OP_PLUS_uxn_opcodes_h_l100_c42_b570 : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l100_c42_b570_left,
BIN_OP_PLUS_uxn_opcodes_h_l100_c42_b570_right,
BIN_OP_PLUS_uxn_opcodes_h_l100_c42_b570_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l100_c42_75ea
BIN_OP_PLUS_uxn_opcodes_h_l100_c42_75ea : entity work.BIN_OP_PLUS_uint17_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l100_c42_75ea_left,
BIN_OP_PLUS_uxn_opcodes_h_l100_c42_75ea_right,
BIN_OP_PLUS_uxn_opcodes_h_l100_c42_75ea_return_output);

-- MUX_uxn_opcodes_h_l100_c22_d62f
MUX_uxn_opcodes_h_l100_c22_d62f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l100_c22_d62f_cond,
MUX_uxn_opcodes_h_l100_c22_d62f_iftrue,
MUX_uxn_opcodes_h_l100_c22_d62f_iffalse,
MUX_uxn_opcodes_h_l100_c22_d62f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l102_c11_8a85
BIN_OP_EQ_uxn_opcodes_h_l102_c11_8a85 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l102_c11_8a85_left,
BIN_OP_EQ_uxn_opcodes_h_l102_c11_8a85_right,
BIN_OP_EQ_uxn_opcodes_h_l102_c11_8a85_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l102_c7_76f2
result_is_pc_updated_MUX_uxn_opcodes_h_l102_c7_76f2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l102_c7_76f2_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l102_c7_76f2_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l102_c7_76f2_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l102_c7_76f2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l102_c7_76f2
result_is_opc_done_MUX_uxn_opcodes_h_l102_c7_76f2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l102_c7_76f2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l102_c7_76f2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l102_c7_76f2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l102_c7_76f2_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 pc,
 previous_stack_read,
 previous_ram_read,
 -- Registers
 tmp16,
 t8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l71_c6_cd4b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l71_c1_c934_return_output,
 tmp16_MUX_uxn_opcodes_h_l71_c2_98f7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_98f7_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_98f7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l71_c2_98f7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_98f7_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l71_c2_98f7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_98f7_return_output,
 t8_MUX_uxn_opcodes_h_l71_c2_98f7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l76_c11_078e_return_output,
 tmp16_MUX_uxn_opcodes_h_l76_c7_f0e6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_f0e6_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_f0e6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_f0e6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_f0e6_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l76_c7_f0e6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_f0e6_return_output,
 t8_MUX_uxn_opcodes_h_l76_c7_f0e6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l79_c11_790e_return_output,
 tmp16_MUX_uxn_opcodes_h_l79_c7_077f_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_077f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_077f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_077f_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l79_c7_077f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_077f_return_output,
 t8_MUX_uxn_opcodes_h_l79_c7_077f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l85_c11_aa2b_return_output,
 tmp16_MUX_uxn_opcodes_h_l85_c7_5d1f_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l85_c7_5d1f_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_5d1f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_5d1f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_5d1f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l89_c11_2e69_return_output,
 tmp16_MUX_uxn_opcodes_h_l89_c7_027a_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_027a_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l89_c7_027a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_027a_return_output,
 CONST_SL_8_uxn_opcodes_h_l91_c3_eb61_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l92_c22_0efb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l94_c11_8a50_return_output,
 tmp16_MUX_uxn_opcodes_h_l94_c7_9007_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_9007_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l94_c7_9007_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_9007_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l95_c22_7e00_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l97_c11_84cf_return_output,
 tmp16_MUX_uxn_opcodes_h_l97_c7_072e_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l97_c7_072e_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l97_c7_072e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l97_c7_072e_return_output,
 BIN_OP_OR_uxn_opcodes_h_l98_c3_d738_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l100_c22_1d0b_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l100_c32_dd08_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l100_c42_b570_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l100_c42_75ea_return_output,
 MUX_uxn_opcodes_h_l100_c22_d62f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l102_c11_8a85_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l102_c7_76f2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l102_c7_76f2_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_cd4b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_cd4b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_cd4b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l71_c1_c934_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l71_c1_c934_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l71_c1_c934_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l71_c1_c934_iffalse : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_98f7_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_98f7_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l76_c7_f0e6_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_98f7_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_98f7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_98f7_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l73_c3_4eef : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_98f7_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_f0e6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_98f7_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_98f7_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_98f7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_98f7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_f0e6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_98f7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_98f7_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l71_c2_98f7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l71_c2_98f7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_f0e6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l71_c2_98f7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l71_c2_98f7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_98f7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_98f7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_f0e6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_98f7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_98f7_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_98f7_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_98f7_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l76_c7_f0e6_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_98f7_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_98f7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_98f7_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_98f7_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_f0e6_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_98f7_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_98f7_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l71_c2_98f7_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l71_c2_98f7_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l76_c7_f0e6_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l71_c2_98f7_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l71_c2_98f7_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l72_c3_362f_uxn_opcodes_h_l72_c3_362f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_078e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_078e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_078e_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l76_c7_f0e6_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l76_c7_f0e6_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l79_c7_077f_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l76_c7_f0e6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_f0e6_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l77_c3_7749 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_f0e6_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l76_c7_f0e6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_f0e6_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_f0e6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_f0e6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_077f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_f0e6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_f0e6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_f0e6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_077f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_f0e6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_f0e6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_f0e6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_077f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_f0e6_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l76_c7_f0e6_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l76_c7_f0e6_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l79_c7_077f_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l76_c7_f0e6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_f0e6_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_f0e6_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_077f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_f0e6_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l76_c7_f0e6_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l76_c7_f0e6_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l79_c7_077f_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l76_c7_f0e6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l79_c11_790e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l79_c11_790e_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l79_c11_790e_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l79_c7_077f_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l79_c7_077f_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_5d1f_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l79_c7_077f_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_077f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_077f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_5d1f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_077f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_077f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_077f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_5d1f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_077f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_077f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_077f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_5d1f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_077f_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l79_c7_077f_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l79_c7_077f_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_5d1f_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l79_c7_077f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_077f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l82_c3_83c0 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_077f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_077f_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l79_c7_077f_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l79_c7_077f_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l79_c7_077f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_aa2b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_aa2b_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_aa2b_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_5d1f_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_5d1f_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l89_c7_027a_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_5d1f_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_5d1f_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_5d1f_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l89_c7_027a_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_5d1f_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_5d1f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_5d1f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_027a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_5d1f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_5d1f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_5d1f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_5d1f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_5d1f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_5d1f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_027a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_5d1f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l89_c11_2e69_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l89_c11_2e69_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l89_c11_2e69_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l89_c7_027a_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l89_c7_027a_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l94_c7_9007_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l89_c7_027a_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_027a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_027a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_9007_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_027a_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l89_c7_027a_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l92_c3_c314 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l89_c7_027a_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l94_c7_9007_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l89_c7_027a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_027a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_027a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_9007_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_027a_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l91_c3_eb61_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l91_c3_eb61_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l92_c22_0efb_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l92_c22_0efb_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l92_c22_0efb_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l94_c11_8a50_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l94_c11_8a50_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l94_c11_8a50_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l94_c7_9007_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l94_c7_9007_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l97_c7_072e_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l94_c7_9007_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_9007_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_9007_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l97_c7_072e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_9007_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l94_c7_9007_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l95_c3_5fe0 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l94_c7_9007_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l97_c7_072e_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l94_c7_9007_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_9007_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_9007_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l97_c7_072e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_9007_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l95_c22_7e00_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l95_c22_7e00_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l95_c22_7e00_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l97_c11_84cf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l97_c11_84cf_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l97_c11_84cf_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l97_c7_072e_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l97_c7_072e_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l97_c7_072e_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l97_c7_072e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l97_c7_072e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l102_c7_76f2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l97_c7_072e_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l97_c7_072e_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l97_c7_072e_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l97_c7_072e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l97_c7_072e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l97_c7_072e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l102_c7_76f2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l97_c7_072e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l98_c3_d738_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l98_c3_d738_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l98_c3_d738_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l100_c22_d62f_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l100_c22_d62f_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l100_c22_d62f_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l100_c22_1d0b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l100_c22_1d0b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l100_c22_1d0b_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l100_c32_dd08_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l100_c32_dd08_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l100_c32_dd08_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l100_c42_b570_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l100_c42_b570_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l100_c42_b570_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l100_c42_75ea_left : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l100_c42_75ea_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l100_c42_75ea_return_output : unsigned(17 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l100_c22_d62f_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l102_c11_8a85_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l102_c11_8a85_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l102_c11_8a85_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l102_c7_76f2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l102_c7_76f2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l102_c7_76f2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l102_c7_76f2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l102_c7_76f2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l102_c7_76f2_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l76_l102_l71_l94_l89_l85_l79_DUPLICATE_386e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l71_l85_l76_DUPLICATE_a904_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l71_l97_l76_DUPLICATE_fbbd_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l71_l76_l79_DUPLICATE_4e3b_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l76_l102_l97_l94_l89_l85_l79_DUPLICATE_f321_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l98_l90_DUPLICATE_1686_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8040_uxn_opcodes_h_l107_l66_DUPLICATE_7ea0_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_tmp16 : unsigned(15 downto 0);
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_tmp16 := tmp16;
  REG_VAR_t8 := t8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l100_c42_75ea_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l97_c11_84cf_right := to_unsigned(6, 3);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l82_c3_83c0 := resize(to_signed(-1, 2), 4);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_077f_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l82_c3_83c0;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l100_c22_1d0b_right := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l102_c7_76f2_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l79_c11_790e_right := to_unsigned(2, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_5d1f_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_077f_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_cd4b_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l73_c3_4eef := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_98f7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l73_c3_4eef;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l102_c11_8a85_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_078e_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l94_c11_8a50_right := to_unsigned(5, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_98f7_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l77_c3_7749 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_f0e6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l77_c3_7749;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l97_c7_072e_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l89_c11_2e69_right := to_unsigned(4, 3);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l71_c1_c934_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l95_c22_7e00_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_aa2b_right := to_unsigned(3, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l102_c7_76f2_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l92_c22_0efb_right := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l100_c32_dd08_right := to_unsigned(2, 2);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_pc := pc;
     VAR_previous_stack_read := previous_stack_read;
     VAR_previous_ram_read := previous_ram_read;

     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l71_c1_c934_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l100_c32_dd08_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l100_c42_b570_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l92_c22_0efb_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l95_c22_7e00_left := VAR_pc;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l79_c7_077f_iftrue := VAR_pc;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_5d1f_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l102_c11_8a85_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_cd4b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_078e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l79_c11_790e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_aa2b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l89_c11_2e69_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l94_c11_8a50_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l97_c11_84cf_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l79_c7_077f_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l100_c22_1d0b_left := t8;
     VAR_t8_MUX_uxn_opcodes_h_l71_c2_98f7_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l76_c7_f0e6_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l79_c7_077f_iffalse := t8;
     VAR_BIN_OP_OR_uxn_opcodes_h_l98_c3_d738_left := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_98f7_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l76_c7_f0e6_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l79_c7_077f_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_5d1f_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l94_c7_9007_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l97_c7_072e_iffalse := tmp16;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l76_l102_l97_l94_l89_l85_l79_DUPLICATE_f321 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l76_l102_l97_l94_l89_l85_l79_DUPLICATE_f321_return_output := result.is_opc_done;

     -- BIN_OP_PLUS[uxn_opcodes_h_l92_c22_0efb] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l92_c22_0efb_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l92_c22_0efb_left;
     BIN_OP_PLUS_uxn_opcodes_h_l92_c22_0efb_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l92_c22_0efb_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l92_c22_0efb_return_output := BIN_OP_PLUS_uxn_opcodes_h_l92_c22_0efb_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l98_l90_DUPLICATE_1686 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l98_l90_DUPLICATE_1686_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l100_c22_1d0b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l100_c22_1d0b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l100_c22_1d0b_left;
     BIN_OP_EQ_uxn_opcodes_h_l100_c22_1d0b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l100_c22_1d0b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l100_c22_1d0b_return_output := BIN_OP_EQ_uxn_opcodes_h_l100_c22_1d0b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l94_c11_8a50] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l94_c11_8a50_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l94_c11_8a50_left;
     BIN_OP_EQ_uxn_opcodes_h_l94_c11_8a50_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l94_c11_8a50_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l94_c11_8a50_return_output := BIN_OP_EQ_uxn_opcodes_h_l94_c11_8a50_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l76_c7_f0e6] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l76_c7_f0e6_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l102_c11_8a85] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l102_c11_8a85_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l102_c11_8a85_left;
     BIN_OP_EQ_uxn_opcodes_h_l102_c11_8a85_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l102_c11_8a85_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l102_c11_8a85_return_output := BIN_OP_EQ_uxn_opcodes_h_l102_c11_8a85_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l71_l97_l76_DUPLICATE_fbbd LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l71_l97_l76_DUPLICATE_fbbd_return_output := result.u16_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l76_l102_l71_l94_l89_l85_l79_DUPLICATE_386e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l76_l102_l71_l94_l89_l85_l79_DUPLICATE_386e_return_output := result.is_pc_updated;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l71_l76_l79_DUPLICATE_4e3b LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l71_l76_l79_DUPLICATE_4e3b_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l71_l85_l76_DUPLICATE_a904 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l71_l85_l76_DUPLICATE_a904_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l76_c11_078e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l76_c11_078e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_078e_left;
     BIN_OP_EQ_uxn_opcodes_h_l76_c11_078e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_078e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_078e_return_output := BIN_OP_EQ_uxn_opcodes_h_l76_c11_078e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l85_c11_aa2b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l85_c11_aa2b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_aa2b_left;
     BIN_OP_EQ_uxn_opcodes_h_l85_c11_aa2b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_aa2b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_aa2b_return_output := BIN_OP_EQ_uxn_opcodes_h_l85_c11_aa2b_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l100_c32_dd08] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l100_c32_dd08_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l100_c32_dd08_left;
     BIN_OP_PLUS_uxn_opcodes_h_l100_c32_dd08_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l100_c32_dd08_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l100_c32_dd08_return_output := BIN_OP_PLUS_uxn_opcodes_h_l100_c32_dd08_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l71_c6_cd4b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l71_c6_cd4b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_cd4b_left;
     BIN_OP_EQ_uxn_opcodes_h_l71_c6_cd4b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_cd4b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_cd4b_return_output := BIN_OP_EQ_uxn_opcodes_h_l71_c6_cd4b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l79_c11_790e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l79_c11_790e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l79_c11_790e_left;
     BIN_OP_EQ_uxn_opcodes_h_l79_c11_790e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l79_c11_790e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l79_c11_790e_return_output := BIN_OP_EQ_uxn_opcodes_h_l79_c11_790e_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l95_c22_7e00] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l95_c22_7e00_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l95_c22_7e00_left;
     BIN_OP_PLUS_uxn_opcodes_h_l95_c22_7e00_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l95_c22_7e00_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l95_c22_7e00_return_output := BIN_OP_PLUS_uxn_opcodes_h_l95_c22_7e00_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l89_c11_2e69] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l89_c11_2e69_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l89_c11_2e69_left;
     BIN_OP_EQ_uxn_opcodes_h_l89_c11_2e69_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l89_c11_2e69_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l89_c11_2e69_return_output := BIN_OP_EQ_uxn_opcodes_h_l89_c11_2e69_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l97_c11_84cf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l97_c11_84cf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l97_c11_84cf_left;
     BIN_OP_EQ_uxn_opcodes_h_l97_c11_84cf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l97_c11_84cf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l97_c11_84cf_return_output := BIN_OP_EQ_uxn_opcodes_h_l97_c11_84cf_return_output;

     -- Submodule level 1
     VAR_MUX_uxn_opcodes_h_l100_c22_d62f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l100_c22_1d0b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l102_c7_76f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l102_c11_8a85_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l102_c7_76f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l102_c11_8a85_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l71_c1_c934_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_cd4b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_98f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_cd4b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_98f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_cd4b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l71_c2_98f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_cd4b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_98f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_cd4b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_98f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_cd4b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_98f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_cd4b_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l71_c2_98f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_cd4b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_98f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_cd4b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_f0e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_078e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_f0e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_078e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_f0e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_078e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_f0e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_078e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_f0e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_078e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l76_c7_f0e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_078e_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l76_c7_f0e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_078e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l76_c7_f0e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_078e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_077f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l79_c11_790e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_077f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l79_c11_790e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_077f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l79_c11_790e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_077f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l79_c11_790e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l79_c7_077f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l79_c11_790e_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l79_c7_077f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l79_c11_790e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l79_c7_077f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l79_c11_790e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_5d1f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_aa2b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_5d1f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_aa2b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_5d1f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_aa2b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_5d1f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_aa2b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_5d1f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_aa2b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_027a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l89_c11_2e69_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_027a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l89_c11_2e69_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l89_c7_027a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l89_c11_2e69_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l89_c7_027a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l89_c11_2e69_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_9007_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l94_c11_8a50_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_9007_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l94_c11_8a50_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l94_c7_9007_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l94_c11_8a50_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l94_c7_9007_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l94_c11_8a50_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l97_c7_072e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l97_c11_84cf_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l97_c7_072e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l97_c11_84cf_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l97_c7_072e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l97_c11_84cf_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l97_c7_072e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l97_c11_84cf_return_output;
     VAR_MUX_uxn_opcodes_h_l100_c22_d62f_iftrue := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l100_c32_dd08_return_output, 16);
     VAR_result_u16_value_uxn_opcodes_h_l92_c3_c314 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l92_c22_0efb_return_output, 16);
     VAR_result_u16_value_uxn_opcodes_h_l95_c3_5fe0 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l95_c22_7e00_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l98_c3_d738_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l98_l90_DUPLICATE_1686_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l91_c3_eb61_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l98_l90_DUPLICATE_1686_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_98f7_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l71_l76_l79_DUPLICATE_4e3b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_f0e6_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l71_l76_l79_DUPLICATE_4e3b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_077f_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l71_l76_l79_DUPLICATE_4e3b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_98f7_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l71_l97_l76_DUPLICATE_fbbd_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l76_c7_f0e6_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l71_l97_l76_DUPLICATE_fbbd_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l97_c7_072e_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l71_l97_l76_DUPLICATE_fbbd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l102_c7_76f2_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l76_l102_l97_l94_l89_l85_l79_DUPLICATE_f321_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_f0e6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l76_l102_l97_l94_l89_l85_l79_DUPLICATE_f321_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_077f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l76_l102_l97_l94_l89_l85_l79_DUPLICATE_f321_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_5d1f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l76_l102_l97_l94_l89_l85_l79_DUPLICATE_f321_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_027a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l76_l102_l97_l94_l89_l85_l79_DUPLICATE_f321_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_9007_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l76_l102_l97_l94_l89_l85_l79_DUPLICATE_f321_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l97_c7_072e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l76_l102_l97_l94_l89_l85_l79_DUPLICATE_f321_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l102_c7_76f2_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l76_l102_l71_l94_l89_l85_l79_DUPLICATE_386e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_98f7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l76_l102_l71_l94_l89_l85_l79_DUPLICATE_386e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_f0e6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l76_l102_l71_l94_l89_l85_l79_DUPLICATE_386e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_077f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l76_l102_l71_l94_l89_l85_l79_DUPLICATE_386e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_5d1f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l76_l102_l71_l94_l89_l85_l79_DUPLICATE_386e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_027a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l76_l102_l71_l94_l89_l85_l79_DUPLICATE_386e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_9007_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l76_l102_l71_l94_l89_l85_l79_DUPLICATE_386e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l71_c2_98f7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l71_l85_l76_DUPLICATE_a904_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_f0e6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l71_l85_l76_DUPLICATE_a904_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_5d1f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l71_l85_l76_DUPLICATE_a904_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_f0e6_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l76_c7_f0e6_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l89_c7_027a_iftrue := VAR_result_u16_value_uxn_opcodes_h_l92_c3_c314;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l94_c7_9007_iftrue := VAR_result_u16_value_uxn_opcodes_h_l95_c3_5fe0;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l102_c7_76f2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l102_c7_76f2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l102_c7_76f2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l102_c7_76f2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l102_c7_76f2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l102_c7_76f2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l102_c7_76f2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l102_c7_76f2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l102_c7_76f2_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l71_c1_c934] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l71_c1_c934_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l71_c1_c934_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l71_c1_c934_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l71_c1_c934_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l71_c1_c934_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l71_c1_c934_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l71_c1_c934_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l71_c1_c934_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l91_c3_eb61] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l91_c3_eb61_x <= VAR_CONST_SL_8_uxn_opcodes_h_l91_c3_eb61_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l91_c3_eb61_return_output := CONST_SL_8_uxn_opcodes_h_l91_c3_eb61_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l76_c7_f0e6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_f0e6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_f0e6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_f0e6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_f0e6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_f0e6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_f0e6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_f0e6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_f0e6_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l98_c3_d738] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l98_c3_d738_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l98_c3_d738_left;
     BIN_OP_OR_uxn_opcodes_h_l98_c3_d738_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l98_c3_d738_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l98_c3_d738_return_output := BIN_OP_OR_uxn_opcodes_h_l98_c3_d738_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l85_c7_5d1f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_5d1f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_5d1f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_5d1f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_5d1f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_5d1f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_5d1f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_5d1f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_5d1f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l79_c7_077f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_077f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_077f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_077f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_077f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_077f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_077f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_077f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_077f_return_output;

     -- t8_MUX[uxn_opcodes_h_l79_c7_077f] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l79_c7_077f_cond <= VAR_t8_MUX_uxn_opcodes_h_l79_c7_077f_cond;
     t8_MUX_uxn_opcodes_h_l79_c7_077f_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l79_c7_077f_iftrue;
     t8_MUX_uxn_opcodes_h_l79_c7_077f_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l79_c7_077f_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l79_c7_077f_return_output := t8_MUX_uxn_opcodes_h_l79_c7_077f_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l102_c7_76f2] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l102_c7_76f2_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l102_c7_76f2_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l102_c7_76f2_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l102_c7_76f2_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l102_c7_76f2_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l102_c7_76f2_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l102_c7_76f2_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l102_c7_76f2_return_output;

     -- Submodule level 2
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l100_c42_b570_right := VAR_BIN_OP_OR_uxn_opcodes_h_l98_c3_d738_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l97_c7_072e_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l98_c3_d738_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l89_c7_027a_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l91_c3_eb61_return_output;
     VAR_printf_uxn_opcodes_h_l72_c3_362f_uxn_opcodes_h_l72_c3_362f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l71_c1_c934_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l97_c7_072e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l102_c7_76f2_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l97_c7_072e_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l102_c7_76f2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_077f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_5d1f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_f0e6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_077f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_98f7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_f0e6_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l76_c7_f0e6_iffalse := VAR_t8_MUX_uxn_opcodes_h_l79_c7_077f_return_output;
     -- BIN_OP_PLUS[uxn_opcodes_h_l100_c42_b570] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l100_c42_b570_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l100_c42_b570_left;
     BIN_OP_PLUS_uxn_opcodes_h_l100_c42_b570_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l100_c42_b570_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l100_c42_b570_return_output := BIN_OP_PLUS_uxn_opcodes_h_l100_c42_b570_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l76_c7_f0e6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_f0e6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_f0e6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_f0e6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_f0e6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_f0e6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_f0e6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_f0e6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_f0e6_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l79_c7_077f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_077f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_077f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_077f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_077f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_077f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_077f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_077f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_077f_return_output;

     -- t8_MUX[uxn_opcodes_h_l76_c7_f0e6] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l76_c7_f0e6_cond <= VAR_t8_MUX_uxn_opcodes_h_l76_c7_f0e6_cond;
     t8_MUX_uxn_opcodes_h_l76_c7_f0e6_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l76_c7_f0e6_iftrue;
     t8_MUX_uxn_opcodes_h_l76_c7_f0e6_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l76_c7_f0e6_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l76_c7_f0e6_return_output := t8_MUX_uxn_opcodes_h_l76_c7_f0e6_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l97_c7_072e] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l97_c7_072e_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l97_c7_072e_cond;
     tmp16_MUX_uxn_opcodes_h_l97_c7_072e_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l97_c7_072e_iftrue;
     tmp16_MUX_uxn_opcodes_h_l97_c7_072e_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l97_c7_072e_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l97_c7_072e_return_output := tmp16_MUX_uxn_opcodes_h_l97_c7_072e_return_output;

     -- printf_uxn_opcodes_h_l72_c3_362f[uxn_opcodes_h_l72_c3_362f] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l72_c3_362f_uxn_opcodes_h_l72_c3_362f_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l72_c3_362f_uxn_opcodes_h_l72_c3_362f_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l97_c7_072e] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l97_c7_072e_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l97_c7_072e_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l97_c7_072e_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l97_c7_072e_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l97_c7_072e_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l97_c7_072e_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l97_c7_072e_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l97_c7_072e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l97_c7_072e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l97_c7_072e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l97_c7_072e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l97_c7_072e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l97_c7_072e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l97_c7_072e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l97_c7_072e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l97_c7_072e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l97_c7_072e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l71_c2_98f7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_98f7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_98f7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_98f7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_98f7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_98f7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_98f7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_98f7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_98f7_return_output;

     -- Submodule level 3
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l100_c42_75ea_left := VAR_BIN_OP_PLUS_uxn_opcodes_h_l100_c42_b570_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_9007_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l97_c7_072e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_9007_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l97_c7_072e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_f0e6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_077f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_98f7_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_f0e6_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l71_c2_98f7_iffalse := VAR_t8_MUX_uxn_opcodes_h_l76_c7_f0e6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l94_c7_9007_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l97_c7_072e_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l94_c7_9007] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l94_c7_9007_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l94_c7_9007_cond;
     tmp16_MUX_uxn_opcodes_h_l94_c7_9007_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l94_c7_9007_iftrue;
     tmp16_MUX_uxn_opcodes_h_l94_c7_9007_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l94_c7_9007_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l94_c7_9007_return_output := tmp16_MUX_uxn_opcodes_h_l94_c7_9007_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l71_c2_98f7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_98f7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_98f7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_98f7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_98f7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_98f7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_98f7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_98f7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_98f7_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l76_c7_f0e6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_f0e6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_f0e6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_f0e6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_f0e6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_f0e6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_f0e6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_f0e6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_f0e6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l94_c7_9007] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_9007_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_9007_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_9007_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_9007_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_9007_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_9007_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_9007_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_9007_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l94_c7_9007] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_9007_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_9007_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_9007_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_9007_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_9007_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_9007_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_9007_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_9007_return_output;

     -- t8_MUX[uxn_opcodes_h_l71_c2_98f7] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l71_c2_98f7_cond <= VAR_t8_MUX_uxn_opcodes_h_l71_c2_98f7_cond;
     t8_MUX_uxn_opcodes_h_l71_c2_98f7_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l71_c2_98f7_iftrue;
     t8_MUX_uxn_opcodes_h_l71_c2_98f7_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l71_c2_98f7_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l71_c2_98f7_return_output := t8_MUX_uxn_opcodes_h_l71_c2_98f7_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l100_c42_75ea] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l100_c42_75ea_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l100_c42_75ea_left;
     BIN_OP_PLUS_uxn_opcodes_h_l100_c42_75ea_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l100_c42_75ea_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l100_c42_75ea_return_output := BIN_OP_PLUS_uxn_opcodes_h_l100_c42_75ea_return_output;

     -- Submodule level 4
     VAR_MUX_uxn_opcodes_h_l100_c22_d62f_iffalse := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l100_c42_75ea_return_output, 16);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_027a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_9007_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_027a_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_9007_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l71_c2_98f7_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_f0e6_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l71_c2_98f7_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l89_c7_027a_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l94_c7_9007_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l89_c7_027a] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_027a_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_027a_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_027a_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_027a_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_027a_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_027a_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_027a_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_027a_return_output;

     -- MUX[uxn_opcodes_h_l100_c22_d62f] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l100_c22_d62f_cond <= VAR_MUX_uxn_opcodes_h_l100_c22_d62f_cond;
     MUX_uxn_opcodes_h_l100_c22_d62f_iftrue <= VAR_MUX_uxn_opcodes_h_l100_c22_d62f_iftrue;
     MUX_uxn_opcodes_h_l100_c22_d62f_iffalse <= VAR_MUX_uxn_opcodes_h_l100_c22_d62f_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l100_c22_d62f_return_output := MUX_uxn_opcodes_h_l100_c22_d62f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l71_c2_98f7] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l71_c2_98f7_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l71_c2_98f7_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l71_c2_98f7_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l71_c2_98f7_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l71_c2_98f7_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l71_c2_98f7_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l71_c2_98f7_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l71_c2_98f7_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l89_c7_027a] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l89_c7_027a_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l89_c7_027a_cond;
     tmp16_MUX_uxn_opcodes_h_l89_c7_027a_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l89_c7_027a_iftrue;
     tmp16_MUX_uxn_opcodes_h_l89_c7_027a_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l89_c7_027a_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l89_c7_027a_return_output := tmp16_MUX_uxn_opcodes_h_l89_c7_027a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l89_c7_027a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_027a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_027a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_027a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_027a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_027a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_027a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_027a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_027a_return_output;

     -- Submodule level 5
     VAR_result_u16_value_MUX_uxn_opcodes_h_l97_c7_072e_iftrue := VAR_MUX_uxn_opcodes_h_l100_c22_d62f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_5d1f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_027a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_5d1f_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_027a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_5d1f_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l89_c7_027a_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l85_c7_5d1f] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l85_c7_5d1f_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_5d1f_cond;
     tmp16_MUX_uxn_opcodes_h_l85_c7_5d1f_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_5d1f_iftrue;
     tmp16_MUX_uxn_opcodes_h_l85_c7_5d1f_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_5d1f_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_5d1f_return_output := tmp16_MUX_uxn_opcodes_h_l85_c7_5d1f_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l85_c7_5d1f] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_5d1f_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_5d1f_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_5d1f_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_5d1f_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_5d1f_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_5d1f_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_5d1f_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_5d1f_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l97_c7_072e] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l97_c7_072e_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l97_c7_072e_cond;
     result_u16_value_MUX_uxn_opcodes_h_l97_c7_072e_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l97_c7_072e_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l97_c7_072e_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l97_c7_072e_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l97_c7_072e_return_output := result_u16_value_MUX_uxn_opcodes_h_l97_c7_072e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l85_c7_5d1f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_5d1f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_5d1f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_5d1f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_5d1f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_5d1f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_5d1f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_5d1f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_5d1f_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_077f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_5d1f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_077f_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_5d1f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l94_c7_9007_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l97_c7_072e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l79_c7_077f_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_5d1f_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l94_c7_9007] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l94_c7_9007_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l94_c7_9007_cond;
     result_u16_value_MUX_uxn_opcodes_h_l94_c7_9007_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l94_c7_9007_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l94_c7_9007_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l94_c7_9007_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l94_c7_9007_return_output := result_u16_value_MUX_uxn_opcodes_h_l94_c7_9007_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l79_c7_077f] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l79_c7_077f_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l79_c7_077f_cond;
     tmp16_MUX_uxn_opcodes_h_l79_c7_077f_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l79_c7_077f_iftrue;
     tmp16_MUX_uxn_opcodes_h_l79_c7_077f_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l79_c7_077f_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l79_c7_077f_return_output := tmp16_MUX_uxn_opcodes_h_l79_c7_077f_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l79_c7_077f] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_077f_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_077f_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_077f_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_077f_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_077f_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_077f_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_077f_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_077f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l79_c7_077f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_077f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_077f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_077f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_077f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_077f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_077f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_077f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_077f_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_f0e6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_077f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_f0e6_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_077f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l89_c7_027a_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l94_c7_9007_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l76_c7_f0e6_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l79_c7_077f_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l76_c7_f0e6] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_f0e6_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_f0e6_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_f0e6_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_f0e6_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_f0e6_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_f0e6_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_f0e6_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_f0e6_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l76_c7_f0e6] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l76_c7_f0e6_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l76_c7_f0e6_cond;
     tmp16_MUX_uxn_opcodes_h_l76_c7_f0e6_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l76_c7_f0e6_iftrue;
     tmp16_MUX_uxn_opcodes_h_l76_c7_f0e6_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l76_c7_f0e6_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l76_c7_f0e6_return_output := tmp16_MUX_uxn_opcodes_h_l76_c7_f0e6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l76_c7_f0e6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_f0e6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_f0e6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_f0e6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_f0e6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_f0e6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_f0e6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_f0e6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_f0e6_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l89_c7_027a] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l89_c7_027a_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l89_c7_027a_cond;
     result_u16_value_MUX_uxn_opcodes_h_l89_c7_027a_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l89_c7_027a_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l89_c7_027a_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l89_c7_027a_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l89_c7_027a_return_output := result_u16_value_MUX_uxn_opcodes_h_l89_c7_027a_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_98f7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_f0e6_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_98f7_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_f0e6_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_5d1f_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l89_c7_027a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_98f7_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l76_c7_f0e6_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l71_c2_98f7] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l71_c2_98f7_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_98f7_cond;
     tmp16_MUX_uxn_opcodes_h_l71_c2_98f7_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_98f7_iftrue;
     tmp16_MUX_uxn_opcodes_h_l71_c2_98f7_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_98f7_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_98f7_return_output := tmp16_MUX_uxn_opcodes_h_l71_c2_98f7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l71_c2_98f7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_98f7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_98f7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_98f7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_98f7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_98f7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_98f7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_98f7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_98f7_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l85_c7_5d1f] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l85_c7_5d1f_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_5d1f_cond;
     result_u16_value_MUX_uxn_opcodes_h_l85_c7_5d1f_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_5d1f_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l85_c7_5d1f_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_5d1f_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_5d1f_return_output := result_u16_value_MUX_uxn_opcodes_h_l85_c7_5d1f_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l71_c2_98f7] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_98f7_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_98f7_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_98f7_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_98f7_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_98f7_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_98f7_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_98f7_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_98f7_return_output;

     -- Submodule level 9
     VAR_result_u16_value_MUX_uxn_opcodes_h_l79_c7_077f_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_5d1f_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_98f7_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l79_c7_077f] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l79_c7_077f_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l79_c7_077f_cond;
     result_u16_value_MUX_uxn_opcodes_h_l79_c7_077f_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l79_c7_077f_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l79_c7_077f_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l79_c7_077f_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l79_c7_077f_return_output := result_u16_value_MUX_uxn_opcodes_h_l79_c7_077f_return_output;

     -- Submodule level 10
     VAR_result_u16_value_MUX_uxn_opcodes_h_l76_c7_f0e6_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l79_c7_077f_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l76_c7_f0e6] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l76_c7_f0e6_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l76_c7_f0e6_cond;
     result_u16_value_MUX_uxn_opcodes_h_l76_c7_f0e6_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l76_c7_f0e6_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l76_c7_f0e6_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l76_c7_f0e6_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l76_c7_f0e6_return_output := result_u16_value_MUX_uxn_opcodes_h_l76_c7_f0e6_return_output;

     -- Submodule level 11
     VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_98f7_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l76_c7_f0e6_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l71_c2_98f7] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l71_c2_98f7_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_98f7_cond;
     result_u16_value_MUX_uxn_opcodes_h_l71_c2_98f7_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_98f7_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l71_c2_98f7_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_98f7_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_98f7_return_output := result_u16_value_MUX_uxn_opcodes_h_l71_c2_98f7_return_output;

     -- Submodule level 12
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_8040_uxn_opcodes_h_l107_l66_DUPLICATE_7ea0 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8040_uxn_opcodes_h_l107_l66_DUPLICATE_7ea0_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_8040(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_98f7_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_98f7_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l71_c2_98f7_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_98f7_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_98f7_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_98f7_return_output);

     -- Submodule level 13
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8040_uxn_opcodes_h_l107_l66_DUPLICATE_7ea0_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8040_uxn_opcodes_h_l107_l66_DUPLICATE_7ea0_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_tmp16 <= REG_VAR_tmp16;
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     tmp16 <= REG_COMB_tmp16;
     t8 <= REG_COMB_t8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
