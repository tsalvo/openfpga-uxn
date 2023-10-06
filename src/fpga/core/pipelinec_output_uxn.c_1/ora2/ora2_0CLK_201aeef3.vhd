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
entity ora2_0CLK_201aeef3 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end ora2_0CLK_201aeef3;
architecture arch of ora2_0CLK_201aeef3 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1173_c6_ef77]
signal BIN_OP_EQ_uxn_opcodes_h_l1173_c6_ef77_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1173_c6_ef77_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1173_c6_ef77_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1173_c1_726a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1173_c1_726a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1173_c1_726a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1173_c1_726a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1173_c1_726a_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1173_c2_25ea]
signal n16_MUX_uxn_opcodes_h_l1173_c2_25ea_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1173_c2_25ea_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1173_c2_25ea_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1173_c2_25ea_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1173_c2_25ea]
signal t16_MUX_uxn_opcodes_h_l1173_c2_25ea_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1173_c2_25ea_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1173_c2_25ea_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1173_c2_25ea_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1173_c2_25ea]
signal tmp16_MUX_uxn_opcodes_h_l1173_c2_25ea_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1173_c2_25ea_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1173_c2_25ea_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1173_c2_25ea_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1173_c2_25ea]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1173_c2_25ea_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1173_c2_25ea_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1173_c2_25ea_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1173_c2_25ea_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1173_c2_25ea]
signal result_stack_value_MUX_uxn_opcodes_h_l1173_c2_25ea_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1173_c2_25ea_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1173_c2_25ea_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1173_c2_25ea_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1173_c2_25ea]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1173_c2_25ea_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1173_c2_25ea_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1173_c2_25ea_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1173_c2_25ea_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1173_c2_25ea]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1173_c2_25ea_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1173_c2_25ea_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1173_c2_25ea_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1173_c2_25ea_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1173_c2_25ea]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1173_c2_25ea_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1173_c2_25ea_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1173_c2_25ea_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1173_c2_25ea_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1173_c2_25ea]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1173_c2_25ea_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1173_c2_25ea_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1173_c2_25ea_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1173_c2_25ea_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1173_c2_25ea]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1173_c2_25ea_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1173_c2_25ea_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1173_c2_25ea_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1173_c2_25ea_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l1174_c3_f733[uxn_opcodes_h_l1174_c3_f733]
signal printf_uxn_opcodes_h_l1174_c3_f733_uxn_opcodes_h_l1174_c3_f733_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1179_c11_e07d]
signal BIN_OP_EQ_uxn_opcodes_h_l1179_c11_e07d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1179_c11_e07d_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1179_c11_e07d_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1179_c7_dbbf]
signal n16_MUX_uxn_opcodes_h_l1179_c7_dbbf_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1179_c7_dbbf_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1179_c7_dbbf_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1179_c7_dbbf_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1179_c7_dbbf]
signal t16_MUX_uxn_opcodes_h_l1179_c7_dbbf_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1179_c7_dbbf_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1179_c7_dbbf_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1179_c7_dbbf_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1179_c7_dbbf]
signal tmp16_MUX_uxn_opcodes_h_l1179_c7_dbbf_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1179_c7_dbbf_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1179_c7_dbbf_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1179_c7_dbbf_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1179_c7_dbbf]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1179_c7_dbbf_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1179_c7_dbbf_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1179_c7_dbbf_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1179_c7_dbbf_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1179_c7_dbbf]
signal result_stack_value_MUX_uxn_opcodes_h_l1179_c7_dbbf_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1179_c7_dbbf_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1179_c7_dbbf_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1179_c7_dbbf_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1179_c7_dbbf]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1179_c7_dbbf_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1179_c7_dbbf_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1179_c7_dbbf_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1179_c7_dbbf_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1179_c7_dbbf]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1179_c7_dbbf_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1179_c7_dbbf_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1179_c7_dbbf_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1179_c7_dbbf_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1179_c7_dbbf]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1179_c7_dbbf_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1179_c7_dbbf_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1179_c7_dbbf_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1179_c7_dbbf_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1179_c7_dbbf]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1179_c7_dbbf_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1179_c7_dbbf_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1179_c7_dbbf_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1179_c7_dbbf_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1179_c7_dbbf]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1179_c7_dbbf_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1179_c7_dbbf_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1179_c7_dbbf_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1179_c7_dbbf_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1182_c11_20e4]
signal BIN_OP_EQ_uxn_opcodes_h_l1182_c11_20e4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1182_c11_20e4_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1182_c11_20e4_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1182_c7_604d]
signal n16_MUX_uxn_opcodes_h_l1182_c7_604d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1182_c7_604d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1182_c7_604d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1182_c7_604d_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1182_c7_604d]
signal t16_MUX_uxn_opcodes_h_l1182_c7_604d_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1182_c7_604d_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1182_c7_604d_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1182_c7_604d_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1182_c7_604d]
signal tmp16_MUX_uxn_opcodes_h_l1182_c7_604d_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1182_c7_604d_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1182_c7_604d_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1182_c7_604d_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1182_c7_604d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1182_c7_604d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1182_c7_604d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1182_c7_604d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1182_c7_604d_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1182_c7_604d]
signal result_stack_value_MUX_uxn_opcodes_h_l1182_c7_604d_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1182_c7_604d_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1182_c7_604d_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1182_c7_604d_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1182_c7_604d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1182_c7_604d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1182_c7_604d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1182_c7_604d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1182_c7_604d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1182_c7_604d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1182_c7_604d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1182_c7_604d_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1182_c7_604d_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1182_c7_604d_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1182_c7_604d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1182_c7_604d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1182_c7_604d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1182_c7_604d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1182_c7_604d_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1182_c7_604d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1182_c7_604d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1182_c7_604d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1182_c7_604d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1182_c7_604d_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1182_c7_604d]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1182_c7_604d_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1182_c7_604d_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1182_c7_604d_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1182_c7_604d_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1187_c11_871d]
signal BIN_OP_EQ_uxn_opcodes_h_l1187_c11_871d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1187_c11_871d_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1187_c11_871d_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1187_c7_ce6a]
signal n16_MUX_uxn_opcodes_h_l1187_c7_ce6a_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1187_c7_ce6a_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1187_c7_ce6a_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1187_c7_ce6a_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1187_c7_ce6a]
signal t16_MUX_uxn_opcodes_h_l1187_c7_ce6a_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1187_c7_ce6a_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1187_c7_ce6a_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1187_c7_ce6a_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1187_c7_ce6a]
signal tmp16_MUX_uxn_opcodes_h_l1187_c7_ce6a_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1187_c7_ce6a_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1187_c7_ce6a_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1187_c7_ce6a_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1187_c7_ce6a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1187_c7_ce6a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1187_c7_ce6a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1187_c7_ce6a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1187_c7_ce6a_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1187_c7_ce6a]
signal result_stack_value_MUX_uxn_opcodes_h_l1187_c7_ce6a_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1187_c7_ce6a_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1187_c7_ce6a_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1187_c7_ce6a_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1187_c7_ce6a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1187_c7_ce6a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1187_c7_ce6a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1187_c7_ce6a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1187_c7_ce6a_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1187_c7_ce6a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1187_c7_ce6a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1187_c7_ce6a_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1187_c7_ce6a_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1187_c7_ce6a_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1187_c7_ce6a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1187_c7_ce6a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1187_c7_ce6a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1187_c7_ce6a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1187_c7_ce6a_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1187_c7_ce6a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1187_c7_ce6a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1187_c7_ce6a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1187_c7_ce6a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1187_c7_ce6a_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1187_c7_ce6a]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1187_c7_ce6a_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1187_c7_ce6a_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1187_c7_ce6a_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1187_c7_ce6a_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1190_c11_368c]
signal BIN_OP_EQ_uxn_opcodes_h_l1190_c11_368c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1190_c11_368c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1190_c11_368c_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1190_c7_a809]
signal n16_MUX_uxn_opcodes_h_l1190_c7_a809_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1190_c7_a809_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1190_c7_a809_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1190_c7_a809_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1190_c7_a809]
signal t16_MUX_uxn_opcodes_h_l1190_c7_a809_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1190_c7_a809_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1190_c7_a809_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1190_c7_a809_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1190_c7_a809]
signal tmp16_MUX_uxn_opcodes_h_l1190_c7_a809_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1190_c7_a809_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1190_c7_a809_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1190_c7_a809_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1190_c7_a809]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1190_c7_a809_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1190_c7_a809_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1190_c7_a809_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1190_c7_a809_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1190_c7_a809]
signal result_stack_value_MUX_uxn_opcodes_h_l1190_c7_a809_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1190_c7_a809_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1190_c7_a809_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1190_c7_a809_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1190_c7_a809]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1190_c7_a809_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1190_c7_a809_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1190_c7_a809_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1190_c7_a809_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1190_c7_a809]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1190_c7_a809_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1190_c7_a809_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1190_c7_a809_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1190_c7_a809_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1190_c7_a809]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1190_c7_a809_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1190_c7_a809_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1190_c7_a809_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1190_c7_a809_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1190_c7_a809]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1190_c7_a809_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1190_c7_a809_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1190_c7_a809_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1190_c7_a809_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1190_c7_a809]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1190_c7_a809_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1190_c7_a809_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1190_c7_a809_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1190_c7_a809_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1191_c3_64df]
signal BIN_OP_OR_uxn_opcodes_h_l1191_c3_64df_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1191_c3_64df_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1191_c3_64df_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1194_c11_048f]
signal BIN_OP_EQ_uxn_opcodes_h_l1194_c11_048f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1194_c11_048f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1194_c11_048f_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1194_c7_404e]
signal n16_MUX_uxn_opcodes_h_l1194_c7_404e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1194_c7_404e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1194_c7_404e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1194_c7_404e_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1194_c7_404e]
signal tmp16_MUX_uxn_opcodes_h_l1194_c7_404e_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1194_c7_404e_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1194_c7_404e_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1194_c7_404e_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1194_c7_404e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c7_404e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c7_404e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c7_404e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c7_404e_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1194_c7_404e]
signal result_stack_value_MUX_uxn_opcodes_h_l1194_c7_404e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1194_c7_404e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1194_c7_404e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1194_c7_404e_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1194_c7_404e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1194_c7_404e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1194_c7_404e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1194_c7_404e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1194_c7_404e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1194_c7_404e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c7_404e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c7_404e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c7_404e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c7_404e_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1194_c7_404e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c7_404e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c7_404e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c7_404e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c7_404e_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1194_c7_404e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1194_c7_404e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1194_c7_404e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1194_c7_404e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1194_c7_404e_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1194_c7_404e]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1194_c7_404e_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1194_c7_404e_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1194_c7_404e_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1194_c7_404e_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1197_c11_948e]
signal BIN_OP_EQ_uxn_opcodes_h_l1197_c11_948e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1197_c11_948e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1197_c11_948e_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1197_c7_7aeb]
signal n16_MUX_uxn_opcodes_h_l1197_c7_7aeb_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1197_c7_7aeb_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1197_c7_7aeb_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1197_c7_7aeb_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1197_c7_7aeb]
signal tmp16_MUX_uxn_opcodes_h_l1197_c7_7aeb_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1197_c7_7aeb_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1197_c7_7aeb_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1197_c7_7aeb_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1197_c7_7aeb]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_7aeb_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_7aeb_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_7aeb_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_7aeb_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1197_c7_7aeb]
signal result_stack_value_MUX_uxn_opcodes_h_l1197_c7_7aeb_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1197_c7_7aeb_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1197_c7_7aeb_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1197_c7_7aeb_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1197_c7_7aeb]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_7aeb_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_7aeb_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_7aeb_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_7aeb_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1197_c7_7aeb]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_7aeb_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_7aeb_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_7aeb_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_7aeb_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1197_c7_7aeb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_7aeb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_7aeb_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_7aeb_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_7aeb_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1197_c7_7aeb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_7aeb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_7aeb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_7aeb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_7aeb_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1197_c7_7aeb]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1197_c7_7aeb_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1197_c7_7aeb_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1197_c7_7aeb_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1197_c7_7aeb_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1202_c11_366f]
signal BIN_OP_EQ_uxn_opcodes_h_l1202_c11_366f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1202_c11_366f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1202_c11_366f_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1202_c7_e8da]
signal n16_MUX_uxn_opcodes_h_l1202_c7_e8da_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1202_c7_e8da_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1202_c7_e8da_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1202_c7_e8da_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1202_c7_e8da]
signal tmp16_MUX_uxn_opcodes_h_l1202_c7_e8da_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1202_c7_e8da_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1202_c7_e8da_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1202_c7_e8da_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1202_c7_e8da]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1202_c7_e8da_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1202_c7_e8da_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1202_c7_e8da_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1202_c7_e8da_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1202_c7_e8da]
signal result_stack_value_MUX_uxn_opcodes_h_l1202_c7_e8da_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1202_c7_e8da_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1202_c7_e8da_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1202_c7_e8da_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1202_c7_e8da]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1202_c7_e8da_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1202_c7_e8da_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1202_c7_e8da_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1202_c7_e8da_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1202_c7_e8da]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1202_c7_e8da_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1202_c7_e8da_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1202_c7_e8da_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1202_c7_e8da_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1202_c7_e8da]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1202_c7_e8da_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1202_c7_e8da_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1202_c7_e8da_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1202_c7_e8da_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1202_c7_e8da]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1202_c7_e8da_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1202_c7_e8da_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1202_c7_e8da_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1202_c7_e8da_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1202_c7_e8da]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1202_c7_e8da_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1202_c7_e8da_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1202_c7_e8da_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1202_c7_e8da_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1205_c11_f0ea]
signal BIN_OP_EQ_uxn_opcodes_h_l1205_c11_f0ea_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1205_c11_f0ea_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1205_c11_f0ea_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1205_c7_0d12]
signal n16_MUX_uxn_opcodes_h_l1205_c7_0d12_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1205_c7_0d12_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1205_c7_0d12_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1205_c7_0d12_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1205_c7_0d12]
signal tmp16_MUX_uxn_opcodes_h_l1205_c7_0d12_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1205_c7_0d12_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1205_c7_0d12_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1205_c7_0d12_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1205_c7_0d12]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1205_c7_0d12_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1205_c7_0d12_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1205_c7_0d12_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1205_c7_0d12_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1205_c7_0d12]
signal result_stack_value_MUX_uxn_opcodes_h_l1205_c7_0d12_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1205_c7_0d12_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1205_c7_0d12_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1205_c7_0d12_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1205_c7_0d12]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1205_c7_0d12_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1205_c7_0d12_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1205_c7_0d12_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1205_c7_0d12_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1205_c7_0d12]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1205_c7_0d12_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1205_c7_0d12_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1205_c7_0d12_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1205_c7_0d12_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1205_c7_0d12]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1205_c7_0d12_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1205_c7_0d12_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1205_c7_0d12_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1205_c7_0d12_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1205_c7_0d12]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1205_c7_0d12_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1205_c7_0d12_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1205_c7_0d12_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1205_c7_0d12_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1205_c7_0d12]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1205_c7_0d12_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1205_c7_0d12_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1205_c7_0d12_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1205_c7_0d12_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1206_c3_a8bc]
signal BIN_OP_OR_uxn_opcodes_h_l1206_c3_a8bc_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1206_c3_a8bc_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1206_c3_a8bc_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1207_c11_2a7c]
signal BIN_OP_OR_uxn_opcodes_h_l1207_c11_2a7c_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1207_c11_2a7c_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1207_c11_2a7c_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1210_c32_30c5]
signal BIN_OP_AND_uxn_opcodes_h_l1210_c32_30c5_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1210_c32_30c5_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1210_c32_30c5_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1210_c32_4214]
signal BIN_OP_GT_uxn_opcodes_h_l1210_c32_4214_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1210_c32_4214_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1210_c32_4214_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1210_c32_a73f]
signal MUX_uxn_opcodes_h_l1210_c32_a73f_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1210_c32_a73f_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1210_c32_a73f_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1210_c32_a73f_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1212_c11_d66d]
signal BIN_OP_EQ_uxn_opcodes_h_l1212_c11_d66d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1212_c11_d66d_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1212_c11_d66d_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1212_c7_780b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_780b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_780b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_780b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_780b_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1212_c7_780b]
signal result_stack_value_MUX_uxn_opcodes_h_l1212_c7_780b_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1212_c7_780b_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1212_c7_780b_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1212_c7_780b_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1212_c7_780b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_780b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_780b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_780b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_780b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1212_c7_780b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_780b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_780b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_780b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_780b_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1212_c7_780b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_780b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_780b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_780b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_780b_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1218_c11_4e16]
signal BIN_OP_EQ_uxn_opcodes_h_l1218_c11_4e16_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1218_c11_4e16_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1218_c11_4e16_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1218_c7_9f69]
signal result_stack_value_MUX_uxn_opcodes_h_l1218_c7_9f69_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1218_c7_9f69_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1218_c7_9f69_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1218_c7_9f69_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1218_c7_9f69]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_9f69_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_9f69_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_9f69_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_9f69_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1218_c7_9f69]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_9f69_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_9f69_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_9f69_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_9f69_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1218_c7_9f69]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_9f69_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_9f69_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_9f69_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_9f69_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1220_c34_fa92]
signal CONST_SR_8_uxn_opcodes_h_l1220_c34_fa92_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1220_c34_fa92_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1222_c11_31d8]
signal BIN_OP_EQ_uxn_opcodes_h_l1222_c11_31d8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1222_c11_31d8_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1222_c11_31d8_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1222_c7_d4f1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_d4f1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_d4f1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_d4f1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_d4f1_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1222_c7_d4f1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_d4f1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_d4f1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_d4f1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_d4f1_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1184_l1199_DUPLICATE_f1f6
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1184_l1199_DUPLICATE_f1f6_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1184_l1199_DUPLICATE_f1f6_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_287e( ref_toks_0 : opcode_result_t;
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
      base.is_sp_shift := ref_toks_1;
      base.stack_value := ref_toks_2;
      base.is_stack_write := ref_toks_3;
      base.sp_relative_shift := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.is_opc_done := ref_toks_6;
      base.is_stack_read := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1173_c6_ef77
BIN_OP_EQ_uxn_opcodes_h_l1173_c6_ef77 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1173_c6_ef77_left,
BIN_OP_EQ_uxn_opcodes_h_l1173_c6_ef77_right,
BIN_OP_EQ_uxn_opcodes_h_l1173_c6_ef77_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1173_c1_726a
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1173_c1_726a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1173_c1_726a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1173_c1_726a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1173_c1_726a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1173_c1_726a_return_output);

-- n16_MUX_uxn_opcodes_h_l1173_c2_25ea
n16_MUX_uxn_opcodes_h_l1173_c2_25ea : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1173_c2_25ea_cond,
n16_MUX_uxn_opcodes_h_l1173_c2_25ea_iftrue,
n16_MUX_uxn_opcodes_h_l1173_c2_25ea_iffalse,
n16_MUX_uxn_opcodes_h_l1173_c2_25ea_return_output);

-- t16_MUX_uxn_opcodes_h_l1173_c2_25ea
t16_MUX_uxn_opcodes_h_l1173_c2_25ea : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1173_c2_25ea_cond,
t16_MUX_uxn_opcodes_h_l1173_c2_25ea_iftrue,
t16_MUX_uxn_opcodes_h_l1173_c2_25ea_iffalse,
t16_MUX_uxn_opcodes_h_l1173_c2_25ea_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1173_c2_25ea
tmp16_MUX_uxn_opcodes_h_l1173_c2_25ea : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1173_c2_25ea_cond,
tmp16_MUX_uxn_opcodes_h_l1173_c2_25ea_iftrue,
tmp16_MUX_uxn_opcodes_h_l1173_c2_25ea_iffalse,
tmp16_MUX_uxn_opcodes_h_l1173_c2_25ea_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1173_c2_25ea
result_is_sp_shift_MUX_uxn_opcodes_h_l1173_c2_25ea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1173_c2_25ea_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1173_c2_25ea_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1173_c2_25ea_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1173_c2_25ea_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1173_c2_25ea
result_stack_value_MUX_uxn_opcodes_h_l1173_c2_25ea : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1173_c2_25ea_cond,
result_stack_value_MUX_uxn_opcodes_h_l1173_c2_25ea_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1173_c2_25ea_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1173_c2_25ea_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1173_c2_25ea
result_is_stack_write_MUX_uxn_opcodes_h_l1173_c2_25ea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1173_c2_25ea_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1173_c2_25ea_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1173_c2_25ea_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1173_c2_25ea_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1173_c2_25ea
result_sp_relative_shift_MUX_uxn_opcodes_h_l1173_c2_25ea : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1173_c2_25ea_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1173_c2_25ea_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1173_c2_25ea_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1173_c2_25ea_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1173_c2_25ea
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1173_c2_25ea : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1173_c2_25ea_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1173_c2_25ea_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1173_c2_25ea_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1173_c2_25ea_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1173_c2_25ea
result_is_opc_done_MUX_uxn_opcodes_h_l1173_c2_25ea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1173_c2_25ea_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1173_c2_25ea_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1173_c2_25ea_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1173_c2_25ea_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1173_c2_25ea
result_is_stack_read_MUX_uxn_opcodes_h_l1173_c2_25ea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1173_c2_25ea_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1173_c2_25ea_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1173_c2_25ea_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1173_c2_25ea_return_output);

-- printf_uxn_opcodes_h_l1174_c3_f733_uxn_opcodes_h_l1174_c3_f733
printf_uxn_opcodes_h_l1174_c3_f733_uxn_opcodes_h_l1174_c3_f733 : entity work.printf_uxn_opcodes_h_l1174_c3_f733_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1174_c3_f733_uxn_opcodes_h_l1174_c3_f733_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1179_c11_e07d
BIN_OP_EQ_uxn_opcodes_h_l1179_c11_e07d : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1179_c11_e07d_left,
BIN_OP_EQ_uxn_opcodes_h_l1179_c11_e07d_right,
BIN_OP_EQ_uxn_opcodes_h_l1179_c11_e07d_return_output);

-- n16_MUX_uxn_opcodes_h_l1179_c7_dbbf
n16_MUX_uxn_opcodes_h_l1179_c7_dbbf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1179_c7_dbbf_cond,
n16_MUX_uxn_opcodes_h_l1179_c7_dbbf_iftrue,
n16_MUX_uxn_opcodes_h_l1179_c7_dbbf_iffalse,
n16_MUX_uxn_opcodes_h_l1179_c7_dbbf_return_output);

-- t16_MUX_uxn_opcodes_h_l1179_c7_dbbf
t16_MUX_uxn_opcodes_h_l1179_c7_dbbf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1179_c7_dbbf_cond,
t16_MUX_uxn_opcodes_h_l1179_c7_dbbf_iftrue,
t16_MUX_uxn_opcodes_h_l1179_c7_dbbf_iffalse,
t16_MUX_uxn_opcodes_h_l1179_c7_dbbf_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1179_c7_dbbf
tmp16_MUX_uxn_opcodes_h_l1179_c7_dbbf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1179_c7_dbbf_cond,
tmp16_MUX_uxn_opcodes_h_l1179_c7_dbbf_iftrue,
tmp16_MUX_uxn_opcodes_h_l1179_c7_dbbf_iffalse,
tmp16_MUX_uxn_opcodes_h_l1179_c7_dbbf_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1179_c7_dbbf
result_is_sp_shift_MUX_uxn_opcodes_h_l1179_c7_dbbf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1179_c7_dbbf_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1179_c7_dbbf_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1179_c7_dbbf_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1179_c7_dbbf_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1179_c7_dbbf
result_stack_value_MUX_uxn_opcodes_h_l1179_c7_dbbf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1179_c7_dbbf_cond,
result_stack_value_MUX_uxn_opcodes_h_l1179_c7_dbbf_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1179_c7_dbbf_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1179_c7_dbbf_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1179_c7_dbbf
result_is_stack_write_MUX_uxn_opcodes_h_l1179_c7_dbbf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1179_c7_dbbf_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1179_c7_dbbf_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1179_c7_dbbf_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1179_c7_dbbf_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1179_c7_dbbf
result_sp_relative_shift_MUX_uxn_opcodes_h_l1179_c7_dbbf : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1179_c7_dbbf_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1179_c7_dbbf_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1179_c7_dbbf_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1179_c7_dbbf_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1179_c7_dbbf
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1179_c7_dbbf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1179_c7_dbbf_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1179_c7_dbbf_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1179_c7_dbbf_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1179_c7_dbbf_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1179_c7_dbbf
result_is_opc_done_MUX_uxn_opcodes_h_l1179_c7_dbbf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1179_c7_dbbf_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1179_c7_dbbf_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1179_c7_dbbf_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1179_c7_dbbf_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1179_c7_dbbf
result_is_stack_read_MUX_uxn_opcodes_h_l1179_c7_dbbf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1179_c7_dbbf_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1179_c7_dbbf_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1179_c7_dbbf_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1179_c7_dbbf_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1182_c11_20e4
BIN_OP_EQ_uxn_opcodes_h_l1182_c11_20e4 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1182_c11_20e4_left,
BIN_OP_EQ_uxn_opcodes_h_l1182_c11_20e4_right,
BIN_OP_EQ_uxn_opcodes_h_l1182_c11_20e4_return_output);

-- n16_MUX_uxn_opcodes_h_l1182_c7_604d
n16_MUX_uxn_opcodes_h_l1182_c7_604d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1182_c7_604d_cond,
n16_MUX_uxn_opcodes_h_l1182_c7_604d_iftrue,
n16_MUX_uxn_opcodes_h_l1182_c7_604d_iffalse,
n16_MUX_uxn_opcodes_h_l1182_c7_604d_return_output);

-- t16_MUX_uxn_opcodes_h_l1182_c7_604d
t16_MUX_uxn_opcodes_h_l1182_c7_604d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1182_c7_604d_cond,
t16_MUX_uxn_opcodes_h_l1182_c7_604d_iftrue,
t16_MUX_uxn_opcodes_h_l1182_c7_604d_iffalse,
t16_MUX_uxn_opcodes_h_l1182_c7_604d_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1182_c7_604d
tmp16_MUX_uxn_opcodes_h_l1182_c7_604d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1182_c7_604d_cond,
tmp16_MUX_uxn_opcodes_h_l1182_c7_604d_iftrue,
tmp16_MUX_uxn_opcodes_h_l1182_c7_604d_iffalse,
tmp16_MUX_uxn_opcodes_h_l1182_c7_604d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1182_c7_604d
result_is_sp_shift_MUX_uxn_opcodes_h_l1182_c7_604d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1182_c7_604d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1182_c7_604d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1182_c7_604d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1182_c7_604d_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1182_c7_604d
result_stack_value_MUX_uxn_opcodes_h_l1182_c7_604d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1182_c7_604d_cond,
result_stack_value_MUX_uxn_opcodes_h_l1182_c7_604d_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1182_c7_604d_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1182_c7_604d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1182_c7_604d
result_is_stack_write_MUX_uxn_opcodes_h_l1182_c7_604d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1182_c7_604d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1182_c7_604d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1182_c7_604d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1182_c7_604d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1182_c7_604d
result_sp_relative_shift_MUX_uxn_opcodes_h_l1182_c7_604d : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1182_c7_604d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1182_c7_604d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1182_c7_604d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1182_c7_604d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1182_c7_604d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1182_c7_604d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1182_c7_604d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1182_c7_604d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1182_c7_604d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1182_c7_604d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1182_c7_604d
result_is_opc_done_MUX_uxn_opcodes_h_l1182_c7_604d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1182_c7_604d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1182_c7_604d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1182_c7_604d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1182_c7_604d_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1182_c7_604d
result_is_stack_read_MUX_uxn_opcodes_h_l1182_c7_604d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1182_c7_604d_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1182_c7_604d_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1182_c7_604d_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1182_c7_604d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1187_c11_871d
BIN_OP_EQ_uxn_opcodes_h_l1187_c11_871d : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1187_c11_871d_left,
BIN_OP_EQ_uxn_opcodes_h_l1187_c11_871d_right,
BIN_OP_EQ_uxn_opcodes_h_l1187_c11_871d_return_output);

-- n16_MUX_uxn_opcodes_h_l1187_c7_ce6a
n16_MUX_uxn_opcodes_h_l1187_c7_ce6a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1187_c7_ce6a_cond,
n16_MUX_uxn_opcodes_h_l1187_c7_ce6a_iftrue,
n16_MUX_uxn_opcodes_h_l1187_c7_ce6a_iffalse,
n16_MUX_uxn_opcodes_h_l1187_c7_ce6a_return_output);

-- t16_MUX_uxn_opcodes_h_l1187_c7_ce6a
t16_MUX_uxn_opcodes_h_l1187_c7_ce6a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1187_c7_ce6a_cond,
t16_MUX_uxn_opcodes_h_l1187_c7_ce6a_iftrue,
t16_MUX_uxn_opcodes_h_l1187_c7_ce6a_iffalse,
t16_MUX_uxn_opcodes_h_l1187_c7_ce6a_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1187_c7_ce6a
tmp16_MUX_uxn_opcodes_h_l1187_c7_ce6a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1187_c7_ce6a_cond,
tmp16_MUX_uxn_opcodes_h_l1187_c7_ce6a_iftrue,
tmp16_MUX_uxn_opcodes_h_l1187_c7_ce6a_iffalse,
tmp16_MUX_uxn_opcodes_h_l1187_c7_ce6a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1187_c7_ce6a
result_is_sp_shift_MUX_uxn_opcodes_h_l1187_c7_ce6a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1187_c7_ce6a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1187_c7_ce6a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1187_c7_ce6a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1187_c7_ce6a_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1187_c7_ce6a
result_stack_value_MUX_uxn_opcodes_h_l1187_c7_ce6a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1187_c7_ce6a_cond,
result_stack_value_MUX_uxn_opcodes_h_l1187_c7_ce6a_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1187_c7_ce6a_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1187_c7_ce6a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1187_c7_ce6a
result_is_stack_write_MUX_uxn_opcodes_h_l1187_c7_ce6a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1187_c7_ce6a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1187_c7_ce6a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1187_c7_ce6a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1187_c7_ce6a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1187_c7_ce6a
result_sp_relative_shift_MUX_uxn_opcodes_h_l1187_c7_ce6a : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1187_c7_ce6a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1187_c7_ce6a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1187_c7_ce6a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1187_c7_ce6a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1187_c7_ce6a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1187_c7_ce6a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1187_c7_ce6a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1187_c7_ce6a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1187_c7_ce6a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1187_c7_ce6a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1187_c7_ce6a
result_is_opc_done_MUX_uxn_opcodes_h_l1187_c7_ce6a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1187_c7_ce6a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1187_c7_ce6a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1187_c7_ce6a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1187_c7_ce6a_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1187_c7_ce6a
result_is_stack_read_MUX_uxn_opcodes_h_l1187_c7_ce6a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1187_c7_ce6a_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1187_c7_ce6a_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1187_c7_ce6a_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1187_c7_ce6a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1190_c11_368c
BIN_OP_EQ_uxn_opcodes_h_l1190_c11_368c : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1190_c11_368c_left,
BIN_OP_EQ_uxn_opcodes_h_l1190_c11_368c_right,
BIN_OP_EQ_uxn_opcodes_h_l1190_c11_368c_return_output);

-- n16_MUX_uxn_opcodes_h_l1190_c7_a809
n16_MUX_uxn_opcodes_h_l1190_c7_a809 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1190_c7_a809_cond,
n16_MUX_uxn_opcodes_h_l1190_c7_a809_iftrue,
n16_MUX_uxn_opcodes_h_l1190_c7_a809_iffalse,
n16_MUX_uxn_opcodes_h_l1190_c7_a809_return_output);

-- t16_MUX_uxn_opcodes_h_l1190_c7_a809
t16_MUX_uxn_opcodes_h_l1190_c7_a809 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1190_c7_a809_cond,
t16_MUX_uxn_opcodes_h_l1190_c7_a809_iftrue,
t16_MUX_uxn_opcodes_h_l1190_c7_a809_iffalse,
t16_MUX_uxn_opcodes_h_l1190_c7_a809_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1190_c7_a809
tmp16_MUX_uxn_opcodes_h_l1190_c7_a809 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1190_c7_a809_cond,
tmp16_MUX_uxn_opcodes_h_l1190_c7_a809_iftrue,
tmp16_MUX_uxn_opcodes_h_l1190_c7_a809_iffalse,
tmp16_MUX_uxn_opcodes_h_l1190_c7_a809_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1190_c7_a809
result_is_sp_shift_MUX_uxn_opcodes_h_l1190_c7_a809 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1190_c7_a809_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1190_c7_a809_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1190_c7_a809_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1190_c7_a809_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1190_c7_a809
result_stack_value_MUX_uxn_opcodes_h_l1190_c7_a809 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1190_c7_a809_cond,
result_stack_value_MUX_uxn_opcodes_h_l1190_c7_a809_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1190_c7_a809_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1190_c7_a809_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1190_c7_a809
result_is_stack_write_MUX_uxn_opcodes_h_l1190_c7_a809 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1190_c7_a809_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1190_c7_a809_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1190_c7_a809_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1190_c7_a809_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1190_c7_a809
result_sp_relative_shift_MUX_uxn_opcodes_h_l1190_c7_a809 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1190_c7_a809_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1190_c7_a809_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1190_c7_a809_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1190_c7_a809_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1190_c7_a809
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1190_c7_a809 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1190_c7_a809_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1190_c7_a809_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1190_c7_a809_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1190_c7_a809_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1190_c7_a809
result_is_opc_done_MUX_uxn_opcodes_h_l1190_c7_a809 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1190_c7_a809_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1190_c7_a809_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1190_c7_a809_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1190_c7_a809_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1190_c7_a809
result_is_stack_read_MUX_uxn_opcodes_h_l1190_c7_a809 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1190_c7_a809_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1190_c7_a809_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1190_c7_a809_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1190_c7_a809_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1191_c3_64df
BIN_OP_OR_uxn_opcodes_h_l1191_c3_64df : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1191_c3_64df_left,
BIN_OP_OR_uxn_opcodes_h_l1191_c3_64df_right,
BIN_OP_OR_uxn_opcodes_h_l1191_c3_64df_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1194_c11_048f
BIN_OP_EQ_uxn_opcodes_h_l1194_c11_048f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1194_c11_048f_left,
BIN_OP_EQ_uxn_opcodes_h_l1194_c11_048f_right,
BIN_OP_EQ_uxn_opcodes_h_l1194_c11_048f_return_output);

-- n16_MUX_uxn_opcodes_h_l1194_c7_404e
n16_MUX_uxn_opcodes_h_l1194_c7_404e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1194_c7_404e_cond,
n16_MUX_uxn_opcodes_h_l1194_c7_404e_iftrue,
n16_MUX_uxn_opcodes_h_l1194_c7_404e_iffalse,
n16_MUX_uxn_opcodes_h_l1194_c7_404e_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1194_c7_404e
tmp16_MUX_uxn_opcodes_h_l1194_c7_404e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1194_c7_404e_cond,
tmp16_MUX_uxn_opcodes_h_l1194_c7_404e_iftrue,
tmp16_MUX_uxn_opcodes_h_l1194_c7_404e_iffalse,
tmp16_MUX_uxn_opcodes_h_l1194_c7_404e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c7_404e
result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c7_404e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c7_404e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c7_404e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c7_404e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c7_404e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1194_c7_404e
result_stack_value_MUX_uxn_opcodes_h_l1194_c7_404e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1194_c7_404e_cond,
result_stack_value_MUX_uxn_opcodes_h_l1194_c7_404e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1194_c7_404e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1194_c7_404e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1194_c7_404e
result_is_stack_write_MUX_uxn_opcodes_h_l1194_c7_404e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1194_c7_404e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1194_c7_404e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1194_c7_404e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1194_c7_404e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c7_404e
result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c7_404e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c7_404e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c7_404e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c7_404e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c7_404e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c7_404e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c7_404e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c7_404e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c7_404e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c7_404e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c7_404e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1194_c7_404e
result_is_opc_done_MUX_uxn_opcodes_h_l1194_c7_404e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1194_c7_404e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1194_c7_404e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1194_c7_404e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1194_c7_404e_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1194_c7_404e
result_is_stack_read_MUX_uxn_opcodes_h_l1194_c7_404e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1194_c7_404e_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1194_c7_404e_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1194_c7_404e_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1194_c7_404e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1197_c11_948e
BIN_OP_EQ_uxn_opcodes_h_l1197_c11_948e : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1197_c11_948e_left,
BIN_OP_EQ_uxn_opcodes_h_l1197_c11_948e_right,
BIN_OP_EQ_uxn_opcodes_h_l1197_c11_948e_return_output);

-- n16_MUX_uxn_opcodes_h_l1197_c7_7aeb
n16_MUX_uxn_opcodes_h_l1197_c7_7aeb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1197_c7_7aeb_cond,
n16_MUX_uxn_opcodes_h_l1197_c7_7aeb_iftrue,
n16_MUX_uxn_opcodes_h_l1197_c7_7aeb_iffalse,
n16_MUX_uxn_opcodes_h_l1197_c7_7aeb_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1197_c7_7aeb
tmp16_MUX_uxn_opcodes_h_l1197_c7_7aeb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1197_c7_7aeb_cond,
tmp16_MUX_uxn_opcodes_h_l1197_c7_7aeb_iftrue,
tmp16_MUX_uxn_opcodes_h_l1197_c7_7aeb_iffalse,
tmp16_MUX_uxn_opcodes_h_l1197_c7_7aeb_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_7aeb
result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_7aeb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_7aeb_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_7aeb_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_7aeb_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_7aeb_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1197_c7_7aeb
result_stack_value_MUX_uxn_opcodes_h_l1197_c7_7aeb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1197_c7_7aeb_cond,
result_stack_value_MUX_uxn_opcodes_h_l1197_c7_7aeb_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1197_c7_7aeb_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1197_c7_7aeb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_7aeb
result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_7aeb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_7aeb_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_7aeb_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_7aeb_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_7aeb_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_7aeb
result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_7aeb : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_7aeb_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_7aeb_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_7aeb_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_7aeb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_7aeb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_7aeb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_7aeb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_7aeb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_7aeb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_7aeb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_7aeb
result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_7aeb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_7aeb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_7aeb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_7aeb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_7aeb_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1197_c7_7aeb
result_is_stack_read_MUX_uxn_opcodes_h_l1197_c7_7aeb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1197_c7_7aeb_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1197_c7_7aeb_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1197_c7_7aeb_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1197_c7_7aeb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1202_c11_366f
BIN_OP_EQ_uxn_opcodes_h_l1202_c11_366f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1202_c11_366f_left,
BIN_OP_EQ_uxn_opcodes_h_l1202_c11_366f_right,
BIN_OP_EQ_uxn_opcodes_h_l1202_c11_366f_return_output);

-- n16_MUX_uxn_opcodes_h_l1202_c7_e8da
n16_MUX_uxn_opcodes_h_l1202_c7_e8da : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1202_c7_e8da_cond,
n16_MUX_uxn_opcodes_h_l1202_c7_e8da_iftrue,
n16_MUX_uxn_opcodes_h_l1202_c7_e8da_iffalse,
n16_MUX_uxn_opcodes_h_l1202_c7_e8da_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1202_c7_e8da
tmp16_MUX_uxn_opcodes_h_l1202_c7_e8da : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1202_c7_e8da_cond,
tmp16_MUX_uxn_opcodes_h_l1202_c7_e8da_iftrue,
tmp16_MUX_uxn_opcodes_h_l1202_c7_e8da_iffalse,
tmp16_MUX_uxn_opcodes_h_l1202_c7_e8da_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1202_c7_e8da
result_is_sp_shift_MUX_uxn_opcodes_h_l1202_c7_e8da : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1202_c7_e8da_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1202_c7_e8da_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1202_c7_e8da_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1202_c7_e8da_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1202_c7_e8da
result_stack_value_MUX_uxn_opcodes_h_l1202_c7_e8da : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1202_c7_e8da_cond,
result_stack_value_MUX_uxn_opcodes_h_l1202_c7_e8da_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1202_c7_e8da_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1202_c7_e8da_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1202_c7_e8da
result_is_stack_write_MUX_uxn_opcodes_h_l1202_c7_e8da : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1202_c7_e8da_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1202_c7_e8da_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1202_c7_e8da_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1202_c7_e8da_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1202_c7_e8da
result_sp_relative_shift_MUX_uxn_opcodes_h_l1202_c7_e8da : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1202_c7_e8da_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1202_c7_e8da_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1202_c7_e8da_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1202_c7_e8da_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1202_c7_e8da
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1202_c7_e8da : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1202_c7_e8da_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1202_c7_e8da_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1202_c7_e8da_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1202_c7_e8da_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1202_c7_e8da
result_is_opc_done_MUX_uxn_opcodes_h_l1202_c7_e8da : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1202_c7_e8da_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1202_c7_e8da_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1202_c7_e8da_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1202_c7_e8da_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1202_c7_e8da
result_is_stack_read_MUX_uxn_opcodes_h_l1202_c7_e8da : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1202_c7_e8da_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1202_c7_e8da_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1202_c7_e8da_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1202_c7_e8da_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1205_c11_f0ea
BIN_OP_EQ_uxn_opcodes_h_l1205_c11_f0ea : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1205_c11_f0ea_left,
BIN_OP_EQ_uxn_opcodes_h_l1205_c11_f0ea_right,
BIN_OP_EQ_uxn_opcodes_h_l1205_c11_f0ea_return_output);

-- n16_MUX_uxn_opcodes_h_l1205_c7_0d12
n16_MUX_uxn_opcodes_h_l1205_c7_0d12 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1205_c7_0d12_cond,
n16_MUX_uxn_opcodes_h_l1205_c7_0d12_iftrue,
n16_MUX_uxn_opcodes_h_l1205_c7_0d12_iffalse,
n16_MUX_uxn_opcodes_h_l1205_c7_0d12_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1205_c7_0d12
tmp16_MUX_uxn_opcodes_h_l1205_c7_0d12 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1205_c7_0d12_cond,
tmp16_MUX_uxn_opcodes_h_l1205_c7_0d12_iftrue,
tmp16_MUX_uxn_opcodes_h_l1205_c7_0d12_iffalse,
tmp16_MUX_uxn_opcodes_h_l1205_c7_0d12_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1205_c7_0d12
result_is_sp_shift_MUX_uxn_opcodes_h_l1205_c7_0d12 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1205_c7_0d12_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1205_c7_0d12_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1205_c7_0d12_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1205_c7_0d12_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1205_c7_0d12
result_stack_value_MUX_uxn_opcodes_h_l1205_c7_0d12 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1205_c7_0d12_cond,
result_stack_value_MUX_uxn_opcodes_h_l1205_c7_0d12_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1205_c7_0d12_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1205_c7_0d12_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1205_c7_0d12
result_is_stack_write_MUX_uxn_opcodes_h_l1205_c7_0d12 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1205_c7_0d12_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1205_c7_0d12_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1205_c7_0d12_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1205_c7_0d12_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1205_c7_0d12
result_sp_relative_shift_MUX_uxn_opcodes_h_l1205_c7_0d12 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1205_c7_0d12_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1205_c7_0d12_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1205_c7_0d12_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1205_c7_0d12_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1205_c7_0d12
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1205_c7_0d12 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1205_c7_0d12_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1205_c7_0d12_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1205_c7_0d12_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1205_c7_0d12_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1205_c7_0d12
result_is_opc_done_MUX_uxn_opcodes_h_l1205_c7_0d12 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1205_c7_0d12_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1205_c7_0d12_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1205_c7_0d12_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1205_c7_0d12_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1205_c7_0d12
result_is_stack_read_MUX_uxn_opcodes_h_l1205_c7_0d12 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1205_c7_0d12_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1205_c7_0d12_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1205_c7_0d12_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1205_c7_0d12_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1206_c3_a8bc
BIN_OP_OR_uxn_opcodes_h_l1206_c3_a8bc : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1206_c3_a8bc_left,
BIN_OP_OR_uxn_opcodes_h_l1206_c3_a8bc_right,
BIN_OP_OR_uxn_opcodes_h_l1206_c3_a8bc_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1207_c11_2a7c
BIN_OP_OR_uxn_opcodes_h_l1207_c11_2a7c : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1207_c11_2a7c_left,
BIN_OP_OR_uxn_opcodes_h_l1207_c11_2a7c_right,
BIN_OP_OR_uxn_opcodes_h_l1207_c11_2a7c_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1210_c32_30c5
BIN_OP_AND_uxn_opcodes_h_l1210_c32_30c5 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1210_c32_30c5_left,
BIN_OP_AND_uxn_opcodes_h_l1210_c32_30c5_right,
BIN_OP_AND_uxn_opcodes_h_l1210_c32_30c5_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1210_c32_4214
BIN_OP_GT_uxn_opcodes_h_l1210_c32_4214 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1210_c32_4214_left,
BIN_OP_GT_uxn_opcodes_h_l1210_c32_4214_right,
BIN_OP_GT_uxn_opcodes_h_l1210_c32_4214_return_output);

-- MUX_uxn_opcodes_h_l1210_c32_a73f
MUX_uxn_opcodes_h_l1210_c32_a73f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1210_c32_a73f_cond,
MUX_uxn_opcodes_h_l1210_c32_a73f_iftrue,
MUX_uxn_opcodes_h_l1210_c32_a73f_iffalse,
MUX_uxn_opcodes_h_l1210_c32_a73f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1212_c11_d66d
BIN_OP_EQ_uxn_opcodes_h_l1212_c11_d66d : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1212_c11_d66d_left,
BIN_OP_EQ_uxn_opcodes_h_l1212_c11_d66d_right,
BIN_OP_EQ_uxn_opcodes_h_l1212_c11_d66d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_780b
result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_780b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_780b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_780b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_780b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_780b_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1212_c7_780b
result_stack_value_MUX_uxn_opcodes_h_l1212_c7_780b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1212_c7_780b_cond,
result_stack_value_MUX_uxn_opcodes_h_l1212_c7_780b_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1212_c7_780b_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1212_c7_780b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_780b
result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_780b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_780b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_780b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_780b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_780b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_780b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_780b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_780b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_780b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_780b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_780b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_780b
result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_780b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_780b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_780b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_780b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_780b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1218_c11_4e16
BIN_OP_EQ_uxn_opcodes_h_l1218_c11_4e16 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1218_c11_4e16_left,
BIN_OP_EQ_uxn_opcodes_h_l1218_c11_4e16_right,
BIN_OP_EQ_uxn_opcodes_h_l1218_c11_4e16_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1218_c7_9f69
result_stack_value_MUX_uxn_opcodes_h_l1218_c7_9f69 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1218_c7_9f69_cond,
result_stack_value_MUX_uxn_opcodes_h_l1218_c7_9f69_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1218_c7_9f69_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1218_c7_9f69_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_9f69
result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_9f69 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_9f69_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_9f69_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_9f69_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_9f69_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_9f69
result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_9f69 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_9f69_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_9f69_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_9f69_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_9f69_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_9f69
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_9f69 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_9f69_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_9f69_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_9f69_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_9f69_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1220_c34_fa92
CONST_SR_8_uxn_opcodes_h_l1220_c34_fa92 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1220_c34_fa92_x,
CONST_SR_8_uxn_opcodes_h_l1220_c34_fa92_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1222_c11_31d8
BIN_OP_EQ_uxn_opcodes_h_l1222_c11_31d8 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1222_c11_31d8_left,
BIN_OP_EQ_uxn_opcodes_h_l1222_c11_31d8_right,
BIN_OP_EQ_uxn_opcodes_h_l1222_c11_31d8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_d4f1
result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_d4f1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_d4f1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_d4f1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_d4f1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_d4f1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_d4f1
result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_d4f1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_d4f1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_d4f1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_d4f1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_d4f1_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1184_l1199_DUPLICATE_f1f6
CONST_SL_8_uint16_t_uxn_opcodes_h_l1184_l1199_DUPLICATE_f1f6 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1184_l1199_DUPLICATE_f1f6_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1184_l1199_DUPLICATE_f1f6_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1173_c6_ef77_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1173_c1_726a_return_output,
 n16_MUX_uxn_opcodes_h_l1173_c2_25ea_return_output,
 t16_MUX_uxn_opcodes_h_l1173_c2_25ea_return_output,
 tmp16_MUX_uxn_opcodes_h_l1173_c2_25ea_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1173_c2_25ea_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1173_c2_25ea_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1173_c2_25ea_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1173_c2_25ea_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1173_c2_25ea_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1173_c2_25ea_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1173_c2_25ea_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1179_c11_e07d_return_output,
 n16_MUX_uxn_opcodes_h_l1179_c7_dbbf_return_output,
 t16_MUX_uxn_opcodes_h_l1179_c7_dbbf_return_output,
 tmp16_MUX_uxn_opcodes_h_l1179_c7_dbbf_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1179_c7_dbbf_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1179_c7_dbbf_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1179_c7_dbbf_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1179_c7_dbbf_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1179_c7_dbbf_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1179_c7_dbbf_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1179_c7_dbbf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1182_c11_20e4_return_output,
 n16_MUX_uxn_opcodes_h_l1182_c7_604d_return_output,
 t16_MUX_uxn_opcodes_h_l1182_c7_604d_return_output,
 tmp16_MUX_uxn_opcodes_h_l1182_c7_604d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1182_c7_604d_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1182_c7_604d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1182_c7_604d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1182_c7_604d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1182_c7_604d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1182_c7_604d_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1182_c7_604d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1187_c11_871d_return_output,
 n16_MUX_uxn_opcodes_h_l1187_c7_ce6a_return_output,
 t16_MUX_uxn_opcodes_h_l1187_c7_ce6a_return_output,
 tmp16_MUX_uxn_opcodes_h_l1187_c7_ce6a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1187_c7_ce6a_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1187_c7_ce6a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1187_c7_ce6a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1187_c7_ce6a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1187_c7_ce6a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1187_c7_ce6a_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1187_c7_ce6a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1190_c11_368c_return_output,
 n16_MUX_uxn_opcodes_h_l1190_c7_a809_return_output,
 t16_MUX_uxn_opcodes_h_l1190_c7_a809_return_output,
 tmp16_MUX_uxn_opcodes_h_l1190_c7_a809_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1190_c7_a809_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1190_c7_a809_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1190_c7_a809_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1190_c7_a809_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1190_c7_a809_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1190_c7_a809_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1190_c7_a809_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1191_c3_64df_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1194_c11_048f_return_output,
 n16_MUX_uxn_opcodes_h_l1194_c7_404e_return_output,
 tmp16_MUX_uxn_opcodes_h_l1194_c7_404e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c7_404e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1194_c7_404e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1194_c7_404e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c7_404e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c7_404e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1194_c7_404e_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1194_c7_404e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1197_c11_948e_return_output,
 n16_MUX_uxn_opcodes_h_l1197_c7_7aeb_return_output,
 tmp16_MUX_uxn_opcodes_h_l1197_c7_7aeb_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_7aeb_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1197_c7_7aeb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_7aeb_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_7aeb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_7aeb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_7aeb_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1197_c7_7aeb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1202_c11_366f_return_output,
 n16_MUX_uxn_opcodes_h_l1202_c7_e8da_return_output,
 tmp16_MUX_uxn_opcodes_h_l1202_c7_e8da_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1202_c7_e8da_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1202_c7_e8da_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1202_c7_e8da_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1202_c7_e8da_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1202_c7_e8da_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1202_c7_e8da_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1202_c7_e8da_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1205_c11_f0ea_return_output,
 n16_MUX_uxn_opcodes_h_l1205_c7_0d12_return_output,
 tmp16_MUX_uxn_opcodes_h_l1205_c7_0d12_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1205_c7_0d12_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1205_c7_0d12_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1205_c7_0d12_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1205_c7_0d12_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1205_c7_0d12_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1205_c7_0d12_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1205_c7_0d12_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1206_c3_a8bc_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1207_c11_2a7c_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1210_c32_30c5_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1210_c32_4214_return_output,
 MUX_uxn_opcodes_h_l1210_c32_a73f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1212_c11_d66d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_780b_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1212_c7_780b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_780b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_780b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_780b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1218_c11_4e16_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1218_c7_9f69_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_9f69_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_9f69_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_9f69_return_output,
 CONST_SR_8_uxn_opcodes_h_l1220_c34_fa92_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1222_c11_31d8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_d4f1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_d4f1_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1184_l1199_DUPLICATE_f1f6_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1173_c6_ef77_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1173_c6_ef77_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1173_c6_ef77_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1173_c1_726a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1173_c1_726a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1173_c1_726a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1173_c1_726a_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1173_c2_25ea_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1173_c2_25ea_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1179_c7_dbbf_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1173_c2_25ea_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1173_c2_25ea_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1173_c2_25ea_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1173_c2_25ea_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1179_c7_dbbf_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1173_c2_25ea_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1173_c2_25ea_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1173_c2_25ea_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1173_c2_25ea_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1179_c7_dbbf_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1173_c2_25ea_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1173_c2_25ea_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1173_c2_25ea_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1173_c2_25ea_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1179_c7_dbbf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1173_c2_25ea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1173_c2_25ea_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1173_c2_25ea_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1173_c2_25ea_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1179_c7_dbbf_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1173_c2_25ea_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1173_c2_25ea_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1173_c2_25ea_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1173_c2_25ea_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1179_c7_dbbf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1173_c2_25ea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1173_c2_25ea_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1173_c2_25ea_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1173_c2_25ea_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1179_c7_dbbf_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1173_c2_25ea_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1173_c2_25ea_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1173_c2_25ea_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1176_c3_4f96 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1173_c2_25ea_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1179_c7_dbbf_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1173_c2_25ea_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1173_c2_25ea_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1173_c2_25ea_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1173_c2_25ea_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1179_c7_dbbf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1173_c2_25ea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1173_c2_25ea_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1173_c2_25ea_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1173_c2_25ea_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1179_c7_dbbf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1173_c2_25ea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1173_c2_25ea_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1174_c3_f733_uxn_opcodes_h_l1174_c3_f733_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1179_c11_e07d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1179_c11_e07d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1179_c11_e07d_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1179_c7_dbbf_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1179_c7_dbbf_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1182_c7_604d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1179_c7_dbbf_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1179_c7_dbbf_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1179_c7_dbbf_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1182_c7_604d_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1179_c7_dbbf_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1179_c7_dbbf_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1179_c7_dbbf_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1182_c7_604d_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1179_c7_dbbf_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1179_c7_dbbf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1179_c7_dbbf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1182_c7_604d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1179_c7_dbbf_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1179_c7_dbbf_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1179_c7_dbbf_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1182_c7_604d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1179_c7_dbbf_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1179_c7_dbbf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1179_c7_dbbf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1182_c7_604d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1179_c7_dbbf_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1179_c7_dbbf_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1179_c7_dbbf_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1182_c7_604d_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1179_c7_dbbf_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1179_c7_dbbf_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1180_c3_56b9 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1179_c7_dbbf_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1182_c7_604d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1179_c7_dbbf_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1179_c7_dbbf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1179_c7_dbbf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1182_c7_604d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1179_c7_dbbf_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1179_c7_dbbf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1179_c7_dbbf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1182_c7_604d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1179_c7_dbbf_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1182_c11_20e4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1182_c11_20e4_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1182_c11_20e4_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1182_c7_604d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1182_c7_604d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1187_c7_ce6a_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1182_c7_604d_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1182_c7_604d_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1182_c7_604d_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1187_c7_ce6a_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1182_c7_604d_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1182_c7_604d_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1182_c7_604d_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1187_c7_ce6a_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1182_c7_604d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1182_c7_604d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1182_c7_604d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1187_c7_ce6a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1182_c7_604d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1182_c7_604d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1182_c7_604d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1187_c7_ce6a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1182_c7_604d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1182_c7_604d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1182_c7_604d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1187_c7_ce6a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1182_c7_604d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1182_c7_604d_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1182_c7_604d_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1187_c7_ce6a_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1182_c7_604d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1182_c7_604d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1185_c3_f728 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1182_c7_604d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1187_c7_ce6a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1182_c7_604d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1182_c7_604d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1182_c7_604d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1187_c7_ce6a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1182_c7_604d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1182_c7_604d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1182_c7_604d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1187_c7_ce6a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1182_c7_604d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1187_c11_871d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1187_c11_871d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1187_c11_871d_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1187_c7_ce6a_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1187_c7_ce6a_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1190_c7_a809_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1187_c7_ce6a_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1187_c7_ce6a_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1187_c7_ce6a_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1190_c7_a809_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1187_c7_ce6a_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1187_c7_ce6a_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1187_c7_ce6a_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1190_c7_a809_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1187_c7_ce6a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1187_c7_ce6a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1187_c7_ce6a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1190_c7_a809_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1187_c7_ce6a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1187_c7_ce6a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1187_c7_ce6a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1190_c7_a809_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1187_c7_ce6a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1187_c7_ce6a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1187_c7_ce6a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1190_c7_a809_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1187_c7_ce6a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1187_c7_ce6a_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1187_c7_ce6a_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1190_c7_a809_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1187_c7_ce6a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1187_c7_ce6a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1188_c3_6835 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1187_c7_ce6a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1190_c7_a809_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1187_c7_ce6a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1187_c7_ce6a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1187_c7_ce6a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1190_c7_a809_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1187_c7_ce6a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1187_c7_ce6a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1187_c7_ce6a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1190_c7_a809_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1187_c7_ce6a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1190_c11_368c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1190_c11_368c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1190_c11_368c_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1190_c7_a809_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1190_c7_a809_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1194_c7_404e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1190_c7_a809_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1190_c7_a809_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1190_c7_a809_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1190_c7_a809_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1190_c7_a809_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1190_c7_a809_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1194_c7_404e_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1190_c7_a809_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1190_c7_a809_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1190_c7_a809_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c7_404e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1190_c7_a809_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1190_c7_a809_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1190_c7_a809_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1194_c7_404e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1190_c7_a809_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1190_c7_a809_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1190_c7_a809_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1194_c7_404e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1190_c7_a809_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1190_c7_a809_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1190_c7_a809_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c7_404e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1190_c7_a809_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1190_c7_a809_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1192_c3_bf40 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1190_c7_a809_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c7_404e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1190_c7_a809_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1190_c7_a809_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1190_c7_a809_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1194_c7_404e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1190_c7_a809_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1190_c7_a809_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1190_c7_a809_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1194_c7_404e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1190_c7_a809_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1191_c3_64df_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1191_c3_64df_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1191_c3_64df_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1194_c11_048f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1194_c11_048f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1194_c11_048f_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1194_c7_404e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1194_c7_404e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1197_c7_7aeb_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1194_c7_404e_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1194_c7_404e_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1194_c7_404e_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1197_c7_7aeb_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1194_c7_404e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c7_404e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c7_404e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_7aeb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c7_404e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1194_c7_404e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1194_c7_404e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1197_c7_7aeb_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1194_c7_404e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1194_c7_404e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1194_c7_404e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_7aeb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1194_c7_404e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c7_404e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c7_404e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_7aeb_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c7_404e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c7_404e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1195_c3_ed3c : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c7_404e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_7aeb_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c7_404e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1194_c7_404e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1194_c7_404e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_7aeb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1194_c7_404e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1194_c7_404e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1194_c7_404e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1197_c7_7aeb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1194_c7_404e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c11_948e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c11_948e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c11_948e_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1197_c7_7aeb_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1197_c7_7aeb_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1202_c7_e8da_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1197_c7_7aeb_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1197_c7_7aeb_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1197_c7_7aeb_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1202_c7_e8da_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1197_c7_7aeb_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_7aeb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_7aeb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1202_c7_e8da_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_7aeb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1197_c7_7aeb_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1197_c7_7aeb_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1202_c7_e8da_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1197_c7_7aeb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_7aeb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_7aeb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1202_c7_e8da_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_7aeb_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_7aeb_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_7aeb_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1202_c7_e8da_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_7aeb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_7aeb_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1200_c3_ea10 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_7aeb_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1202_c7_e8da_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_7aeb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_7aeb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_7aeb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1202_c7_e8da_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_7aeb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1197_c7_7aeb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1197_c7_7aeb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1202_c7_e8da_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1197_c7_7aeb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1202_c11_366f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1202_c11_366f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1202_c11_366f_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1202_c7_e8da_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1202_c7_e8da_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1205_c7_0d12_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1202_c7_e8da_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1202_c7_e8da_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1202_c7_e8da_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1205_c7_0d12_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1202_c7_e8da_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1202_c7_e8da_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1202_c7_e8da_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1205_c7_0d12_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1202_c7_e8da_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1202_c7_e8da_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1202_c7_e8da_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1205_c7_0d12_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1202_c7_e8da_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1202_c7_e8da_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1202_c7_e8da_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1205_c7_0d12_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1202_c7_e8da_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1202_c7_e8da_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1202_c7_e8da_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1205_c7_0d12_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1202_c7_e8da_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1202_c7_e8da_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1203_c3_22ec : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1202_c7_e8da_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1205_c7_0d12_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1202_c7_e8da_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1202_c7_e8da_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1202_c7_e8da_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1205_c7_0d12_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1202_c7_e8da_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1202_c7_e8da_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1202_c7_e8da_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1205_c7_0d12_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1202_c7_e8da_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1205_c11_f0ea_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1205_c11_f0ea_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1205_c11_f0ea_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1205_c7_0d12_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1205_c7_0d12_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1205_c7_0d12_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1205_c7_0d12_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1205_c7_0d12_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1205_c7_0d12_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1205_c7_0d12_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1205_c7_0d12_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_780b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1205_c7_0d12_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1205_c7_0d12_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1205_c7_0d12_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1212_c7_780b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1205_c7_0d12_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1205_c7_0d12_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1205_c7_0d12_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_780b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1205_c7_0d12_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1205_c7_0d12_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1205_c7_0d12_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1205_c7_0d12_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1205_c7_0d12_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1205_c7_0d12_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_780b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1205_c7_0d12_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1205_c7_0d12_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1205_c7_0d12_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_780b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1205_c7_0d12_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1205_c7_0d12_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1205_c7_0d12_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1205_c7_0d12_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1206_c3_a8bc_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1206_c3_a8bc_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1206_c3_a8bc_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1207_c11_2a7c_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1207_c11_2a7c_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1207_c11_2a7c_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1210_c32_a73f_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1210_c32_a73f_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1210_c32_a73f_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1210_c32_30c5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1210_c32_30c5_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1210_c32_30c5_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1210_c32_4214_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1210_c32_4214_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1210_c32_4214_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1210_c32_a73f_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1212_c11_d66d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1212_c11_d66d_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1212_c11_d66d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_780b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_780b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_780b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1212_c7_780b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1212_c7_780b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1218_c7_9f69_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1212_c7_780b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_780b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_780b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_9f69_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_780b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_780b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1215_c3_5206 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_780b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_9f69_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_780b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_780b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_780b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_9f69_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_780b_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1216_c24_7d84_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_4e16_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_4e16_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_4e16_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1218_c7_9f69_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1218_c7_9f69_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1218_c7_9f69_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_9f69_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_9f69_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_d4f1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_9f69_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_9f69_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_9f69_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_d4f1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_9f69_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_9f69_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1219_c3_b5b6 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_9f69_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_9f69_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1220_c34_fa92_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1220_c34_fa92_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1220_c24_1f1f_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_31d8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_31d8_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_31d8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_d4f1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_d4f1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_d4f1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_d4f1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_d4f1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_d4f1_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1202_l1173_l1197_l1194_l1190_l1187_l1212_l1182_l1179_DUPLICATE_b33a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1202_l1173_l1197_l1194_l1190_l1218_l1187_l1182_l1205_l1179_DUPLICATE_8064_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1202_l1173_l1197_l1194_l1222_l1190_l1218_l1187_l1182_l1205_l1179_DUPLICATE_ac2b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1202_l1173_l1197_l1194_l1190_l1187_l1182_l1205_l1179_DUPLICATE_97e9_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1202_l1197_l1194_l1222_l1190_l1218_l1187_l1212_l1182_l1205_l1179_DUPLICATE_3094_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1202_l1197_l1194_l1190_l1187_l1182_l1205_l1179_DUPLICATE_d8bd_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1183_l1206_l1191_l1198_DUPLICATE_0ac5_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1184_l1199_DUPLICATE_f1f6_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1184_l1199_DUPLICATE_f1f6_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1218_l1205_DUPLICATE_adf2_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l1169_l1227_DUPLICATE_86af_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1202_c11_366f_right := to_unsigned(7, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_d4f1_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1192_c3_bf40 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1190_c7_a809_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1192_c3_bf40;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1195_c3_ed3c := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c7_404e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1195_c3_ed3c;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1205_c7_0d12_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1194_c11_048f_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1187_c11_871d_right := to_unsigned(3, 2);
     VAR_MUX_uxn_opcodes_h_l1210_c32_a73f_iffalse := resize(to_signed(-2, 3), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c11_948e_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1182_c11_20e4_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1185_c3_f728 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1182_c7_604d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1185_c3_f728;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1190_c11_368c_right := to_unsigned(4, 3);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1210_c32_30c5_right := to_unsigned(128, 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1219_c3_b5b6 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_9f69_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1219_c3_b5b6;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_780b_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1173_c2_25ea_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_d4f1_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1215_c3_5206 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_780b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1215_c3_5206;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1205_c11_f0ea_right := to_unsigned(8, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1180_c3_56b9 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1179_c7_dbbf_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1180_c3_56b9;
     VAR_BIN_OP_GT_uxn_opcodes_h_l1210_c32_4214_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_4e16_right := to_unsigned(10, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1176_c3_4f96 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1173_c2_25ea_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1176_c3_4f96;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_31d8_right := to_unsigned(11, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1179_c11_e07d_right := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1173_c1_726a_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1173_c6_ef77_right := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1205_c7_0d12_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1210_c32_a73f_iftrue := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1188_c3_6835 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1187_c7_ce6a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1188_c3_6835;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1173_c2_25ea_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1212_c11_d66d_right := to_unsigned(9, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1200_c3_ea10 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_7aeb_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1200_c3_ea10;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1203_c3_22ec := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1202_c7_e8da_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1203_c3_22ec;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_780b_iftrue := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1173_c1_726a_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1210_c32_30c5_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1206_c3_a8bc_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1173_c2_25ea_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1179_c7_dbbf_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1182_c7_604d_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1187_c7_ce6a_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1190_c7_a809_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1194_c7_404e_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1202_c7_e8da_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1205_c7_0d12_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1173_c6_ef77_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1179_c11_e07d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1182_c11_20e4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1187_c11_871d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1190_c11_368c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1194_c11_048f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c11_948e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1202_c11_366f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1205_c11_f0ea_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1212_c11_d66d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_4e16_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_31d8_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1191_c3_64df_left := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1207_c11_2a7c_right := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1173_c2_25ea_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1179_c7_dbbf_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1187_c7_ce6a_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1190_c7_a809_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1220_c34_fa92_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1173_c2_25ea_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1179_c7_dbbf_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1182_c7_604d_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1187_c7_ce6a_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1190_c7_a809_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1194_c7_404e_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1197_c7_7aeb_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1202_c7_e8da_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1205_c7_0d12_iffalse := tmp16;
     -- CONST_SR_8[uxn_opcodes_h_l1220_c34_fa92] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1220_c34_fa92_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1220_c34_fa92_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1220_c34_fa92_return_output := CONST_SR_8_uxn_opcodes_h_l1220_c34_fa92_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1187_c11_871d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1187_c11_871d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1187_c11_871d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1187_c11_871d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1187_c11_871d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1187_c11_871d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1187_c11_871d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1173_c6_ef77] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1173_c6_ef77_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1173_c6_ef77_left;
     BIN_OP_EQ_uxn_opcodes_h_l1173_c6_ef77_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1173_c6_ef77_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1173_c6_ef77_return_output := BIN_OP_EQ_uxn_opcodes_h_l1173_c6_ef77_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1218_c11_4e16] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1218_c11_4e16_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_4e16_left;
     BIN_OP_EQ_uxn_opcodes_h_l1218_c11_4e16_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_4e16_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_4e16_return_output := BIN_OP_EQ_uxn_opcodes_h_l1218_c11_4e16_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1222_c11_31d8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1222_c11_31d8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_31d8_left;
     BIN_OP_EQ_uxn_opcodes_h_l1222_c11_31d8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_31d8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_31d8_return_output := BIN_OP_EQ_uxn_opcodes_h_l1222_c11_31d8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1182_c11_20e4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1182_c11_20e4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1182_c11_20e4_left;
     BIN_OP_EQ_uxn_opcodes_h_l1182_c11_20e4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1182_c11_20e4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1182_c11_20e4_return_output := BIN_OP_EQ_uxn_opcodes_h_l1182_c11_20e4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1197_c11_948e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1197_c11_948e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c11_948e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1197_c11_948e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c11_948e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c11_948e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1197_c11_948e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1179_c11_e07d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1179_c11_e07d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1179_c11_e07d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1179_c11_e07d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1179_c11_e07d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1179_c11_e07d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1179_c11_e07d_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1183_l1206_l1191_l1198_DUPLICATE_0ac5 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1183_l1206_l1191_l1198_DUPLICATE_0ac5_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1216_c24_7d84] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1216_c24_7d84_return_output := CAST_TO_uint8_t_uint16_t(
     tmp16);

     -- BIN_OP_AND[uxn_opcodes_h_l1210_c32_30c5] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1210_c32_30c5_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1210_c32_30c5_left;
     BIN_OP_AND_uxn_opcodes_h_l1210_c32_30c5_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1210_c32_30c5_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1210_c32_30c5_return_output := BIN_OP_AND_uxn_opcodes_h_l1210_c32_30c5_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1202_l1173_l1197_l1194_l1190_l1187_l1212_l1182_l1179_DUPLICATE_b33a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1202_l1173_l1197_l1194_l1190_l1187_l1212_l1182_l1179_DUPLICATE_b33a_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1205_c11_f0ea] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1205_c11_f0ea_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1205_c11_f0ea_left;
     BIN_OP_EQ_uxn_opcodes_h_l1205_c11_f0ea_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1205_c11_f0ea_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1205_c11_f0ea_return_output := BIN_OP_EQ_uxn_opcodes_h_l1205_c11_f0ea_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1202_l1173_l1197_l1194_l1190_l1218_l1187_l1182_l1205_l1179_DUPLICATE_8064 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1202_l1173_l1197_l1194_l1190_l1218_l1187_l1182_l1205_l1179_DUPLICATE_8064_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1194_c11_048f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1194_c11_048f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1194_c11_048f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1194_c11_048f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1194_c11_048f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1194_c11_048f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1194_c11_048f_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1202_l1173_l1197_l1194_l1222_l1190_l1218_l1187_l1182_l1205_l1179_DUPLICATE_ac2b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1202_l1173_l1197_l1194_l1222_l1190_l1218_l1187_l1182_l1205_l1179_DUPLICATE_ac2b_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1202_l1197_l1194_l1222_l1190_l1218_l1187_l1212_l1182_l1205_l1179_DUPLICATE_3094 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1202_l1197_l1194_l1222_l1190_l1218_l1187_l1212_l1182_l1205_l1179_DUPLICATE_3094_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1202_c11_366f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1202_c11_366f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1202_c11_366f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1202_c11_366f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1202_c11_366f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1202_c11_366f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1202_c11_366f_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1202_l1197_l1194_l1190_l1187_l1182_l1205_l1179_DUPLICATE_d8bd LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1202_l1197_l1194_l1190_l1187_l1182_l1205_l1179_DUPLICATE_d8bd_return_output := result.is_stack_read;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1202_l1173_l1197_l1194_l1190_l1187_l1182_l1205_l1179_DUPLICATE_97e9 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1202_l1173_l1197_l1194_l1190_l1187_l1182_l1205_l1179_DUPLICATE_97e9_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1212_c11_d66d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1212_c11_d66d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1212_c11_d66d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1212_c11_d66d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1212_c11_d66d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1212_c11_d66d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1212_c11_d66d_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1218_l1205_DUPLICATE_adf2 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1218_l1205_DUPLICATE_adf2_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1190_c11_368c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1190_c11_368c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1190_c11_368c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1190_c11_368c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1190_c11_368c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1190_c11_368c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1190_c11_368c_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1210_c32_4214_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1210_c32_30c5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1173_c1_726a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1173_c6_ef77_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1173_c2_25ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1173_c6_ef77_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1173_c2_25ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1173_c6_ef77_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1173_c2_25ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1173_c6_ef77_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1173_c2_25ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1173_c6_ef77_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1173_c2_25ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1173_c6_ef77_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1173_c2_25ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1173_c6_ef77_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1173_c2_25ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1173_c6_ef77_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1173_c2_25ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1173_c6_ef77_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1173_c2_25ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1173_c6_ef77_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1173_c2_25ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1173_c6_ef77_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1179_c7_dbbf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1179_c11_e07d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1179_c7_dbbf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1179_c11_e07d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1179_c7_dbbf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1179_c11_e07d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1179_c7_dbbf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1179_c11_e07d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1179_c7_dbbf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1179_c11_e07d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1179_c7_dbbf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1179_c11_e07d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1179_c7_dbbf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1179_c11_e07d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1179_c7_dbbf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1179_c11_e07d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1179_c7_dbbf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1179_c11_e07d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1179_c7_dbbf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1179_c11_e07d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1182_c7_604d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1182_c11_20e4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1182_c7_604d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1182_c11_20e4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1182_c7_604d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1182_c11_20e4_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1182_c7_604d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1182_c11_20e4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1182_c7_604d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1182_c11_20e4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1182_c7_604d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1182_c11_20e4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1182_c7_604d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1182_c11_20e4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1182_c7_604d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1182_c11_20e4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1182_c7_604d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1182_c11_20e4_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1182_c7_604d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1182_c11_20e4_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1187_c7_ce6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1187_c11_871d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1187_c7_ce6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1187_c11_871d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1187_c7_ce6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1187_c11_871d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1187_c7_ce6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1187_c11_871d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1187_c7_ce6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1187_c11_871d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1187_c7_ce6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1187_c11_871d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1187_c7_ce6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1187_c11_871d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1187_c7_ce6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1187_c11_871d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1187_c7_ce6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1187_c11_871d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1187_c7_ce6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1187_c11_871d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1190_c7_a809_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1190_c11_368c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1190_c7_a809_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1190_c11_368c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1190_c7_a809_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1190_c11_368c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1190_c7_a809_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1190_c11_368c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1190_c7_a809_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1190_c11_368c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1190_c7_a809_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1190_c11_368c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1190_c7_a809_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1190_c11_368c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1190_c7_a809_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1190_c11_368c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1190_c7_a809_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1190_c11_368c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1190_c7_a809_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1190_c11_368c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1194_c7_404e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1194_c11_048f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1194_c7_404e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1194_c11_048f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c7_404e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1194_c11_048f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1194_c7_404e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1194_c11_048f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1194_c7_404e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1194_c11_048f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c7_404e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1194_c11_048f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c7_404e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1194_c11_048f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1194_c7_404e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1194_c11_048f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1194_c7_404e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1194_c11_048f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1197_c7_7aeb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c11_948e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_7aeb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c11_948e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_7aeb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c11_948e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1197_c7_7aeb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c11_948e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_7aeb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c11_948e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_7aeb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c11_948e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_7aeb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c11_948e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1197_c7_7aeb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c11_948e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1197_c7_7aeb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c11_948e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1202_c7_e8da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1202_c11_366f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1202_c7_e8da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1202_c11_366f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1202_c7_e8da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1202_c11_366f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1202_c7_e8da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1202_c11_366f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1202_c7_e8da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1202_c11_366f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1202_c7_e8da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1202_c11_366f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1202_c7_e8da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1202_c11_366f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1202_c7_e8da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1202_c11_366f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1202_c7_e8da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1202_c11_366f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1205_c7_0d12_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1205_c11_f0ea_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1205_c7_0d12_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1205_c11_f0ea_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1205_c7_0d12_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1205_c11_f0ea_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1205_c7_0d12_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1205_c11_f0ea_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1205_c7_0d12_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1205_c11_f0ea_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1205_c7_0d12_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1205_c11_f0ea_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1205_c7_0d12_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1205_c11_f0ea_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1205_c7_0d12_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1205_c11_f0ea_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1205_c7_0d12_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1205_c11_f0ea_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_780b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1212_c11_d66d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_780b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1212_c11_d66d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_780b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1212_c11_d66d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_780b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1212_c11_d66d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1212_c7_780b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1212_c11_d66d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_9f69_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_4e16_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_9f69_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_4e16_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_9f69_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_4e16_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1218_c7_9f69_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_4e16_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_d4f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_31d8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_d4f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_31d8_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1191_c3_64df_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1183_l1206_l1191_l1198_DUPLICATE_0ac5_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1206_c3_a8bc_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1183_l1206_l1191_l1198_DUPLICATE_0ac5_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1184_l1199_DUPLICATE_f1f6_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1183_l1206_l1191_l1198_DUPLICATE_0ac5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1212_c7_780b_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1216_c24_7d84_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1173_c2_25ea_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1202_l1173_l1197_l1194_l1190_l1187_l1182_l1205_l1179_DUPLICATE_97e9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1179_c7_dbbf_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1202_l1173_l1197_l1194_l1190_l1187_l1182_l1205_l1179_DUPLICATE_97e9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1182_c7_604d_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1202_l1173_l1197_l1194_l1190_l1187_l1182_l1205_l1179_DUPLICATE_97e9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1187_c7_ce6a_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1202_l1173_l1197_l1194_l1190_l1187_l1182_l1205_l1179_DUPLICATE_97e9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1190_c7_a809_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1202_l1173_l1197_l1194_l1190_l1187_l1182_l1205_l1179_DUPLICATE_97e9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c7_404e_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1202_l1173_l1197_l1194_l1190_l1187_l1182_l1205_l1179_DUPLICATE_97e9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_7aeb_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1202_l1173_l1197_l1194_l1190_l1187_l1182_l1205_l1179_DUPLICATE_97e9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1202_c7_e8da_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1202_l1173_l1197_l1194_l1190_l1187_l1182_l1205_l1179_DUPLICATE_97e9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1205_c7_0d12_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1202_l1173_l1197_l1194_l1190_l1187_l1182_l1205_l1179_DUPLICATE_97e9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1179_c7_dbbf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1202_l1197_l1194_l1222_l1190_l1218_l1187_l1212_l1182_l1205_l1179_DUPLICATE_3094_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1182_c7_604d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1202_l1197_l1194_l1222_l1190_l1218_l1187_l1212_l1182_l1205_l1179_DUPLICATE_3094_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1187_c7_ce6a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1202_l1197_l1194_l1222_l1190_l1218_l1187_l1212_l1182_l1205_l1179_DUPLICATE_3094_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1190_c7_a809_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1202_l1197_l1194_l1222_l1190_l1218_l1187_l1212_l1182_l1205_l1179_DUPLICATE_3094_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1194_c7_404e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1202_l1197_l1194_l1222_l1190_l1218_l1187_l1212_l1182_l1205_l1179_DUPLICATE_3094_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_7aeb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1202_l1197_l1194_l1222_l1190_l1218_l1187_l1212_l1182_l1205_l1179_DUPLICATE_3094_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1202_c7_e8da_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1202_l1197_l1194_l1222_l1190_l1218_l1187_l1212_l1182_l1205_l1179_DUPLICATE_3094_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1205_c7_0d12_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1202_l1197_l1194_l1222_l1190_l1218_l1187_l1212_l1182_l1205_l1179_DUPLICATE_3094_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_780b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1202_l1197_l1194_l1222_l1190_l1218_l1187_l1212_l1182_l1205_l1179_DUPLICATE_3094_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_9f69_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1202_l1197_l1194_l1222_l1190_l1218_l1187_l1212_l1182_l1205_l1179_DUPLICATE_3094_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_d4f1_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1202_l1197_l1194_l1222_l1190_l1218_l1187_l1212_l1182_l1205_l1179_DUPLICATE_3094_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1173_c2_25ea_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1202_l1173_l1197_l1194_l1190_l1187_l1212_l1182_l1179_DUPLICATE_b33a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1179_c7_dbbf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1202_l1173_l1197_l1194_l1190_l1187_l1212_l1182_l1179_DUPLICATE_b33a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1182_c7_604d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1202_l1173_l1197_l1194_l1190_l1187_l1212_l1182_l1179_DUPLICATE_b33a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1187_c7_ce6a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1202_l1173_l1197_l1194_l1190_l1187_l1212_l1182_l1179_DUPLICATE_b33a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1190_c7_a809_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1202_l1173_l1197_l1194_l1190_l1187_l1212_l1182_l1179_DUPLICATE_b33a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c7_404e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1202_l1173_l1197_l1194_l1190_l1187_l1212_l1182_l1179_DUPLICATE_b33a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_7aeb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1202_l1173_l1197_l1194_l1190_l1187_l1212_l1182_l1179_DUPLICATE_b33a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1202_c7_e8da_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1202_l1173_l1197_l1194_l1190_l1187_l1212_l1182_l1179_DUPLICATE_b33a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_780b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1202_l1173_l1197_l1194_l1190_l1187_l1212_l1182_l1179_DUPLICATE_b33a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1179_c7_dbbf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1202_l1197_l1194_l1190_l1187_l1182_l1205_l1179_DUPLICATE_d8bd_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1182_c7_604d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1202_l1197_l1194_l1190_l1187_l1182_l1205_l1179_DUPLICATE_d8bd_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1187_c7_ce6a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1202_l1197_l1194_l1190_l1187_l1182_l1205_l1179_DUPLICATE_d8bd_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1190_c7_a809_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1202_l1197_l1194_l1190_l1187_l1182_l1205_l1179_DUPLICATE_d8bd_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1194_c7_404e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1202_l1197_l1194_l1190_l1187_l1182_l1205_l1179_DUPLICATE_d8bd_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1197_c7_7aeb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1202_l1197_l1194_l1190_l1187_l1182_l1205_l1179_DUPLICATE_d8bd_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1202_c7_e8da_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1202_l1197_l1194_l1190_l1187_l1182_l1205_l1179_DUPLICATE_d8bd_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1205_c7_0d12_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1202_l1197_l1194_l1190_l1187_l1182_l1205_l1179_DUPLICATE_d8bd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1173_c2_25ea_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1202_l1173_l1197_l1194_l1222_l1190_l1218_l1187_l1182_l1205_l1179_DUPLICATE_ac2b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1179_c7_dbbf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1202_l1173_l1197_l1194_l1222_l1190_l1218_l1187_l1182_l1205_l1179_DUPLICATE_ac2b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1182_c7_604d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1202_l1173_l1197_l1194_l1222_l1190_l1218_l1187_l1182_l1205_l1179_DUPLICATE_ac2b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1187_c7_ce6a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1202_l1173_l1197_l1194_l1222_l1190_l1218_l1187_l1182_l1205_l1179_DUPLICATE_ac2b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1190_c7_a809_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1202_l1173_l1197_l1194_l1222_l1190_l1218_l1187_l1182_l1205_l1179_DUPLICATE_ac2b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1194_c7_404e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1202_l1173_l1197_l1194_l1222_l1190_l1218_l1187_l1182_l1205_l1179_DUPLICATE_ac2b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_7aeb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1202_l1173_l1197_l1194_l1222_l1190_l1218_l1187_l1182_l1205_l1179_DUPLICATE_ac2b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1202_c7_e8da_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1202_l1173_l1197_l1194_l1222_l1190_l1218_l1187_l1182_l1205_l1179_DUPLICATE_ac2b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1205_c7_0d12_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1202_l1173_l1197_l1194_l1222_l1190_l1218_l1187_l1182_l1205_l1179_DUPLICATE_ac2b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_9f69_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1202_l1173_l1197_l1194_l1222_l1190_l1218_l1187_l1182_l1205_l1179_DUPLICATE_ac2b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_d4f1_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1202_l1173_l1197_l1194_l1222_l1190_l1218_l1187_l1182_l1205_l1179_DUPLICATE_ac2b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1205_c7_0d12_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1218_l1205_DUPLICATE_adf2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_9f69_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1218_l1205_DUPLICATE_adf2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1173_c2_25ea_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1202_l1173_l1197_l1194_l1190_l1218_l1187_l1182_l1205_l1179_DUPLICATE_8064_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1179_c7_dbbf_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1202_l1173_l1197_l1194_l1190_l1218_l1187_l1182_l1205_l1179_DUPLICATE_8064_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1182_c7_604d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1202_l1173_l1197_l1194_l1190_l1218_l1187_l1182_l1205_l1179_DUPLICATE_8064_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1187_c7_ce6a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1202_l1173_l1197_l1194_l1190_l1218_l1187_l1182_l1205_l1179_DUPLICATE_8064_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1190_c7_a809_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1202_l1173_l1197_l1194_l1190_l1218_l1187_l1182_l1205_l1179_DUPLICATE_8064_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1194_c7_404e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1202_l1173_l1197_l1194_l1190_l1218_l1187_l1182_l1205_l1179_DUPLICATE_8064_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1197_c7_7aeb_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1202_l1173_l1197_l1194_l1190_l1218_l1187_l1182_l1205_l1179_DUPLICATE_8064_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1202_c7_e8da_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1202_l1173_l1197_l1194_l1190_l1218_l1187_l1182_l1205_l1179_DUPLICATE_8064_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1205_c7_0d12_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1202_l1173_l1197_l1194_l1190_l1218_l1187_l1182_l1205_l1179_DUPLICATE_8064_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1218_c7_9f69_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1202_l1173_l1197_l1194_l1190_l1218_l1187_l1182_l1205_l1179_DUPLICATE_8064_return_output;
     -- BIN_OP_OR[uxn_opcodes_h_l1191_c3_64df] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1191_c3_64df_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1191_c3_64df_left;
     BIN_OP_OR_uxn_opcodes_h_l1191_c3_64df_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1191_c3_64df_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1191_c3_64df_return_output := BIN_OP_OR_uxn_opcodes_h_l1191_c3_64df_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1206_c3_a8bc] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1206_c3_a8bc_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1206_c3_a8bc_left;
     BIN_OP_OR_uxn_opcodes_h_l1206_c3_a8bc_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1206_c3_a8bc_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1206_c3_a8bc_return_output := BIN_OP_OR_uxn_opcodes_h_l1206_c3_a8bc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1222_c7_d4f1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_d4f1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_d4f1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_d4f1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_d4f1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_d4f1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_d4f1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_d4f1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_d4f1_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1173_c1_726a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1173_c1_726a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1173_c1_726a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1173_c1_726a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1173_c1_726a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1173_c1_726a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1173_c1_726a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1173_c1_726a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1173_c1_726a_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1184_l1199_DUPLICATE_f1f6 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1184_l1199_DUPLICATE_f1f6_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1184_l1199_DUPLICATE_f1f6_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1184_l1199_DUPLICATE_f1f6_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1184_l1199_DUPLICATE_f1f6_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1212_c7_780b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_780b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_780b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_780b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_780b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_780b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_780b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_780b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_780b_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1210_c32_4214] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1210_c32_4214_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1210_c32_4214_left;
     BIN_OP_GT_uxn_opcodes_h_l1210_c32_4214_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1210_c32_4214_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1210_c32_4214_return_output := BIN_OP_GT_uxn_opcodes_h_l1210_c32_4214_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1205_c7_0d12] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1205_c7_0d12_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1205_c7_0d12_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1205_c7_0d12_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1205_c7_0d12_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1205_c7_0d12_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1205_c7_0d12_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1205_c7_0d12_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1205_c7_0d12_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1222_c7_d4f1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_d4f1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_d4f1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_d4f1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_d4f1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_d4f1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_d4f1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_d4f1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_d4f1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1218_c7_9f69] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_9f69_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_9f69_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_9f69_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_9f69_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_9f69_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_9f69_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_9f69_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_9f69_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1220_c24_1f1f] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1220_c24_1f1f_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1220_c34_fa92_return_output);

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1210_c32_a73f_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1210_c32_4214_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1190_c7_a809_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1191_c3_64df_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1207_c11_2a7c_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1206_c3_a8bc_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1205_c7_0d12_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1206_c3_a8bc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1218_c7_9f69_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1220_c24_1f1f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1197_c7_7aeb_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1184_l1199_DUPLICATE_f1f6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1182_c7_604d_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1184_l1199_DUPLICATE_f1f6_return_output;
     VAR_printf_uxn_opcodes_h_l1174_c3_f733_uxn_opcodes_h_l1174_c3_f733_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1173_c1_726a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_9f69_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_d4f1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1205_c7_0d12_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_780b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1202_c7_e8da_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1205_c7_0d12_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_9f69_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_d4f1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_780b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_9f69_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1218_c7_9f69] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_9f69_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_9f69_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_9f69_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_9f69_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_9f69_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_9f69_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_9f69_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_9f69_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1212_c7_780b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_780b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_780b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_780b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_780b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_780b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_780b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_780b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_780b_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1207_c11_2a7c] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1207_c11_2a7c_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1207_c11_2a7c_left;
     BIN_OP_OR_uxn_opcodes_h_l1207_c11_2a7c_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1207_c11_2a7c_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1207_c11_2a7c_return_output := BIN_OP_OR_uxn_opcodes_h_l1207_c11_2a7c_return_output;

     -- MUX[uxn_opcodes_h_l1210_c32_a73f] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1210_c32_a73f_cond <= VAR_MUX_uxn_opcodes_h_l1210_c32_a73f_cond;
     MUX_uxn_opcodes_h_l1210_c32_a73f_iftrue <= VAR_MUX_uxn_opcodes_h_l1210_c32_a73f_iftrue;
     MUX_uxn_opcodes_h_l1210_c32_a73f_iffalse <= VAR_MUX_uxn_opcodes_h_l1210_c32_a73f_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1210_c32_a73f_return_output := MUX_uxn_opcodes_h_l1210_c32_a73f_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1202_c7_e8da] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1202_c7_e8da_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1202_c7_e8da_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1202_c7_e8da_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1202_c7_e8da_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1202_c7_e8da_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1202_c7_e8da_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1202_c7_e8da_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1202_c7_e8da_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1205_c7_0d12] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1205_c7_0d12_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1205_c7_0d12_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1205_c7_0d12_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1205_c7_0d12_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1205_c7_0d12_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1205_c7_0d12_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1205_c7_0d12_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1205_c7_0d12_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1218_c7_9f69] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_9f69_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_9f69_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_9f69_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_9f69_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_9f69_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_9f69_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_9f69_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_9f69_return_output;

     -- printf_uxn_opcodes_h_l1174_c3_f733[uxn_opcodes_h_l1174_c3_f733] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1174_c3_f733_uxn_opcodes_h_l1174_c3_f733_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1174_c3_f733_uxn_opcodes_h_l1174_c3_f733_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_stack_value_MUX[uxn_opcodes_h_l1218_c7_9f69] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1218_c7_9f69_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1218_c7_9f69_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1218_c7_9f69_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1218_c7_9f69_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1218_c7_9f69_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1218_c7_9f69_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1218_c7_9f69_return_output := result_stack_value_MUX_uxn_opcodes_h_l1218_c7_9f69_return_output;

     -- t16_MUX[uxn_opcodes_h_l1190_c7_a809] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1190_c7_a809_cond <= VAR_t16_MUX_uxn_opcodes_h_l1190_c7_a809_cond;
     t16_MUX_uxn_opcodes_h_l1190_c7_a809_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1190_c7_a809_iftrue;
     t16_MUX_uxn_opcodes_h_l1190_c7_a809_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1190_c7_a809_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1190_c7_a809_return_output := t16_MUX_uxn_opcodes_h_l1190_c7_a809_return_output;

     -- n16_MUX[uxn_opcodes_h_l1205_c7_0d12] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1205_c7_0d12_cond <= VAR_n16_MUX_uxn_opcodes_h_l1205_c7_0d12_cond;
     n16_MUX_uxn_opcodes_h_l1205_c7_0d12_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1205_c7_0d12_iftrue;
     n16_MUX_uxn_opcodes_h_l1205_c7_0d12_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1205_c7_0d12_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1205_c7_0d12_return_output := n16_MUX_uxn_opcodes_h_l1205_c7_0d12_return_output;

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l1205_c7_0d12_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1207_c11_2a7c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1205_c7_0d12_iftrue := VAR_MUX_uxn_opcodes_h_l1210_c32_a73f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1202_c7_e8da_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1205_c7_0d12_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_780b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_9f69_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1202_c7_e8da_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1205_c7_0d12_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1197_c7_7aeb_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1202_c7_e8da_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_780b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_9f69_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1205_c7_0d12_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_780b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1212_c7_780b_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1218_c7_9f69_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1187_c7_ce6a_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1190_c7_a809_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l1197_c7_7aeb] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1197_c7_7aeb_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1197_c7_7aeb_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1197_c7_7aeb_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1197_c7_7aeb_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1197_c7_7aeb_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1197_c7_7aeb_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1197_c7_7aeb_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1197_c7_7aeb_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1205_c7_0d12] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1205_c7_0d12_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1205_c7_0d12_cond;
     tmp16_MUX_uxn_opcodes_h_l1205_c7_0d12_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1205_c7_0d12_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1205_c7_0d12_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1205_c7_0d12_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1205_c7_0d12_return_output := tmp16_MUX_uxn_opcodes_h_l1205_c7_0d12_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1212_c7_780b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_780b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_780b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_780b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_780b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_780b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_780b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_780b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_780b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1205_c7_0d12] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1205_c7_0d12_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1205_c7_0d12_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1205_c7_0d12_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1205_c7_0d12_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1205_c7_0d12_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1205_c7_0d12_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1205_c7_0d12_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1205_c7_0d12_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1202_c7_e8da] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1202_c7_e8da_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1202_c7_e8da_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1202_c7_e8da_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1202_c7_e8da_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1202_c7_e8da_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1202_c7_e8da_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1202_c7_e8da_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1202_c7_e8da_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1205_c7_0d12] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1205_c7_0d12_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1205_c7_0d12_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1205_c7_0d12_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1205_c7_0d12_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1205_c7_0d12_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1205_c7_0d12_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1205_c7_0d12_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1205_c7_0d12_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1212_c7_780b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_780b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_780b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_780b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_780b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_780b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_780b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_780b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_780b_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1212_c7_780b] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1212_c7_780b_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1212_c7_780b_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1212_c7_780b_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1212_c7_780b_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1212_c7_780b_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1212_c7_780b_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1212_c7_780b_return_output := result_stack_value_MUX_uxn_opcodes_h_l1212_c7_780b_return_output;

     -- n16_MUX[uxn_opcodes_h_l1202_c7_e8da] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1202_c7_e8da_cond <= VAR_n16_MUX_uxn_opcodes_h_l1202_c7_e8da_cond;
     n16_MUX_uxn_opcodes_h_l1202_c7_e8da_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1202_c7_e8da_iftrue;
     n16_MUX_uxn_opcodes_h_l1202_c7_e8da_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1202_c7_e8da_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1202_c7_e8da_return_output := n16_MUX_uxn_opcodes_h_l1202_c7_e8da_return_output;

     -- t16_MUX[uxn_opcodes_h_l1187_c7_ce6a] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1187_c7_ce6a_cond <= VAR_t16_MUX_uxn_opcodes_h_l1187_c7_ce6a_cond;
     t16_MUX_uxn_opcodes_h_l1187_c7_ce6a_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1187_c7_ce6a_iftrue;
     t16_MUX_uxn_opcodes_h_l1187_c7_ce6a_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1187_c7_ce6a_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1187_c7_ce6a_return_output := t16_MUX_uxn_opcodes_h_l1187_c7_ce6a_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l1197_c7_7aeb_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1202_c7_e8da_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1205_c7_0d12_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_780b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_7aeb_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1202_c7_e8da_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1194_c7_404e_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1197_c7_7aeb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1205_c7_0d12_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_780b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1202_c7_e8da_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1205_c7_0d12_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1202_c7_e8da_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1205_c7_0d12_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1205_c7_0d12_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1212_c7_780b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1182_c7_604d_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1187_c7_ce6a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1202_c7_e8da_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1205_c7_0d12_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1202_c7_e8da] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1202_c7_e8da_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1202_c7_e8da_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1202_c7_e8da_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1202_c7_e8da_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1202_c7_e8da_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1202_c7_e8da_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1202_c7_e8da_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1202_c7_e8da_return_output;

     -- n16_MUX[uxn_opcodes_h_l1197_c7_7aeb] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1197_c7_7aeb_cond <= VAR_n16_MUX_uxn_opcodes_h_l1197_c7_7aeb_cond;
     n16_MUX_uxn_opcodes_h_l1197_c7_7aeb_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1197_c7_7aeb_iftrue;
     n16_MUX_uxn_opcodes_h_l1197_c7_7aeb_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1197_c7_7aeb_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1197_c7_7aeb_return_output := n16_MUX_uxn_opcodes_h_l1197_c7_7aeb_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1202_c7_e8da] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1202_c7_e8da_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1202_c7_e8da_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1202_c7_e8da_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1202_c7_e8da_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1202_c7_e8da_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1202_c7_e8da_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1202_c7_e8da_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1202_c7_e8da_return_output;

     -- t16_MUX[uxn_opcodes_h_l1182_c7_604d] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1182_c7_604d_cond <= VAR_t16_MUX_uxn_opcodes_h_l1182_c7_604d_cond;
     t16_MUX_uxn_opcodes_h_l1182_c7_604d_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1182_c7_604d_iftrue;
     t16_MUX_uxn_opcodes_h_l1182_c7_604d_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1182_c7_604d_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1182_c7_604d_return_output := t16_MUX_uxn_opcodes_h_l1182_c7_604d_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1194_c7_404e] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1194_c7_404e_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1194_c7_404e_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1194_c7_404e_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1194_c7_404e_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1194_c7_404e_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1194_c7_404e_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1194_c7_404e_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1194_c7_404e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1205_c7_0d12] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1205_c7_0d12_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1205_c7_0d12_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1205_c7_0d12_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1205_c7_0d12_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1205_c7_0d12_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1205_c7_0d12_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1205_c7_0d12_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1205_c7_0d12_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1197_c7_7aeb] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_7aeb_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_7aeb_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_7aeb_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_7aeb_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_7aeb_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_7aeb_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_7aeb_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_7aeb_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1205_c7_0d12] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1205_c7_0d12_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1205_c7_0d12_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1205_c7_0d12_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1205_c7_0d12_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1205_c7_0d12_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1205_c7_0d12_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1205_c7_0d12_return_output := result_stack_value_MUX_uxn_opcodes_h_l1205_c7_0d12_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1202_c7_e8da] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1202_c7_e8da_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1202_c7_e8da_cond;
     tmp16_MUX_uxn_opcodes_h_l1202_c7_e8da_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1202_c7_e8da_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1202_c7_e8da_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1202_c7_e8da_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1202_c7_e8da_return_output := tmp16_MUX_uxn_opcodes_h_l1202_c7_e8da_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1205_c7_0d12] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1205_c7_0d12_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1205_c7_0d12_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1205_c7_0d12_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1205_c7_0d12_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1205_c7_0d12_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1205_c7_0d12_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1205_c7_0d12_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1205_c7_0d12_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1194_c7_404e_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1197_c7_7aeb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1202_c7_e8da_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1205_c7_0d12_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c7_404e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_7aeb_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1190_c7_a809_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1194_c7_404e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1202_c7_e8da_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1205_c7_0d12_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_7aeb_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1202_c7_e8da_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_7aeb_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1202_c7_e8da_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1202_c7_e8da_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1205_c7_0d12_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1179_c7_dbbf_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1182_c7_604d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1197_c7_7aeb_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1202_c7_e8da_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1202_c7_e8da] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1202_c7_e8da_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1202_c7_e8da_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1202_c7_e8da_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1202_c7_e8da_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1202_c7_e8da_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1202_c7_e8da_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1202_c7_e8da_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1202_c7_e8da_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1197_c7_7aeb] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_7aeb_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_7aeb_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_7aeb_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_7aeb_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_7aeb_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_7aeb_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_7aeb_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_7aeb_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1194_c7_404e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c7_404e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c7_404e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c7_404e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c7_404e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c7_404e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c7_404e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c7_404e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c7_404e_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1190_c7_a809] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1190_c7_a809_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1190_c7_a809_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1190_c7_a809_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1190_c7_a809_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1190_c7_a809_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1190_c7_a809_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1190_c7_a809_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1190_c7_a809_return_output;

     -- t16_MUX[uxn_opcodes_h_l1179_c7_dbbf] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1179_c7_dbbf_cond <= VAR_t16_MUX_uxn_opcodes_h_l1179_c7_dbbf_cond;
     t16_MUX_uxn_opcodes_h_l1179_c7_dbbf_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1179_c7_dbbf_iftrue;
     t16_MUX_uxn_opcodes_h_l1179_c7_dbbf_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1179_c7_dbbf_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1179_c7_dbbf_return_output := t16_MUX_uxn_opcodes_h_l1179_c7_dbbf_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1202_c7_e8da] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1202_c7_e8da_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1202_c7_e8da_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1202_c7_e8da_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1202_c7_e8da_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1202_c7_e8da_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1202_c7_e8da_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1202_c7_e8da_return_output := result_stack_value_MUX_uxn_opcodes_h_l1202_c7_e8da_return_output;

     -- n16_MUX[uxn_opcodes_h_l1194_c7_404e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1194_c7_404e_cond <= VAR_n16_MUX_uxn_opcodes_h_l1194_c7_404e_cond;
     n16_MUX_uxn_opcodes_h_l1194_c7_404e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1194_c7_404e_iftrue;
     n16_MUX_uxn_opcodes_h_l1194_c7_404e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1194_c7_404e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1194_c7_404e_return_output := n16_MUX_uxn_opcodes_h_l1194_c7_404e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1202_c7_e8da] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1202_c7_e8da_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1202_c7_e8da_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1202_c7_e8da_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1202_c7_e8da_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1202_c7_e8da_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1202_c7_e8da_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1202_c7_e8da_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1202_c7_e8da_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1197_c7_7aeb] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1197_c7_7aeb_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1197_c7_7aeb_cond;
     tmp16_MUX_uxn_opcodes_h_l1197_c7_7aeb_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1197_c7_7aeb_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1197_c7_7aeb_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1197_c7_7aeb_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1197_c7_7aeb_return_output := tmp16_MUX_uxn_opcodes_h_l1197_c7_7aeb_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1197_c7_7aeb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_7aeb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_7aeb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_7aeb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_7aeb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_7aeb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_7aeb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_7aeb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_7aeb_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1190_c7_a809_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1194_c7_404e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_7aeb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1202_c7_e8da_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1190_c7_a809_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c7_404e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1187_c7_ce6a_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1190_c7_a809_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_7aeb_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1202_c7_e8da_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c7_404e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_7aeb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c7_404e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_7aeb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1197_c7_7aeb_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1202_c7_e8da_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1173_c2_25ea_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1179_c7_dbbf_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1194_c7_404e_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1197_c7_7aeb_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1197_c7_7aeb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_7aeb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_7aeb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_7aeb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_7aeb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_7aeb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_7aeb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_7aeb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_7aeb_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1194_c7_404e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c7_404e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c7_404e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c7_404e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c7_404e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c7_404e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c7_404e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c7_404e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c7_404e_return_output;

     -- t16_MUX[uxn_opcodes_h_l1173_c2_25ea] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1173_c2_25ea_cond <= VAR_t16_MUX_uxn_opcodes_h_l1173_c2_25ea_cond;
     t16_MUX_uxn_opcodes_h_l1173_c2_25ea_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1173_c2_25ea_iftrue;
     t16_MUX_uxn_opcodes_h_l1173_c2_25ea_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1173_c2_25ea_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1173_c2_25ea_return_output := t16_MUX_uxn_opcodes_h_l1173_c2_25ea_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1187_c7_ce6a] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1187_c7_ce6a_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1187_c7_ce6a_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1187_c7_ce6a_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1187_c7_ce6a_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1187_c7_ce6a_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1187_c7_ce6a_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1187_c7_ce6a_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1187_c7_ce6a_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1194_c7_404e] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1194_c7_404e_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1194_c7_404e_cond;
     tmp16_MUX_uxn_opcodes_h_l1194_c7_404e_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1194_c7_404e_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1194_c7_404e_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1194_c7_404e_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1194_c7_404e_return_output := tmp16_MUX_uxn_opcodes_h_l1194_c7_404e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1194_c7_404e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c7_404e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c7_404e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c7_404e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c7_404e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c7_404e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c7_404e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c7_404e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c7_404e_return_output;

     -- n16_MUX[uxn_opcodes_h_l1190_c7_a809] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1190_c7_a809_cond <= VAR_n16_MUX_uxn_opcodes_h_l1190_c7_a809_cond;
     n16_MUX_uxn_opcodes_h_l1190_c7_a809_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1190_c7_a809_iftrue;
     n16_MUX_uxn_opcodes_h_l1190_c7_a809_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1190_c7_a809_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1190_c7_a809_return_output := n16_MUX_uxn_opcodes_h_l1190_c7_a809_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1190_c7_a809] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1190_c7_a809_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1190_c7_a809_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1190_c7_a809_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1190_c7_a809_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1190_c7_a809_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1190_c7_a809_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1190_c7_a809_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1190_c7_a809_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1197_c7_7aeb] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_7aeb_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_7aeb_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_7aeb_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_7aeb_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_7aeb_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_7aeb_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_7aeb_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_7aeb_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1197_c7_7aeb] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1197_c7_7aeb_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1197_c7_7aeb_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1197_c7_7aeb_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1197_c7_7aeb_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1197_c7_7aeb_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1197_c7_7aeb_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1197_c7_7aeb_return_output := result_stack_value_MUX_uxn_opcodes_h_l1197_c7_7aeb_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1187_c7_ce6a_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1190_c7_a809_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1194_c7_404e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_7aeb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1187_c7_ce6a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1190_c7_a809_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1182_c7_604d_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1187_c7_ce6a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1194_c7_404e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_7aeb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1190_c7_a809_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c7_404e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1190_c7_a809_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c7_404e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1194_c7_404e_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1197_c7_7aeb_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1173_c2_25ea_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1190_c7_a809_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1194_c7_404e_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1194_c7_404e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1194_c7_404e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1194_c7_404e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1194_c7_404e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1194_c7_404e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1194_c7_404e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1194_c7_404e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1194_c7_404e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1194_c7_404e_return_output;

     -- n16_MUX[uxn_opcodes_h_l1187_c7_ce6a] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1187_c7_ce6a_cond <= VAR_n16_MUX_uxn_opcodes_h_l1187_c7_ce6a_cond;
     n16_MUX_uxn_opcodes_h_l1187_c7_ce6a_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1187_c7_ce6a_iftrue;
     n16_MUX_uxn_opcodes_h_l1187_c7_ce6a_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1187_c7_ce6a_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1187_c7_ce6a_return_output := n16_MUX_uxn_opcodes_h_l1187_c7_ce6a_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1194_c7_404e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1194_c7_404e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1194_c7_404e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1194_c7_404e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1194_c7_404e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1194_c7_404e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1194_c7_404e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1194_c7_404e_return_output := result_stack_value_MUX_uxn_opcodes_h_l1194_c7_404e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1194_c7_404e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1194_c7_404e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1194_c7_404e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1194_c7_404e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1194_c7_404e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1194_c7_404e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1194_c7_404e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1194_c7_404e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1194_c7_404e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1187_c7_ce6a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1187_c7_ce6a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1187_c7_ce6a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1187_c7_ce6a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1187_c7_ce6a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1187_c7_ce6a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1187_c7_ce6a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1187_c7_ce6a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1187_c7_ce6a_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1182_c7_604d] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1182_c7_604d_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1182_c7_604d_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1182_c7_604d_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1182_c7_604d_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1182_c7_604d_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1182_c7_604d_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1182_c7_604d_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1182_c7_604d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1190_c7_a809] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1190_c7_a809_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1190_c7_a809_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1190_c7_a809_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1190_c7_a809_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1190_c7_a809_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1190_c7_a809_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1190_c7_a809_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1190_c7_a809_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1190_c7_a809] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1190_c7_a809_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1190_c7_a809_cond;
     tmp16_MUX_uxn_opcodes_h_l1190_c7_a809_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1190_c7_a809_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1190_c7_a809_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1190_c7_a809_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1190_c7_a809_return_output := tmp16_MUX_uxn_opcodes_h_l1190_c7_a809_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1190_c7_a809] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1190_c7_a809_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1190_c7_a809_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1190_c7_a809_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1190_c7_a809_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1190_c7_a809_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1190_c7_a809_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1190_c7_a809_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1190_c7_a809_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l1182_c7_604d_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1187_c7_ce6a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1190_c7_a809_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1194_c7_404e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1182_c7_604d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1187_c7_ce6a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1179_c7_dbbf_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1182_c7_604d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1190_c7_a809_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1194_c7_404e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1187_c7_ce6a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1190_c7_a809_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1187_c7_ce6a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1190_c7_a809_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1190_c7_a809_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1194_c7_404e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1187_c7_ce6a_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1190_c7_a809_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l1179_c7_dbbf] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1179_c7_dbbf_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1179_c7_dbbf_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1179_c7_dbbf_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1179_c7_dbbf_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1179_c7_dbbf_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1179_c7_dbbf_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1179_c7_dbbf_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1179_c7_dbbf_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1190_c7_a809] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1190_c7_a809_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1190_c7_a809_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1190_c7_a809_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1190_c7_a809_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1190_c7_a809_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1190_c7_a809_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1190_c7_a809_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1190_c7_a809_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1187_c7_ce6a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1187_c7_ce6a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1187_c7_ce6a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1187_c7_ce6a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1187_c7_ce6a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1187_c7_ce6a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1187_c7_ce6a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1187_c7_ce6a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1187_c7_ce6a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1190_c7_a809] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1190_c7_a809_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1190_c7_a809_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1190_c7_a809_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1190_c7_a809_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1190_c7_a809_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1190_c7_a809_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1190_c7_a809_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1190_c7_a809_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1187_c7_ce6a] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1187_c7_ce6a_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1187_c7_ce6a_cond;
     tmp16_MUX_uxn_opcodes_h_l1187_c7_ce6a_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1187_c7_ce6a_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1187_c7_ce6a_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1187_c7_ce6a_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1187_c7_ce6a_return_output := tmp16_MUX_uxn_opcodes_h_l1187_c7_ce6a_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1190_c7_a809] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1190_c7_a809_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1190_c7_a809_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1190_c7_a809_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1190_c7_a809_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1190_c7_a809_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1190_c7_a809_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1190_c7_a809_return_output := result_stack_value_MUX_uxn_opcodes_h_l1190_c7_a809_return_output;

     -- n16_MUX[uxn_opcodes_h_l1182_c7_604d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1182_c7_604d_cond <= VAR_n16_MUX_uxn_opcodes_h_l1182_c7_604d_cond;
     n16_MUX_uxn_opcodes_h_l1182_c7_604d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1182_c7_604d_iftrue;
     n16_MUX_uxn_opcodes_h_l1182_c7_604d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1182_c7_604d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1182_c7_604d_return_output := n16_MUX_uxn_opcodes_h_l1182_c7_604d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1187_c7_ce6a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1187_c7_ce6a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1187_c7_ce6a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1187_c7_ce6a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1187_c7_ce6a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1187_c7_ce6a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1187_c7_ce6a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1187_c7_ce6a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1187_c7_ce6a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1182_c7_604d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1182_c7_604d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1182_c7_604d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1182_c7_604d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1182_c7_604d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1182_c7_604d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1182_c7_604d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1182_c7_604d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1182_c7_604d_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l1179_c7_dbbf_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1182_c7_604d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1187_c7_ce6a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1190_c7_a809_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1179_c7_dbbf_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1182_c7_604d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1173_c2_25ea_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1179_c7_dbbf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1187_c7_ce6a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1190_c7_a809_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1182_c7_604d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1187_c7_ce6a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1182_c7_604d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1187_c7_ce6a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1187_c7_ce6a_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1190_c7_a809_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1182_c7_604d_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1187_c7_ce6a_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1182_c7_604d] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1182_c7_604d_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1182_c7_604d_cond;
     tmp16_MUX_uxn_opcodes_h_l1182_c7_604d_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1182_c7_604d_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1182_c7_604d_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1182_c7_604d_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1182_c7_604d_return_output := tmp16_MUX_uxn_opcodes_h_l1182_c7_604d_return_output;

     -- n16_MUX[uxn_opcodes_h_l1179_c7_dbbf] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1179_c7_dbbf_cond <= VAR_n16_MUX_uxn_opcodes_h_l1179_c7_dbbf_cond;
     n16_MUX_uxn_opcodes_h_l1179_c7_dbbf_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1179_c7_dbbf_iftrue;
     n16_MUX_uxn_opcodes_h_l1179_c7_dbbf_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1179_c7_dbbf_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1179_c7_dbbf_return_output := n16_MUX_uxn_opcodes_h_l1179_c7_dbbf_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1187_c7_ce6a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1187_c7_ce6a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1187_c7_ce6a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1187_c7_ce6a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1187_c7_ce6a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1187_c7_ce6a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1187_c7_ce6a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1187_c7_ce6a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1187_c7_ce6a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1187_c7_ce6a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1187_c7_ce6a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1187_c7_ce6a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1187_c7_ce6a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1187_c7_ce6a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1187_c7_ce6a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1187_c7_ce6a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1187_c7_ce6a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1187_c7_ce6a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1182_c7_604d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1182_c7_604d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1182_c7_604d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1182_c7_604d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1182_c7_604d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1182_c7_604d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1182_c7_604d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1182_c7_604d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1182_c7_604d_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1187_c7_ce6a] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1187_c7_ce6a_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1187_c7_ce6a_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1187_c7_ce6a_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1187_c7_ce6a_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1187_c7_ce6a_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1187_c7_ce6a_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1187_c7_ce6a_return_output := result_stack_value_MUX_uxn_opcodes_h_l1187_c7_ce6a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1182_c7_604d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1182_c7_604d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1182_c7_604d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1182_c7_604d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1182_c7_604d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1182_c7_604d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1182_c7_604d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1182_c7_604d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1182_c7_604d_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1173_c2_25ea] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1173_c2_25ea_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1173_c2_25ea_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1173_c2_25ea_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1173_c2_25ea_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1173_c2_25ea_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1173_c2_25ea_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1173_c2_25ea_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1173_c2_25ea_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1179_c7_dbbf] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1179_c7_dbbf_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1179_c7_dbbf_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1179_c7_dbbf_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1179_c7_dbbf_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1179_c7_dbbf_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1179_c7_dbbf_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1179_c7_dbbf_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1179_c7_dbbf_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l1173_c2_25ea_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1179_c7_dbbf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1182_c7_604d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1187_c7_ce6a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1173_c2_25ea_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1179_c7_dbbf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1182_c7_604d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1187_c7_ce6a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1179_c7_dbbf_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1182_c7_604d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1179_c7_dbbf_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1182_c7_604d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1182_c7_604d_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1187_c7_ce6a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1179_c7_dbbf_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1182_c7_604d_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1182_c7_604d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1182_c7_604d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1182_c7_604d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1182_c7_604d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1182_c7_604d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1182_c7_604d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1182_c7_604d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1182_c7_604d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1182_c7_604d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1179_c7_dbbf] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1179_c7_dbbf_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1179_c7_dbbf_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1179_c7_dbbf_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1179_c7_dbbf_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1179_c7_dbbf_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1179_c7_dbbf_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1179_c7_dbbf_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1179_c7_dbbf_return_output;

     -- n16_MUX[uxn_opcodes_h_l1173_c2_25ea] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1173_c2_25ea_cond <= VAR_n16_MUX_uxn_opcodes_h_l1173_c2_25ea_cond;
     n16_MUX_uxn_opcodes_h_l1173_c2_25ea_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1173_c2_25ea_iftrue;
     n16_MUX_uxn_opcodes_h_l1173_c2_25ea_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1173_c2_25ea_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1173_c2_25ea_return_output := n16_MUX_uxn_opcodes_h_l1173_c2_25ea_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1182_c7_604d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1182_c7_604d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1182_c7_604d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1182_c7_604d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1182_c7_604d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1182_c7_604d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1182_c7_604d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1182_c7_604d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1182_c7_604d_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1179_c7_dbbf] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1179_c7_dbbf_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1179_c7_dbbf_cond;
     tmp16_MUX_uxn_opcodes_h_l1179_c7_dbbf_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1179_c7_dbbf_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1179_c7_dbbf_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1179_c7_dbbf_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1179_c7_dbbf_return_output := tmp16_MUX_uxn_opcodes_h_l1179_c7_dbbf_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1179_c7_dbbf] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1179_c7_dbbf_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1179_c7_dbbf_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1179_c7_dbbf_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1179_c7_dbbf_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1179_c7_dbbf_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1179_c7_dbbf_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1179_c7_dbbf_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1179_c7_dbbf_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1182_c7_604d] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1182_c7_604d_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1182_c7_604d_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1182_c7_604d_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1182_c7_604d_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1182_c7_604d_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1182_c7_604d_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1182_c7_604d_return_output := result_stack_value_MUX_uxn_opcodes_h_l1182_c7_604d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1173_c2_25ea] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1173_c2_25ea_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1173_c2_25ea_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1173_c2_25ea_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1173_c2_25ea_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1173_c2_25ea_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1173_c2_25ea_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1173_c2_25ea_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1173_c2_25ea_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1173_c2_25ea_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1179_c7_dbbf_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1182_c7_604d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1179_c7_dbbf_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1182_c7_604d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1173_c2_25ea_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1179_c7_dbbf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1173_c2_25ea_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1179_c7_dbbf_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1179_c7_dbbf_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1182_c7_604d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1173_c2_25ea_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1179_c7_dbbf_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1173_c2_25ea] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1173_c2_25ea_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1173_c2_25ea_cond;
     tmp16_MUX_uxn_opcodes_h_l1173_c2_25ea_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1173_c2_25ea_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1173_c2_25ea_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1173_c2_25ea_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1173_c2_25ea_return_output := tmp16_MUX_uxn_opcodes_h_l1173_c2_25ea_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1173_c2_25ea] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1173_c2_25ea_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1173_c2_25ea_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1173_c2_25ea_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1173_c2_25ea_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1173_c2_25ea_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1173_c2_25ea_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1173_c2_25ea_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1173_c2_25ea_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1179_c7_dbbf] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1179_c7_dbbf_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1179_c7_dbbf_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1179_c7_dbbf_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1179_c7_dbbf_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1179_c7_dbbf_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1179_c7_dbbf_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1179_c7_dbbf_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1179_c7_dbbf_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1179_c7_dbbf] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1179_c7_dbbf_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1179_c7_dbbf_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1179_c7_dbbf_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1179_c7_dbbf_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1179_c7_dbbf_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1179_c7_dbbf_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1179_c7_dbbf_return_output := result_stack_value_MUX_uxn_opcodes_h_l1179_c7_dbbf_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1179_c7_dbbf] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1179_c7_dbbf_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1179_c7_dbbf_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1179_c7_dbbf_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1179_c7_dbbf_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1179_c7_dbbf_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1179_c7_dbbf_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1179_c7_dbbf_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1179_c7_dbbf_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1173_c2_25ea] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1173_c2_25ea_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1173_c2_25ea_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1173_c2_25ea_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1173_c2_25ea_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1173_c2_25ea_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1173_c2_25ea_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1173_c2_25ea_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1173_c2_25ea_return_output;

     -- Submodule level 12
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1173_c2_25ea_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1179_c7_dbbf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1173_c2_25ea_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1179_c7_dbbf_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1173_c2_25ea_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1179_c7_dbbf_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1173_c2_25ea_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1173_c2_25ea] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1173_c2_25ea_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1173_c2_25ea_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1173_c2_25ea_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1173_c2_25ea_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1173_c2_25ea_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1173_c2_25ea_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1173_c2_25ea_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1173_c2_25ea_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1173_c2_25ea] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1173_c2_25ea_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1173_c2_25ea_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1173_c2_25ea_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1173_c2_25ea_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1173_c2_25ea_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1173_c2_25ea_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1173_c2_25ea_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1173_c2_25ea_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1173_c2_25ea] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1173_c2_25ea_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1173_c2_25ea_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1173_c2_25ea_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1173_c2_25ea_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1173_c2_25ea_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1173_c2_25ea_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1173_c2_25ea_return_output := result_stack_value_MUX_uxn_opcodes_h_l1173_c2_25ea_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l1169_l1227_DUPLICATE_86af LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l1169_l1227_DUPLICATE_86af_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_287e(
     result,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1173_c2_25ea_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1173_c2_25ea_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1173_c2_25ea_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1173_c2_25ea_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1173_c2_25ea_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1173_c2_25ea_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1173_c2_25ea_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l1169_l1227_DUPLICATE_86af_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l1169_l1227_DUPLICATE_86af_return_output;
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
