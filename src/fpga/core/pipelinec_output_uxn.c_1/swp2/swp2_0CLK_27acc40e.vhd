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
-- Submodules: 111
entity swp2_0CLK_27acc40e is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end swp2_0CLK_27acc40e;
architecture arch of swp2_0CLK_27acc40e is
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
-- BIN_OP_EQ[uxn_opcodes_h_l2755_c6_f267]
signal BIN_OP_EQ_uxn_opcodes_h_l2755_c6_f267_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2755_c6_f267_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2755_c6_f267_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2755_c1_ed18]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_ed18_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_ed18_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_ed18_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_ed18_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2755_c2_e1ef]
signal t16_MUX_uxn_opcodes_h_l2755_c2_e1ef_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2755_c2_e1ef_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2755_c2_e1ef_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2755_c2_e1ef_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2755_c2_e1ef]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c2_e1ef_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c2_e1ef_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c2_e1ef_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c2_e1ef_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2755_c2_e1ef]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2755_c2_e1ef_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2755_c2_e1ef_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2755_c2_e1ef_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2755_c2_e1ef_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2755_c2_e1ef]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2755_c2_e1ef_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2755_c2_e1ef_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2755_c2_e1ef_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2755_c2_e1ef_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2755_c2_e1ef]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2755_c2_e1ef_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2755_c2_e1ef_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2755_c2_e1ef_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2755_c2_e1ef_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2755_c2_e1ef]
signal result_u8_value_MUX_uxn_opcodes_h_l2755_c2_e1ef_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2755_c2_e1ef_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2755_c2_e1ef_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2755_c2_e1ef_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2755_c2_e1ef]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2755_c2_e1ef_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2755_c2_e1ef_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2755_c2_e1ef_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2755_c2_e1ef_return_output : signed(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l2755_c2_e1ef]
signal n16_MUX_uxn_opcodes_h_l2755_c2_e1ef_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2755_c2_e1ef_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2755_c2_e1ef_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2755_c2_e1ef_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l2756_c3_e6b8[uxn_opcodes_h_l2756_c3_e6b8]
signal printf_uxn_opcodes_h_l2756_c3_e6b8_uxn_opcodes_h_l2756_c3_e6b8_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2760_c11_4f83]
signal BIN_OP_EQ_uxn_opcodes_h_l2760_c11_4f83_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2760_c11_4f83_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2760_c11_4f83_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2760_c7_bff8]
signal t16_MUX_uxn_opcodes_h_l2760_c7_bff8_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2760_c7_bff8_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2760_c7_bff8_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2760_c7_bff8_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2760_c7_bff8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2760_c7_bff8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2760_c7_bff8_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2760_c7_bff8_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2760_c7_bff8_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2760_c7_bff8]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2760_c7_bff8_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2760_c7_bff8_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2760_c7_bff8_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2760_c7_bff8_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2760_c7_bff8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2760_c7_bff8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2760_c7_bff8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2760_c7_bff8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2760_c7_bff8_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2760_c7_bff8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2760_c7_bff8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2760_c7_bff8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2760_c7_bff8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2760_c7_bff8_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2760_c7_bff8]
signal result_u8_value_MUX_uxn_opcodes_h_l2760_c7_bff8_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2760_c7_bff8_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2760_c7_bff8_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2760_c7_bff8_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2760_c7_bff8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2760_c7_bff8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2760_c7_bff8_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2760_c7_bff8_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2760_c7_bff8_return_output : signed(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l2760_c7_bff8]
signal n16_MUX_uxn_opcodes_h_l2760_c7_bff8_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2760_c7_bff8_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2760_c7_bff8_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2760_c7_bff8_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2763_c11_64e7]
signal BIN_OP_EQ_uxn_opcodes_h_l2763_c11_64e7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2763_c11_64e7_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2763_c11_64e7_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2763_c7_90ce]
signal t16_MUX_uxn_opcodes_h_l2763_c7_90ce_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2763_c7_90ce_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2763_c7_90ce_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2763_c7_90ce_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2763_c7_90ce]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2763_c7_90ce_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2763_c7_90ce_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2763_c7_90ce_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2763_c7_90ce_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2763_c7_90ce]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2763_c7_90ce_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2763_c7_90ce_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2763_c7_90ce_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2763_c7_90ce_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2763_c7_90ce]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2763_c7_90ce_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2763_c7_90ce_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2763_c7_90ce_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2763_c7_90ce_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2763_c7_90ce]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2763_c7_90ce_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2763_c7_90ce_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2763_c7_90ce_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2763_c7_90ce_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2763_c7_90ce]
signal result_u8_value_MUX_uxn_opcodes_h_l2763_c7_90ce_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2763_c7_90ce_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2763_c7_90ce_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2763_c7_90ce_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2763_c7_90ce]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2763_c7_90ce_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2763_c7_90ce_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2763_c7_90ce_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2763_c7_90ce_return_output : signed(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l2763_c7_90ce]
signal n16_MUX_uxn_opcodes_h_l2763_c7_90ce_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2763_c7_90ce_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2763_c7_90ce_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2763_c7_90ce_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2768_c11_5f51]
signal BIN_OP_EQ_uxn_opcodes_h_l2768_c11_5f51_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2768_c11_5f51_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2768_c11_5f51_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2768_c7_9615]
signal t16_MUX_uxn_opcodes_h_l2768_c7_9615_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2768_c7_9615_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2768_c7_9615_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2768_c7_9615_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2768_c7_9615]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2768_c7_9615_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2768_c7_9615_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2768_c7_9615_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2768_c7_9615_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2768_c7_9615]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2768_c7_9615_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2768_c7_9615_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2768_c7_9615_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2768_c7_9615_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2768_c7_9615]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2768_c7_9615_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2768_c7_9615_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2768_c7_9615_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2768_c7_9615_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2768_c7_9615]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2768_c7_9615_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2768_c7_9615_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2768_c7_9615_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2768_c7_9615_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2768_c7_9615]
signal result_u8_value_MUX_uxn_opcodes_h_l2768_c7_9615_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2768_c7_9615_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2768_c7_9615_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2768_c7_9615_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2768_c7_9615]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2768_c7_9615_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2768_c7_9615_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2768_c7_9615_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2768_c7_9615_return_output : signed(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l2768_c7_9615]
signal n16_MUX_uxn_opcodes_h_l2768_c7_9615_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2768_c7_9615_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2768_c7_9615_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2768_c7_9615_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2771_c11_0058]
signal BIN_OP_EQ_uxn_opcodes_h_l2771_c11_0058_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2771_c11_0058_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2771_c11_0058_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2771_c7_4f8f]
signal t16_MUX_uxn_opcodes_h_l2771_c7_4f8f_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2771_c7_4f8f_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2771_c7_4f8f_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2771_c7_4f8f_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2771_c7_4f8f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2771_c7_4f8f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2771_c7_4f8f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2771_c7_4f8f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2771_c7_4f8f_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2771_c7_4f8f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2771_c7_4f8f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2771_c7_4f8f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2771_c7_4f8f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2771_c7_4f8f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2771_c7_4f8f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2771_c7_4f8f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2771_c7_4f8f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2771_c7_4f8f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2771_c7_4f8f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2771_c7_4f8f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2771_c7_4f8f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2771_c7_4f8f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2771_c7_4f8f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2771_c7_4f8f_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2771_c7_4f8f]
signal result_u8_value_MUX_uxn_opcodes_h_l2771_c7_4f8f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2771_c7_4f8f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2771_c7_4f8f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2771_c7_4f8f_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2771_c7_4f8f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2771_c7_4f8f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2771_c7_4f8f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2771_c7_4f8f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2771_c7_4f8f_return_output : signed(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l2771_c7_4f8f]
signal n16_MUX_uxn_opcodes_h_l2771_c7_4f8f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2771_c7_4f8f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2771_c7_4f8f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2771_c7_4f8f_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2772_c3_e6d2]
signal BIN_OP_OR_uxn_opcodes_h_l2772_c3_e6d2_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2772_c3_e6d2_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2772_c3_e6d2_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2775_c11_275a]
signal BIN_OP_EQ_uxn_opcodes_h_l2775_c11_275a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2775_c11_275a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2775_c11_275a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2775_c7_5e03]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2775_c7_5e03_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2775_c7_5e03_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2775_c7_5e03_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2775_c7_5e03_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2775_c7_5e03]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2775_c7_5e03_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2775_c7_5e03_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2775_c7_5e03_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2775_c7_5e03_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2775_c7_5e03]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2775_c7_5e03_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2775_c7_5e03_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2775_c7_5e03_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2775_c7_5e03_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2775_c7_5e03]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2775_c7_5e03_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2775_c7_5e03_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2775_c7_5e03_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2775_c7_5e03_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2775_c7_5e03]
signal result_u8_value_MUX_uxn_opcodes_h_l2775_c7_5e03_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2775_c7_5e03_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2775_c7_5e03_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2775_c7_5e03_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2775_c7_5e03]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2775_c7_5e03_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2775_c7_5e03_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2775_c7_5e03_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2775_c7_5e03_return_output : signed(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l2775_c7_5e03]
signal n16_MUX_uxn_opcodes_h_l2775_c7_5e03_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2775_c7_5e03_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2775_c7_5e03_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2775_c7_5e03_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2778_c11_9097]
signal BIN_OP_EQ_uxn_opcodes_h_l2778_c11_9097_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2778_c11_9097_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2778_c11_9097_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2778_c7_4b85]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2778_c7_4b85_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2778_c7_4b85_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2778_c7_4b85_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2778_c7_4b85_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2778_c7_4b85]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2778_c7_4b85_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2778_c7_4b85_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2778_c7_4b85_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2778_c7_4b85_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2778_c7_4b85]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2778_c7_4b85_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2778_c7_4b85_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2778_c7_4b85_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2778_c7_4b85_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2778_c7_4b85]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2778_c7_4b85_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2778_c7_4b85_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2778_c7_4b85_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2778_c7_4b85_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2778_c7_4b85]
signal result_u8_value_MUX_uxn_opcodes_h_l2778_c7_4b85_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2778_c7_4b85_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2778_c7_4b85_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2778_c7_4b85_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2778_c7_4b85]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2778_c7_4b85_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2778_c7_4b85_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2778_c7_4b85_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2778_c7_4b85_return_output : signed(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l2778_c7_4b85]
signal n16_MUX_uxn_opcodes_h_l2778_c7_4b85_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2778_c7_4b85_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2778_c7_4b85_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2778_c7_4b85_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2783_c11_912c]
signal BIN_OP_EQ_uxn_opcodes_h_l2783_c11_912c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2783_c11_912c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2783_c11_912c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2783_c7_712c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2783_c7_712c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2783_c7_712c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2783_c7_712c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2783_c7_712c_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2783_c7_712c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2783_c7_712c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2783_c7_712c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2783_c7_712c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2783_c7_712c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2783_c7_712c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2783_c7_712c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2783_c7_712c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2783_c7_712c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2783_c7_712c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2783_c7_712c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2783_c7_712c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2783_c7_712c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2783_c7_712c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2783_c7_712c_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2783_c7_712c]
signal result_u8_value_MUX_uxn_opcodes_h_l2783_c7_712c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2783_c7_712c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2783_c7_712c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2783_c7_712c_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2783_c7_712c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2783_c7_712c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2783_c7_712c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2783_c7_712c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2783_c7_712c_return_output : signed(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l2783_c7_712c]
signal n16_MUX_uxn_opcodes_h_l2783_c7_712c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2783_c7_712c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2783_c7_712c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2783_c7_712c_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2786_c11_ae2a]
signal BIN_OP_EQ_uxn_opcodes_h_l2786_c11_ae2a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2786_c11_ae2a_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2786_c11_ae2a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2786_c7_d992]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2786_c7_d992_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2786_c7_d992_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2786_c7_d992_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2786_c7_d992_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2786_c7_d992]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2786_c7_d992_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2786_c7_d992_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2786_c7_d992_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2786_c7_d992_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2786_c7_d992]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2786_c7_d992_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2786_c7_d992_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2786_c7_d992_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2786_c7_d992_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2786_c7_d992]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2786_c7_d992_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2786_c7_d992_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2786_c7_d992_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2786_c7_d992_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2786_c7_d992]
signal result_u8_value_MUX_uxn_opcodes_h_l2786_c7_d992_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2786_c7_d992_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2786_c7_d992_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2786_c7_d992_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2786_c7_d992]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2786_c7_d992_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2786_c7_d992_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2786_c7_d992_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2786_c7_d992_return_output : signed(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l2786_c7_d992]
signal n16_MUX_uxn_opcodes_h_l2786_c7_d992_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2786_c7_d992_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2786_c7_d992_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2786_c7_d992_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2787_c3_1bf2]
signal BIN_OP_OR_uxn_opcodes_h_l2787_c3_1bf2_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2787_c3_1bf2_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2787_c3_1bf2_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2789_c30_2eb6]
signal sp_relative_shift_uxn_opcodes_h_l2789_c30_2eb6_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2789_c30_2eb6_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2789_c30_2eb6_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2789_c30_2eb6_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2794_c11_42c6]
signal BIN_OP_EQ_uxn_opcodes_h_l2794_c11_42c6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2794_c11_42c6_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2794_c11_42c6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2794_c7_3103]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_3103_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_3103_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_3103_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_3103_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2794_c7_3103]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_3103_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_3103_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_3103_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_3103_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2794_c7_3103]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_3103_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_3103_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_3103_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_3103_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2794_c7_3103]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_3103_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_3103_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_3103_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_3103_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2794_c7_3103]
signal result_u8_value_MUX_uxn_opcodes_h_l2794_c7_3103_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2794_c7_3103_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2794_c7_3103_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2794_c7_3103_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2797_c31_3240]
signal CONST_SR_8_uxn_opcodes_h_l2797_c31_3240_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2797_c31_3240_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2799_c11_00ce]
signal BIN_OP_EQ_uxn_opcodes_h_l2799_c11_00ce_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2799_c11_00ce_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2799_c11_00ce_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2799_c7_4214]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2799_c7_4214_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2799_c7_4214_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2799_c7_4214_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2799_c7_4214_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2799_c7_4214]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2799_c7_4214_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2799_c7_4214_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2799_c7_4214_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2799_c7_4214_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2799_c7_4214]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2799_c7_4214_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2799_c7_4214_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2799_c7_4214_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2799_c7_4214_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2799_c7_4214]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2799_c7_4214_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2799_c7_4214_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2799_c7_4214_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2799_c7_4214_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2799_c7_4214]
signal result_u8_value_MUX_uxn_opcodes_h_l2799_c7_4214_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2799_c7_4214_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2799_c7_4214_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2799_c7_4214_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2804_c11_aba0]
signal BIN_OP_EQ_uxn_opcodes_h_l2804_c11_aba0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2804_c11_aba0_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2804_c11_aba0_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2804_c7_a92f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2804_c7_a92f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2804_c7_a92f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2804_c7_a92f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2804_c7_a92f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2804_c7_a92f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2804_c7_a92f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2804_c7_a92f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2804_c7_a92f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2804_c7_a92f_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2804_c7_a92f]
signal result_u8_value_MUX_uxn_opcodes_h_l2804_c7_a92f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2804_c7_a92f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2804_c7_a92f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2804_c7_a92f_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2804_c7_a92f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2804_c7_a92f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2804_c7_a92f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2804_c7_a92f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2804_c7_a92f_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2806_c31_e513]
signal CONST_SR_8_uxn_opcodes_h_l2806_c31_e513_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2806_c31_e513_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2808_c11_df74]
signal BIN_OP_EQ_uxn_opcodes_h_l2808_c11_df74_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2808_c11_df74_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2808_c11_df74_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2808_c7_16c0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2808_c7_16c0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2808_c7_16c0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2808_c7_16c0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2808_c7_16c0_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2808_c7_16c0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2808_c7_16c0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2808_c7_16c0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2808_c7_16c0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2808_c7_16c0_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2765_l2780_DUPLICATE_37e9
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2765_l2780_DUPLICATE_37e9_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2765_l2780_DUPLICATE_37e9_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_641b( ref_toks_0 : opcode_result_t;
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
      base.is_sp_shift := ref_toks_2;
      base.is_opc_done := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.u8_value := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2755_c6_f267
BIN_OP_EQ_uxn_opcodes_h_l2755_c6_f267 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2755_c6_f267_left,
BIN_OP_EQ_uxn_opcodes_h_l2755_c6_f267_right,
BIN_OP_EQ_uxn_opcodes_h_l2755_c6_f267_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_ed18
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_ed18 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_ed18_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_ed18_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_ed18_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_ed18_return_output);

-- t16_MUX_uxn_opcodes_h_l2755_c2_e1ef
t16_MUX_uxn_opcodes_h_l2755_c2_e1ef : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2755_c2_e1ef_cond,
t16_MUX_uxn_opcodes_h_l2755_c2_e1ef_iftrue,
t16_MUX_uxn_opcodes_h_l2755_c2_e1ef_iffalse,
t16_MUX_uxn_opcodes_h_l2755_c2_e1ef_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c2_e1ef
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c2_e1ef : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c2_e1ef_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c2_e1ef_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c2_e1ef_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c2_e1ef_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2755_c2_e1ef
result_is_sp_shift_MUX_uxn_opcodes_h_l2755_c2_e1ef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2755_c2_e1ef_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2755_c2_e1ef_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2755_c2_e1ef_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2755_c2_e1ef_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2755_c2_e1ef
result_is_opc_done_MUX_uxn_opcodes_h_l2755_c2_e1ef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2755_c2_e1ef_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2755_c2_e1ef_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2755_c2_e1ef_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2755_c2_e1ef_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2755_c2_e1ef
result_is_stack_write_MUX_uxn_opcodes_h_l2755_c2_e1ef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2755_c2_e1ef_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2755_c2_e1ef_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2755_c2_e1ef_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2755_c2_e1ef_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2755_c2_e1ef
result_u8_value_MUX_uxn_opcodes_h_l2755_c2_e1ef : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2755_c2_e1ef_cond,
result_u8_value_MUX_uxn_opcodes_h_l2755_c2_e1ef_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2755_c2_e1ef_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2755_c2_e1ef_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2755_c2_e1ef
result_sp_relative_shift_MUX_uxn_opcodes_h_l2755_c2_e1ef : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2755_c2_e1ef_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2755_c2_e1ef_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2755_c2_e1ef_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2755_c2_e1ef_return_output);

-- n16_MUX_uxn_opcodes_h_l2755_c2_e1ef
n16_MUX_uxn_opcodes_h_l2755_c2_e1ef : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2755_c2_e1ef_cond,
n16_MUX_uxn_opcodes_h_l2755_c2_e1ef_iftrue,
n16_MUX_uxn_opcodes_h_l2755_c2_e1ef_iffalse,
n16_MUX_uxn_opcodes_h_l2755_c2_e1ef_return_output);

-- printf_uxn_opcodes_h_l2756_c3_e6b8_uxn_opcodes_h_l2756_c3_e6b8
printf_uxn_opcodes_h_l2756_c3_e6b8_uxn_opcodes_h_l2756_c3_e6b8 : entity work.printf_uxn_opcodes_h_l2756_c3_e6b8_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2756_c3_e6b8_uxn_opcodes_h_l2756_c3_e6b8_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2760_c11_4f83
BIN_OP_EQ_uxn_opcodes_h_l2760_c11_4f83 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2760_c11_4f83_left,
BIN_OP_EQ_uxn_opcodes_h_l2760_c11_4f83_right,
BIN_OP_EQ_uxn_opcodes_h_l2760_c11_4f83_return_output);

-- t16_MUX_uxn_opcodes_h_l2760_c7_bff8
t16_MUX_uxn_opcodes_h_l2760_c7_bff8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2760_c7_bff8_cond,
t16_MUX_uxn_opcodes_h_l2760_c7_bff8_iftrue,
t16_MUX_uxn_opcodes_h_l2760_c7_bff8_iffalse,
t16_MUX_uxn_opcodes_h_l2760_c7_bff8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2760_c7_bff8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2760_c7_bff8 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2760_c7_bff8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2760_c7_bff8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2760_c7_bff8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2760_c7_bff8_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2760_c7_bff8
result_is_sp_shift_MUX_uxn_opcodes_h_l2760_c7_bff8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2760_c7_bff8_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2760_c7_bff8_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2760_c7_bff8_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2760_c7_bff8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2760_c7_bff8
result_is_opc_done_MUX_uxn_opcodes_h_l2760_c7_bff8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2760_c7_bff8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2760_c7_bff8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2760_c7_bff8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2760_c7_bff8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2760_c7_bff8
result_is_stack_write_MUX_uxn_opcodes_h_l2760_c7_bff8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2760_c7_bff8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2760_c7_bff8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2760_c7_bff8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2760_c7_bff8_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2760_c7_bff8
result_u8_value_MUX_uxn_opcodes_h_l2760_c7_bff8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2760_c7_bff8_cond,
result_u8_value_MUX_uxn_opcodes_h_l2760_c7_bff8_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2760_c7_bff8_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2760_c7_bff8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2760_c7_bff8
result_sp_relative_shift_MUX_uxn_opcodes_h_l2760_c7_bff8 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2760_c7_bff8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2760_c7_bff8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2760_c7_bff8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2760_c7_bff8_return_output);

-- n16_MUX_uxn_opcodes_h_l2760_c7_bff8
n16_MUX_uxn_opcodes_h_l2760_c7_bff8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2760_c7_bff8_cond,
n16_MUX_uxn_opcodes_h_l2760_c7_bff8_iftrue,
n16_MUX_uxn_opcodes_h_l2760_c7_bff8_iffalse,
n16_MUX_uxn_opcodes_h_l2760_c7_bff8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2763_c11_64e7
BIN_OP_EQ_uxn_opcodes_h_l2763_c11_64e7 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2763_c11_64e7_left,
BIN_OP_EQ_uxn_opcodes_h_l2763_c11_64e7_right,
BIN_OP_EQ_uxn_opcodes_h_l2763_c11_64e7_return_output);

-- t16_MUX_uxn_opcodes_h_l2763_c7_90ce
t16_MUX_uxn_opcodes_h_l2763_c7_90ce : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2763_c7_90ce_cond,
t16_MUX_uxn_opcodes_h_l2763_c7_90ce_iftrue,
t16_MUX_uxn_opcodes_h_l2763_c7_90ce_iffalse,
t16_MUX_uxn_opcodes_h_l2763_c7_90ce_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2763_c7_90ce
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2763_c7_90ce : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2763_c7_90ce_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2763_c7_90ce_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2763_c7_90ce_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2763_c7_90ce_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2763_c7_90ce
result_is_sp_shift_MUX_uxn_opcodes_h_l2763_c7_90ce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2763_c7_90ce_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2763_c7_90ce_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2763_c7_90ce_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2763_c7_90ce_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2763_c7_90ce
result_is_opc_done_MUX_uxn_opcodes_h_l2763_c7_90ce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2763_c7_90ce_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2763_c7_90ce_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2763_c7_90ce_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2763_c7_90ce_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2763_c7_90ce
result_is_stack_write_MUX_uxn_opcodes_h_l2763_c7_90ce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2763_c7_90ce_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2763_c7_90ce_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2763_c7_90ce_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2763_c7_90ce_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2763_c7_90ce
result_u8_value_MUX_uxn_opcodes_h_l2763_c7_90ce : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2763_c7_90ce_cond,
result_u8_value_MUX_uxn_opcodes_h_l2763_c7_90ce_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2763_c7_90ce_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2763_c7_90ce_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2763_c7_90ce
result_sp_relative_shift_MUX_uxn_opcodes_h_l2763_c7_90ce : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2763_c7_90ce_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2763_c7_90ce_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2763_c7_90ce_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2763_c7_90ce_return_output);

-- n16_MUX_uxn_opcodes_h_l2763_c7_90ce
n16_MUX_uxn_opcodes_h_l2763_c7_90ce : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2763_c7_90ce_cond,
n16_MUX_uxn_opcodes_h_l2763_c7_90ce_iftrue,
n16_MUX_uxn_opcodes_h_l2763_c7_90ce_iffalse,
n16_MUX_uxn_opcodes_h_l2763_c7_90ce_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2768_c11_5f51
BIN_OP_EQ_uxn_opcodes_h_l2768_c11_5f51 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2768_c11_5f51_left,
BIN_OP_EQ_uxn_opcodes_h_l2768_c11_5f51_right,
BIN_OP_EQ_uxn_opcodes_h_l2768_c11_5f51_return_output);

-- t16_MUX_uxn_opcodes_h_l2768_c7_9615
t16_MUX_uxn_opcodes_h_l2768_c7_9615 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2768_c7_9615_cond,
t16_MUX_uxn_opcodes_h_l2768_c7_9615_iftrue,
t16_MUX_uxn_opcodes_h_l2768_c7_9615_iffalse,
t16_MUX_uxn_opcodes_h_l2768_c7_9615_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2768_c7_9615
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2768_c7_9615 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2768_c7_9615_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2768_c7_9615_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2768_c7_9615_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2768_c7_9615_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2768_c7_9615
result_is_sp_shift_MUX_uxn_opcodes_h_l2768_c7_9615 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2768_c7_9615_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2768_c7_9615_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2768_c7_9615_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2768_c7_9615_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2768_c7_9615
result_is_opc_done_MUX_uxn_opcodes_h_l2768_c7_9615 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2768_c7_9615_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2768_c7_9615_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2768_c7_9615_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2768_c7_9615_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2768_c7_9615
result_is_stack_write_MUX_uxn_opcodes_h_l2768_c7_9615 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2768_c7_9615_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2768_c7_9615_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2768_c7_9615_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2768_c7_9615_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2768_c7_9615
result_u8_value_MUX_uxn_opcodes_h_l2768_c7_9615 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2768_c7_9615_cond,
result_u8_value_MUX_uxn_opcodes_h_l2768_c7_9615_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2768_c7_9615_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2768_c7_9615_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2768_c7_9615
result_sp_relative_shift_MUX_uxn_opcodes_h_l2768_c7_9615 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2768_c7_9615_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2768_c7_9615_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2768_c7_9615_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2768_c7_9615_return_output);

-- n16_MUX_uxn_opcodes_h_l2768_c7_9615
n16_MUX_uxn_opcodes_h_l2768_c7_9615 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2768_c7_9615_cond,
n16_MUX_uxn_opcodes_h_l2768_c7_9615_iftrue,
n16_MUX_uxn_opcodes_h_l2768_c7_9615_iffalse,
n16_MUX_uxn_opcodes_h_l2768_c7_9615_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2771_c11_0058
BIN_OP_EQ_uxn_opcodes_h_l2771_c11_0058 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2771_c11_0058_left,
BIN_OP_EQ_uxn_opcodes_h_l2771_c11_0058_right,
BIN_OP_EQ_uxn_opcodes_h_l2771_c11_0058_return_output);

-- t16_MUX_uxn_opcodes_h_l2771_c7_4f8f
t16_MUX_uxn_opcodes_h_l2771_c7_4f8f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2771_c7_4f8f_cond,
t16_MUX_uxn_opcodes_h_l2771_c7_4f8f_iftrue,
t16_MUX_uxn_opcodes_h_l2771_c7_4f8f_iffalse,
t16_MUX_uxn_opcodes_h_l2771_c7_4f8f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2771_c7_4f8f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2771_c7_4f8f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2771_c7_4f8f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2771_c7_4f8f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2771_c7_4f8f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2771_c7_4f8f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2771_c7_4f8f
result_is_sp_shift_MUX_uxn_opcodes_h_l2771_c7_4f8f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2771_c7_4f8f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2771_c7_4f8f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2771_c7_4f8f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2771_c7_4f8f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2771_c7_4f8f
result_is_opc_done_MUX_uxn_opcodes_h_l2771_c7_4f8f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2771_c7_4f8f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2771_c7_4f8f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2771_c7_4f8f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2771_c7_4f8f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2771_c7_4f8f
result_is_stack_write_MUX_uxn_opcodes_h_l2771_c7_4f8f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2771_c7_4f8f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2771_c7_4f8f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2771_c7_4f8f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2771_c7_4f8f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2771_c7_4f8f
result_u8_value_MUX_uxn_opcodes_h_l2771_c7_4f8f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2771_c7_4f8f_cond,
result_u8_value_MUX_uxn_opcodes_h_l2771_c7_4f8f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2771_c7_4f8f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2771_c7_4f8f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2771_c7_4f8f
result_sp_relative_shift_MUX_uxn_opcodes_h_l2771_c7_4f8f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2771_c7_4f8f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2771_c7_4f8f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2771_c7_4f8f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2771_c7_4f8f_return_output);

-- n16_MUX_uxn_opcodes_h_l2771_c7_4f8f
n16_MUX_uxn_opcodes_h_l2771_c7_4f8f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2771_c7_4f8f_cond,
n16_MUX_uxn_opcodes_h_l2771_c7_4f8f_iftrue,
n16_MUX_uxn_opcodes_h_l2771_c7_4f8f_iffalse,
n16_MUX_uxn_opcodes_h_l2771_c7_4f8f_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2772_c3_e6d2
BIN_OP_OR_uxn_opcodes_h_l2772_c3_e6d2 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2772_c3_e6d2_left,
BIN_OP_OR_uxn_opcodes_h_l2772_c3_e6d2_right,
BIN_OP_OR_uxn_opcodes_h_l2772_c3_e6d2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2775_c11_275a
BIN_OP_EQ_uxn_opcodes_h_l2775_c11_275a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2775_c11_275a_left,
BIN_OP_EQ_uxn_opcodes_h_l2775_c11_275a_right,
BIN_OP_EQ_uxn_opcodes_h_l2775_c11_275a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2775_c7_5e03
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2775_c7_5e03 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2775_c7_5e03_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2775_c7_5e03_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2775_c7_5e03_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2775_c7_5e03_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2775_c7_5e03
result_is_sp_shift_MUX_uxn_opcodes_h_l2775_c7_5e03 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2775_c7_5e03_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2775_c7_5e03_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2775_c7_5e03_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2775_c7_5e03_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2775_c7_5e03
result_is_opc_done_MUX_uxn_opcodes_h_l2775_c7_5e03 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2775_c7_5e03_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2775_c7_5e03_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2775_c7_5e03_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2775_c7_5e03_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2775_c7_5e03
result_is_stack_write_MUX_uxn_opcodes_h_l2775_c7_5e03 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2775_c7_5e03_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2775_c7_5e03_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2775_c7_5e03_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2775_c7_5e03_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2775_c7_5e03
result_u8_value_MUX_uxn_opcodes_h_l2775_c7_5e03 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2775_c7_5e03_cond,
result_u8_value_MUX_uxn_opcodes_h_l2775_c7_5e03_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2775_c7_5e03_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2775_c7_5e03_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2775_c7_5e03
result_sp_relative_shift_MUX_uxn_opcodes_h_l2775_c7_5e03 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2775_c7_5e03_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2775_c7_5e03_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2775_c7_5e03_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2775_c7_5e03_return_output);

-- n16_MUX_uxn_opcodes_h_l2775_c7_5e03
n16_MUX_uxn_opcodes_h_l2775_c7_5e03 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2775_c7_5e03_cond,
n16_MUX_uxn_opcodes_h_l2775_c7_5e03_iftrue,
n16_MUX_uxn_opcodes_h_l2775_c7_5e03_iffalse,
n16_MUX_uxn_opcodes_h_l2775_c7_5e03_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2778_c11_9097
BIN_OP_EQ_uxn_opcodes_h_l2778_c11_9097 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2778_c11_9097_left,
BIN_OP_EQ_uxn_opcodes_h_l2778_c11_9097_right,
BIN_OP_EQ_uxn_opcodes_h_l2778_c11_9097_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2778_c7_4b85
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2778_c7_4b85 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2778_c7_4b85_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2778_c7_4b85_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2778_c7_4b85_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2778_c7_4b85_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2778_c7_4b85
result_is_sp_shift_MUX_uxn_opcodes_h_l2778_c7_4b85 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2778_c7_4b85_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2778_c7_4b85_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2778_c7_4b85_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2778_c7_4b85_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2778_c7_4b85
result_is_opc_done_MUX_uxn_opcodes_h_l2778_c7_4b85 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2778_c7_4b85_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2778_c7_4b85_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2778_c7_4b85_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2778_c7_4b85_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2778_c7_4b85
result_is_stack_write_MUX_uxn_opcodes_h_l2778_c7_4b85 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2778_c7_4b85_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2778_c7_4b85_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2778_c7_4b85_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2778_c7_4b85_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2778_c7_4b85
result_u8_value_MUX_uxn_opcodes_h_l2778_c7_4b85 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2778_c7_4b85_cond,
result_u8_value_MUX_uxn_opcodes_h_l2778_c7_4b85_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2778_c7_4b85_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2778_c7_4b85_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2778_c7_4b85
result_sp_relative_shift_MUX_uxn_opcodes_h_l2778_c7_4b85 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2778_c7_4b85_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2778_c7_4b85_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2778_c7_4b85_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2778_c7_4b85_return_output);

-- n16_MUX_uxn_opcodes_h_l2778_c7_4b85
n16_MUX_uxn_opcodes_h_l2778_c7_4b85 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2778_c7_4b85_cond,
n16_MUX_uxn_opcodes_h_l2778_c7_4b85_iftrue,
n16_MUX_uxn_opcodes_h_l2778_c7_4b85_iffalse,
n16_MUX_uxn_opcodes_h_l2778_c7_4b85_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2783_c11_912c
BIN_OP_EQ_uxn_opcodes_h_l2783_c11_912c : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2783_c11_912c_left,
BIN_OP_EQ_uxn_opcodes_h_l2783_c11_912c_right,
BIN_OP_EQ_uxn_opcodes_h_l2783_c11_912c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2783_c7_712c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2783_c7_712c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2783_c7_712c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2783_c7_712c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2783_c7_712c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2783_c7_712c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2783_c7_712c
result_is_sp_shift_MUX_uxn_opcodes_h_l2783_c7_712c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2783_c7_712c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2783_c7_712c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2783_c7_712c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2783_c7_712c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2783_c7_712c
result_is_opc_done_MUX_uxn_opcodes_h_l2783_c7_712c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2783_c7_712c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2783_c7_712c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2783_c7_712c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2783_c7_712c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2783_c7_712c
result_is_stack_write_MUX_uxn_opcodes_h_l2783_c7_712c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2783_c7_712c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2783_c7_712c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2783_c7_712c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2783_c7_712c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2783_c7_712c
result_u8_value_MUX_uxn_opcodes_h_l2783_c7_712c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2783_c7_712c_cond,
result_u8_value_MUX_uxn_opcodes_h_l2783_c7_712c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2783_c7_712c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2783_c7_712c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2783_c7_712c
result_sp_relative_shift_MUX_uxn_opcodes_h_l2783_c7_712c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2783_c7_712c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2783_c7_712c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2783_c7_712c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2783_c7_712c_return_output);

-- n16_MUX_uxn_opcodes_h_l2783_c7_712c
n16_MUX_uxn_opcodes_h_l2783_c7_712c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2783_c7_712c_cond,
n16_MUX_uxn_opcodes_h_l2783_c7_712c_iftrue,
n16_MUX_uxn_opcodes_h_l2783_c7_712c_iffalse,
n16_MUX_uxn_opcodes_h_l2783_c7_712c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2786_c11_ae2a
BIN_OP_EQ_uxn_opcodes_h_l2786_c11_ae2a : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2786_c11_ae2a_left,
BIN_OP_EQ_uxn_opcodes_h_l2786_c11_ae2a_right,
BIN_OP_EQ_uxn_opcodes_h_l2786_c11_ae2a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2786_c7_d992
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2786_c7_d992 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2786_c7_d992_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2786_c7_d992_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2786_c7_d992_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2786_c7_d992_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2786_c7_d992
result_is_sp_shift_MUX_uxn_opcodes_h_l2786_c7_d992 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2786_c7_d992_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2786_c7_d992_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2786_c7_d992_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2786_c7_d992_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2786_c7_d992
result_is_opc_done_MUX_uxn_opcodes_h_l2786_c7_d992 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2786_c7_d992_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2786_c7_d992_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2786_c7_d992_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2786_c7_d992_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2786_c7_d992
result_is_stack_write_MUX_uxn_opcodes_h_l2786_c7_d992 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2786_c7_d992_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2786_c7_d992_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2786_c7_d992_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2786_c7_d992_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2786_c7_d992
result_u8_value_MUX_uxn_opcodes_h_l2786_c7_d992 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2786_c7_d992_cond,
result_u8_value_MUX_uxn_opcodes_h_l2786_c7_d992_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2786_c7_d992_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2786_c7_d992_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2786_c7_d992
result_sp_relative_shift_MUX_uxn_opcodes_h_l2786_c7_d992 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2786_c7_d992_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2786_c7_d992_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2786_c7_d992_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2786_c7_d992_return_output);

-- n16_MUX_uxn_opcodes_h_l2786_c7_d992
n16_MUX_uxn_opcodes_h_l2786_c7_d992 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2786_c7_d992_cond,
n16_MUX_uxn_opcodes_h_l2786_c7_d992_iftrue,
n16_MUX_uxn_opcodes_h_l2786_c7_d992_iffalse,
n16_MUX_uxn_opcodes_h_l2786_c7_d992_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2787_c3_1bf2
BIN_OP_OR_uxn_opcodes_h_l2787_c3_1bf2 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2787_c3_1bf2_left,
BIN_OP_OR_uxn_opcodes_h_l2787_c3_1bf2_right,
BIN_OP_OR_uxn_opcodes_h_l2787_c3_1bf2_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2789_c30_2eb6
sp_relative_shift_uxn_opcodes_h_l2789_c30_2eb6 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2789_c30_2eb6_ins,
sp_relative_shift_uxn_opcodes_h_l2789_c30_2eb6_x,
sp_relative_shift_uxn_opcodes_h_l2789_c30_2eb6_y,
sp_relative_shift_uxn_opcodes_h_l2789_c30_2eb6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2794_c11_42c6
BIN_OP_EQ_uxn_opcodes_h_l2794_c11_42c6 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2794_c11_42c6_left,
BIN_OP_EQ_uxn_opcodes_h_l2794_c11_42c6_right,
BIN_OP_EQ_uxn_opcodes_h_l2794_c11_42c6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_3103
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_3103 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_3103_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_3103_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_3103_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_3103_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_3103
result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_3103 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_3103_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_3103_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_3103_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_3103_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_3103
result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_3103 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_3103_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_3103_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_3103_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_3103_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_3103
result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_3103 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_3103_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_3103_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_3103_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_3103_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2794_c7_3103
result_u8_value_MUX_uxn_opcodes_h_l2794_c7_3103 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2794_c7_3103_cond,
result_u8_value_MUX_uxn_opcodes_h_l2794_c7_3103_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2794_c7_3103_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2794_c7_3103_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2797_c31_3240
CONST_SR_8_uxn_opcodes_h_l2797_c31_3240 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2797_c31_3240_x,
CONST_SR_8_uxn_opcodes_h_l2797_c31_3240_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2799_c11_00ce
BIN_OP_EQ_uxn_opcodes_h_l2799_c11_00ce : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2799_c11_00ce_left,
BIN_OP_EQ_uxn_opcodes_h_l2799_c11_00ce_right,
BIN_OP_EQ_uxn_opcodes_h_l2799_c11_00ce_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2799_c7_4214
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2799_c7_4214 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2799_c7_4214_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2799_c7_4214_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2799_c7_4214_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2799_c7_4214_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2799_c7_4214
result_is_sp_shift_MUX_uxn_opcodes_h_l2799_c7_4214 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2799_c7_4214_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2799_c7_4214_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2799_c7_4214_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2799_c7_4214_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2799_c7_4214
result_is_opc_done_MUX_uxn_opcodes_h_l2799_c7_4214 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2799_c7_4214_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2799_c7_4214_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2799_c7_4214_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2799_c7_4214_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2799_c7_4214
result_is_stack_write_MUX_uxn_opcodes_h_l2799_c7_4214 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2799_c7_4214_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2799_c7_4214_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2799_c7_4214_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2799_c7_4214_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2799_c7_4214
result_u8_value_MUX_uxn_opcodes_h_l2799_c7_4214 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2799_c7_4214_cond,
result_u8_value_MUX_uxn_opcodes_h_l2799_c7_4214_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2799_c7_4214_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2799_c7_4214_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2804_c11_aba0
BIN_OP_EQ_uxn_opcodes_h_l2804_c11_aba0 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2804_c11_aba0_left,
BIN_OP_EQ_uxn_opcodes_h_l2804_c11_aba0_right,
BIN_OP_EQ_uxn_opcodes_h_l2804_c11_aba0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2804_c7_a92f
result_is_stack_write_MUX_uxn_opcodes_h_l2804_c7_a92f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2804_c7_a92f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2804_c7_a92f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2804_c7_a92f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2804_c7_a92f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2804_c7_a92f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2804_c7_a92f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2804_c7_a92f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2804_c7_a92f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2804_c7_a92f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2804_c7_a92f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2804_c7_a92f
result_u8_value_MUX_uxn_opcodes_h_l2804_c7_a92f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2804_c7_a92f_cond,
result_u8_value_MUX_uxn_opcodes_h_l2804_c7_a92f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2804_c7_a92f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2804_c7_a92f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2804_c7_a92f
result_is_opc_done_MUX_uxn_opcodes_h_l2804_c7_a92f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2804_c7_a92f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2804_c7_a92f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2804_c7_a92f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2804_c7_a92f_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2806_c31_e513
CONST_SR_8_uxn_opcodes_h_l2806_c31_e513 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2806_c31_e513_x,
CONST_SR_8_uxn_opcodes_h_l2806_c31_e513_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2808_c11_df74
BIN_OP_EQ_uxn_opcodes_h_l2808_c11_df74 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2808_c11_df74_left,
BIN_OP_EQ_uxn_opcodes_h_l2808_c11_df74_right,
BIN_OP_EQ_uxn_opcodes_h_l2808_c11_df74_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2808_c7_16c0
result_is_stack_write_MUX_uxn_opcodes_h_l2808_c7_16c0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2808_c7_16c0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2808_c7_16c0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2808_c7_16c0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2808_c7_16c0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2808_c7_16c0
result_is_opc_done_MUX_uxn_opcodes_h_l2808_c7_16c0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2808_c7_16c0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2808_c7_16c0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2808_c7_16c0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2808_c7_16c0_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2765_l2780_DUPLICATE_37e9
CONST_SL_8_uint16_t_uxn_opcodes_h_l2765_l2780_DUPLICATE_37e9 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l2765_l2780_DUPLICATE_37e9_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l2765_l2780_DUPLICATE_37e9_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2755_c6_f267_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_ed18_return_output,
 t16_MUX_uxn_opcodes_h_l2755_c2_e1ef_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c2_e1ef_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2755_c2_e1ef_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2755_c2_e1ef_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2755_c2_e1ef_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2755_c2_e1ef_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2755_c2_e1ef_return_output,
 n16_MUX_uxn_opcodes_h_l2755_c2_e1ef_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2760_c11_4f83_return_output,
 t16_MUX_uxn_opcodes_h_l2760_c7_bff8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2760_c7_bff8_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2760_c7_bff8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2760_c7_bff8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2760_c7_bff8_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2760_c7_bff8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2760_c7_bff8_return_output,
 n16_MUX_uxn_opcodes_h_l2760_c7_bff8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2763_c11_64e7_return_output,
 t16_MUX_uxn_opcodes_h_l2763_c7_90ce_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2763_c7_90ce_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2763_c7_90ce_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2763_c7_90ce_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2763_c7_90ce_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2763_c7_90ce_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2763_c7_90ce_return_output,
 n16_MUX_uxn_opcodes_h_l2763_c7_90ce_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2768_c11_5f51_return_output,
 t16_MUX_uxn_opcodes_h_l2768_c7_9615_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2768_c7_9615_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2768_c7_9615_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2768_c7_9615_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2768_c7_9615_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2768_c7_9615_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2768_c7_9615_return_output,
 n16_MUX_uxn_opcodes_h_l2768_c7_9615_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2771_c11_0058_return_output,
 t16_MUX_uxn_opcodes_h_l2771_c7_4f8f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2771_c7_4f8f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2771_c7_4f8f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2771_c7_4f8f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2771_c7_4f8f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2771_c7_4f8f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2771_c7_4f8f_return_output,
 n16_MUX_uxn_opcodes_h_l2771_c7_4f8f_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2772_c3_e6d2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2775_c11_275a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2775_c7_5e03_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2775_c7_5e03_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2775_c7_5e03_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2775_c7_5e03_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2775_c7_5e03_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2775_c7_5e03_return_output,
 n16_MUX_uxn_opcodes_h_l2775_c7_5e03_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2778_c11_9097_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2778_c7_4b85_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2778_c7_4b85_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2778_c7_4b85_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2778_c7_4b85_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2778_c7_4b85_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2778_c7_4b85_return_output,
 n16_MUX_uxn_opcodes_h_l2778_c7_4b85_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2783_c11_912c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2783_c7_712c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2783_c7_712c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2783_c7_712c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2783_c7_712c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2783_c7_712c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2783_c7_712c_return_output,
 n16_MUX_uxn_opcodes_h_l2783_c7_712c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2786_c11_ae2a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2786_c7_d992_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2786_c7_d992_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2786_c7_d992_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2786_c7_d992_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2786_c7_d992_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2786_c7_d992_return_output,
 n16_MUX_uxn_opcodes_h_l2786_c7_d992_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2787_c3_1bf2_return_output,
 sp_relative_shift_uxn_opcodes_h_l2789_c30_2eb6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2794_c11_42c6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_3103_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_3103_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_3103_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_3103_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2794_c7_3103_return_output,
 CONST_SR_8_uxn_opcodes_h_l2797_c31_3240_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2799_c11_00ce_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2799_c7_4214_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2799_c7_4214_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2799_c7_4214_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2799_c7_4214_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2799_c7_4214_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2804_c11_aba0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2804_c7_a92f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2804_c7_a92f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2804_c7_a92f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2804_c7_a92f_return_output,
 CONST_SR_8_uxn_opcodes_h_l2806_c31_e513_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2808_c11_df74_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2808_c7_16c0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2808_c7_16c0_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l2765_l2780_DUPLICATE_37e9_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c6_f267_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c6_f267_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c6_f267_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_ed18_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_ed18_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_ed18_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_ed18_iffalse : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2755_c2_e1ef_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2755_c2_e1ef_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2760_c7_bff8_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2755_c2_e1ef_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2755_c2_e1ef_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c2_e1ef_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2757_c3_a715 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c2_e1ef_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2760_c7_bff8_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c2_e1ef_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c2_e1ef_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2755_c2_e1ef_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2755_c2_e1ef_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2760_c7_bff8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2755_c2_e1ef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2755_c2_e1ef_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2755_c2_e1ef_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2755_c2_e1ef_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2760_c7_bff8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2755_c2_e1ef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2755_c2_e1ef_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2755_c2_e1ef_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2755_c2_e1ef_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2760_c7_bff8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2755_c2_e1ef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2755_c2_e1ef_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2755_c2_e1ef_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2755_c2_e1ef_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2760_c7_bff8_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2755_c2_e1ef_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2755_c2_e1ef_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2755_c2_e1ef_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2755_c2_e1ef_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2760_c7_bff8_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2755_c2_e1ef_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2755_c2_e1ef_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2755_c2_e1ef_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2755_c2_e1ef_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2760_c7_bff8_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2755_c2_e1ef_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2755_c2_e1ef_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2756_c3_e6b8_uxn_opcodes_h_l2756_c3_e6b8_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2760_c11_4f83_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2760_c11_4f83_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2760_c11_4f83_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2760_c7_bff8_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2760_c7_bff8_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2763_c7_90ce_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2760_c7_bff8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2760_c7_bff8_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2761_c3_bc03 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2760_c7_bff8_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2763_c7_90ce_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2760_c7_bff8_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2760_c7_bff8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2760_c7_bff8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2763_c7_90ce_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2760_c7_bff8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2760_c7_bff8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2760_c7_bff8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2763_c7_90ce_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2760_c7_bff8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2760_c7_bff8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2760_c7_bff8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2763_c7_90ce_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2760_c7_bff8_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2760_c7_bff8_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2760_c7_bff8_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2763_c7_90ce_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2760_c7_bff8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2760_c7_bff8_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2760_c7_bff8_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2763_c7_90ce_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2760_c7_bff8_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2760_c7_bff8_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2760_c7_bff8_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2763_c7_90ce_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2760_c7_bff8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2763_c11_64e7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2763_c11_64e7_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2763_c11_64e7_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2763_c7_90ce_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2763_c7_90ce_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2768_c7_9615_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2763_c7_90ce_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2763_c7_90ce_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2766_c3_9421 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2763_c7_90ce_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2768_c7_9615_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2763_c7_90ce_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2763_c7_90ce_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2763_c7_90ce_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2768_c7_9615_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2763_c7_90ce_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2763_c7_90ce_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2763_c7_90ce_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2768_c7_9615_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2763_c7_90ce_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2763_c7_90ce_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2763_c7_90ce_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2768_c7_9615_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2763_c7_90ce_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2763_c7_90ce_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2763_c7_90ce_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2768_c7_9615_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2763_c7_90ce_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2763_c7_90ce_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2763_c7_90ce_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2768_c7_9615_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2763_c7_90ce_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2763_c7_90ce_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2763_c7_90ce_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2768_c7_9615_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2763_c7_90ce_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2768_c11_5f51_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2768_c11_5f51_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2768_c11_5f51_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2768_c7_9615_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2768_c7_9615_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2771_c7_4f8f_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2768_c7_9615_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2768_c7_9615_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2769_c3_cae4 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2768_c7_9615_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2771_c7_4f8f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2768_c7_9615_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2768_c7_9615_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2768_c7_9615_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2771_c7_4f8f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2768_c7_9615_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2768_c7_9615_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2768_c7_9615_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2771_c7_4f8f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2768_c7_9615_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2768_c7_9615_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2768_c7_9615_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2771_c7_4f8f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2768_c7_9615_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2768_c7_9615_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2768_c7_9615_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2771_c7_4f8f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2768_c7_9615_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2768_c7_9615_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2768_c7_9615_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2771_c7_4f8f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2768_c7_9615_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2768_c7_9615_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2768_c7_9615_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2771_c7_4f8f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2768_c7_9615_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2771_c11_0058_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2771_c11_0058_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2771_c11_0058_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2771_c7_4f8f_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2771_c7_4f8f_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2771_c7_4f8f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2771_c7_4f8f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2773_c3_f073 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2771_c7_4f8f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2775_c7_5e03_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2771_c7_4f8f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2771_c7_4f8f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2771_c7_4f8f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2775_c7_5e03_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2771_c7_4f8f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2771_c7_4f8f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2771_c7_4f8f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2775_c7_5e03_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2771_c7_4f8f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2771_c7_4f8f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2771_c7_4f8f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2775_c7_5e03_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2771_c7_4f8f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2771_c7_4f8f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2771_c7_4f8f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2775_c7_5e03_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2771_c7_4f8f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2771_c7_4f8f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2771_c7_4f8f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2775_c7_5e03_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2771_c7_4f8f_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2771_c7_4f8f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2771_c7_4f8f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2775_c7_5e03_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2771_c7_4f8f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2772_c3_e6d2_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2772_c3_e6d2_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2772_c3_e6d2_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2775_c11_275a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2775_c11_275a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2775_c11_275a_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2775_c7_5e03_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2776_c3_19b2 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2775_c7_5e03_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2778_c7_4b85_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2775_c7_5e03_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2775_c7_5e03_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2775_c7_5e03_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2778_c7_4b85_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2775_c7_5e03_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2775_c7_5e03_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2775_c7_5e03_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2778_c7_4b85_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2775_c7_5e03_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2775_c7_5e03_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2775_c7_5e03_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2778_c7_4b85_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2775_c7_5e03_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2775_c7_5e03_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2775_c7_5e03_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2778_c7_4b85_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2775_c7_5e03_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2775_c7_5e03_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2775_c7_5e03_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2778_c7_4b85_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2775_c7_5e03_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2775_c7_5e03_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2775_c7_5e03_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2778_c7_4b85_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2775_c7_5e03_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2778_c11_9097_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2778_c11_9097_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2778_c11_9097_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2778_c7_4b85_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2781_c3_c969 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2778_c7_4b85_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2783_c7_712c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2778_c7_4b85_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2778_c7_4b85_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2778_c7_4b85_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2783_c7_712c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2778_c7_4b85_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2778_c7_4b85_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2778_c7_4b85_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2783_c7_712c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2778_c7_4b85_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2778_c7_4b85_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2778_c7_4b85_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2783_c7_712c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2778_c7_4b85_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2778_c7_4b85_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2778_c7_4b85_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2783_c7_712c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2778_c7_4b85_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2778_c7_4b85_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2778_c7_4b85_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2783_c7_712c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2778_c7_4b85_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2778_c7_4b85_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2778_c7_4b85_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2783_c7_712c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2778_c7_4b85_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2783_c11_912c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2783_c11_912c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2783_c11_912c_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2783_c7_712c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2784_c3_bc0e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2783_c7_712c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2786_c7_d992_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2783_c7_712c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2783_c7_712c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2783_c7_712c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2786_c7_d992_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2783_c7_712c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2783_c7_712c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2783_c7_712c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2786_c7_d992_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2783_c7_712c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2783_c7_712c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2783_c7_712c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2786_c7_d992_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2783_c7_712c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2783_c7_712c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2783_c7_712c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2786_c7_d992_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2783_c7_712c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2783_c7_712c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2783_c7_712c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2786_c7_d992_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2783_c7_712c_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2783_c7_712c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2783_c7_712c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2786_c7_d992_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2783_c7_712c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2786_c11_ae2a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2786_c11_ae2a_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2786_c11_ae2a_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2786_c7_d992_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2791_c3_6d7c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2786_c7_d992_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_3103_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2786_c7_d992_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2786_c7_d992_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2786_c7_d992_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_3103_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2786_c7_d992_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2786_c7_d992_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2786_c7_d992_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_3103_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2786_c7_d992_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2786_c7_d992_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2786_c7_d992_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_3103_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2786_c7_d992_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2786_c7_d992_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2786_c7_d992_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2794_c7_3103_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2786_c7_d992_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2786_c7_d992_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2786_c7_d992_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2786_c7_d992_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2786_c7_d992_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2786_c7_d992_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2786_c7_d992_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2787_c3_1bf2_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2787_c3_1bf2_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2787_c3_1bf2_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2789_c30_2eb6_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2789_c30_2eb6_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2789_c30_2eb6_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2789_c30_2eb6_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2792_c21_2523_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2794_c11_42c6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2794_c11_42c6_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2794_c11_42c6_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_3103_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2796_c3_33d2 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_3103_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2799_c7_4214_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_3103_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_3103_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_3103_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2799_c7_4214_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_3103_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_3103_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_3103_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2799_c7_4214_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_3103_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_3103_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_3103_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2799_c7_4214_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_3103_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2794_c7_3103_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2794_c7_3103_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2799_c7_4214_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2794_c7_3103_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2797_c31_3240_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2797_c31_3240_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2797_c21_a759_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2799_c11_00ce_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2799_c11_00ce_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2799_c11_00ce_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2799_c7_4214_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2801_c3_5a3c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2799_c7_4214_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2804_c7_a92f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2799_c7_4214_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2799_c7_4214_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2799_c7_4214_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2799_c7_4214_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2799_c7_4214_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2799_c7_4214_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2804_c7_a92f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2799_c7_4214_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2799_c7_4214_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2799_c7_4214_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2804_c7_a92f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2799_c7_4214_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2799_c7_4214_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2799_c7_4214_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2804_c7_a92f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2799_c7_4214_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2802_c21_4571_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2804_c11_aba0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2804_c11_aba0_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2804_c11_aba0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2804_c7_a92f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2804_c7_a92f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2808_c7_16c0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2804_c7_a92f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2804_c7_a92f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2805_c3_6847 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2804_c7_a92f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2804_c7_a92f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2804_c7_a92f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2804_c7_a92f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2804_c7_a92f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2804_c7_a92f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2804_c7_a92f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2804_c7_a92f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2808_c7_16c0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2804_c7_a92f_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2806_c31_e513_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2806_c31_e513_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2806_c21_3aa7_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2808_c11_df74_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2808_c11_df74_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2808_c11_df74_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2808_c7_16c0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2808_c7_16c0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2808_c7_16c0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2808_c7_16c0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2808_c7_16c0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2808_c7_16c0_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2771_l2799_l2768_l2763_l2760_l2783_l2755_l2778_l2775_DUPLICATE_8f4d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2804_l2771_l2799_l2768_l2794_l2763_l2760_l2783_l2755_l2778_l2808_l2775_DUPLICATE_a42e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2804_l2771_l2768_l2763_l2760_l2783_l2755_l2778_l2775_DUPLICATE_295f_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2771_l2768_l2763_l2786_l2760_l2783_l2755_l2778_l2775_DUPLICATE_2dd5_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2804_l2771_l2799_l2768_l2794_l2763_l2786_l2760_l2783_l2778_l2808_l2775_DUPLICATE_62cc_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2772_l2764_l2787_l2779_DUPLICATE_18c0_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2765_l2780_DUPLICATE_37e9_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2765_l2780_DUPLICATE_37e9_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_641b_uxn_opcodes_h_l2751_l2813_DUPLICATE_c56d_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2763_c11_64e7_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2769_c3_cae4 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2768_c7_9615_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2769_c3_cae4;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2796_c3_33d2 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_3103_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2796_c3_33d2;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2783_c11_912c_right := to_unsigned(7, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2786_c7_d992_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_ed18_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2766_c3_9421 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2763_c7_90ce_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2766_c3_9421;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2808_c11_df74_right := to_unsigned(12, 4);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2799_c7_4214_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_3103_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2771_c11_0058_right := to_unsigned(4, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2755_c2_e1ef_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2808_c7_16c0_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2757_c3_a715 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c2_e1ef_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2757_c3_a715;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2801_c3_5a3c := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2799_c7_4214_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2801_c3_5a3c;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2805_c3_6847 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2804_c7_a92f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2805_c3_6847;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2778_c11_9097_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2776_c3_19b2 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2775_c7_5e03_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2776_c3_19b2;
     VAR_sp_relative_shift_uxn_opcodes_h_l2789_c30_2eb6_y := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_sp_relative_shift_uxn_opcodes_h_l2789_c30_2eb6_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2786_c7_d992_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2791_c3_6d7c := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2786_c7_d992_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2791_c3_6d7c;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2760_c11_4f83_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2775_c11_275a_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2786_c11_ae2a_right := to_unsigned(8, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c6_f267_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2799_c11_00ce_right := to_unsigned(10, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2804_c11_aba0_right := to_unsigned(11, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2781_c3_c969 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2778_c7_4b85_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2781_c3_c969;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2794_c11_42c6_right := to_unsigned(9, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2761_c3_bc03 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2760_c7_bff8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2761_c3_bc03;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2773_c3_f073 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2771_c7_4f8f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2773_c3_f073;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2808_c7_16c0_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2768_c11_5f51_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2784_c3_bc0e := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2783_c7_712c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2784_c3_bc0e;

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_ed18_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l2789_c30_2eb6_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2787_c3_1bf2_left := n16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2797_c31_3240_x := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2755_c2_e1ef_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2760_c7_bff8_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2763_c7_90ce_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2768_c7_9615_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2771_c7_4f8f_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2775_c7_5e03_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2783_c7_712c_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2786_c7_d992_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c6_f267_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2760_c11_4f83_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2763_c11_64e7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2768_c11_5f51_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2771_c11_0058_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2775_c11_275a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2778_c11_9097_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2783_c11_912c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2786_c11_ae2a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2794_c11_42c6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2799_c11_00ce_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2804_c11_aba0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2808_c11_df74_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2772_c3_e6d2_left := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2806_c31_e513_x := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2755_c2_e1ef_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2760_c7_bff8_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2768_c7_9615_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2771_c7_4f8f_iffalse := t16;
     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2804_c7_a92f] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2804_c7_a92f_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2771_l2768_l2763_l2786_l2760_l2783_l2755_l2778_l2775_DUPLICATE_2dd5 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2771_l2768_l2763_l2786_l2760_l2783_l2755_l2778_l2775_DUPLICATE_2dd5_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2786_c11_ae2a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2786_c11_ae2a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2786_c11_ae2a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2786_c11_ae2a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2786_c11_ae2a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2786_c11_ae2a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2786_c11_ae2a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2783_c11_912c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2783_c11_912c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2783_c11_912c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2783_c11_912c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2783_c11_912c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2783_c11_912c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2783_c11_912c_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2772_l2764_l2787_l2779_DUPLICATE_18c0 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2772_l2764_l2787_l2779_DUPLICATE_18c0_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l2755_c6_f267] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2755_c6_f267_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c6_f267_left;
     BIN_OP_EQ_uxn_opcodes_h_l2755_c6_f267_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c6_f267_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c6_f267_return_output := BIN_OP_EQ_uxn_opcodes_h_l2755_c6_f267_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2804_l2771_l2799_l2768_l2794_l2763_l2786_l2760_l2783_l2778_l2808_l2775_DUPLICATE_62cc LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2804_l2771_l2799_l2768_l2794_l2763_l2786_l2760_l2783_l2778_l2808_l2775_DUPLICATE_62cc_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2771_c11_0058] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2771_c11_0058_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2771_c11_0058_left;
     BIN_OP_EQ_uxn_opcodes_h_l2771_c11_0058_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2771_c11_0058_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2771_c11_0058_return_output := BIN_OP_EQ_uxn_opcodes_h_l2771_c11_0058_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2804_l2771_l2799_l2768_l2794_l2763_l2760_l2783_l2755_l2778_l2808_l2775_DUPLICATE_a42e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2804_l2771_l2799_l2768_l2794_l2763_l2760_l2783_l2755_l2778_l2808_l2775_DUPLICATE_a42e_return_output := result.is_stack_write;

     -- CONST_SR_8[uxn_opcodes_h_l2806_c31_e513] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2806_c31_e513_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2806_c31_e513_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2806_c31_e513_return_output := CONST_SR_8_uxn_opcodes_h_l2806_c31_e513_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2804_c11_aba0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2804_c11_aba0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2804_c11_aba0_left;
     BIN_OP_EQ_uxn_opcodes_h_l2804_c11_aba0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2804_c11_aba0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2804_c11_aba0_return_output := BIN_OP_EQ_uxn_opcodes_h_l2804_c11_aba0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2763_c11_64e7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2763_c11_64e7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2763_c11_64e7_left;
     BIN_OP_EQ_uxn_opcodes_h_l2763_c11_64e7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2763_c11_64e7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2763_c11_64e7_return_output := BIN_OP_EQ_uxn_opcodes_h_l2763_c11_64e7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2768_c11_5f51] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2768_c11_5f51_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2768_c11_5f51_left;
     BIN_OP_EQ_uxn_opcodes_h_l2768_c11_5f51_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2768_c11_5f51_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2768_c11_5f51_return_output := BIN_OP_EQ_uxn_opcodes_h_l2768_c11_5f51_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2771_l2799_l2768_l2763_l2760_l2783_l2755_l2778_l2775_DUPLICATE_8f4d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2771_l2799_l2768_l2763_l2760_l2783_l2755_l2778_l2775_DUPLICATE_8f4d_return_output := result.is_sp_shift;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2802_c21_4571] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2802_c21_4571_return_output := CAST_TO_uint8_t_uint16_t(
     t16);

     -- BIN_OP_EQ[uxn_opcodes_h_l2778_c11_9097] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2778_c11_9097_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2778_c11_9097_left;
     BIN_OP_EQ_uxn_opcodes_h_l2778_c11_9097_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2778_c11_9097_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2778_c11_9097_return_output := BIN_OP_EQ_uxn_opcodes_h_l2778_c11_9097_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2760_c11_4f83] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2760_c11_4f83_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2760_c11_4f83_left;
     BIN_OP_EQ_uxn_opcodes_h_l2760_c11_4f83_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2760_c11_4f83_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2760_c11_4f83_return_output := BIN_OP_EQ_uxn_opcodes_h_l2760_c11_4f83_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l2789_c30_2eb6] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2789_c30_2eb6_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2789_c30_2eb6_ins;
     sp_relative_shift_uxn_opcodes_h_l2789_c30_2eb6_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2789_c30_2eb6_x;
     sp_relative_shift_uxn_opcodes_h_l2789_c30_2eb6_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2789_c30_2eb6_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2789_c30_2eb6_return_output := sp_relative_shift_uxn_opcodes_h_l2789_c30_2eb6_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2804_l2771_l2768_l2763_l2760_l2783_l2755_l2778_l2775_DUPLICATE_295f LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2804_l2771_l2768_l2763_l2760_l2783_l2755_l2778_l2775_DUPLICATE_295f_return_output := result.u8_value;

     -- CONST_SR_8[uxn_opcodes_h_l2797_c31_3240] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2797_c31_3240_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2797_c31_3240_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2797_c31_3240_return_output := CONST_SR_8_uxn_opcodes_h_l2797_c31_3240_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2794_c11_42c6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2794_c11_42c6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2794_c11_42c6_left;
     BIN_OP_EQ_uxn_opcodes_h_l2794_c11_42c6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2794_c11_42c6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2794_c11_42c6_return_output := BIN_OP_EQ_uxn_opcodes_h_l2794_c11_42c6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2799_c11_00ce] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2799_c11_00ce_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2799_c11_00ce_left;
     BIN_OP_EQ_uxn_opcodes_h_l2799_c11_00ce_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2799_c11_00ce_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2799_c11_00ce_return_output := BIN_OP_EQ_uxn_opcodes_h_l2799_c11_00ce_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2808_c11_df74] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2808_c11_df74_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2808_c11_df74_left;
     BIN_OP_EQ_uxn_opcodes_h_l2808_c11_df74_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2808_c11_df74_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2808_c11_df74_return_output := BIN_OP_EQ_uxn_opcodes_h_l2808_c11_df74_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2775_c11_275a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2775_c11_275a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2775_c11_275a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2775_c11_275a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2775_c11_275a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2775_c11_275a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2775_c11_275a_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_ed18_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c6_f267_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2755_c2_e1ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c6_f267_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2755_c2_e1ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c6_f267_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2755_c2_e1ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c6_f267_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2755_c2_e1ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c6_f267_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2755_c2_e1ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c6_f267_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c2_e1ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c6_f267_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2755_c2_e1ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c6_f267_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2755_c2_e1ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c6_f267_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2760_c7_bff8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2760_c11_4f83_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2760_c7_bff8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2760_c11_4f83_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2760_c7_bff8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2760_c11_4f83_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2760_c7_bff8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2760_c11_4f83_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2760_c7_bff8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2760_c11_4f83_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2760_c7_bff8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2760_c11_4f83_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2760_c7_bff8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2760_c11_4f83_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2760_c7_bff8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2760_c11_4f83_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2763_c7_90ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2763_c11_64e7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2763_c7_90ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2763_c11_64e7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2763_c7_90ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2763_c11_64e7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2763_c7_90ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2763_c11_64e7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2763_c7_90ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2763_c11_64e7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2763_c7_90ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2763_c11_64e7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2763_c7_90ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2763_c11_64e7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2763_c7_90ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2763_c11_64e7_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2768_c7_9615_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2768_c11_5f51_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2768_c7_9615_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2768_c11_5f51_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2768_c7_9615_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2768_c11_5f51_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2768_c7_9615_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2768_c11_5f51_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2768_c7_9615_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2768_c11_5f51_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2768_c7_9615_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2768_c11_5f51_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2768_c7_9615_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2768_c11_5f51_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2768_c7_9615_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2768_c11_5f51_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2771_c7_4f8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2771_c11_0058_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2771_c7_4f8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2771_c11_0058_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2771_c7_4f8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2771_c11_0058_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2771_c7_4f8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2771_c11_0058_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2771_c7_4f8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2771_c11_0058_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2771_c7_4f8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2771_c11_0058_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2771_c7_4f8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2771_c11_0058_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2771_c7_4f8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2771_c11_0058_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2775_c7_5e03_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2775_c11_275a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2775_c7_5e03_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2775_c11_275a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2775_c7_5e03_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2775_c11_275a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2775_c7_5e03_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2775_c11_275a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2775_c7_5e03_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2775_c11_275a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2775_c7_5e03_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2775_c11_275a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2775_c7_5e03_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2775_c11_275a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2778_c7_4b85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2778_c11_9097_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2778_c7_4b85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2778_c11_9097_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2778_c7_4b85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2778_c11_9097_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2778_c7_4b85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2778_c11_9097_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2778_c7_4b85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2778_c11_9097_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2778_c7_4b85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2778_c11_9097_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2778_c7_4b85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2778_c11_9097_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2783_c7_712c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2783_c11_912c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2783_c7_712c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2783_c11_912c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2783_c7_712c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2783_c11_912c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2783_c7_712c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2783_c11_912c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2783_c7_712c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2783_c11_912c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2783_c7_712c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2783_c11_912c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2783_c7_712c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2783_c11_912c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2786_c7_d992_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2786_c11_ae2a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2786_c7_d992_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2786_c11_ae2a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2786_c7_d992_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2786_c11_ae2a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2786_c7_d992_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2786_c11_ae2a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2786_c7_d992_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2786_c11_ae2a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2786_c7_d992_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2786_c11_ae2a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2786_c7_d992_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2786_c11_ae2a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_3103_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2794_c11_42c6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_3103_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2794_c11_42c6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_3103_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2794_c11_42c6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_3103_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2794_c11_42c6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2794_c7_3103_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2794_c11_42c6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2799_c7_4214_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2799_c11_00ce_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2799_c7_4214_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2799_c11_00ce_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2799_c7_4214_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2799_c11_00ce_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2799_c7_4214_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2799_c11_00ce_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2799_c7_4214_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2799_c11_00ce_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2804_c7_a92f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2804_c11_aba0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2804_c7_a92f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2804_c11_aba0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2804_c7_a92f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2804_c11_aba0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2804_c7_a92f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2804_c11_aba0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2808_c7_16c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2808_c11_df74_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2808_c7_16c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2808_c11_df74_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2772_c3_e6d2_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2772_l2764_l2787_l2779_DUPLICATE_18c0_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2787_c3_1bf2_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2772_l2764_l2787_l2779_DUPLICATE_18c0_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2765_l2780_DUPLICATE_37e9_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2772_l2764_l2787_l2779_DUPLICATE_18c0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2799_c7_4214_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2802_c21_4571_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2755_c2_e1ef_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2771_l2768_l2763_l2786_l2760_l2783_l2755_l2778_l2775_DUPLICATE_2dd5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2760_c7_bff8_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2771_l2768_l2763_l2786_l2760_l2783_l2755_l2778_l2775_DUPLICATE_2dd5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2763_c7_90ce_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2771_l2768_l2763_l2786_l2760_l2783_l2755_l2778_l2775_DUPLICATE_2dd5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2768_c7_9615_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2771_l2768_l2763_l2786_l2760_l2783_l2755_l2778_l2775_DUPLICATE_2dd5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2771_c7_4f8f_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2771_l2768_l2763_l2786_l2760_l2783_l2755_l2778_l2775_DUPLICATE_2dd5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2775_c7_5e03_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2771_l2768_l2763_l2786_l2760_l2783_l2755_l2778_l2775_DUPLICATE_2dd5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2778_c7_4b85_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2771_l2768_l2763_l2786_l2760_l2783_l2755_l2778_l2775_DUPLICATE_2dd5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2783_c7_712c_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2771_l2768_l2763_l2786_l2760_l2783_l2755_l2778_l2775_DUPLICATE_2dd5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2786_c7_d992_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2771_l2768_l2763_l2786_l2760_l2783_l2755_l2778_l2775_DUPLICATE_2dd5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2760_c7_bff8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2804_l2771_l2799_l2768_l2794_l2763_l2786_l2760_l2783_l2778_l2808_l2775_DUPLICATE_62cc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2763_c7_90ce_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2804_l2771_l2799_l2768_l2794_l2763_l2786_l2760_l2783_l2778_l2808_l2775_DUPLICATE_62cc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2768_c7_9615_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2804_l2771_l2799_l2768_l2794_l2763_l2786_l2760_l2783_l2778_l2808_l2775_DUPLICATE_62cc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2771_c7_4f8f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2804_l2771_l2799_l2768_l2794_l2763_l2786_l2760_l2783_l2778_l2808_l2775_DUPLICATE_62cc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2775_c7_5e03_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2804_l2771_l2799_l2768_l2794_l2763_l2786_l2760_l2783_l2778_l2808_l2775_DUPLICATE_62cc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2778_c7_4b85_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2804_l2771_l2799_l2768_l2794_l2763_l2786_l2760_l2783_l2778_l2808_l2775_DUPLICATE_62cc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2783_c7_712c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2804_l2771_l2799_l2768_l2794_l2763_l2786_l2760_l2783_l2778_l2808_l2775_DUPLICATE_62cc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2786_c7_d992_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2804_l2771_l2799_l2768_l2794_l2763_l2786_l2760_l2783_l2778_l2808_l2775_DUPLICATE_62cc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_3103_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2804_l2771_l2799_l2768_l2794_l2763_l2786_l2760_l2783_l2778_l2808_l2775_DUPLICATE_62cc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2799_c7_4214_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2804_l2771_l2799_l2768_l2794_l2763_l2786_l2760_l2783_l2778_l2808_l2775_DUPLICATE_62cc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2804_c7_a92f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2804_l2771_l2799_l2768_l2794_l2763_l2786_l2760_l2783_l2778_l2808_l2775_DUPLICATE_62cc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2808_c7_16c0_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2804_l2771_l2799_l2768_l2794_l2763_l2786_l2760_l2783_l2778_l2808_l2775_DUPLICATE_62cc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2755_c2_e1ef_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2771_l2799_l2768_l2763_l2760_l2783_l2755_l2778_l2775_DUPLICATE_8f4d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2760_c7_bff8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2771_l2799_l2768_l2763_l2760_l2783_l2755_l2778_l2775_DUPLICATE_8f4d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2763_c7_90ce_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2771_l2799_l2768_l2763_l2760_l2783_l2755_l2778_l2775_DUPLICATE_8f4d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2768_c7_9615_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2771_l2799_l2768_l2763_l2760_l2783_l2755_l2778_l2775_DUPLICATE_8f4d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2771_c7_4f8f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2771_l2799_l2768_l2763_l2760_l2783_l2755_l2778_l2775_DUPLICATE_8f4d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2775_c7_5e03_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2771_l2799_l2768_l2763_l2760_l2783_l2755_l2778_l2775_DUPLICATE_8f4d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2778_c7_4b85_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2771_l2799_l2768_l2763_l2760_l2783_l2755_l2778_l2775_DUPLICATE_8f4d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2783_c7_712c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2771_l2799_l2768_l2763_l2760_l2783_l2755_l2778_l2775_DUPLICATE_8f4d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2799_c7_4214_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2771_l2799_l2768_l2763_l2760_l2783_l2755_l2778_l2775_DUPLICATE_8f4d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2755_c2_e1ef_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2804_l2771_l2799_l2768_l2794_l2763_l2760_l2783_l2755_l2778_l2808_l2775_DUPLICATE_a42e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2760_c7_bff8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2804_l2771_l2799_l2768_l2794_l2763_l2760_l2783_l2755_l2778_l2808_l2775_DUPLICATE_a42e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2763_c7_90ce_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2804_l2771_l2799_l2768_l2794_l2763_l2760_l2783_l2755_l2778_l2808_l2775_DUPLICATE_a42e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2768_c7_9615_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2804_l2771_l2799_l2768_l2794_l2763_l2760_l2783_l2755_l2778_l2808_l2775_DUPLICATE_a42e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2771_c7_4f8f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2804_l2771_l2799_l2768_l2794_l2763_l2760_l2783_l2755_l2778_l2808_l2775_DUPLICATE_a42e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2775_c7_5e03_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2804_l2771_l2799_l2768_l2794_l2763_l2760_l2783_l2755_l2778_l2808_l2775_DUPLICATE_a42e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2778_c7_4b85_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2804_l2771_l2799_l2768_l2794_l2763_l2760_l2783_l2755_l2778_l2808_l2775_DUPLICATE_a42e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2783_c7_712c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2804_l2771_l2799_l2768_l2794_l2763_l2760_l2783_l2755_l2778_l2808_l2775_DUPLICATE_a42e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_3103_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2804_l2771_l2799_l2768_l2794_l2763_l2760_l2783_l2755_l2778_l2808_l2775_DUPLICATE_a42e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2799_c7_4214_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2804_l2771_l2799_l2768_l2794_l2763_l2760_l2783_l2755_l2778_l2808_l2775_DUPLICATE_a42e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2804_c7_a92f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2804_l2771_l2799_l2768_l2794_l2763_l2760_l2783_l2755_l2778_l2808_l2775_DUPLICATE_a42e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2808_c7_16c0_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2804_l2771_l2799_l2768_l2794_l2763_l2760_l2783_l2755_l2778_l2808_l2775_DUPLICATE_a42e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2755_c2_e1ef_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2804_l2771_l2768_l2763_l2760_l2783_l2755_l2778_l2775_DUPLICATE_295f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2760_c7_bff8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2804_l2771_l2768_l2763_l2760_l2783_l2755_l2778_l2775_DUPLICATE_295f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2763_c7_90ce_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2804_l2771_l2768_l2763_l2760_l2783_l2755_l2778_l2775_DUPLICATE_295f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2768_c7_9615_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2804_l2771_l2768_l2763_l2760_l2783_l2755_l2778_l2775_DUPLICATE_295f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2771_c7_4f8f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2804_l2771_l2768_l2763_l2760_l2783_l2755_l2778_l2775_DUPLICATE_295f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2775_c7_5e03_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2804_l2771_l2768_l2763_l2760_l2783_l2755_l2778_l2775_DUPLICATE_295f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2778_c7_4b85_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2804_l2771_l2768_l2763_l2760_l2783_l2755_l2778_l2775_DUPLICATE_295f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2783_c7_712c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2804_l2771_l2768_l2763_l2760_l2783_l2755_l2778_l2775_DUPLICATE_295f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2804_c7_a92f_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2804_l2771_l2768_l2763_l2760_l2783_l2755_l2778_l2775_DUPLICATE_295f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2804_c7_a92f_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2804_c7_a92f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2786_c7_d992_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2789_c30_2eb6_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2808_c7_16c0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2808_c7_16c0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2808_c7_16c0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2808_c7_16c0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2808_c7_16c0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2808_c7_16c0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2808_c7_16c0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2808_c7_16c0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2808_c7_16c0_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2797_c21_a759] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2797_c21_a759_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2797_c31_3240_return_output);

     -- BIN_OP_OR[uxn_opcodes_h_l2772_c3_e6d2] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2772_c3_e6d2_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2772_c3_e6d2_left;
     BIN_OP_OR_uxn_opcodes_h_l2772_c3_e6d2_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2772_c3_e6d2_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2772_c3_e6d2_return_output := BIN_OP_OR_uxn_opcodes_h_l2772_c3_e6d2_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2806_c21_3aa7] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2806_c21_3aa7_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2806_c31_e513_return_output);

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2786_c7_d992] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2786_c7_d992_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2786_c7_d992_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2786_c7_d992_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2786_c7_d992_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2786_c7_d992_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2786_c7_d992_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2786_c7_d992_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2786_c7_d992_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2804_c7_a92f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2804_c7_a92f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2804_c7_a92f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2804_c7_a92f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2804_c7_a92f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2804_c7_a92f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2804_c7_a92f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2804_c7_a92f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2804_c7_a92f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2808_c7_16c0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2808_c7_16c0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2808_c7_16c0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2808_c7_16c0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2808_c7_16c0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2808_c7_16c0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2808_c7_16c0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2808_c7_16c0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2808_c7_16c0_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2787_c3_1bf2] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2787_c3_1bf2_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2787_c3_1bf2_left;
     BIN_OP_OR_uxn_opcodes_h_l2787_c3_1bf2_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2787_c3_1bf2_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2787_c3_1bf2_return_output := BIN_OP_OR_uxn_opcodes_h_l2787_c3_1bf2_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2755_c1_ed18] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_ed18_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_ed18_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_ed18_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_ed18_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_ed18_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_ed18_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_ed18_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_ed18_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2799_c7_4214] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2799_c7_4214_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2799_c7_4214_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2799_c7_4214_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2799_c7_4214_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2799_c7_4214_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2799_c7_4214_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2799_c7_4214_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2799_c7_4214_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l2765_l2780_DUPLICATE_37e9 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l2765_l2780_DUPLICATE_37e9_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2765_l2780_DUPLICATE_37e9_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2765_l2780_DUPLICATE_37e9_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l2765_l2780_DUPLICATE_37e9_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l2771_c7_4f8f_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2772_c3_e6d2_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2786_c7_d992_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2787_c3_1bf2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2794_c7_3103_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2797_c21_a759_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2804_c7_a92f_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2806_c21_3aa7_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2778_c7_4b85_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2765_l2780_DUPLICATE_37e9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2763_c7_90ce_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2765_l2780_DUPLICATE_37e9_return_output;
     VAR_printf_uxn_opcodes_h_l2756_c3_e6b8_uxn_opcodes_h_l2756_c3_e6b8_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_ed18_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2804_c7_a92f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2808_c7_16c0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_3103_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2799_c7_4214_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2804_c7_a92f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2808_c7_16c0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2783_c7_712c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2786_c7_d992_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2799_c7_4214_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2804_c7_a92f_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2804_c7_a92f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2804_c7_a92f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2804_c7_a92f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2804_c7_a92f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2804_c7_a92f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2804_c7_a92f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2804_c7_a92f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2804_c7_a92f_return_output := result_u8_value_MUX_uxn_opcodes_h_l2804_c7_a92f_return_output;

     -- t16_MUX[uxn_opcodes_h_l2771_c7_4f8f] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2771_c7_4f8f_cond <= VAR_t16_MUX_uxn_opcodes_h_l2771_c7_4f8f_cond;
     t16_MUX_uxn_opcodes_h_l2771_c7_4f8f_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2771_c7_4f8f_iftrue;
     t16_MUX_uxn_opcodes_h_l2771_c7_4f8f_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2771_c7_4f8f_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2771_c7_4f8f_return_output := t16_MUX_uxn_opcodes_h_l2771_c7_4f8f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2799_c7_4214] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2799_c7_4214_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2799_c7_4214_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2799_c7_4214_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2799_c7_4214_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2799_c7_4214_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2799_c7_4214_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2799_c7_4214_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2799_c7_4214_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2792_c21_2523] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2792_c21_2523_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_OR_uxn_opcodes_h_l2787_c3_1bf2_return_output);

     -- printf_uxn_opcodes_h_l2756_c3_e6b8[uxn_opcodes_h_l2756_c3_e6b8] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2756_c3_e6b8_uxn_opcodes_h_l2756_c3_e6b8_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2756_c3_e6b8_uxn_opcodes_h_l2756_c3_e6b8_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- n16_MUX[uxn_opcodes_h_l2786_c7_d992] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2786_c7_d992_cond <= VAR_n16_MUX_uxn_opcodes_h_l2786_c7_d992_cond;
     n16_MUX_uxn_opcodes_h_l2786_c7_d992_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2786_c7_d992_iftrue;
     n16_MUX_uxn_opcodes_h_l2786_c7_d992_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2786_c7_d992_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2786_c7_d992_return_output := n16_MUX_uxn_opcodes_h_l2786_c7_d992_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2794_c7_3103] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_3103_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_3103_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_3103_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_3103_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_3103_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_3103_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_3103_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_3103_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2804_c7_a92f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2804_c7_a92f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2804_c7_a92f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2804_c7_a92f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2804_c7_a92f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2804_c7_a92f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2804_c7_a92f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2804_c7_a92f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2804_c7_a92f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2804_c7_a92f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2804_c7_a92f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2804_c7_a92f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2804_c7_a92f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2804_c7_a92f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2804_c7_a92f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2804_c7_a92f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2804_c7_a92f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2804_c7_a92f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2783_c7_712c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2783_c7_712c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2783_c7_712c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2783_c7_712c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2783_c7_712c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2783_c7_712c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2783_c7_712c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2783_c7_712c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2783_c7_712c_return_output;

     -- Submodule level 3
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2786_c7_d992_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2792_c21_2523_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2783_c7_712c_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2786_c7_d992_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2799_c7_4214_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2804_c7_a92f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2786_c7_d992_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_3103_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2799_c7_4214_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2804_c7_a92f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2778_c7_4b85_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2783_c7_712c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_3103_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2799_c7_4214_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2799_c7_4214_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2804_c7_a92f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2768_c7_9615_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2771_c7_4f8f_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2799_c7_4214] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2799_c7_4214_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2799_c7_4214_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2799_c7_4214_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2799_c7_4214_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2799_c7_4214_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2799_c7_4214_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2799_c7_4214_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2799_c7_4214_return_output;

     -- t16_MUX[uxn_opcodes_h_l2768_c7_9615] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2768_c7_9615_cond <= VAR_t16_MUX_uxn_opcodes_h_l2768_c7_9615_cond;
     t16_MUX_uxn_opcodes_h_l2768_c7_9615_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2768_c7_9615_iftrue;
     t16_MUX_uxn_opcodes_h_l2768_c7_9615_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2768_c7_9615_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2768_c7_9615_return_output := t16_MUX_uxn_opcodes_h_l2768_c7_9615_return_output;

     -- n16_MUX[uxn_opcodes_h_l2783_c7_712c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2783_c7_712c_cond <= VAR_n16_MUX_uxn_opcodes_h_l2783_c7_712c_cond;
     n16_MUX_uxn_opcodes_h_l2783_c7_712c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2783_c7_712c_iftrue;
     n16_MUX_uxn_opcodes_h_l2783_c7_712c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2783_c7_712c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2783_c7_712c_return_output := n16_MUX_uxn_opcodes_h_l2783_c7_712c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2794_c7_3103] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_3103_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_3103_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_3103_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_3103_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_3103_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_3103_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_3103_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_3103_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2799_c7_4214] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2799_c7_4214_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2799_c7_4214_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2799_c7_4214_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2799_c7_4214_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2799_c7_4214_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2799_c7_4214_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2799_c7_4214_return_output := result_u8_value_MUX_uxn_opcodes_h_l2799_c7_4214_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2778_c7_4b85] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2778_c7_4b85_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2778_c7_4b85_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2778_c7_4b85_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2778_c7_4b85_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2778_c7_4b85_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2778_c7_4b85_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2778_c7_4b85_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2778_c7_4b85_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2786_c7_d992] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2786_c7_d992_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2786_c7_d992_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2786_c7_d992_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2786_c7_d992_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2786_c7_d992_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2786_c7_d992_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2786_c7_d992_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2786_c7_d992_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2799_c7_4214] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2799_c7_4214_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2799_c7_4214_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2799_c7_4214_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2799_c7_4214_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2799_c7_4214_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2799_c7_4214_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2799_c7_4214_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2799_c7_4214_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l2778_c7_4b85_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2783_c7_712c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_3103_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2799_c7_4214_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2783_c7_712c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2786_c7_d992_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_3103_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2799_c7_4214_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2775_c7_5e03_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2778_c7_4b85_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2786_c7_d992_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_3103_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2794_c7_3103_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2799_c7_4214_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2763_c7_90ce_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2768_c7_9615_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2794_c7_3103] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2794_c7_3103_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2794_c7_3103_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2794_c7_3103_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2794_c7_3103_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2794_c7_3103_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2794_c7_3103_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2794_c7_3103_return_output := result_u8_value_MUX_uxn_opcodes_h_l2794_c7_3103_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2775_c7_5e03] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2775_c7_5e03_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2775_c7_5e03_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2775_c7_5e03_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2775_c7_5e03_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2775_c7_5e03_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2775_c7_5e03_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2775_c7_5e03_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2775_c7_5e03_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2783_c7_712c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2783_c7_712c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2783_c7_712c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2783_c7_712c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2783_c7_712c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2783_c7_712c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2783_c7_712c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2783_c7_712c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2783_c7_712c_return_output;

     -- t16_MUX[uxn_opcodes_h_l2763_c7_90ce] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2763_c7_90ce_cond <= VAR_t16_MUX_uxn_opcodes_h_l2763_c7_90ce_cond;
     t16_MUX_uxn_opcodes_h_l2763_c7_90ce_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2763_c7_90ce_iftrue;
     t16_MUX_uxn_opcodes_h_l2763_c7_90ce_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2763_c7_90ce_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2763_c7_90ce_return_output := t16_MUX_uxn_opcodes_h_l2763_c7_90ce_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2786_c7_d992] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2786_c7_d992_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2786_c7_d992_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2786_c7_d992_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2786_c7_d992_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2786_c7_d992_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2786_c7_d992_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2786_c7_d992_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2786_c7_d992_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2794_c7_3103] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_3103_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_3103_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_3103_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_3103_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_3103_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_3103_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_3103_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_3103_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2794_c7_3103] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_3103_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_3103_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_3103_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_3103_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_3103_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_3103_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_3103_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_3103_return_output;

     -- n16_MUX[uxn_opcodes_h_l2778_c7_4b85] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2778_c7_4b85_cond <= VAR_n16_MUX_uxn_opcodes_h_l2778_c7_4b85_cond;
     n16_MUX_uxn_opcodes_h_l2778_c7_4b85_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2778_c7_4b85_iftrue;
     n16_MUX_uxn_opcodes_h_l2778_c7_4b85_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2778_c7_4b85_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2778_c7_4b85_return_output := n16_MUX_uxn_opcodes_h_l2778_c7_4b85_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l2775_c7_5e03_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2778_c7_4b85_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2786_c7_d992_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_3103_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2778_c7_4b85_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2783_c7_712c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2786_c7_d992_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_3103_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2771_c7_4f8f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2775_c7_5e03_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2783_c7_712c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2786_c7_d992_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2786_c7_d992_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2794_c7_3103_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2760_c7_bff8_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2763_c7_90ce_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2786_c7_d992] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2786_c7_d992_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2786_c7_d992_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2786_c7_d992_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2786_c7_d992_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2786_c7_d992_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2786_c7_d992_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2786_c7_d992_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2786_c7_d992_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2771_c7_4f8f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2771_c7_4f8f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2771_c7_4f8f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2771_c7_4f8f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2771_c7_4f8f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2771_c7_4f8f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2771_c7_4f8f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2771_c7_4f8f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2771_c7_4f8f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2786_c7_d992] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2786_c7_d992_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2786_c7_d992_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2786_c7_d992_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2786_c7_d992_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2786_c7_d992_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2786_c7_d992_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2786_c7_d992_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2786_c7_d992_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2778_c7_4b85] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2778_c7_4b85_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2778_c7_4b85_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2778_c7_4b85_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2778_c7_4b85_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2778_c7_4b85_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2778_c7_4b85_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2778_c7_4b85_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2778_c7_4b85_return_output;

     -- n16_MUX[uxn_opcodes_h_l2775_c7_5e03] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2775_c7_5e03_cond <= VAR_n16_MUX_uxn_opcodes_h_l2775_c7_5e03_cond;
     n16_MUX_uxn_opcodes_h_l2775_c7_5e03_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2775_c7_5e03_iftrue;
     n16_MUX_uxn_opcodes_h_l2775_c7_5e03_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2775_c7_5e03_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2775_c7_5e03_return_output := n16_MUX_uxn_opcodes_h_l2775_c7_5e03_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2786_c7_d992] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2786_c7_d992_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2786_c7_d992_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2786_c7_d992_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2786_c7_d992_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2786_c7_d992_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2786_c7_d992_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2786_c7_d992_return_output := result_u8_value_MUX_uxn_opcodes_h_l2786_c7_d992_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2783_c7_712c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2783_c7_712c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2783_c7_712c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2783_c7_712c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2783_c7_712c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2783_c7_712c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2783_c7_712c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2783_c7_712c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2783_c7_712c_return_output;

     -- t16_MUX[uxn_opcodes_h_l2760_c7_bff8] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2760_c7_bff8_cond <= VAR_t16_MUX_uxn_opcodes_h_l2760_c7_bff8_cond;
     t16_MUX_uxn_opcodes_h_l2760_c7_bff8_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2760_c7_bff8_iftrue;
     t16_MUX_uxn_opcodes_h_l2760_c7_bff8_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2760_c7_bff8_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2760_c7_bff8_return_output := t16_MUX_uxn_opcodes_h_l2760_c7_bff8_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2771_c7_4f8f_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2775_c7_5e03_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2783_c7_712c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2786_c7_d992_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2775_c7_5e03_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2778_c7_4b85_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2783_c7_712c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2786_c7_d992_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2768_c7_9615_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2771_c7_4f8f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2778_c7_4b85_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2783_c7_712c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2783_c7_712c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2786_c7_d992_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2755_c2_e1ef_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2760_c7_bff8_return_output;
     -- n16_MUX[uxn_opcodes_h_l2771_c7_4f8f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2771_c7_4f8f_cond <= VAR_n16_MUX_uxn_opcodes_h_l2771_c7_4f8f_cond;
     n16_MUX_uxn_opcodes_h_l2771_c7_4f8f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2771_c7_4f8f_iftrue;
     n16_MUX_uxn_opcodes_h_l2771_c7_4f8f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2771_c7_4f8f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2771_c7_4f8f_return_output := n16_MUX_uxn_opcodes_h_l2771_c7_4f8f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2778_c7_4b85] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2778_c7_4b85_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2778_c7_4b85_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2778_c7_4b85_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2778_c7_4b85_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2778_c7_4b85_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2778_c7_4b85_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2778_c7_4b85_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2778_c7_4b85_return_output;

     -- t16_MUX[uxn_opcodes_h_l2755_c2_e1ef] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2755_c2_e1ef_cond <= VAR_t16_MUX_uxn_opcodes_h_l2755_c2_e1ef_cond;
     t16_MUX_uxn_opcodes_h_l2755_c2_e1ef_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2755_c2_e1ef_iftrue;
     t16_MUX_uxn_opcodes_h_l2755_c2_e1ef_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2755_c2_e1ef_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2755_c2_e1ef_return_output := t16_MUX_uxn_opcodes_h_l2755_c2_e1ef_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2783_c7_712c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2783_c7_712c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2783_c7_712c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2783_c7_712c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2783_c7_712c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2783_c7_712c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2783_c7_712c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2783_c7_712c_return_output := result_u8_value_MUX_uxn_opcodes_h_l2783_c7_712c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2783_c7_712c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2783_c7_712c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2783_c7_712c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2783_c7_712c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2783_c7_712c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2783_c7_712c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2783_c7_712c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2783_c7_712c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2783_c7_712c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2775_c7_5e03] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2775_c7_5e03_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2775_c7_5e03_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2775_c7_5e03_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2775_c7_5e03_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2775_c7_5e03_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2775_c7_5e03_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2775_c7_5e03_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2775_c7_5e03_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2768_c7_9615] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2768_c7_9615_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2768_c7_9615_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2768_c7_9615_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2768_c7_9615_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2768_c7_9615_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2768_c7_9615_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2768_c7_9615_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2768_c7_9615_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2783_c7_712c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2783_c7_712c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2783_c7_712c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2783_c7_712c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2783_c7_712c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2783_c7_712c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2783_c7_712c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2783_c7_712c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2783_c7_712c_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l2768_c7_9615_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2771_c7_4f8f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2778_c7_4b85_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2783_c7_712c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2771_c7_4f8f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2775_c7_5e03_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2778_c7_4b85_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2783_c7_712c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2763_c7_90ce_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2768_c7_9615_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2775_c7_5e03_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2778_c7_4b85_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2778_c7_4b85_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2783_c7_712c_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2755_c2_e1ef_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2771_c7_4f8f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2771_c7_4f8f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2771_c7_4f8f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2771_c7_4f8f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2771_c7_4f8f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2771_c7_4f8f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2771_c7_4f8f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2771_c7_4f8f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2771_c7_4f8f_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2778_c7_4b85] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2778_c7_4b85_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2778_c7_4b85_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2778_c7_4b85_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2778_c7_4b85_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2778_c7_4b85_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2778_c7_4b85_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2778_c7_4b85_return_output := result_u8_value_MUX_uxn_opcodes_h_l2778_c7_4b85_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2778_c7_4b85] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2778_c7_4b85_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2778_c7_4b85_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2778_c7_4b85_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2778_c7_4b85_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2778_c7_4b85_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2778_c7_4b85_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2778_c7_4b85_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2778_c7_4b85_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2775_c7_5e03] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2775_c7_5e03_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2775_c7_5e03_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2775_c7_5e03_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2775_c7_5e03_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2775_c7_5e03_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2775_c7_5e03_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2775_c7_5e03_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2775_c7_5e03_return_output;

     -- n16_MUX[uxn_opcodes_h_l2768_c7_9615] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2768_c7_9615_cond <= VAR_n16_MUX_uxn_opcodes_h_l2768_c7_9615_cond;
     n16_MUX_uxn_opcodes_h_l2768_c7_9615_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2768_c7_9615_iftrue;
     n16_MUX_uxn_opcodes_h_l2768_c7_9615_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2768_c7_9615_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2768_c7_9615_return_output := n16_MUX_uxn_opcodes_h_l2768_c7_9615_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2763_c7_90ce] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2763_c7_90ce_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2763_c7_90ce_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2763_c7_90ce_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2763_c7_90ce_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2763_c7_90ce_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2763_c7_90ce_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2763_c7_90ce_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2763_c7_90ce_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2778_c7_4b85] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2778_c7_4b85_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2778_c7_4b85_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2778_c7_4b85_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2778_c7_4b85_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2778_c7_4b85_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2778_c7_4b85_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2778_c7_4b85_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2778_c7_4b85_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l2763_c7_90ce_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2768_c7_9615_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2775_c7_5e03_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2778_c7_4b85_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2768_c7_9615_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2771_c7_4f8f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2775_c7_5e03_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2778_c7_4b85_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2760_c7_bff8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2763_c7_90ce_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2771_c7_4f8f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2775_c7_5e03_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2775_c7_5e03_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2778_c7_4b85_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2768_c7_9615] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2768_c7_9615_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2768_c7_9615_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2768_c7_9615_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2768_c7_9615_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2768_c7_9615_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2768_c7_9615_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2768_c7_9615_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2768_c7_9615_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2771_c7_4f8f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2771_c7_4f8f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2771_c7_4f8f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2771_c7_4f8f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2771_c7_4f8f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2771_c7_4f8f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2771_c7_4f8f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2771_c7_4f8f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2771_c7_4f8f_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2775_c7_5e03] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2775_c7_5e03_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2775_c7_5e03_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2775_c7_5e03_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2775_c7_5e03_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2775_c7_5e03_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2775_c7_5e03_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2775_c7_5e03_return_output := result_u8_value_MUX_uxn_opcodes_h_l2775_c7_5e03_return_output;

     -- n16_MUX[uxn_opcodes_h_l2763_c7_90ce] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2763_c7_90ce_cond <= VAR_n16_MUX_uxn_opcodes_h_l2763_c7_90ce_cond;
     n16_MUX_uxn_opcodes_h_l2763_c7_90ce_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2763_c7_90ce_iftrue;
     n16_MUX_uxn_opcodes_h_l2763_c7_90ce_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2763_c7_90ce_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2763_c7_90ce_return_output := n16_MUX_uxn_opcodes_h_l2763_c7_90ce_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2760_c7_bff8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2760_c7_bff8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2760_c7_bff8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2760_c7_bff8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2760_c7_bff8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2760_c7_bff8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2760_c7_bff8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2760_c7_bff8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2760_c7_bff8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2775_c7_5e03] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2775_c7_5e03_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2775_c7_5e03_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2775_c7_5e03_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2775_c7_5e03_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2775_c7_5e03_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2775_c7_5e03_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2775_c7_5e03_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2775_c7_5e03_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2775_c7_5e03] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2775_c7_5e03_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2775_c7_5e03_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2775_c7_5e03_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2775_c7_5e03_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2775_c7_5e03_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2775_c7_5e03_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2775_c7_5e03_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2775_c7_5e03_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l2760_c7_bff8_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2763_c7_90ce_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2771_c7_4f8f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2775_c7_5e03_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2763_c7_90ce_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2768_c7_9615_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2771_c7_4f8f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2775_c7_5e03_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2755_c2_e1ef_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2760_c7_bff8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2768_c7_9615_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2771_c7_4f8f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2771_c7_4f8f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2775_c7_5e03_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2771_c7_4f8f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2771_c7_4f8f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2771_c7_4f8f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2771_c7_4f8f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2771_c7_4f8f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2771_c7_4f8f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2771_c7_4f8f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2771_c7_4f8f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2771_c7_4f8f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2755_c2_e1ef] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2755_c2_e1ef_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2755_c2_e1ef_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2755_c2_e1ef_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2755_c2_e1ef_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2755_c2_e1ef_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2755_c2_e1ef_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2755_c2_e1ef_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2755_c2_e1ef_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2768_c7_9615] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2768_c7_9615_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2768_c7_9615_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2768_c7_9615_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2768_c7_9615_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2768_c7_9615_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2768_c7_9615_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2768_c7_9615_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2768_c7_9615_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2763_c7_90ce] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2763_c7_90ce_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2763_c7_90ce_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2763_c7_90ce_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2763_c7_90ce_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2763_c7_90ce_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2763_c7_90ce_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2763_c7_90ce_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2763_c7_90ce_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2771_c7_4f8f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2771_c7_4f8f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2771_c7_4f8f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2771_c7_4f8f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2771_c7_4f8f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2771_c7_4f8f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2771_c7_4f8f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2771_c7_4f8f_return_output := result_u8_value_MUX_uxn_opcodes_h_l2771_c7_4f8f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2771_c7_4f8f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2771_c7_4f8f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2771_c7_4f8f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2771_c7_4f8f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2771_c7_4f8f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2771_c7_4f8f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2771_c7_4f8f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2771_c7_4f8f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2771_c7_4f8f_return_output;

     -- n16_MUX[uxn_opcodes_h_l2760_c7_bff8] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2760_c7_bff8_cond <= VAR_n16_MUX_uxn_opcodes_h_l2760_c7_bff8_cond;
     n16_MUX_uxn_opcodes_h_l2760_c7_bff8_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2760_c7_bff8_iftrue;
     n16_MUX_uxn_opcodes_h_l2760_c7_bff8_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2760_c7_bff8_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2760_c7_bff8_return_output := n16_MUX_uxn_opcodes_h_l2760_c7_bff8_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l2755_c2_e1ef_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2760_c7_bff8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2768_c7_9615_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2771_c7_4f8f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2760_c7_bff8_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2763_c7_90ce_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2768_c7_9615_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2771_c7_4f8f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2763_c7_90ce_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2768_c7_9615_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2768_c7_9615_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2771_c7_4f8f_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2768_c7_9615] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2768_c7_9615_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2768_c7_9615_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2768_c7_9615_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2768_c7_9615_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2768_c7_9615_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2768_c7_9615_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2768_c7_9615_return_output := result_u8_value_MUX_uxn_opcodes_h_l2768_c7_9615_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2768_c7_9615] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2768_c7_9615_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2768_c7_9615_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2768_c7_9615_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2768_c7_9615_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2768_c7_9615_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2768_c7_9615_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2768_c7_9615_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2768_c7_9615_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2760_c7_bff8] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2760_c7_bff8_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2760_c7_bff8_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2760_c7_bff8_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2760_c7_bff8_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2760_c7_bff8_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2760_c7_bff8_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2760_c7_bff8_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2760_c7_bff8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2768_c7_9615] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2768_c7_9615_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2768_c7_9615_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2768_c7_9615_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2768_c7_9615_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2768_c7_9615_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2768_c7_9615_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2768_c7_9615_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2768_c7_9615_return_output;

     -- n16_MUX[uxn_opcodes_h_l2755_c2_e1ef] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2755_c2_e1ef_cond <= VAR_n16_MUX_uxn_opcodes_h_l2755_c2_e1ef_cond;
     n16_MUX_uxn_opcodes_h_l2755_c2_e1ef_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2755_c2_e1ef_iftrue;
     n16_MUX_uxn_opcodes_h_l2755_c2_e1ef_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2755_c2_e1ef_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2755_c2_e1ef_return_output := n16_MUX_uxn_opcodes_h_l2755_c2_e1ef_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2763_c7_90ce] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2763_c7_90ce_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2763_c7_90ce_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2763_c7_90ce_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2763_c7_90ce_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2763_c7_90ce_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2763_c7_90ce_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2763_c7_90ce_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2763_c7_90ce_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2755_c2_e1ef_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2763_c7_90ce_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2768_c7_9615_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2755_c2_e1ef_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2760_c7_bff8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2763_c7_90ce_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2768_c7_9615_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2760_c7_bff8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2763_c7_90ce_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2763_c7_90ce_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2768_c7_9615_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2763_c7_90ce] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2763_c7_90ce_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2763_c7_90ce_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2763_c7_90ce_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2763_c7_90ce_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2763_c7_90ce_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2763_c7_90ce_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2763_c7_90ce_return_output := result_u8_value_MUX_uxn_opcodes_h_l2763_c7_90ce_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2763_c7_90ce] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2763_c7_90ce_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2763_c7_90ce_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2763_c7_90ce_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2763_c7_90ce_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2763_c7_90ce_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2763_c7_90ce_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2763_c7_90ce_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2763_c7_90ce_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2760_c7_bff8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2760_c7_bff8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2760_c7_bff8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2760_c7_bff8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2760_c7_bff8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2760_c7_bff8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2760_c7_bff8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2760_c7_bff8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2760_c7_bff8_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2755_c2_e1ef] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2755_c2_e1ef_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2755_c2_e1ef_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2755_c2_e1ef_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2755_c2_e1ef_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2755_c2_e1ef_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2755_c2_e1ef_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2755_c2_e1ef_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2755_c2_e1ef_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2763_c7_90ce] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2763_c7_90ce_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2763_c7_90ce_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2763_c7_90ce_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2763_c7_90ce_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2763_c7_90ce_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2763_c7_90ce_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2763_c7_90ce_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2763_c7_90ce_return_output;

     -- Submodule level 12
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2760_c7_bff8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2763_c7_90ce_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2760_c7_bff8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2763_c7_90ce_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c2_e1ef_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2760_c7_bff8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2760_c7_bff8_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2763_c7_90ce_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2760_c7_bff8] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2760_c7_bff8_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2760_c7_bff8_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2760_c7_bff8_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2760_c7_bff8_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2760_c7_bff8_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2760_c7_bff8_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2760_c7_bff8_return_output := result_u8_value_MUX_uxn_opcodes_h_l2760_c7_bff8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2755_c2_e1ef] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c2_e1ef_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c2_e1ef_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c2_e1ef_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c2_e1ef_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c2_e1ef_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c2_e1ef_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c2_e1ef_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c2_e1ef_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2760_c7_bff8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2760_c7_bff8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2760_c7_bff8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2760_c7_bff8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2760_c7_bff8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2760_c7_bff8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2760_c7_bff8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2760_c7_bff8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2760_c7_bff8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2760_c7_bff8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2760_c7_bff8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2760_c7_bff8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2760_c7_bff8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2760_c7_bff8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2760_c7_bff8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2760_c7_bff8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2760_c7_bff8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2760_c7_bff8_return_output;

     -- Submodule level 13
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2755_c2_e1ef_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2760_c7_bff8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2755_c2_e1ef_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2760_c7_bff8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2755_c2_e1ef_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2760_c7_bff8_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2755_c2_e1ef] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2755_c2_e1ef_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2755_c2_e1ef_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2755_c2_e1ef_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2755_c2_e1ef_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2755_c2_e1ef_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2755_c2_e1ef_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2755_c2_e1ef_return_output := result_u8_value_MUX_uxn_opcodes_h_l2755_c2_e1ef_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2755_c2_e1ef] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2755_c2_e1ef_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2755_c2_e1ef_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2755_c2_e1ef_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2755_c2_e1ef_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2755_c2_e1ef_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2755_c2_e1ef_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2755_c2_e1ef_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2755_c2_e1ef_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2755_c2_e1ef] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2755_c2_e1ef_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2755_c2_e1ef_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2755_c2_e1ef_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2755_c2_e1ef_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2755_c2_e1ef_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2755_c2_e1ef_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2755_c2_e1ef_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2755_c2_e1ef_return_output;

     -- Submodule level 14
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_641b_uxn_opcodes_h_l2751_l2813_DUPLICATE_c56d LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_641b_uxn_opcodes_h_l2751_l2813_DUPLICATE_c56d_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_641b(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c2_e1ef_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2755_c2_e1ef_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2755_c2_e1ef_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2755_c2_e1ef_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2755_c2_e1ef_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2755_c2_e1ef_return_output);

     -- Submodule level 15
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_641b_uxn_opcodes_h_l2751_l2813_DUPLICATE_c56d_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_641b_uxn_opcodes_h_l2751_l2813_DUPLICATE_c56d_return_output;
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
