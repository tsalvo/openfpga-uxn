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
-- Submodules: 71
entity sub2_0CLK_4712a73c is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end sub2_0CLK_4712a73c;
architecture arch of sub2_0CLK_4712a73c is
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
-- BIN_OP_EQ[uxn_opcodes_h_l2459_c6_ee4a]
signal BIN_OP_EQ_uxn_opcodes_h_l2459_c6_ee4a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2459_c6_ee4a_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2459_c6_ee4a_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2459_c2_d7ae]
signal n16_MUX_uxn_opcodes_h_l2459_c2_d7ae_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2459_c2_d7ae_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2459_c2_d7ae_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2459_c2_d7ae_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2459_c2_d7ae]
signal t16_MUX_uxn_opcodes_h_l2459_c2_d7ae_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2459_c2_d7ae_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2459_c2_d7ae_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2459_c2_d7ae_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2459_c2_d7ae]
signal tmp16_MUX_uxn_opcodes_h_l2459_c2_d7ae_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2459_c2_d7ae_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2459_c2_d7ae_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2459_c2_d7ae_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2459_c2_d7ae]
signal result_u8_value_MUX_uxn_opcodes_h_l2459_c2_d7ae_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2459_c2_d7ae_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2459_c2_d7ae_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2459_c2_d7ae_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2459_c2_d7ae]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2459_c2_d7ae_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2459_c2_d7ae_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2459_c2_d7ae_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2459_c2_d7ae_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2459_c2_d7ae]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2459_c2_d7ae_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2459_c2_d7ae_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2459_c2_d7ae_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2459_c2_d7ae_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2459_c2_d7ae]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2459_c2_d7ae_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2459_c2_d7ae_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2459_c2_d7ae_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2459_c2_d7ae_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2459_c2_d7ae]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2459_c2_d7ae_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2459_c2_d7ae_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2459_c2_d7ae_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2459_c2_d7ae_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2466_c11_f776]
signal BIN_OP_EQ_uxn_opcodes_h_l2466_c11_f776_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2466_c11_f776_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2466_c11_f776_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2466_c7_6774]
signal n16_MUX_uxn_opcodes_h_l2466_c7_6774_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2466_c7_6774_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2466_c7_6774_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2466_c7_6774_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2466_c7_6774]
signal t16_MUX_uxn_opcodes_h_l2466_c7_6774_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2466_c7_6774_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2466_c7_6774_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2466_c7_6774_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2466_c7_6774]
signal tmp16_MUX_uxn_opcodes_h_l2466_c7_6774_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2466_c7_6774_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2466_c7_6774_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2466_c7_6774_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2466_c7_6774]
signal result_u8_value_MUX_uxn_opcodes_h_l2466_c7_6774_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2466_c7_6774_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2466_c7_6774_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2466_c7_6774_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2466_c7_6774]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2466_c7_6774_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2466_c7_6774_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2466_c7_6774_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2466_c7_6774_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2466_c7_6774]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2466_c7_6774_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2466_c7_6774_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2466_c7_6774_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2466_c7_6774_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2466_c7_6774]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2466_c7_6774_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2466_c7_6774_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2466_c7_6774_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2466_c7_6774_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2466_c7_6774]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2466_c7_6774_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2466_c7_6774_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2466_c7_6774_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2466_c7_6774_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2469_c11_a1aa]
signal BIN_OP_EQ_uxn_opcodes_h_l2469_c11_a1aa_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2469_c11_a1aa_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2469_c11_a1aa_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2469_c7_bd6f]
signal n16_MUX_uxn_opcodes_h_l2469_c7_bd6f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2469_c7_bd6f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2469_c7_bd6f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2469_c7_bd6f_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2469_c7_bd6f]
signal t16_MUX_uxn_opcodes_h_l2469_c7_bd6f_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2469_c7_bd6f_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2469_c7_bd6f_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2469_c7_bd6f_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2469_c7_bd6f]
signal tmp16_MUX_uxn_opcodes_h_l2469_c7_bd6f_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2469_c7_bd6f_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2469_c7_bd6f_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2469_c7_bd6f_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2469_c7_bd6f]
signal result_u8_value_MUX_uxn_opcodes_h_l2469_c7_bd6f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2469_c7_bd6f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2469_c7_bd6f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2469_c7_bd6f_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2469_c7_bd6f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2469_c7_bd6f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2469_c7_bd6f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2469_c7_bd6f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2469_c7_bd6f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2469_c7_bd6f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2469_c7_bd6f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2469_c7_bd6f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2469_c7_bd6f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2469_c7_bd6f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2469_c7_bd6f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2469_c7_bd6f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2469_c7_bd6f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2469_c7_bd6f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2469_c7_bd6f_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2469_c7_bd6f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2469_c7_bd6f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2469_c7_bd6f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2469_c7_bd6f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2469_c7_bd6f_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2474_c11_bd0a]
signal BIN_OP_EQ_uxn_opcodes_h_l2474_c11_bd0a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2474_c11_bd0a_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2474_c11_bd0a_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2474_c7_e0ed]
signal n16_MUX_uxn_opcodes_h_l2474_c7_e0ed_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2474_c7_e0ed_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2474_c7_e0ed_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2474_c7_e0ed_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2474_c7_e0ed]
signal t16_MUX_uxn_opcodes_h_l2474_c7_e0ed_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2474_c7_e0ed_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2474_c7_e0ed_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2474_c7_e0ed_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2474_c7_e0ed]
signal tmp16_MUX_uxn_opcodes_h_l2474_c7_e0ed_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2474_c7_e0ed_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2474_c7_e0ed_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2474_c7_e0ed_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2474_c7_e0ed]
signal result_u8_value_MUX_uxn_opcodes_h_l2474_c7_e0ed_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2474_c7_e0ed_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2474_c7_e0ed_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2474_c7_e0ed_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2474_c7_e0ed]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2474_c7_e0ed_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2474_c7_e0ed_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2474_c7_e0ed_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2474_c7_e0ed_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2474_c7_e0ed]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2474_c7_e0ed_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2474_c7_e0ed_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2474_c7_e0ed_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2474_c7_e0ed_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2474_c7_e0ed]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2474_c7_e0ed_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2474_c7_e0ed_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2474_c7_e0ed_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2474_c7_e0ed_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2474_c7_e0ed]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2474_c7_e0ed_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2474_c7_e0ed_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2474_c7_e0ed_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2474_c7_e0ed_return_output : signed(3 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2475_c3_ce24]
signal BIN_OP_OR_uxn_opcodes_h_l2475_c3_ce24_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2475_c3_ce24_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2475_c3_ce24_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2478_c11_4038]
signal BIN_OP_EQ_uxn_opcodes_h_l2478_c11_4038_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2478_c11_4038_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2478_c11_4038_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2478_c7_6522]
signal n16_MUX_uxn_opcodes_h_l2478_c7_6522_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2478_c7_6522_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2478_c7_6522_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2478_c7_6522_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2478_c7_6522]
signal tmp16_MUX_uxn_opcodes_h_l2478_c7_6522_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2478_c7_6522_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2478_c7_6522_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2478_c7_6522_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2478_c7_6522]
signal result_u8_value_MUX_uxn_opcodes_h_l2478_c7_6522_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2478_c7_6522_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2478_c7_6522_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2478_c7_6522_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2478_c7_6522]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2478_c7_6522_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2478_c7_6522_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2478_c7_6522_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2478_c7_6522_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2478_c7_6522]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2478_c7_6522_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2478_c7_6522_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2478_c7_6522_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2478_c7_6522_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2478_c7_6522]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2478_c7_6522_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2478_c7_6522_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2478_c7_6522_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2478_c7_6522_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2478_c7_6522]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2478_c7_6522_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2478_c7_6522_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2478_c7_6522_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2478_c7_6522_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2482_c11_b04c]
signal BIN_OP_EQ_uxn_opcodes_h_l2482_c11_b04c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2482_c11_b04c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2482_c11_b04c_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2482_c7_1923]
signal n16_MUX_uxn_opcodes_h_l2482_c7_1923_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2482_c7_1923_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2482_c7_1923_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2482_c7_1923_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2482_c7_1923]
signal tmp16_MUX_uxn_opcodes_h_l2482_c7_1923_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2482_c7_1923_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2482_c7_1923_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2482_c7_1923_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2482_c7_1923]
signal result_u8_value_MUX_uxn_opcodes_h_l2482_c7_1923_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2482_c7_1923_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2482_c7_1923_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2482_c7_1923_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2482_c7_1923]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2482_c7_1923_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2482_c7_1923_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2482_c7_1923_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2482_c7_1923_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2482_c7_1923]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2482_c7_1923_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2482_c7_1923_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2482_c7_1923_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2482_c7_1923_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2482_c7_1923]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2482_c7_1923_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2482_c7_1923_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2482_c7_1923_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2482_c7_1923_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2482_c7_1923]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2482_c7_1923_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2482_c7_1923_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2482_c7_1923_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2482_c7_1923_return_output : signed(3 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2483_c3_9096]
signal BIN_OP_OR_uxn_opcodes_h_l2483_c3_9096_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2483_c3_9096_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2483_c3_9096_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l2484_c11_9222]
signal BIN_OP_MINUS_uxn_opcodes_h_l2484_c11_9222_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l2484_c11_9222_right : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l2484_c11_9222_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2486_c30_dba3]
signal sp_relative_shift_uxn_opcodes_h_l2486_c30_dba3_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2486_c30_dba3_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2486_c30_dba3_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2486_c30_dba3_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2491_c11_9858]
signal BIN_OP_EQ_uxn_opcodes_h_l2491_c11_9858_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2491_c11_9858_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2491_c11_9858_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2491_c7_a095]
signal result_u8_value_MUX_uxn_opcodes_h_l2491_c7_a095_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2491_c7_a095_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2491_c7_a095_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2491_c7_a095_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2491_c7_a095]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2491_c7_a095_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2491_c7_a095_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2491_c7_a095_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2491_c7_a095_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2491_c7_a095]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2491_c7_a095_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2491_c7_a095_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2491_c7_a095_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2491_c7_a095_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2491_c7_a095]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2491_c7_a095_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2491_c7_a095_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2491_c7_a095_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2491_c7_a095_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2491_c7_a095]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2491_c7_a095_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2491_c7_a095_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2491_c7_a095_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2491_c7_a095_return_output : signed(3 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2494_c31_b572]
signal CONST_SR_8_uxn_opcodes_h_l2494_c31_b572_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2494_c31_b572_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2496_c11_c909]
signal BIN_OP_EQ_uxn_opcodes_h_l2496_c11_c909_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2496_c11_c909_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2496_c11_c909_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2496_c7_f2eb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2496_c7_f2eb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2496_c7_f2eb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2496_c7_f2eb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2496_c7_f2eb_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2496_c7_f2eb]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2496_c7_f2eb_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2496_c7_f2eb_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2496_c7_f2eb_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2496_c7_f2eb_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2480_l2471_DUPLICATE_297f
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2480_l2471_DUPLICATE_297f_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2480_l2471_DUPLICATE_297f_return_output : unsigned(15 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l2459_c6_ee4a
BIN_OP_EQ_uxn_opcodes_h_l2459_c6_ee4a : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2459_c6_ee4a_left,
BIN_OP_EQ_uxn_opcodes_h_l2459_c6_ee4a_right,
BIN_OP_EQ_uxn_opcodes_h_l2459_c6_ee4a_return_output);

-- n16_MUX_uxn_opcodes_h_l2459_c2_d7ae
n16_MUX_uxn_opcodes_h_l2459_c2_d7ae : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2459_c2_d7ae_cond,
n16_MUX_uxn_opcodes_h_l2459_c2_d7ae_iftrue,
n16_MUX_uxn_opcodes_h_l2459_c2_d7ae_iffalse,
n16_MUX_uxn_opcodes_h_l2459_c2_d7ae_return_output);

-- t16_MUX_uxn_opcodes_h_l2459_c2_d7ae
t16_MUX_uxn_opcodes_h_l2459_c2_d7ae : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2459_c2_d7ae_cond,
t16_MUX_uxn_opcodes_h_l2459_c2_d7ae_iftrue,
t16_MUX_uxn_opcodes_h_l2459_c2_d7ae_iffalse,
t16_MUX_uxn_opcodes_h_l2459_c2_d7ae_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2459_c2_d7ae
tmp16_MUX_uxn_opcodes_h_l2459_c2_d7ae : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2459_c2_d7ae_cond,
tmp16_MUX_uxn_opcodes_h_l2459_c2_d7ae_iftrue,
tmp16_MUX_uxn_opcodes_h_l2459_c2_d7ae_iffalse,
tmp16_MUX_uxn_opcodes_h_l2459_c2_d7ae_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2459_c2_d7ae
result_u8_value_MUX_uxn_opcodes_h_l2459_c2_d7ae : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2459_c2_d7ae_cond,
result_u8_value_MUX_uxn_opcodes_h_l2459_c2_d7ae_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2459_c2_d7ae_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2459_c2_d7ae_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2459_c2_d7ae
result_is_stack_write_MUX_uxn_opcodes_h_l2459_c2_d7ae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2459_c2_d7ae_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2459_c2_d7ae_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2459_c2_d7ae_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2459_c2_d7ae_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2459_c2_d7ae
result_is_opc_done_MUX_uxn_opcodes_h_l2459_c2_d7ae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2459_c2_d7ae_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2459_c2_d7ae_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2459_c2_d7ae_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2459_c2_d7ae_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2459_c2_d7ae
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2459_c2_d7ae : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2459_c2_d7ae_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2459_c2_d7ae_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2459_c2_d7ae_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2459_c2_d7ae_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2459_c2_d7ae
result_sp_relative_shift_MUX_uxn_opcodes_h_l2459_c2_d7ae : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2459_c2_d7ae_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2459_c2_d7ae_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2459_c2_d7ae_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2459_c2_d7ae_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2466_c11_f776
BIN_OP_EQ_uxn_opcodes_h_l2466_c11_f776 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2466_c11_f776_left,
BIN_OP_EQ_uxn_opcodes_h_l2466_c11_f776_right,
BIN_OP_EQ_uxn_opcodes_h_l2466_c11_f776_return_output);

-- n16_MUX_uxn_opcodes_h_l2466_c7_6774
n16_MUX_uxn_opcodes_h_l2466_c7_6774 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2466_c7_6774_cond,
n16_MUX_uxn_opcodes_h_l2466_c7_6774_iftrue,
n16_MUX_uxn_opcodes_h_l2466_c7_6774_iffalse,
n16_MUX_uxn_opcodes_h_l2466_c7_6774_return_output);

-- t16_MUX_uxn_opcodes_h_l2466_c7_6774
t16_MUX_uxn_opcodes_h_l2466_c7_6774 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2466_c7_6774_cond,
t16_MUX_uxn_opcodes_h_l2466_c7_6774_iftrue,
t16_MUX_uxn_opcodes_h_l2466_c7_6774_iffalse,
t16_MUX_uxn_opcodes_h_l2466_c7_6774_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2466_c7_6774
tmp16_MUX_uxn_opcodes_h_l2466_c7_6774 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2466_c7_6774_cond,
tmp16_MUX_uxn_opcodes_h_l2466_c7_6774_iftrue,
tmp16_MUX_uxn_opcodes_h_l2466_c7_6774_iffalse,
tmp16_MUX_uxn_opcodes_h_l2466_c7_6774_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2466_c7_6774
result_u8_value_MUX_uxn_opcodes_h_l2466_c7_6774 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2466_c7_6774_cond,
result_u8_value_MUX_uxn_opcodes_h_l2466_c7_6774_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2466_c7_6774_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2466_c7_6774_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2466_c7_6774
result_is_stack_write_MUX_uxn_opcodes_h_l2466_c7_6774 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2466_c7_6774_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2466_c7_6774_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2466_c7_6774_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2466_c7_6774_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2466_c7_6774
result_is_opc_done_MUX_uxn_opcodes_h_l2466_c7_6774 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2466_c7_6774_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2466_c7_6774_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2466_c7_6774_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2466_c7_6774_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2466_c7_6774
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2466_c7_6774 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2466_c7_6774_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2466_c7_6774_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2466_c7_6774_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2466_c7_6774_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2466_c7_6774
result_sp_relative_shift_MUX_uxn_opcodes_h_l2466_c7_6774 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2466_c7_6774_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2466_c7_6774_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2466_c7_6774_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2466_c7_6774_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2469_c11_a1aa
BIN_OP_EQ_uxn_opcodes_h_l2469_c11_a1aa : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2469_c11_a1aa_left,
BIN_OP_EQ_uxn_opcodes_h_l2469_c11_a1aa_right,
BIN_OP_EQ_uxn_opcodes_h_l2469_c11_a1aa_return_output);

-- n16_MUX_uxn_opcodes_h_l2469_c7_bd6f
n16_MUX_uxn_opcodes_h_l2469_c7_bd6f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2469_c7_bd6f_cond,
n16_MUX_uxn_opcodes_h_l2469_c7_bd6f_iftrue,
n16_MUX_uxn_opcodes_h_l2469_c7_bd6f_iffalse,
n16_MUX_uxn_opcodes_h_l2469_c7_bd6f_return_output);

-- t16_MUX_uxn_opcodes_h_l2469_c7_bd6f
t16_MUX_uxn_opcodes_h_l2469_c7_bd6f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2469_c7_bd6f_cond,
t16_MUX_uxn_opcodes_h_l2469_c7_bd6f_iftrue,
t16_MUX_uxn_opcodes_h_l2469_c7_bd6f_iffalse,
t16_MUX_uxn_opcodes_h_l2469_c7_bd6f_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2469_c7_bd6f
tmp16_MUX_uxn_opcodes_h_l2469_c7_bd6f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2469_c7_bd6f_cond,
tmp16_MUX_uxn_opcodes_h_l2469_c7_bd6f_iftrue,
tmp16_MUX_uxn_opcodes_h_l2469_c7_bd6f_iffalse,
tmp16_MUX_uxn_opcodes_h_l2469_c7_bd6f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2469_c7_bd6f
result_u8_value_MUX_uxn_opcodes_h_l2469_c7_bd6f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2469_c7_bd6f_cond,
result_u8_value_MUX_uxn_opcodes_h_l2469_c7_bd6f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2469_c7_bd6f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2469_c7_bd6f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2469_c7_bd6f
result_is_stack_write_MUX_uxn_opcodes_h_l2469_c7_bd6f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2469_c7_bd6f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2469_c7_bd6f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2469_c7_bd6f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2469_c7_bd6f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2469_c7_bd6f
result_is_opc_done_MUX_uxn_opcodes_h_l2469_c7_bd6f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2469_c7_bd6f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2469_c7_bd6f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2469_c7_bd6f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2469_c7_bd6f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2469_c7_bd6f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2469_c7_bd6f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2469_c7_bd6f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2469_c7_bd6f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2469_c7_bd6f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2469_c7_bd6f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2469_c7_bd6f
result_sp_relative_shift_MUX_uxn_opcodes_h_l2469_c7_bd6f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2469_c7_bd6f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2469_c7_bd6f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2469_c7_bd6f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2469_c7_bd6f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2474_c11_bd0a
BIN_OP_EQ_uxn_opcodes_h_l2474_c11_bd0a : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2474_c11_bd0a_left,
BIN_OP_EQ_uxn_opcodes_h_l2474_c11_bd0a_right,
BIN_OP_EQ_uxn_opcodes_h_l2474_c11_bd0a_return_output);

-- n16_MUX_uxn_opcodes_h_l2474_c7_e0ed
n16_MUX_uxn_opcodes_h_l2474_c7_e0ed : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2474_c7_e0ed_cond,
n16_MUX_uxn_opcodes_h_l2474_c7_e0ed_iftrue,
n16_MUX_uxn_opcodes_h_l2474_c7_e0ed_iffalse,
n16_MUX_uxn_opcodes_h_l2474_c7_e0ed_return_output);

-- t16_MUX_uxn_opcodes_h_l2474_c7_e0ed
t16_MUX_uxn_opcodes_h_l2474_c7_e0ed : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2474_c7_e0ed_cond,
t16_MUX_uxn_opcodes_h_l2474_c7_e0ed_iftrue,
t16_MUX_uxn_opcodes_h_l2474_c7_e0ed_iffalse,
t16_MUX_uxn_opcodes_h_l2474_c7_e0ed_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2474_c7_e0ed
tmp16_MUX_uxn_opcodes_h_l2474_c7_e0ed : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2474_c7_e0ed_cond,
tmp16_MUX_uxn_opcodes_h_l2474_c7_e0ed_iftrue,
tmp16_MUX_uxn_opcodes_h_l2474_c7_e0ed_iffalse,
tmp16_MUX_uxn_opcodes_h_l2474_c7_e0ed_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2474_c7_e0ed
result_u8_value_MUX_uxn_opcodes_h_l2474_c7_e0ed : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2474_c7_e0ed_cond,
result_u8_value_MUX_uxn_opcodes_h_l2474_c7_e0ed_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2474_c7_e0ed_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2474_c7_e0ed_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2474_c7_e0ed
result_is_stack_write_MUX_uxn_opcodes_h_l2474_c7_e0ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2474_c7_e0ed_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2474_c7_e0ed_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2474_c7_e0ed_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2474_c7_e0ed_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2474_c7_e0ed
result_is_opc_done_MUX_uxn_opcodes_h_l2474_c7_e0ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2474_c7_e0ed_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2474_c7_e0ed_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2474_c7_e0ed_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2474_c7_e0ed_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2474_c7_e0ed
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2474_c7_e0ed : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2474_c7_e0ed_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2474_c7_e0ed_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2474_c7_e0ed_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2474_c7_e0ed_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2474_c7_e0ed
result_sp_relative_shift_MUX_uxn_opcodes_h_l2474_c7_e0ed : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2474_c7_e0ed_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2474_c7_e0ed_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2474_c7_e0ed_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2474_c7_e0ed_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2475_c3_ce24
BIN_OP_OR_uxn_opcodes_h_l2475_c3_ce24 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2475_c3_ce24_left,
BIN_OP_OR_uxn_opcodes_h_l2475_c3_ce24_right,
BIN_OP_OR_uxn_opcodes_h_l2475_c3_ce24_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2478_c11_4038
BIN_OP_EQ_uxn_opcodes_h_l2478_c11_4038 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2478_c11_4038_left,
BIN_OP_EQ_uxn_opcodes_h_l2478_c11_4038_right,
BIN_OP_EQ_uxn_opcodes_h_l2478_c11_4038_return_output);

-- n16_MUX_uxn_opcodes_h_l2478_c7_6522
n16_MUX_uxn_opcodes_h_l2478_c7_6522 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2478_c7_6522_cond,
n16_MUX_uxn_opcodes_h_l2478_c7_6522_iftrue,
n16_MUX_uxn_opcodes_h_l2478_c7_6522_iffalse,
n16_MUX_uxn_opcodes_h_l2478_c7_6522_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2478_c7_6522
tmp16_MUX_uxn_opcodes_h_l2478_c7_6522 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2478_c7_6522_cond,
tmp16_MUX_uxn_opcodes_h_l2478_c7_6522_iftrue,
tmp16_MUX_uxn_opcodes_h_l2478_c7_6522_iffalse,
tmp16_MUX_uxn_opcodes_h_l2478_c7_6522_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2478_c7_6522
result_u8_value_MUX_uxn_opcodes_h_l2478_c7_6522 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2478_c7_6522_cond,
result_u8_value_MUX_uxn_opcodes_h_l2478_c7_6522_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2478_c7_6522_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2478_c7_6522_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2478_c7_6522
result_is_stack_write_MUX_uxn_opcodes_h_l2478_c7_6522 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2478_c7_6522_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2478_c7_6522_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2478_c7_6522_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2478_c7_6522_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2478_c7_6522
result_is_opc_done_MUX_uxn_opcodes_h_l2478_c7_6522 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2478_c7_6522_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2478_c7_6522_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2478_c7_6522_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2478_c7_6522_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2478_c7_6522
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2478_c7_6522 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2478_c7_6522_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2478_c7_6522_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2478_c7_6522_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2478_c7_6522_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2478_c7_6522
result_sp_relative_shift_MUX_uxn_opcodes_h_l2478_c7_6522 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2478_c7_6522_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2478_c7_6522_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2478_c7_6522_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2478_c7_6522_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2482_c11_b04c
BIN_OP_EQ_uxn_opcodes_h_l2482_c11_b04c : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2482_c11_b04c_left,
BIN_OP_EQ_uxn_opcodes_h_l2482_c11_b04c_right,
BIN_OP_EQ_uxn_opcodes_h_l2482_c11_b04c_return_output);

-- n16_MUX_uxn_opcodes_h_l2482_c7_1923
n16_MUX_uxn_opcodes_h_l2482_c7_1923 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2482_c7_1923_cond,
n16_MUX_uxn_opcodes_h_l2482_c7_1923_iftrue,
n16_MUX_uxn_opcodes_h_l2482_c7_1923_iffalse,
n16_MUX_uxn_opcodes_h_l2482_c7_1923_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2482_c7_1923
tmp16_MUX_uxn_opcodes_h_l2482_c7_1923 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2482_c7_1923_cond,
tmp16_MUX_uxn_opcodes_h_l2482_c7_1923_iftrue,
tmp16_MUX_uxn_opcodes_h_l2482_c7_1923_iffalse,
tmp16_MUX_uxn_opcodes_h_l2482_c7_1923_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2482_c7_1923
result_u8_value_MUX_uxn_opcodes_h_l2482_c7_1923 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2482_c7_1923_cond,
result_u8_value_MUX_uxn_opcodes_h_l2482_c7_1923_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2482_c7_1923_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2482_c7_1923_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2482_c7_1923
result_is_stack_write_MUX_uxn_opcodes_h_l2482_c7_1923 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2482_c7_1923_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2482_c7_1923_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2482_c7_1923_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2482_c7_1923_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2482_c7_1923
result_is_opc_done_MUX_uxn_opcodes_h_l2482_c7_1923 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2482_c7_1923_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2482_c7_1923_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2482_c7_1923_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2482_c7_1923_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2482_c7_1923
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2482_c7_1923 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2482_c7_1923_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2482_c7_1923_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2482_c7_1923_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2482_c7_1923_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2482_c7_1923
result_sp_relative_shift_MUX_uxn_opcodes_h_l2482_c7_1923 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2482_c7_1923_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2482_c7_1923_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2482_c7_1923_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2482_c7_1923_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2483_c3_9096
BIN_OP_OR_uxn_opcodes_h_l2483_c3_9096 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2483_c3_9096_left,
BIN_OP_OR_uxn_opcodes_h_l2483_c3_9096_right,
BIN_OP_OR_uxn_opcodes_h_l2483_c3_9096_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l2484_c11_9222
BIN_OP_MINUS_uxn_opcodes_h_l2484_c11_9222 : entity work.BIN_OP_MINUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l2484_c11_9222_left,
BIN_OP_MINUS_uxn_opcodes_h_l2484_c11_9222_right,
BIN_OP_MINUS_uxn_opcodes_h_l2484_c11_9222_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2486_c30_dba3
sp_relative_shift_uxn_opcodes_h_l2486_c30_dba3 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2486_c30_dba3_ins,
sp_relative_shift_uxn_opcodes_h_l2486_c30_dba3_x,
sp_relative_shift_uxn_opcodes_h_l2486_c30_dba3_y,
sp_relative_shift_uxn_opcodes_h_l2486_c30_dba3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2491_c11_9858
BIN_OP_EQ_uxn_opcodes_h_l2491_c11_9858 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2491_c11_9858_left,
BIN_OP_EQ_uxn_opcodes_h_l2491_c11_9858_right,
BIN_OP_EQ_uxn_opcodes_h_l2491_c11_9858_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2491_c7_a095
result_u8_value_MUX_uxn_opcodes_h_l2491_c7_a095 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2491_c7_a095_cond,
result_u8_value_MUX_uxn_opcodes_h_l2491_c7_a095_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2491_c7_a095_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2491_c7_a095_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2491_c7_a095
result_is_stack_write_MUX_uxn_opcodes_h_l2491_c7_a095 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2491_c7_a095_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2491_c7_a095_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2491_c7_a095_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2491_c7_a095_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2491_c7_a095
result_is_opc_done_MUX_uxn_opcodes_h_l2491_c7_a095 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2491_c7_a095_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2491_c7_a095_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2491_c7_a095_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2491_c7_a095_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2491_c7_a095
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2491_c7_a095 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2491_c7_a095_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2491_c7_a095_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2491_c7_a095_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2491_c7_a095_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2491_c7_a095
result_sp_relative_shift_MUX_uxn_opcodes_h_l2491_c7_a095 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2491_c7_a095_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2491_c7_a095_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2491_c7_a095_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2491_c7_a095_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2494_c31_b572
CONST_SR_8_uxn_opcodes_h_l2494_c31_b572 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2494_c31_b572_x,
CONST_SR_8_uxn_opcodes_h_l2494_c31_b572_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2496_c11_c909
BIN_OP_EQ_uxn_opcodes_h_l2496_c11_c909 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2496_c11_c909_left,
BIN_OP_EQ_uxn_opcodes_h_l2496_c11_c909_right,
BIN_OP_EQ_uxn_opcodes_h_l2496_c11_c909_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2496_c7_f2eb
result_is_opc_done_MUX_uxn_opcodes_h_l2496_c7_f2eb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2496_c7_f2eb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2496_c7_f2eb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2496_c7_f2eb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2496_c7_f2eb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2496_c7_f2eb
result_is_stack_write_MUX_uxn_opcodes_h_l2496_c7_f2eb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2496_c7_f2eb_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2496_c7_f2eb_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2496_c7_f2eb_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2496_c7_f2eb_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2480_l2471_DUPLICATE_297f
CONST_SL_8_uint16_t_uxn_opcodes_h_l2480_l2471_DUPLICATE_297f : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l2480_l2471_DUPLICATE_297f_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l2480_l2471_DUPLICATE_297f_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2459_c6_ee4a_return_output,
 n16_MUX_uxn_opcodes_h_l2459_c2_d7ae_return_output,
 t16_MUX_uxn_opcodes_h_l2459_c2_d7ae_return_output,
 tmp16_MUX_uxn_opcodes_h_l2459_c2_d7ae_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2459_c2_d7ae_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2459_c2_d7ae_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2459_c2_d7ae_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2459_c2_d7ae_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2459_c2_d7ae_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2466_c11_f776_return_output,
 n16_MUX_uxn_opcodes_h_l2466_c7_6774_return_output,
 t16_MUX_uxn_opcodes_h_l2466_c7_6774_return_output,
 tmp16_MUX_uxn_opcodes_h_l2466_c7_6774_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2466_c7_6774_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2466_c7_6774_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2466_c7_6774_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2466_c7_6774_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2466_c7_6774_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2469_c11_a1aa_return_output,
 n16_MUX_uxn_opcodes_h_l2469_c7_bd6f_return_output,
 t16_MUX_uxn_opcodes_h_l2469_c7_bd6f_return_output,
 tmp16_MUX_uxn_opcodes_h_l2469_c7_bd6f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2469_c7_bd6f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2469_c7_bd6f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2469_c7_bd6f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2469_c7_bd6f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2469_c7_bd6f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2474_c11_bd0a_return_output,
 n16_MUX_uxn_opcodes_h_l2474_c7_e0ed_return_output,
 t16_MUX_uxn_opcodes_h_l2474_c7_e0ed_return_output,
 tmp16_MUX_uxn_opcodes_h_l2474_c7_e0ed_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2474_c7_e0ed_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2474_c7_e0ed_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2474_c7_e0ed_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2474_c7_e0ed_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2474_c7_e0ed_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2475_c3_ce24_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2478_c11_4038_return_output,
 n16_MUX_uxn_opcodes_h_l2478_c7_6522_return_output,
 tmp16_MUX_uxn_opcodes_h_l2478_c7_6522_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2478_c7_6522_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2478_c7_6522_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2478_c7_6522_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2478_c7_6522_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2478_c7_6522_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2482_c11_b04c_return_output,
 n16_MUX_uxn_opcodes_h_l2482_c7_1923_return_output,
 tmp16_MUX_uxn_opcodes_h_l2482_c7_1923_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2482_c7_1923_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2482_c7_1923_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2482_c7_1923_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2482_c7_1923_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2482_c7_1923_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2483_c3_9096_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l2484_c11_9222_return_output,
 sp_relative_shift_uxn_opcodes_h_l2486_c30_dba3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2491_c11_9858_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2491_c7_a095_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2491_c7_a095_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2491_c7_a095_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2491_c7_a095_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2491_c7_a095_return_output,
 CONST_SR_8_uxn_opcodes_h_l2494_c31_b572_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2496_c11_c909_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2496_c7_f2eb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2496_c7_f2eb_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l2480_l2471_DUPLICATE_297f_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2459_c6_ee4a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2459_c6_ee4a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2459_c6_ee4a_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2459_c2_d7ae_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2459_c2_d7ae_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2466_c7_6774_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2459_c2_d7ae_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2459_c2_d7ae_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2459_c2_d7ae_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2459_c2_d7ae_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2466_c7_6774_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2459_c2_d7ae_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2459_c2_d7ae_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2459_c2_d7ae_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2459_c2_d7ae_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2466_c7_6774_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2459_c2_d7ae_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2459_c2_d7ae_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2459_c2_d7ae_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2459_c2_d7ae_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2466_c7_6774_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2459_c2_d7ae_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2459_c2_d7ae_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2459_c2_d7ae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2459_c2_d7ae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2466_c7_6774_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2459_c2_d7ae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2459_c2_d7ae_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2459_c2_d7ae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2459_c2_d7ae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2466_c7_6774_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2459_c2_d7ae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2459_c2_d7ae_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2459_c2_d7ae_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2463_c3_e4c6 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2459_c2_d7ae_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2466_c7_6774_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2459_c2_d7ae_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2459_c2_d7ae_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2459_c2_d7ae_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2459_c2_d7ae_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2466_c7_6774_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2459_c2_d7ae_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2459_c2_d7ae_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2466_c11_f776_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2466_c11_f776_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2466_c11_f776_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2466_c7_6774_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2466_c7_6774_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2469_c7_bd6f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2466_c7_6774_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2466_c7_6774_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2466_c7_6774_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2469_c7_bd6f_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2466_c7_6774_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2466_c7_6774_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2466_c7_6774_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2469_c7_bd6f_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2466_c7_6774_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2466_c7_6774_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2466_c7_6774_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2469_c7_bd6f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2466_c7_6774_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2466_c7_6774_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2466_c7_6774_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2469_c7_bd6f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2466_c7_6774_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2466_c7_6774_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2466_c7_6774_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2469_c7_bd6f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2466_c7_6774_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2466_c7_6774_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2467_c3_217c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2466_c7_6774_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2469_c7_bd6f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2466_c7_6774_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2466_c7_6774_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2466_c7_6774_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2469_c7_bd6f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2466_c7_6774_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2469_c11_a1aa_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2469_c11_a1aa_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2469_c11_a1aa_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2469_c7_bd6f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2469_c7_bd6f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2474_c7_e0ed_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2469_c7_bd6f_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2469_c7_bd6f_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2469_c7_bd6f_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2474_c7_e0ed_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2469_c7_bd6f_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2469_c7_bd6f_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2469_c7_bd6f_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2474_c7_e0ed_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2469_c7_bd6f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2469_c7_bd6f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2469_c7_bd6f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2474_c7_e0ed_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2469_c7_bd6f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2469_c7_bd6f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2469_c7_bd6f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2474_c7_e0ed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2469_c7_bd6f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2469_c7_bd6f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2469_c7_bd6f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2474_c7_e0ed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2469_c7_bd6f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2469_c7_bd6f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2472_c3_fa6f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2469_c7_bd6f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2474_c7_e0ed_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2469_c7_bd6f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2469_c7_bd6f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2469_c7_bd6f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2474_c7_e0ed_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2469_c7_bd6f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2474_c11_bd0a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2474_c11_bd0a_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2474_c11_bd0a_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2474_c7_e0ed_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2474_c7_e0ed_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2478_c7_6522_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2474_c7_e0ed_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2474_c7_e0ed_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2474_c7_e0ed_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2474_c7_e0ed_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2474_c7_e0ed_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2474_c7_e0ed_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2478_c7_6522_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2474_c7_e0ed_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2474_c7_e0ed_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2474_c7_e0ed_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2478_c7_6522_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2474_c7_e0ed_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2474_c7_e0ed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2474_c7_e0ed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2478_c7_6522_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2474_c7_e0ed_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2474_c7_e0ed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2474_c7_e0ed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2478_c7_6522_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2474_c7_e0ed_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2474_c7_e0ed_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2476_c3_35e6 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2474_c7_e0ed_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2478_c7_6522_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2474_c7_e0ed_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2474_c7_e0ed_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2474_c7_e0ed_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2478_c7_6522_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2474_c7_e0ed_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2475_c3_ce24_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2475_c3_ce24_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2475_c3_ce24_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2478_c11_4038_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2478_c11_4038_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2478_c11_4038_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2478_c7_6522_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2478_c7_6522_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2482_c7_1923_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2478_c7_6522_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2478_c7_6522_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2478_c7_6522_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2482_c7_1923_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2478_c7_6522_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2478_c7_6522_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2478_c7_6522_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2482_c7_1923_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2478_c7_6522_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2478_c7_6522_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2478_c7_6522_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2482_c7_1923_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2478_c7_6522_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2478_c7_6522_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2478_c7_6522_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2482_c7_1923_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2478_c7_6522_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2478_c7_6522_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2478_c7_6522_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2482_c7_1923_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2478_c7_6522_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2478_c7_6522_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2478_c7_6522_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2482_c7_1923_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2478_c7_6522_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2482_c11_b04c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2482_c11_b04c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2482_c11_b04c_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2482_c7_1923_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2482_c7_1923_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2482_c7_1923_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2482_c7_1923_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2482_c7_1923_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2482_c7_1923_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2482_c7_1923_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2482_c7_1923_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2491_c7_a095_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2482_c7_1923_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2482_c7_1923_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2482_c7_1923_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2491_c7_a095_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2482_c7_1923_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2482_c7_1923_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2482_c7_1923_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2491_c7_a095_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2482_c7_1923_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2482_c7_1923_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2488_c3_1397 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2482_c7_1923_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2491_c7_a095_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2482_c7_1923_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2482_c7_1923_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2482_c7_1923_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2491_c7_a095_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2482_c7_1923_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2483_c3_9096_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2483_c3_9096_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2483_c3_9096_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2484_c11_9222_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2484_c11_9222_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2484_c11_9222_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2486_c30_dba3_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2486_c30_dba3_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2486_c30_dba3_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2486_c30_dba3_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2489_c21_59e8_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2491_c11_9858_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2491_c11_9858_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2491_c11_9858_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2491_c7_a095_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2491_c7_a095_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2491_c7_a095_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2491_c7_a095_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2491_c7_a095_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2496_c7_f2eb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2491_c7_a095_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2491_c7_a095_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2491_c7_a095_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2496_c7_f2eb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2491_c7_a095_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2491_c7_a095_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2493_c3_5dd5 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2491_c7_a095_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2491_c7_a095_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2491_c7_a095_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2492_c3_d773 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2491_c7_a095_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2491_c7_a095_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2494_c31_b572_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2494_c31_b572_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2494_c21_f4a9_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c11_c909_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c11_c909_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c11_c909_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2496_c7_f2eb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2496_c7_f2eb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2496_c7_f2eb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2496_c7_f2eb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2496_c7_f2eb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2496_c7_f2eb_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2466_l2459_l2491_l2478_l2474_l2469_DUPLICATE_8fb6_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2466_l2496_l2459_l2491_l2478_l2474_l2469_DUPLICATE_b523_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2466_l2459_l2491_l2478_l2474_l2469_DUPLICATE_ec98_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2466_l2496_l2491_l2482_l2478_l2474_l2469_DUPLICATE_f113_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2479_l2483_l2475_l2470_DUPLICATE_3c79_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2480_l2471_DUPLICATE_297f_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2480_l2471_DUPLICATE_297f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2491_l2478_DUPLICATE_1e12_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_eae7_uxn_opcodes_h_l2501_l2455_DUPLICATE_e8c3_return_output : opcode_result_t;
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
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2496_c7_f2eb_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2469_c11_a1aa_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2467_c3_217c := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2466_c7_6774_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2467_c3_217c;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2478_c11_4038_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2482_c11_b04c_right := to_unsigned(5, 3);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2492_c3_d773 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2491_c7_a095_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2492_c3_d773;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2459_c2_d7ae_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2482_c7_1923_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2474_c11_bd0a_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2463_c3_e4c6 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2459_c2_d7ae_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2463_c3_e4c6;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2491_c11_9858_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c11_c909_right := to_unsigned(7, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2496_c7_f2eb_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2493_c3_5dd5 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2491_c7_a095_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2493_c3_5dd5;
     VAR_sp_relative_shift_uxn_opcodes_h_l2486_c30_dba3_y := resize(to_signed(-2, 3), 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2472_c3_fa6f := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2469_c7_bd6f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2472_c3_fa6f;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2488_c3_1397 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2482_c7_1923_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2488_c3_1397;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2466_c11_f776_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2459_c6_ee4a_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2476_c3_35e6 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2474_c7_e0ed_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2476_c3_35e6;
     VAR_sp_relative_shift_uxn_opcodes_h_l2486_c30_dba3_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2486_c30_dba3_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2483_c3_9096_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2459_c2_d7ae_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2466_c7_6774_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2469_c7_bd6f_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2474_c7_e0ed_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2482_c7_1923_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2459_c6_ee4a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2466_c11_f776_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2469_c11_a1aa_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2474_c11_bd0a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2478_c11_4038_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2482_c11_b04c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2491_c11_9858_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c11_c909_left := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2484_c11_9222_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2475_c3_ce24_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2459_c2_d7ae_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2466_c7_6774_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2474_c7_e0ed_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2494_c31_b572_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2459_c2_d7ae_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2466_c7_6774_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2469_c7_bd6f_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2474_c7_e0ed_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2478_c7_6522_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2482_c7_1923_iffalse := tmp16;
     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2479_l2483_l2475_l2470_DUPLICATE_3c79 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2479_l2483_l2475_l2470_DUPLICATE_3c79_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l2474_c11_bd0a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2474_c11_bd0a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2474_c11_bd0a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2474_c11_bd0a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2474_c11_bd0a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2474_c11_bd0a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2474_c11_bd0a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2491_c11_9858] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2491_c11_9858_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2491_c11_9858_left;
     BIN_OP_EQ_uxn_opcodes_h_l2491_c11_9858_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2491_c11_9858_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2491_c11_9858_return_output := BIN_OP_EQ_uxn_opcodes_h_l2491_c11_9858_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2496_c11_c909] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2496_c11_c909_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c11_c909_left;
     BIN_OP_EQ_uxn_opcodes_h_l2496_c11_c909_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c11_c909_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c11_c909_return_output := BIN_OP_EQ_uxn_opcodes_h_l2496_c11_c909_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2482_c11_b04c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2482_c11_b04c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2482_c11_b04c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2482_c11_b04c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2482_c11_b04c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2482_c11_b04c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2482_c11_b04c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2469_c11_a1aa] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2469_c11_a1aa_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2469_c11_a1aa_left;
     BIN_OP_EQ_uxn_opcodes_h_l2469_c11_a1aa_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2469_c11_a1aa_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2469_c11_a1aa_return_output := BIN_OP_EQ_uxn_opcodes_h_l2469_c11_a1aa_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2466_c11_f776] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2466_c11_f776_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2466_c11_f776_left;
     BIN_OP_EQ_uxn_opcodes_h_l2466_c11_f776_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2466_c11_f776_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2466_c11_f776_return_output := BIN_OP_EQ_uxn_opcodes_h_l2466_c11_f776_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2466_l2496_l2491_l2482_l2478_l2474_l2469_DUPLICATE_f113 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2466_l2496_l2491_l2482_l2478_l2474_l2469_DUPLICATE_f113_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2478_c11_4038] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2478_c11_4038_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2478_c11_4038_left;
     BIN_OP_EQ_uxn_opcodes_h_l2478_c11_4038_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2478_c11_4038_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2478_c11_4038_return_output := BIN_OP_EQ_uxn_opcodes_h_l2478_c11_4038_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2466_l2496_l2459_l2491_l2478_l2474_l2469_DUPLICATE_b523 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2466_l2496_l2459_l2491_l2478_l2474_l2469_DUPLICATE_b523_return_output := result.is_stack_write;

     -- sp_relative_shift[uxn_opcodes_h_l2486_c30_dba3] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2486_c30_dba3_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2486_c30_dba3_ins;
     sp_relative_shift_uxn_opcodes_h_l2486_c30_dba3_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2486_c30_dba3_x;
     sp_relative_shift_uxn_opcodes_h_l2486_c30_dba3_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2486_c30_dba3_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2486_c30_dba3_return_output := sp_relative_shift_uxn_opcodes_h_l2486_c30_dba3_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2466_l2459_l2491_l2478_l2474_l2469_DUPLICATE_ec98 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2466_l2459_l2491_l2478_l2474_l2469_DUPLICATE_ec98_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2466_l2459_l2491_l2478_l2474_l2469_DUPLICATE_8fb6 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2466_l2459_l2491_l2478_l2474_l2469_DUPLICATE_8fb6_return_output := result.u8_value;

     -- CONST_SR_8[uxn_opcodes_h_l2494_c31_b572] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2494_c31_b572_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2494_c31_b572_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2494_c31_b572_return_output := CONST_SR_8_uxn_opcodes_h_l2494_c31_b572_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2459_c6_ee4a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2459_c6_ee4a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2459_c6_ee4a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2459_c6_ee4a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2459_c6_ee4a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2459_c6_ee4a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2459_c6_ee4a_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2491_l2478_DUPLICATE_1e12 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2491_l2478_DUPLICATE_1e12_return_output := result.stack_address_sp_offset;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l2459_c2_d7ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2459_c6_ee4a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2459_c2_d7ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2459_c6_ee4a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2459_c2_d7ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2459_c6_ee4a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2459_c2_d7ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2459_c6_ee4a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2459_c2_d7ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2459_c6_ee4a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2459_c2_d7ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2459_c6_ee4a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2459_c2_d7ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2459_c6_ee4a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2459_c2_d7ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2459_c6_ee4a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2466_c7_6774_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2466_c11_f776_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2466_c7_6774_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2466_c11_f776_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2466_c7_6774_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2466_c11_f776_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2466_c7_6774_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2466_c11_f776_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2466_c7_6774_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2466_c11_f776_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2466_c7_6774_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2466_c11_f776_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2466_c7_6774_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2466_c11_f776_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2466_c7_6774_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2466_c11_f776_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2469_c7_bd6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2469_c11_a1aa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2469_c7_bd6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2469_c11_a1aa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2469_c7_bd6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2469_c11_a1aa_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2469_c7_bd6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2469_c11_a1aa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2469_c7_bd6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2469_c11_a1aa_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2469_c7_bd6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2469_c11_a1aa_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2469_c7_bd6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2469_c11_a1aa_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2469_c7_bd6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2469_c11_a1aa_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2474_c7_e0ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2474_c11_bd0a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2474_c7_e0ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2474_c11_bd0a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2474_c7_e0ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2474_c11_bd0a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2474_c7_e0ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2474_c11_bd0a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2474_c7_e0ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2474_c11_bd0a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2474_c7_e0ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2474_c11_bd0a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2474_c7_e0ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2474_c11_bd0a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2474_c7_e0ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2474_c11_bd0a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2478_c7_6522_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2478_c11_4038_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2478_c7_6522_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2478_c11_4038_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2478_c7_6522_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2478_c11_4038_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2478_c7_6522_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2478_c11_4038_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2478_c7_6522_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2478_c11_4038_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2478_c7_6522_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2478_c11_4038_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2478_c7_6522_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2478_c11_4038_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2482_c7_1923_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2482_c11_b04c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2482_c7_1923_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2482_c11_b04c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2482_c7_1923_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2482_c11_b04c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2482_c7_1923_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2482_c11_b04c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2482_c7_1923_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2482_c11_b04c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2482_c7_1923_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2482_c11_b04c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2482_c7_1923_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2482_c11_b04c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2491_c7_a095_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2491_c11_9858_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2491_c7_a095_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2491_c11_9858_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2491_c7_a095_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2491_c11_9858_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2491_c7_a095_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2491_c11_9858_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2491_c7_a095_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2491_c11_9858_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2496_c7_f2eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c11_c909_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2496_c7_f2eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c11_c909_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2475_c3_ce24_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2479_l2483_l2475_l2470_DUPLICATE_3c79_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2483_c3_9096_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2479_l2483_l2475_l2470_DUPLICATE_3c79_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2480_l2471_DUPLICATE_297f_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2479_l2483_l2475_l2470_DUPLICATE_3c79_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2459_c2_d7ae_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2466_l2459_l2491_l2478_l2474_l2469_DUPLICATE_ec98_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2466_c7_6774_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2466_l2459_l2491_l2478_l2474_l2469_DUPLICATE_ec98_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2469_c7_bd6f_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2466_l2459_l2491_l2478_l2474_l2469_DUPLICATE_ec98_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2474_c7_e0ed_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2466_l2459_l2491_l2478_l2474_l2469_DUPLICATE_ec98_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2478_c7_6522_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2466_l2459_l2491_l2478_l2474_l2469_DUPLICATE_ec98_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2491_c7_a095_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2466_l2459_l2491_l2478_l2474_l2469_DUPLICATE_ec98_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2466_c7_6774_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2466_l2496_l2491_l2482_l2478_l2474_l2469_DUPLICATE_f113_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2469_c7_bd6f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2466_l2496_l2491_l2482_l2478_l2474_l2469_DUPLICATE_f113_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2474_c7_e0ed_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2466_l2496_l2491_l2482_l2478_l2474_l2469_DUPLICATE_f113_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2478_c7_6522_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2466_l2496_l2491_l2482_l2478_l2474_l2469_DUPLICATE_f113_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2482_c7_1923_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2466_l2496_l2491_l2482_l2478_l2474_l2469_DUPLICATE_f113_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2491_c7_a095_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2466_l2496_l2491_l2482_l2478_l2474_l2469_DUPLICATE_f113_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2496_c7_f2eb_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2466_l2496_l2491_l2482_l2478_l2474_l2469_DUPLICATE_f113_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2459_c2_d7ae_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2466_l2496_l2459_l2491_l2478_l2474_l2469_DUPLICATE_b523_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2466_c7_6774_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2466_l2496_l2459_l2491_l2478_l2474_l2469_DUPLICATE_b523_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2469_c7_bd6f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2466_l2496_l2459_l2491_l2478_l2474_l2469_DUPLICATE_b523_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2474_c7_e0ed_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2466_l2496_l2459_l2491_l2478_l2474_l2469_DUPLICATE_b523_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2478_c7_6522_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2466_l2496_l2459_l2491_l2478_l2474_l2469_DUPLICATE_b523_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2491_c7_a095_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2466_l2496_l2459_l2491_l2478_l2474_l2469_DUPLICATE_b523_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2496_c7_f2eb_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2466_l2496_l2459_l2491_l2478_l2474_l2469_DUPLICATE_b523_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2478_c7_6522_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2491_l2478_DUPLICATE_1e12_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2491_c7_a095_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2491_l2478_DUPLICATE_1e12_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2459_c2_d7ae_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2466_l2459_l2491_l2478_l2474_l2469_DUPLICATE_8fb6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2466_c7_6774_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2466_l2459_l2491_l2478_l2474_l2469_DUPLICATE_8fb6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2469_c7_bd6f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2466_l2459_l2491_l2478_l2474_l2469_DUPLICATE_8fb6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2474_c7_e0ed_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2466_l2459_l2491_l2478_l2474_l2469_DUPLICATE_8fb6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2478_c7_6522_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2466_l2459_l2491_l2478_l2474_l2469_DUPLICATE_8fb6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2491_c7_a095_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2466_l2459_l2491_l2478_l2474_l2469_DUPLICATE_8fb6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2482_c7_1923_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2486_c30_dba3_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2496_c7_f2eb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2496_c7_f2eb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2496_c7_f2eb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2496_c7_f2eb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2496_c7_f2eb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2496_c7_f2eb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2496_c7_f2eb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2496_c7_f2eb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2496_c7_f2eb_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2494_c21_f4a9] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2494_c21_f4a9_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2494_c31_b572_return_output);

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2496_c7_f2eb] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2496_c7_f2eb_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2496_c7_f2eb_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2496_c7_f2eb_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2496_c7_f2eb_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2496_c7_f2eb_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2496_c7_f2eb_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2496_c7_f2eb_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2496_c7_f2eb_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2491_c7_a095] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2491_c7_a095_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2491_c7_a095_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2491_c7_a095_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2491_c7_a095_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2491_c7_a095_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2491_c7_a095_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2491_c7_a095_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2491_c7_a095_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2475_c3_ce24] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2475_c3_ce24_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2475_c3_ce24_left;
     BIN_OP_OR_uxn_opcodes_h_l2475_c3_ce24_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2475_c3_ce24_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2475_c3_ce24_return_output := BIN_OP_OR_uxn_opcodes_h_l2475_c3_ce24_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l2480_l2471_DUPLICATE_297f LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l2480_l2471_DUPLICATE_297f_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2480_l2471_DUPLICATE_297f_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2480_l2471_DUPLICATE_297f_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l2480_l2471_DUPLICATE_297f_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2483_c3_9096] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2483_c3_9096_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2483_c3_9096_left;
     BIN_OP_OR_uxn_opcodes_h_l2483_c3_9096_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2483_c3_9096_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2483_c3_9096_return_output := BIN_OP_OR_uxn_opcodes_h_l2483_c3_9096_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2491_c7_a095] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2491_c7_a095_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2491_c7_a095_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2491_c7_a095_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2491_c7_a095_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2491_c7_a095_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2491_c7_a095_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2491_c7_a095_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2491_c7_a095_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l2474_c7_e0ed_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2475_c3_ce24_return_output;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2484_c11_9222_left := VAR_BIN_OP_OR_uxn_opcodes_h_l2483_c3_9096_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2482_c7_1923_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2483_c3_9096_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2491_c7_a095_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2494_c21_f4a9_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2478_c7_6522_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2480_l2471_DUPLICATE_297f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2469_c7_bd6f_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2480_l2471_DUPLICATE_297f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2491_c7_a095_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2496_c7_f2eb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2491_c7_a095_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2496_c7_f2eb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2482_c7_1923_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2491_c7_a095_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2482_c7_1923_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2491_c7_a095_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2482_c7_1923] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2482_c7_1923_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2482_c7_1923_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2482_c7_1923_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2482_c7_1923_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2482_c7_1923_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2482_c7_1923_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2482_c7_1923_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2482_c7_1923_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2491_c7_a095] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2491_c7_a095_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2491_c7_a095_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2491_c7_a095_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2491_c7_a095_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2491_c7_a095_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2491_c7_a095_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2491_c7_a095_return_output := result_u8_value_MUX_uxn_opcodes_h_l2491_c7_a095_return_output;

     -- BIN_OP_MINUS[uxn_opcodes_h_l2484_c11_9222] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l2484_c11_9222_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l2484_c11_9222_left;
     BIN_OP_MINUS_uxn_opcodes_h_l2484_c11_9222_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l2484_c11_9222_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2484_c11_9222_return_output := BIN_OP_MINUS_uxn_opcodes_h_l2484_c11_9222_return_output;

     -- n16_MUX[uxn_opcodes_h_l2482_c7_1923] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2482_c7_1923_cond <= VAR_n16_MUX_uxn_opcodes_h_l2482_c7_1923_cond;
     n16_MUX_uxn_opcodes_h_l2482_c7_1923_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2482_c7_1923_iftrue;
     n16_MUX_uxn_opcodes_h_l2482_c7_1923_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2482_c7_1923_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2482_c7_1923_return_output := n16_MUX_uxn_opcodes_h_l2482_c7_1923_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2491_c7_a095] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2491_c7_a095_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2491_c7_a095_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2491_c7_a095_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2491_c7_a095_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2491_c7_a095_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2491_c7_a095_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2491_c7_a095_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2491_c7_a095_return_output;

     -- t16_MUX[uxn_opcodes_h_l2474_c7_e0ed] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2474_c7_e0ed_cond <= VAR_t16_MUX_uxn_opcodes_h_l2474_c7_e0ed_cond;
     t16_MUX_uxn_opcodes_h_l2474_c7_e0ed_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2474_c7_e0ed_iftrue;
     t16_MUX_uxn_opcodes_h_l2474_c7_e0ed_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2474_c7_e0ed_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2474_c7_e0ed_return_output := t16_MUX_uxn_opcodes_h_l2474_c7_e0ed_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2491_c7_a095] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2491_c7_a095_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2491_c7_a095_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2491_c7_a095_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2491_c7_a095_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2491_c7_a095_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2491_c7_a095_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2491_c7_a095_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2491_c7_a095_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2482_c7_1923] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2482_c7_1923_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2482_c7_1923_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2482_c7_1923_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2482_c7_1923_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2482_c7_1923_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2482_c7_1923_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2482_c7_1923_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2482_c7_1923_return_output;

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l2482_c7_1923_iftrue := VAR_BIN_OP_MINUS_uxn_opcodes_h_l2484_c11_9222_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2478_c7_6522_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2482_c7_1923_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2482_c7_1923_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2491_c7_a095_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2482_c7_1923_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2491_c7_a095_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2478_c7_6522_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2482_c7_1923_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2478_c7_6522_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2482_c7_1923_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2482_c7_1923_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2491_c7_a095_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2469_c7_bd6f_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2474_c7_e0ed_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2478_c7_6522] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2478_c7_6522_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2478_c7_6522_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2478_c7_6522_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2478_c7_6522_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2478_c7_6522_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2478_c7_6522_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2478_c7_6522_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2478_c7_6522_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2482_c7_1923] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2482_c7_1923_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2482_c7_1923_cond;
     tmp16_MUX_uxn_opcodes_h_l2482_c7_1923_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2482_c7_1923_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2482_c7_1923_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2482_c7_1923_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2482_c7_1923_return_output := tmp16_MUX_uxn_opcodes_h_l2482_c7_1923_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2489_c21_59e8] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2489_c21_59e8_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2484_c11_9222_return_output);

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2482_c7_1923] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2482_c7_1923_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2482_c7_1923_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2482_c7_1923_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2482_c7_1923_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2482_c7_1923_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2482_c7_1923_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2482_c7_1923_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2482_c7_1923_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2478_c7_6522] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2478_c7_6522_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2478_c7_6522_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2478_c7_6522_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2478_c7_6522_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2478_c7_6522_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2478_c7_6522_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2478_c7_6522_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2478_c7_6522_return_output;

     -- n16_MUX[uxn_opcodes_h_l2478_c7_6522] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2478_c7_6522_cond <= VAR_n16_MUX_uxn_opcodes_h_l2478_c7_6522_cond;
     n16_MUX_uxn_opcodes_h_l2478_c7_6522_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2478_c7_6522_iftrue;
     n16_MUX_uxn_opcodes_h_l2478_c7_6522_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2478_c7_6522_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2478_c7_6522_return_output := n16_MUX_uxn_opcodes_h_l2478_c7_6522_return_output;

     -- t16_MUX[uxn_opcodes_h_l2469_c7_bd6f] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2469_c7_bd6f_cond <= VAR_t16_MUX_uxn_opcodes_h_l2469_c7_bd6f_cond;
     t16_MUX_uxn_opcodes_h_l2469_c7_bd6f_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2469_c7_bd6f_iftrue;
     t16_MUX_uxn_opcodes_h_l2469_c7_bd6f_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2469_c7_bd6f_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2469_c7_bd6f_return_output := t16_MUX_uxn_opcodes_h_l2469_c7_bd6f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2482_c7_1923] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2482_c7_1923_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2482_c7_1923_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2482_c7_1923_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2482_c7_1923_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2482_c7_1923_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2482_c7_1923_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2482_c7_1923_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2482_c7_1923_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2482_c7_1923_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2489_c21_59e8_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2474_c7_e0ed_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2478_c7_6522_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2478_c7_6522_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2482_c7_1923_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2478_c7_6522_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2482_c7_1923_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2474_c7_e0ed_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2478_c7_6522_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2474_c7_e0ed_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2478_c7_6522_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2466_c7_6774_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2469_c7_bd6f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2478_c7_6522_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2482_c7_1923_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2478_c7_6522] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2478_c7_6522_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2478_c7_6522_cond;
     tmp16_MUX_uxn_opcodes_h_l2478_c7_6522_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2478_c7_6522_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2478_c7_6522_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2478_c7_6522_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2478_c7_6522_return_output := tmp16_MUX_uxn_opcodes_h_l2478_c7_6522_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2474_c7_e0ed] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2474_c7_e0ed_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2474_c7_e0ed_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2474_c7_e0ed_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2474_c7_e0ed_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2474_c7_e0ed_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2474_c7_e0ed_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2474_c7_e0ed_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2474_c7_e0ed_return_output;

     -- t16_MUX[uxn_opcodes_h_l2466_c7_6774] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2466_c7_6774_cond <= VAR_t16_MUX_uxn_opcodes_h_l2466_c7_6774_cond;
     t16_MUX_uxn_opcodes_h_l2466_c7_6774_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2466_c7_6774_iftrue;
     t16_MUX_uxn_opcodes_h_l2466_c7_6774_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2466_c7_6774_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2466_c7_6774_return_output := t16_MUX_uxn_opcodes_h_l2466_c7_6774_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2478_c7_6522] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2478_c7_6522_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2478_c7_6522_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2478_c7_6522_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2478_c7_6522_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2478_c7_6522_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2478_c7_6522_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2478_c7_6522_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2478_c7_6522_return_output;

     -- n16_MUX[uxn_opcodes_h_l2474_c7_e0ed] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2474_c7_e0ed_cond <= VAR_n16_MUX_uxn_opcodes_h_l2474_c7_e0ed_cond;
     n16_MUX_uxn_opcodes_h_l2474_c7_e0ed_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2474_c7_e0ed_iftrue;
     n16_MUX_uxn_opcodes_h_l2474_c7_e0ed_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2474_c7_e0ed_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2474_c7_e0ed_return_output := n16_MUX_uxn_opcodes_h_l2474_c7_e0ed_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2478_c7_6522] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2478_c7_6522_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2478_c7_6522_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2478_c7_6522_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2478_c7_6522_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2478_c7_6522_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2478_c7_6522_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2478_c7_6522_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2478_c7_6522_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2482_c7_1923] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2482_c7_1923_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2482_c7_1923_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2482_c7_1923_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2482_c7_1923_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2482_c7_1923_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2482_c7_1923_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2482_c7_1923_return_output := result_u8_value_MUX_uxn_opcodes_h_l2482_c7_1923_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2474_c7_e0ed] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2474_c7_e0ed_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2474_c7_e0ed_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2474_c7_e0ed_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2474_c7_e0ed_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2474_c7_e0ed_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2474_c7_e0ed_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2474_c7_e0ed_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2474_c7_e0ed_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l2469_c7_bd6f_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2474_c7_e0ed_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2474_c7_e0ed_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2478_c7_6522_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2474_c7_e0ed_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2478_c7_6522_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2469_c7_bd6f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2474_c7_e0ed_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2469_c7_bd6f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2474_c7_e0ed_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2478_c7_6522_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2482_c7_1923_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2459_c2_d7ae_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2466_c7_6774_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2474_c7_e0ed_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2478_c7_6522_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2469_c7_bd6f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2469_c7_bd6f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2469_c7_bd6f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2469_c7_bd6f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2469_c7_bd6f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2469_c7_bd6f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2469_c7_bd6f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2469_c7_bd6f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2469_c7_bd6f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2474_c7_e0ed] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2474_c7_e0ed_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2474_c7_e0ed_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2474_c7_e0ed_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2474_c7_e0ed_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2474_c7_e0ed_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2474_c7_e0ed_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2474_c7_e0ed_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2474_c7_e0ed_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2478_c7_6522] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2478_c7_6522_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2478_c7_6522_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2478_c7_6522_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2478_c7_6522_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2478_c7_6522_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2478_c7_6522_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2478_c7_6522_return_output := result_u8_value_MUX_uxn_opcodes_h_l2478_c7_6522_return_output;

     -- n16_MUX[uxn_opcodes_h_l2469_c7_bd6f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2469_c7_bd6f_cond <= VAR_n16_MUX_uxn_opcodes_h_l2469_c7_bd6f_cond;
     n16_MUX_uxn_opcodes_h_l2469_c7_bd6f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2469_c7_bd6f_iftrue;
     n16_MUX_uxn_opcodes_h_l2469_c7_bd6f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2469_c7_bd6f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2469_c7_bd6f_return_output := n16_MUX_uxn_opcodes_h_l2469_c7_bd6f_return_output;

     -- t16_MUX[uxn_opcodes_h_l2459_c2_d7ae] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2459_c2_d7ae_cond <= VAR_t16_MUX_uxn_opcodes_h_l2459_c2_d7ae_cond;
     t16_MUX_uxn_opcodes_h_l2459_c2_d7ae_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2459_c2_d7ae_iftrue;
     t16_MUX_uxn_opcodes_h_l2459_c2_d7ae_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2459_c2_d7ae_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2459_c2_d7ae_return_output := t16_MUX_uxn_opcodes_h_l2459_c2_d7ae_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2474_c7_e0ed] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2474_c7_e0ed_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2474_c7_e0ed_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2474_c7_e0ed_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2474_c7_e0ed_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2474_c7_e0ed_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2474_c7_e0ed_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2474_c7_e0ed_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2474_c7_e0ed_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2469_c7_bd6f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2469_c7_bd6f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2469_c7_bd6f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2469_c7_bd6f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2469_c7_bd6f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2469_c7_bd6f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2469_c7_bd6f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2469_c7_bd6f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2469_c7_bd6f_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2474_c7_e0ed] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2474_c7_e0ed_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2474_c7_e0ed_cond;
     tmp16_MUX_uxn_opcodes_h_l2474_c7_e0ed_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2474_c7_e0ed_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2474_c7_e0ed_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2474_c7_e0ed_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2474_c7_e0ed_return_output := tmp16_MUX_uxn_opcodes_h_l2474_c7_e0ed_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2466_c7_6774_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2469_c7_bd6f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2469_c7_bd6f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2474_c7_e0ed_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2469_c7_bd6f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2474_c7_e0ed_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2466_c7_6774_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2469_c7_bd6f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2466_c7_6774_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2469_c7_bd6f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2474_c7_e0ed_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2478_c7_6522_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2459_c2_d7ae_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2469_c7_bd6f_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2474_c7_e0ed_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2469_c7_bd6f] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2469_c7_bd6f_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2469_c7_bd6f_cond;
     tmp16_MUX_uxn_opcodes_h_l2469_c7_bd6f_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2469_c7_bd6f_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2469_c7_bd6f_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2469_c7_bd6f_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2469_c7_bd6f_return_output := tmp16_MUX_uxn_opcodes_h_l2469_c7_bd6f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2466_c7_6774] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2466_c7_6774_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2466_c7_6774_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2466_c7_6774_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2466_c7_6774_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2466_c7_6774_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2466_c7_6774_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2466_c7_6774_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2466_c7_6774_return_output;

     -- n16_MUX[uxn_opcodes_h_l2466_c7_6774] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2466_c7_6774_cond <= VAR_n16_MUX_uxn_opcodes_h_l2466_c7_6774_cond;
     n16_MUX_uxn_opcodes_h_l2466_c7_6774_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2466_c7_6774_iftrue;
     n16_MUX_uxn_opcodes_h_l2466_c7_6774_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2466_c7_6774_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2466_c7_6774_return_output := n16_MUX_uxn_opcodes_h_l2466_c7_6774_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2469_c7_bd6f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2469_c7_bd6f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2469_c7_bd6f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2469_c7_bd6f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2469_c7_bd6f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2469_c7_bd6f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2469_c7_bd6f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2469_c7_bd6f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2469_c7_bd6f_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2474_c7_e0ed] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2474_c7_e0ed_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2474_c7_e0ed_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2474_c7_e0ed_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2474_c7_e0ed_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2474_c7_e0ed_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2474_c7_e0ed_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2474_c7_e0ed_return_output := result_u8_value_MUX_uxn_opcodes_h_l2474_c7_e0ed_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2466_c7_6774] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2466_c7_6774_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2466_c7_6774_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2466_c7_6774_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2466_c7_6774_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2466_c7_6774_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2466_c7_6774_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2466_c7_6774_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2466_c7_6774_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2469_c7_bd6f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2469_c7_bd6f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2469_c7_bd6f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2469_c7_bd6f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2469_c7_bd6f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2469_c7_bd6f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2469_c7_bd6f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2469_c7_bd6f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2469_c7_bd6f_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l2459_c2_d7ae_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2466_c7_6774_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2466_c7_6774_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2469_c7_bd6f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2466_c7_6774_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2469_c7_bd6f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2459_c2_d7ae_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2466_c7_6774_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2459_c2_d7ae_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2466_c7_6774_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2469_c7_bd6f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2474_c7_e0ed_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2466_c7_6774_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2469_c7_bd6f_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2466_c7_6774] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2466_c7_6774_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2466_c7_6774_cond;
     tmp16_MUX_uxn_opcodes_h_l2466_c7_6774_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2466_c7_6774_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2466_c7_6774_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2466_c7_6774_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2466_c7_6774_return_output := tmp16_MUX_uxn_opcodes_h_l2466_c7_6774_return_output;

     -- n16_MUX[uxn_opcodes_h_l2459_c2_d7ae] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2459_c2_d7ae_cond <= VAR_n16_MUX_uxn_opcodes_h_l2459_c2_d7ae_cond;
     n16_MUX_uxn_opcodes_h_l2459_c2_d7ae_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2459_c2_d7ae_iftrue;
     n16_MUX_uxn_opcodes_h_l2459_c2_d7ae_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2459_c2_d7ae_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2459_c2_d7ae_return_output := n16_MUX_uxn_opcodes_h_l2459_c2_d7ae_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2459_c2_d7ae] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2459_c2_d7ae_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2459_c2_d7ae_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2459_c2_d7ae_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2459_c2_d7ae_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2459_c2_d7ae_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2459_c2_d7ae_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2459_c2_d7ae_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2459_c2_d7ae_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2459_c2_d7ae] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2459_c2_d7ae_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2459_c2_d7ae_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2459_c2_d7ae_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2459_c2_d7ae_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2459_c2_d7ae_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2459_c2_d7ae_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2459_c2_d7ae_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2459_c2_d7ae_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2466_c7_6774] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2466_c7_6774_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2466_c7_6774_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2466_c7_6774_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2466_c7_6774_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2466_c7_6774_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2466_c7_6774_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2466_c7_6774_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2466_c7_6774_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2466_c7_6774] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2466_c7_6774_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2466_c7_6774_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2466_c7_6774_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2466_c7_6774_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2466_c7_6774_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2466_c7_6774_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2466_c7_6774_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2466_c7_6774_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2469_c7_bd6f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2469_c7_bd6f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2469_c7_bd6f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2469_c7_bd6f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2469_c7_bd6f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2469_c7_bd6f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2469_c7_bd6f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2469_c7_bd6f_return_output := result_u8_value_MUX_uxn_opcodes_h_l2469_c7_bd6f_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2459_c2_d7ae_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2459_c2_d7ae_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2466_c7_6774_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2459_c2_d7ae_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2466_c7_6774_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2466_c7_6774_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2469_c7_bd6f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2459_c2_d7ae_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2466_c7_6774_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2466_c7_6774] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2466_c7_6774_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2466_c7_6774_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2466_c7_6774_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2466_c7_6774_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2466_c7_6774_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2466_c7_6774_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2466_c7_6774_return_output := result_u8_value_MUX_uxn_opcodes_h_l2466_c7_6774_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2459_c2_d7ae] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2459_c2_d7ae_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2459_c2_d7ae_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2459_c2_d7ae_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2459_c2_d7ae_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2459_c2_d7ae_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2459_c2_d7ae_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2459_c2_d7ae_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2459_c2_d7ae_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2459_c2_d7ae] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2459_c2_d7ae_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2459_c2_d7ae_cond;
     tmp16_MUX_uxn_opcodes_h_l2459_c2_d7ae_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2459_c2_d7ae_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2459_c2_d7ae_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2459_c2_d7ae_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2459_c2_d7ae_return_output := tmp16_MUX_uxn_opcodes_h_l2459_c2_d7ae_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2459_c2_d7ae] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2459_c2_d7ae_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2459_c2_d7ae_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2459_c2_d7ae_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2459_c2_d7ae_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2459_c2_d7ae_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2459_c2_d7ae_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2459_c2_d7ae_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2459_c2_d7ae_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2459_c2_d7ae_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2466_c7_6774_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l2459_c2_d7ae_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2459_c2_d7ae] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2459_c2_d7ae_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2459_c2_d7ae_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2459_c2_d7ae_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2459_c2_d7ae_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2459_c2_d7ae_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2459_c2_d7ae_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2459_c2_d7ae_return_output := result_u8_value_MUX_uxn_opcodes_h_l2459_c2_d7ae_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_eae7_uxn_opcodes_h_l2501_l2455_DUPLICATE_e8c3 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_eae7_uxn_opcodes_h_l2501_l2455_DUPLICATE_e8c3_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_eae7(
     result,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2459_c2_d7ae_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2459_c2_d7ae_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2459_c2_d7ae_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2459_c2_d7ae_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2459_c2_d7ae_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_eae7_uxn_opcodes_h_l2501_l2455_DUPLICATE_e8c3_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_eae7_uxn_opcodes_h_l2501_l2455_DUPLICATE_e8c3_return_output;
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
