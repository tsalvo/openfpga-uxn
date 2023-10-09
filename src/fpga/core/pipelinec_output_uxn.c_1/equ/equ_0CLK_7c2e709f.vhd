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
-- Submodules: 65
entity equ_0CLK_7c2e709f is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end equ_0CLK_7c2e709f;
architecture arch of equ_0CLK_7c2e709f is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_n8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1309_c6_d303]
signal BIN_OP_EQ_uxn_opcodes_h_l1309_c6_d303_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1309_c6_d303_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1309_c6_d303_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1309_c1_c97f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1309_c1_c97f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1309_c1_c97f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1309_c1_c97f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1309_c1_c97f_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1309_c2_f5f8]
signal t8_MUX_uxn_opcodes_h_l1309_c2_f5f8_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1309_c2_f5f8_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1309_c2_f5f8_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1309_c2_f5f8_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l1309_c2_f5f8]
signal n8_MUX_uxn_opcodes_h_l1309_c2_f5f8_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1309_c2_f5f8_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1309_c2_f5f8_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1309_c2_f5f8_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1309_c2_f5f8]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1309_c2_f5f8_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1309_c2_f5f8_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1309_c2_f5f8_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1309_c2_f5f8_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1309_c2_f5f8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1309_c2_f5f8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1309_c2_f5f8_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1309_c2_f5f8_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1309_c2_f5f8_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1309_c2_f5f8]
signal result_stack_value_MUX_uxn_opcodes_h_l1309_c2_f5f8_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1309_c2_f5f8_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1309_c2_f5f8_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1309_c2_f5f8_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1309_c2_f5f8]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1309_c2_f5f8_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1309_c2_f5f8_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1309_c2_f5f8_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1309_c2_f5f8_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1309_c2_f5f8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1309_c2_f5f8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1309_c2_f5f8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1309_c2_f5f8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1309_c2_f5f8_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1309_c2_f5f8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1309_c2_f5f8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1309_c2_f5f8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1309_c2_f5f8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1309_c2_f5f8_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1309_c2_f5f8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1309_c2_f5f8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1309_c2_f5f8_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1309_c2_f5f8_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1309_c2_f5f8_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l1310_c3_e1f7[uxn_opcodes_h_l1310_c3_e1f7]
signal printf_uxn_opcodes_h_l1310_c3_e1f7_uxn_opcodes_h_l1310_c3_e1f7_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1315_c11_ab9b]
signal BIN_OP_EQ_uxn_opcodes_h_l1315_c11_ab9b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1315_c11_ab9b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1315_c11_ab9b_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1315_c7_7e13]
signal t8_MUX_uxn_opcodes_h_l1315_c7_7e13_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1315_c7_7e13_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1315_c7_7e13_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1315_c7_7e13_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l1315_c7_7e13]
signal n8_MUX_uxn_opcodes_h_l1315_c7_7e13_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1315_c7_7e13_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1315_c7_7e13_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1315_c7_7e13_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1315_c7_7e13]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1315_c7_7e13_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1315_c7_7e13_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1315_c7_7e13_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1315_c7_7e13_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1315_c7_7e13]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1315_c7_7e13_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1315_c7_7e13_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1315_c7_7e13_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1315_c7_7e13_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1315_c7_7e13]
signal result_stack_value_MUX_uxn_opcodes_h_l1315_c7_7e13_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1315_c7_7e13_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1315_c7_7e13_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1315_c7_7e13_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1315_c7_7e13]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1315_c7_7e13_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1315_c7_7e13_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1315_c7_7e13_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1315_c7_7e13_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1315_c7_7e13]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1315_c7_7e13_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1315_c7_7e13_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1315_c7_7e13_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1315_c7_7e13_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1315_c7_7e13]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1315_c7_7e13_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1315_c7_7e13_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1315_c7_7e13_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1315_c7_7e13_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1315_c7_7e13]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1315_c7_7e13_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1315_c7_7e13_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1315_c7_7e13_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1315_c7_7e13_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1318_c11_260d]
signal BIN_OP_EQ_uxn_opcodes_h_l1318_c11_260d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1318_c11_260d_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1318_c11_260d_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1318_c7_f51d]
signal t8_MUX_uxn_opcodes_h_l1318_c7_f51d_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1318_c7_f51d_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1318_c7_f51d_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1318_c7_f51d_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l1318_c7_f51d]
signal n8_MUX_uxn_opcodes_h_l1318_c7_f51d_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1318_c7_f51d_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1318_c7_f51d_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1318_c7_f51d_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1318_c7_f51d]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1318_c7_f51d_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1318_c7_f51d_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1318_c7_f51d_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1318_c7_f51d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1318_c7_f51d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1318_c7_f51d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1318_c7_f51d_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1318_c7_f51d_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1318_c7_f51d_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1318_c7_f51d]
signal result_stack_value_MUX_uxn_opcodes_h_l1318_c7_f51d_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1318_c7_f51d_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1318_c7_f51d_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1318_c7_f51d_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1318_c7_f51d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1318_c7_f51d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1318_c7_f51d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1318_c7_f51d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1318_c7_f51d_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1318_c7_f51d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1318_c7_f51d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1318_c7_f51d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1318_c7_f51d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1318_c7_f51d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1318_c7_f51d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1318_c7_f51d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1318_c7_f51d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1318_c7_f51d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1318_c7_f51d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1318_c7_f51d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1318_c7_f51d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1318_c7_f51d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1318_c7_f51d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1318_c7_f51d_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1322_c11_020c]
signal BIN_OP_EQ_uxn_opcodes_h_l1322_c11_020c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1322_c11_020c_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1322_c11_020c_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1322_c7_34ee]
signal n8_MUX_uxn_opcodes_h_l1322_c7_34ee_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1322_c7_34ee_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1322_c7_34ee_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1322_c7_34ee_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1322_c7_34ee]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1322_c7_34ee_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1322_c7_34ee_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1322_c7_34ee_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1322_c7_34ee_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1322_c7_34ee]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1322_c7_34ee_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1322_c7_34ee_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1322_c7_34ee_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1322_c7_34ee_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1322_c7_34ee]
signal result_stack_value_MUX_uxn_opcodes_h_l1322_c7_34ee_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1322_c7_34ee_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1322_c7_34ee_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1322_c7_34ee_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1322_c7_34ee]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1322_c7_34ee_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1322_c7_34ee_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1322_c7_34ee_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1322_c7_34ee_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1322_c7_34ee]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1322_c7_34ee_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1322_c7_34ee_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1322_c7_34ee_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1322_c7_34ee_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1322_c7_34ee]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1322_c7_34ee_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1322_c7_34ee_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1322_c7_34ee_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1322_c7_34ee_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1322_c7_34ee]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1322_c7_34ee_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1322_c7_34ee_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1322_c7_34ee_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1322_c7_34ee_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1325_c11_3d10]
signal BIN_OP_EQ_uxn_opcodes_h_l1325_c11_3d10_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1325_c11_3d10_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1325_c11_3d10_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1325_c7_8f49]
signal n8_MUX_uxn_opcodes_h_l1325_c7_8f49_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1325_c7_8f49_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1325_c7_8f49_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1325_c7_8f49_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1325_c7_8f49]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1325_c7_8f49_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1325_c7_8f49_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1325_c7_8f49_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1325_c7_8f49_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1325_c7_8f49]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1325_c7_8f49_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1325_c7_8f49_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1325_c7_8f49_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1325_c7_8f49_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1325_c7_8f49]
signal result_stack_value_MUX_uxn_opcodes_h_l1325_c7_8f49_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1325_c7_8f49_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1325_c7_8f49_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1325_c7_8f49_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1325_c7_8f49]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1325_c7_8f49_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1325_c7_8f49_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1325_c7_8f49_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1325_c7_8f49_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1325_c7_8f49]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1325_c7_8f49_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1325_c7_8f49_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1325_c7_8f49_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1325_c7_8f49_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1325_c7_8f49]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1325_c7_8f49_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1325_c7_8f49_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1325_c7_8f49_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1325_c7_8f49_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1325_c7_8f49]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1325_c7_8f49_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1325_c7_8f49_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1325_c7_8f49_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1325_c7_8f49_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1329_c32_af29]
signal BIN_OP_AND_uxn_opcodes_h_l1329_c32_af29_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1329_c32_af29_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1329_c32_af29_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1329_c32_9cd2]
signal BIN_OP_GT_uxn_opcodes_h_l1329_c32_9cd2_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1329_c32_9cd2_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1329_c32_9cd2_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1329_c32_e1b8]
signal MUX_uxn_opcodes_h_l1329_c32_e1b8_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1329_c32_e1b8_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1329_c32_e1b8_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1329_c32_e1b8_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1331_c11_dc70]
signal BIN_OP_EQ_uxn_opcodes_h_l1331_c11_dc70_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1331_c11_dc70_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1331_c11_dc70_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1331_c7_529e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1331_c7_529e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1331_c7_529e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1331_c7_529e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1331_c7_529e_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1331_c7_529e]
signal result_stack_value_MUX_uxn_opcodes_h_l1331_c7_529e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1331_c7_529e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1331_c7_529e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1331_c7_529e_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1331_c7_529e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1331_c7_529e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1331_c7_529e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1331_c7_529e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1331_c7_529e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1331_c7_529e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1331_c7_529e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1331_c7_529e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1331_c7_529e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1331_c7_529e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1331_c7_529e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1331_c7_529e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1331_c7_529e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1331_c7_529e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1331_c7_529e_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1335_c24_887a]
signal BIN_OP_EQ_uxn_opcodes_h_l1335_c24_887a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1335_c24_887a_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1335_c24_887a_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1335_c24_ee45]
signal MUX_uxn_opcodes_h_l1335_c24_ee45_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1335_c24_ee45_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1335_c24_ee45_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1335_c24_ee45_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1337_c11_4e9e]
signal BIN_OP_EQ_uxn_opcodes_h_l1337_c11_4e9e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1337_c11_4e9e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1337_c11_4e9e_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1337_c7_137d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1337_c7_137d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1337_c7_137d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1337_c7_137d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1337_c7_137d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1337_c7_137d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1337_c7_137d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1337_c7_137d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1337_c7_137d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1337_c7_137d_return_output : unsigned(0 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3( ref_toks_0 : opcode_result_t;
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
      base.stack_value := ref_toks_3;
      base.is_sp_shift := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.is_opc_done := ref_toks_6;
      base.stack_address_sp_offset := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1309_c6_d303
BIN_OP_EQ_uxn_opcodes_h_l1309_c6_d303 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1309_c6_d303_left,
BIN_OP_EQ_uxn_opcodes_h_l1309_c6_d303_right,
BIN_OP_EQ_uxn_opcodes_h_l1309_c6_d303_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1309_c1_c97f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1309_c1_c97f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1309_c1_c97f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1309_c1_c97f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1309_c1_c97f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1309_c1_c97f_return_output);

-- t8_MUX_uxn_opcodes_h_l1309_c2_f5f8
t8_MUX_uxn_opcodes_h_l1309_c2_f5f8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1309_c2_f5f8_cond,
t8_MUX_uxn_opcodes_h_l1309_c2_f5f8_iftrue,
t8_MUX_uxn_opcodes_h_l1309_c2_f5f8_iffalse,
t8_MUX_uxn_opcodes_h_l1309_c2_f5f8_return_output);

-- n8_MUX_uxn_opcodes_h_l1309_c2_f5f8
n8_MUX_uxn_opcodes_h_l1309_c2_f5f8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1309_c2_f5f8_cond,
n8_MUX_uxn_opcodes_h_l1309_c2_f5f8_iftrue,
n8_MUX_uxn_opcodes_h_l1309_c2_f5f8_iffalse,
n8_MUX_uxn_opcodes_h_l1309_c2_f5f8_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1309_c2_f5f8
result_is_stack_read_MUX_uxn_opcodes_h_l1309_c2_f5f8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1309_c2_f5f8_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1309_c2_f5f8_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1309_c2_f5f8_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1309_c2_f5f8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1309_c2_f5f8
result_sp_relative_shift_MUX_uxn_opcodes_h_l1309_c2_f5f8 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1309_c2_f5f8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1309_c2_f5f8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1309_c2_f5f8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1309_c2_f5f8_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1309_c2_f5f8
result_stack_value_MUX_uxn_opcodes_h_l1309_c2_f5f8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1309_c2_f5f8_cond,
result_stack_value_MUX_uxn_opcodes_h_l1309_c2_f5f8_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1309_c2_f5f8_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1309_c2_f5f8_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1309_c2_f5f8
result_is_sp_shift_MUX_uxn_opcodes_h_l1309_c2_f5f8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1309_c2_f5f8_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1309_c2_f5f8_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1309_c2_f5f8_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1309_c2_f5f8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1309_c2_f5f8
result_is_stack_write_MUX_uxn_opcodes_h_l1309_c2_f5f8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1309_c2_f5f8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1309_c2_f5f8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1309_c2_f5f8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1309_c2_f5f8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1309_c2_f5f8
result_is_opc_done_MUX_uxn_opcodes_h_l1309_c2_f5f8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1309_c2_f5f8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1309_c2_f5f8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1309_c2_f5f8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1309_c2_f5f8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1309_c2_f5f8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1309_c2_f5f8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1309_c2_f5f8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1309_c2_f5f8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1309_c2_f5f8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1309_c2_f5f8_return_output);

-- printf_uxn_opcodes_h_l1310_c3_e1f7_uxn_opcodes_h_l1310_c3_e1f7
printf_uxn_opcodes_h_l1310_c3_e1f7_uxn_opcodes_h_l1310_c3_e1f7 : entity work.printf_uxn_opcodes_h_l1310_c3_e1f7_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1310_c3_e1f7_uxn_opcodes_h_l1310_c3_e1f7_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1315_c11_ab9b
BIN_OP_EQ_uxn_opcodes_h_l1315_c11_ab9b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1315_c11_ab9b_left,
BIN_OP_EQ_uxn_opcodes_h_l1315_c11_ab9b_right,
BIN_OP_EQ_uxn_opcodes_h_l1315_c11_ab9b_return_output);

-- t8_MUX_uxn_opcodes_h_l1315_c7_7e13
t8_MUX_uxn_opcodes_h_l1315_c7_7e13 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1315_c7_7e13_cond,
t8_MUX_uxn_opcodes_h_l1315_c7_7e13_iftrue,
t8_MUX_uxn_opcodes_h_l1315_c7_7e13_iffalse,
t8_MUX_uxn_opcodes_h_l1315_c7_7e13_return_output);

-- n8_MUX_uxn_opcodes_h_l1315_c7_7e13
n8_MUX_uxn_opcodes_h_l1315_c7_7e13 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1315_c7_7e13_cond,
n8_MUX_uxn_opcodes_h_l1315_c7_7e13_iftrue,
n8_MUX_uxn_opcodes_h_l1315_c7_7e13_iffalse,
n8_MUX_uxn_opcodes_h_l1315_c7_7e13_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1315_c7_7e13
result_is_stack_read_MUX_uxn_opcodes_h_l1315_c7_7e13 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1315_c7_7e13_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1315_c7_7e13_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1315_c7_7e13_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1315_c7_7e13_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1315_c7_7e13
result_sp_relative_shift_MUX_uxn_opcodes_h_l1315_c7_7e13 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1315_c7_7e13_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1315_c7_7e13_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1315_c7_7e13_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1315_c7_7e13_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1315_c7_7e13
result_stack_value_MUX_uxn_opcodes_h_l1315_c7_7e13 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1315_c7_7e13_cond,
result_stack_value_MUX_uxn_opcodes_h_l1315_c7_7e13_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1315_c7_7e13_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1315_c7_7e13_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1315_c7_7e13
result_is_sp_shift_MUX_uxn_opcodes_h_l1315_c7_7e13 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1315_c7_7e13_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1315_c7_7e13_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1315_c7_7e13_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1315_c7_7e13_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1315_c7_7e13
result_is_stack_write_MUX_uxn_opcodes_h_l1315_c7_7e13 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1315_c7_7e13_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1315_c7_7e13_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1315_c7_7e13_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1315_c7_7e13_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1315_c7_7e13
result_is_opc_done_MUX_uxn_opcodes_h_l1315_c7_7e13 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1315_c7_7e13_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1315_c7_7e13_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1315_c7_7e13_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1315_c7_7e13_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1315_c7_7e13
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1315_c7_7e13 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1315_c7_7e13_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1315_c7_7e13_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1315_c7_7e13_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1315_c7_7e13_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1318_c11_260d
BIN_OP_EQ_uxn_opcodes_h_l1318_c11_260d : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1318_c11_260d_left,
BIN_OP_EQ_uxn_opcodes_h_l1318_c11_260d_right,
BIN_OP_EQ_uxn_opcodes_h_l1318_c11_260d_return_output);

-- t8_MUX_uxn_opcodes_h_l1318_c7_f51d
t8_MUX_uxn_opcodes_h_l1318_c7_f51d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1318_c7_f51d_cond,
t8_MUX_uxn_opcodes_h_l1318_c7_f51d_iftrue,
t8_MUX_uxn_opcodes_h_l1318_c7_f51d_iffalse,
t8_MUX_uxn_opcodes_h_l1318_c7_f51d_return_output);

-- n8_MUX_uxn_opcodes_h_l1318_c7_f51d
n8_MUX_uxn_opcodes_h_l1318_c7_f51d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1318_c7_f51d_cond,
n8_MUX_uxn_opcodes_h_l1318_c7_f51d_iftrue,
n8_MUX_uxn_opcodes_h_l1318_c7_f51d_iffalse,
n8_MUX_uxn_opcodes_h_l1318_c7_f51d_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1318_c7_f51d
result_is_stack_read_MUX_uxn_opcodes_h_l1318_c7_f51d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1318_c7_f51d_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1318_c7_f51d_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1318_c7_f51d_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1318_c7_f51d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1318_c7_f51d
result_sp_relative_shift_MUX_uxn_opcodes_h_l1318_c7_f51d : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1318_c7_f51d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1318_c7_f51d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1318_c7_f51d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1318_c7_f51d_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1318_c7_f51d
result_stack_value_MUX_uxn_opcodes_h_l1318_c7_f51d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1318_c7_f51d_cond,
result_stack_value_MUX_uxn_opcodes_h_l1318_c7_f51d_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1318_c7_f51d_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1318_c7_f51d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1318_c7_f51d
result_is_sp_shift_MUX_uxn_opcodes_h_l1318_c7_f51d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1318_c7_f51d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1318_c7_f51d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1318_c7_f51d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1318_c7_f51d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1318_c7_f51d
result_is_stack_write_MUX_uxn_opcodes_h_l1318_c7_f51d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1318_c7_f51d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1318_c7_f51d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1318_c7_f51d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1318_c7_f51d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1318_c7_f51d
result_is_opc_done_MUX_uxn_opcodes_h_l1318_c7_f51d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1318_c7_f51d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1318_c7_f51d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1318_c7_f51d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1318_c7_f51d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1318_c7_f51d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1318_c7_f51d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1318_c7_f51d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1318_c7_f51d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1318_c7_f51d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1318_c7_f51d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1322_c11_020c
BIN_OP_EQ_uxn_opcodes_h_l1322_c11_020c : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1322_c11_020c_left,
BIN_OP_EQ_uxn_opcodes_h_l1322_c11_020c_right,
BIN_OP_EQ_uxn_opcodes_h_l1322_c11_020c_return_output);

-- n8_MUX_uxn_opcodes_h_l1322_c7_34ee
n8_MUX_uxn_opcodes_h_l1322_c7_34ee : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1322_c7_34ee_cond,
n8_MUX_uxn_opcodes_h_l1322_c7_34ee_iftrue,
n8_MUX_uxn_opcodes_h_l1322_c7_34ee_iffalse,
n8_MUX_uxn_opcodes_h_l1322_c7_34ee_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1322_c7_34ee
result_is_stack_read_MUX_uxn_opcodes_h_l1322_c7_34ee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1322_c7_34ee_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1322_c7_34ee_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1322_c7_34ee_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1322_c7_34ee_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1322_c7_34ee
result_sp_relative_shift_MUX_uxn_opcodes_h_l1322_c7_34ee : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1322_c7_34ee_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1322_c7_34ee_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1322_c7_34ee_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1322_c7_34ee_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1322_c7_34ee
result_stack_value_MUX_uxn_opcodes_h_l1322_c7_34ee : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1322_c7_34ee_cond,
result_stack_value_MUX_uxn_opcodes_h_l1322_c7_34ee_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1322_c7_34ee_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1322_c7_34ee_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1322_c7_34ee
result_is_sp_shift_MUX_uxn_opcodes_h_l1322_c7_34ee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1322_c7_34ee_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1322_c7_34ee_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1322_c7_34ee_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1322_c7_34ee_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1322_c7_34ee
result_is_stack_write_MUX_uxn_opcodes_h_l1322_c7_34ee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1322_c7_34ee_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1322_c7_34ee_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1322_c7_34ee_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1322_c7_34ee_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1322_c7_34ee
result_is_opc_done_MUX_uxn_opcodes_h_l1322_c7_34ee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1322_c7_34ee_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1322_c7_34ee_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1322_c7_34ee_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1322_c7_34ee_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1322_c7_34ee
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1322_c7_34ee : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1322_c7_34ee_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1322_c7_34ee_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1322_c7_34ee_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1322_c7_34ee_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1325_c11_3d10
BIN_OP_EQ_uxn_opcodes_h_l1325_c11_3d10 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1325_c11_3d10_left,
BIN_OP_EQ_uxn_opcodes_h_l1325_c11_3d10_right,
BIN_OP_EQ_uxn_opcodes_h_l1325_c11_3d10_return_output);

-- n8_MUX_uxn_opcodes_h_l1325_c7_8f49
n8_MUX_uxn_opcodes_h_l1325_c7_8f49 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1325_c7_8f49_cond,
n8_MUX_uxn_opcodes_h_l1325_c7_8f49_iftrue,
n8_MUX_uxn_opcodes_h_l1325_c7_8f49_iffalse,
n8_MUX_uxn_opcodes_h_l1325_c7_8f49_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1325_c7_8f49
result_is_stack_read_MUX_uxn_opcodes_h_l1325_c7_8f49 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1325_c7_8f49_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1325_c7_8f49_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1325_c7_8f49_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1325_c7_8f49_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1325_c7_8f49
result_sp_relative_shift_MUX_uxn_opcodes_h_l1325_c7_8f49 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1325_c7_8f49_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1325_c7_8f49_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1325_c7_8f49_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1325_c7_8f49_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1325_c7_8f49
result_stack_value_MUX_uxn_opcodes_h_l1325_c7_8f49 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1325_c7_8f49_cond,
result_stack_value_MUX_uxn_opcodes_h_l1325_c7_8f49_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1325_c7_8f49_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1325_c7_8f49_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1325_c7_8f49
result_is_sp_shift_MUX_uxn_opcodes_h_l1325_c7_8f49 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1325_c7_8f49_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1325_c7_8f49_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1325_c7_8f49_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1325_c7_8f49_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1325_c7_8f49
result_is_stack_write_MUX_uxn_opcodes_h_l1325_c7_8f49 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1325_c7_8f49_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1325_c7_8f49_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1325_c7_8f49_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1325_c7_8f49_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1325_c7_8f49
result_is_opc_done_MUX_uxn_opcodes_h_l1325_c7_8f49 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1325_c7_8f49_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1325_c7_8f49_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1325_c7_8f49_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1325_c7_8f49_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1325_c7_8f49
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1325_c7_8f49 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1325_c7_8f49_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1325_c7_8f49_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1325_c7_8f49_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1325_c7_8f49_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1329_c32_af29
BIN_OP_AND_uxn_opcodes_h_l1329_c32_af29 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1329_c32_af29_left,
BIN_OP_AND_uxn_opcodes_h_l1329_c32_af29_right,
BIN_OP_AND_uxn_opcodes_h_l1329_c32_af29_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1329_c32_9cd2
BIN_OP_GT_uxn_opcodes_h_l1329_c32_9cd2 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1329_c32_9cd2_left,
BIN_OP_GT_uxn_opcodes_h_l1329_c32_9cd2_right,
BIN_OP_GT_uxn_opcodes_h_l1329_c32_9cd2_return_output);

-- MUX_uxn_opcodes_h_l1329_c32_e1b8
MUX_uxn_opcodes_h_l1329_c32_e1b8 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1329_c32_e1b8_cond,
MUX_uxn_opcodes_h_l1329_c32_e1b8_iftrue,
MUX_uxn_opcodes_h_l1329_c32_e1b8_iffalse,
MUX_uxn_opcodes_h_l1329_c32_e1b8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1331_c11_dc70
BIN_OP_EQ_uxn_opcodes_h_l1331_c11_dc70 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1331_c11_dc70_left,
BIN_OP_EQ_uxn_opcodes_h_l1331_c11_dc70_right,
BIN_OP_EQ_uxn_opcodes_h_l1331_c11_dc70_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1331_c7_529e
result_is_sp_shift_MUX_uxn_opcodes_h_l1331_c7_529e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1331_c7_529e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1331_c7_529e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1331_c7_529e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1331_c7_529e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1331_c7_529e
result_stack_value_MUX_uxn_opcodes_h_l1331_c7_529e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1331_c7_529e_cond,
result_stack_value_MUX_uxn_opcodes_h_l1331_c7_529e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1331_c7_529e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1331_c7_529e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1331_c7_529e
result_is_stack_write_MUX_uxn_opcodes_h_l1331_c7_529e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1331_c7_529e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1331_c7_529e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1331_c7_529e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1331_c7_529e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1331_c7_529e
result_is_opc_done_MUX_uxn_opcodes_h_l1331_c7_529e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1331_c7_529e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1331_c7_529e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1331_c7_529e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1331_c7_529e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1331_c7_529e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1331_c7_529e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1331_c7_529e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1331_c7_529e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1331_c7_529e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1331_c7_529e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1335_c24_887a
BIN_OP_EQ_uxn_opcodes_h_l1335_c24_887a : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1335_c24_887a_left,
BIN_OP_EQ_uxn_opcodes_h_l1335_c24_887a_right,
BIN_OP_EQ_uxn_opcodes_h_l1335_c24_887a_return_output);

-- MUX_uxn_opcodes_h_l1335_c24_ee45
MUX_uxn_opcodes_h_l1335_c24_ee45 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1335_c24_ee45_cond,
MUX_uxn_opcodes_h_l1335_c24_ee45_iftrue,
MUX_uxn_opcodes_h_l1335_c24_ee45_iffalse,
MUX_uxn_opcodes_h_l1335_c24_ee45_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1337_c11_4e9e
BIN_OP_EQ_uxn_opcodes_h_l1337_c11_4e9e : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1337_c11_4e9e_left,
BIN_OP_EQ_uxn_opcodes_h_l1337_c11_4e9e_right,
BIN_OP_EQ_uxn_opcodes_h_l1337_c11_4e9e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1337_c7_137d
result_is_stack_write_MUX_uxn_opcodes_h_l1337_c7_137d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1337_c7_137d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1337_c7_137d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1337_c7_137d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1337_c7_137d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1337_c7_137d
result_is_opc_done_MUX_uxn_opcodes_h_l1337_c7_137d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1337_c7_137d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1337_c7_137d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1337_c7_137d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1337_c7_137d_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t8,
 n8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1309_c6_d303_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1309_c1_c97f_return_output,
 t8_MUX_uxn_opcodes_h_l1309_c2_f5f8_return_output,
 n8_MUX_uxn_opcodes_h_l1309_c2_f5f8_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1309_c2_f5f8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1309_c2_f5f8_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1309_c2_f5f8_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1309_c2_f5f8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1309_c2_f5f8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1309_c2_f5f8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1309_c2_f5f8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1315_c11_ab9b_return_output,
 t8_MUX_uxn_opcodes_h_l1315_c7_7e13_return_output,
 n8_MUX_uxn_opcodes_h_l1315_c7_7e13_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1315_c7_7e13_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1315_c7_7e13_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1315_c7_7e13_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1315_c7_7e13_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1315_c7_7e13_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1315_c7_7e13_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1315_c7_7e13_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1318_c11_260d_return_output,
 t8_MUX_uxn_opcodes_h_l1318_c7_f51d_return_output,
 n8_MUX_uxn_opcodes_h_l1318_c7_f51d_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1318_c7_f51d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1318_c7_f51d_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1318_c7_f51d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1318_c7_f51d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1318_c7_f51d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1318_c7_f51d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1318_c7_f51d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1322_c11_020c_return_output,
 n8_MUX_uxn_opcodes_h_l1322_c7_34ee_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1322_c7_34ee_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1322_c7_34ee_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1322_c7_34ee_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1322_c7_34ee_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1322_c7_34ee_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1322_c7_34ee_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1322_c7_34ee_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1325_c11_3d10_return_output,
 n8_MUX_uxn_opcodes_h_l1325_c7_8f49_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1325_c7_8f49_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1325_c7_8f49_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1325_c7_8f49_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1325_c7_8f49_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1325_c7_8f49_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1325_c7_8f49_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1325_c7_8f49_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1329_c32_af29_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1329_c32_9cd2_return_output,
 MUX_uxn_opcodes_h_l1329_c32_e1b8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1331_c11_dc70_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1331_c7_529e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1331_c7_529e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1331_c7_529e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1331_c7_529e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1331_c7_529e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1335_c24_887a_return_output,
 MUX_uxn_opcodes_h_l1335_c24_ee45_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1337_c11_4e9e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1337_c7_137d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1337_c7_137d_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1309_c6_d303_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1309_c6_d303_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1309_c6_d303_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1309_c1_c97f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1309_c1_c97f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1309_c1_c97f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1309_c1_c97f_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1309_c2_f5f8_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1309_c2_f5f8_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1315_c7_7e13_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1309_c2_f5f8_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1309_c2_f5f8_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1309_c2_f5f8_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1309_c2_f5f8_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1315_c7_7e13_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1309_c2_f5f8_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1309_c2_f5f8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1309_c2_f5f8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1309_c2_f5f8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1315_c7_7e13_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1309_c2_f5f8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1309_c2_f5f8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1309_c2_f5f8_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1309_c2_f5f8_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1315_c7_7e13_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1309_c2_f5f8_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1309_c2_f5f8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1309_c2_f5f8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1309_c2_f5f8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1315_c7_7e13_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1309_c2_f5f8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1309_c2_f5f8_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1309_c2_f5f8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1309_c2_f5f8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1315_c7_7e13_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1309_c2_f5f8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1309_c2_f5f8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1309_c2_f5f8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1309_c2_f5f8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1315_c7_7e13_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1309_c2_f5f8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1309_c2_f5f8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1309_c2_f5f8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1309_c2_f5f8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1315_c7_7e13_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1309_c2_f5f8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1309_c2_f5f8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1309_c2_f5f8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1312_c3_b6b2 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1309_c2_f5f8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1315_c7_7e13_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1309_c2_f5f8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1309_c2_f5f8_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1310_c3_e1f7_uxn_opcodes_h_l1310_c3_e1f7_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1315_c11_ab9b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1315_c11_ab9b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1315_c11_ab9b_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1315_c7_7e13_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1315_c7_7e13_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1318_c7_f51d_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1315_c7_7e13_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1315_c7_7e13_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1315_c7_7e13_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1318_c7_f51d_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1315_c7_7e13_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1315_c7_7e13_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1315_c7_7e13_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1318_c7_f51d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1315_c7_7e13_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1315_c7_7e13_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1315_c7_7e13_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1318_c7_f51d_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1315_c7_7e13_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1315_c7_7e13_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1315_c7_7e13_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1318_c7_f51d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1315_c7_7e13_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1315_c7_7e13_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1315_c7_7e13_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1318_c7_f51d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1315_c7_7e13_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1315_c7_7e13_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1315_c7_7e13_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1318_c7_f51d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1315_c7_7e13_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1315_c7_7e13_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1315_c7_7e13_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1318_c7_f51d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1315_c7_7e13_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1315_c7_7e13_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1316_c3_7f85 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1315_c7_7e13_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1318_c7_f51d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1315_c7_7e13_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1318_c11_260d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1318_c11_260d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1318_c11_260d_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1318_c7_f51d_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1318_c7_f51d_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1318_c7_f51d_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1318_c7_f51d_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1318_c7_f51d_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1322_c7_34ee_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1318_c7_f51d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1318_c7_f51d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1318_c7_f51d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1322_c7_34ee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1318_c7_f51d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1318_c7_f51d_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1318_c7_f51d_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1322_c7_34ee_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1318_c7_f51d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1318_c7_f51d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1318_c7_f51d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1322_c7_34ee_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1318_c7_f51d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1318_c7_f51d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1318_c7_f51d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1322_c7_34ee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1318_c7_f51d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1318_c7_f51d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1318_c7_f51d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1322_c7_34ee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1318_c7_f51d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1318_c7_f51d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1318_c7_f51d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1322_c7_34ee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1318_c7_f51d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1318_c7_f51d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1320_c3_42ab : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1318_c7_f51d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1322_c7_34ee_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1318_c7_f51d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1322_c11_020c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1322_c11_020c_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1322_c11_020c_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1322_c7_34ee_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1322_c7_34ee_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1325_c7_8f49_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1322_c7_34ee_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1322_c7_34ee_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1322_c7_34ee_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1325_c7_8f49_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1322_c7_34ee_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1322_c7_34ee_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1322_c7_34ee_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1325_c7_8f49_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1322_c7_34ee_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1322_c7_34ee_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1322_c7_34ee_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1325_c7_8f49_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1322_c7_34ee_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1322_c7_34ee_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1322_c7_34ee_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1325_c7_8f49_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1322_c7_34ee_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1322_c7_34ee_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1322_c7_34ee_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1325_c7_8f49_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1322_c7_34ee_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1322_c7_34ee_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1322_c7_34ee_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1325_c7_8f49_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1322_c7_34ee_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1322_c7_34ee_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1323_c3_066a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1322_c7_34ee_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1325_c7_8f49_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1322_c7_34ee_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1325_c11_3d10_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1325_c11_3d10_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1325_c11_3d10_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1325_c7_8f49_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1325_c7_8f49_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1325_c7_8f49_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1325_c7_8f49_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1325_c7_8f49_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1325_c7_8f49_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1325_c7_8f49_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1325_c7_8f49_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1325_c7_8f49_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1325_c7_8f49_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1325_c7_8f49_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1331_c7_529e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1325_c7_8f49_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1325_c7_8f49_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1325_c7_8f49_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1331_c7_529e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1325_c7_8f49_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1325_c7_8f49_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1325_c7_8f49_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1331_c7_529e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1325_c7_8f49_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1325_c7_8f49_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1325_c7_8f49_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1331_c7_529e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1325_c7_8f49_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1325_c7_8f49_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1325_c7_8f49_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1331_c7_529e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1325_c7_8f49_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1329_c32_e1b8_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1329_c32_e1b8_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1329_c32_e1b8_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1329_c32_af29_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1329_c32_af29_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1329_c32_af29_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1329_c32_9cd2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1329_c32_9cd2_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1329_c32_9cd2_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1329_c32_e1b8_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1331_c11_dc70_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1331_c11_dc70_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1331_c11_dc70_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1331_c7_529e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1331_c7_529e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1331_c7_529e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1331_c7_529e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1331_c7_529e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1331_c7_529e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1331_c7_529e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1331_c7_529e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1337_c7_137d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1331_c7_529e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1331_c7_529e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1331_c7_529e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1337_c7_137d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1331_c7_529e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1331_c7_529e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1334_c3_772c : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1331_c7_529e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1331_c7_529e_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1335_c24_ee45_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1335_c24_ee45_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1335_c24_ee45_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1335_c24_887a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1335_c24_887a_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1335_c24_887a_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1335_c24_ee45_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1337_c11_4e9e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1337_c11_4e9e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1337_c11_4e9e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1337_c7_137d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1337_c7_137d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1337_c7_137d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1337_c7_137d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1337_c7_137d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1337_c7_137d_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1325_l1322_l1318_l1315_l1309_DUPLICATE_5be4_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1331_l1325_l1322_l1318_l1315_l1309_DUPLICATE_222e_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1331_l1322_l1318_l1315_l1309_DUPLICATE_5768_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1337_l1325_l1322_l1318_l1315_l1309_DUPLICATE_acea_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1315_l1325_l1318_l1322_DUPLICATE_bf88_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1337_l1331_l1325_l1322_l1318_l1315_DUPLICATE_e085_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1325_l1331_DUPLICATE_6af8_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l1342_l1305_DUPLICATE_27e9_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_n8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_n8 := n8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1312_c3_b6b2 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1309_c2_f5f8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1312_c3_b6b2;
     VAR_MUX_uxn_opcodes_h_l1335_c24_ee45_iftrue := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1323_c3_066a := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1322_c7_34ee_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1323_c3_066a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1309_c6_d303_right := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l1329_c32_9cd2_right := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1331_c7_529e_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1318_c11_260d_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1337_c7_137d_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1325_c7_8f49_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1309_c2_f5f8_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1309_c1_c97f_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1334_c3_772c := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1331_c7_529e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1334_c3_772c;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1315_c11_ab9b_right := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l1335_c24_ee45_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1337_c7_137d_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1331_c7_529e_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1325_c7_8f49_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1309_c2_f5f8_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1329_c32_e1b8_iffalse := resize(to_signed(-1, 2), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1320_c3_42ab := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1318_c7_f51d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1320_c3_42ab;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1325_c11_3d10_right := to_unsigned(4, 3);
     VAR_MUX_uxn_opcodes_h_l1329_c32_e1b8_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1322_c11_020c_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1316_c3_7f85 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1315_c7_7e13_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1316_c3_7f85;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1329_c32_af29_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1331_c11_dc70_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1337_c11_4e9e_right := to_unsigned(6, 3);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1309_c1_c97f_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1329_c32_af29_left := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1335_c24_887a_left := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1309_c2_f5f8_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1315_c7_7e13_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1318_c7_f51d_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1322_c7_34ee_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1325_c7_8f49_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1309_c6_d303_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1315_c11_ab9b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1318_c11_260d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1322_c11_020c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1325_c11_3d10_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1331_c11_dc70_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1337_c11_4e9e_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l1325_c7_8f49_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1318_c7_f51d_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1335_c24_887a_right := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1309_c2_f5f8_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1315_c7_7e13_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1318_c7_f51d_iffalse := t8;
     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1325_l1322_l1318_l1315_l1309_DUPLICATE_5be4 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1325_l1322_l1318_l1315_l1309_DUPLICATE_5be4_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1315_c11_ab9b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1315_c11_ab9b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1315_c11_ab9b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1315_c11_ab9b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1315_c11_ab9b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1315_c11_ab9b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1315_c11_ab9b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1318_c11_260d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1318_c11_260d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1318_c11_260d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1318_c11_260d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1318_c11_260d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1318_c11_260d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1318_c11_260d_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1315_l1325_l1318_l1322_DUPLICATE_bf88 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1315_l1325_l1318_l1322_DUPLICATE_bf88_return_output := result.is_stack_read;

     -- BIN_OP_AND[uxn_opcodes_h_l1329_c32_af29] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1329_c32_af29_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1329_c32_af29_left;
     BIN_OP_AND_uxn_opcodes_h_l1329_c32_af29_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1329_c32_af29_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1329_c32_af29_return_output := BIN_OP_AND_uxn_opcodes_h_l1329_c32_af29_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1331_c11_dc70] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1331_c11_dc70_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1331_c11_dc70_left;
     BIN_OP_EQ_uxn_opcodes_h_l1331_c11_dc70_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1331_c11_dc70_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1331_c11_dc70_return_output := BIN_OP_EQ_uxn_opcodes_h_l1331_c11_dc70_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1337_c11_4e9e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1337_c11_4e9e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1337_c11_4e9e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1337_c11_4e9e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1337_c11_4e9e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1337_c11_4e9e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1337_c11_4e9e_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1337_l1325_l1322_l1318_l1315_l1309_DUPLICATE_acea LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1337_l1325_l1322_l1318_l1315_l1309_DUPLICATE_acea_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1322_c11_020c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1322_c11_020c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1322_c11_020c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1322_c11_020c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1322_c11_020c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1322_c11_020c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1322_c11_020c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1309_c6_d303] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1309_c6_d303_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1309_c6_d303_left;
     BIN_OP_EQ_uxn_opcodes_h_l1309_c6_d303_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1309_c6_d303_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1309_c6_d303_return_output := BIN_OP_EQ_uxn_opcodes_h_l1309_c6_d303_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1335_c24_887a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1335_c24_887a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1335_c24_887a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1335_c24_887a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1335_c24_887a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1335_c24_887a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1335_c24_887a_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1325_l1331_DUPLICATE_6af8 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1325_l1331_DUPLICATE_6af8_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1331_l1325_l1322_l1318_l1315_l1309_DUPLICATE_222e LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1331_l1325_l1322_l1318_l1315_l1309_DUPLICATE_222e_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1325_c11_3d10] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1325_c11_3d10_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1325_c11_3d10_left;
     BIN_OP_EQ_uxn_opcodes_h_l1325_c11_3d10_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1325_c11_3d10_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1325_c11_3d10_return_output := BIN_OP_EQ_uxn_opcodes_h_l1325_c11_3d10_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1337_l1331_l1325_l1322_l1318_l1315_DUPLICATE_e085 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1337_l1331_l1325_l1322_l1318_l1315_DUPLICATE_e085_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1331_l1322_l1318_l1315_l1309_DUPLICATE_5768 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1331_l1322_l1318_l1315_l1309_DUPLICATE_5768_return_output := result.is_sp_shift;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1329_c32_9cd2_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1329_c32_af29_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1309_c1_c97f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1309_c6_d303_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1309_c2_f5f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1309_c6_d303_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1309_c2_f5f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1309_c6_d303_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1309_c2_f5f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1309_c6_d303_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1309_c2_f5f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1309_c6_d303_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1309_c2_f5f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1309_c6_d303_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1309_c2_f5f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1309_c6_d303_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1309_c2_f5f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1309_c6_d303_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1309_c2_f5f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1309_c6_d303_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1309_c2_f5f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1309_c6_d303_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1315_c7_7e13_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1315_c11_ab9b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1315_c7_7e13_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1315_c11_ab9b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1315_c7_7e13_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1315_c11_ab9b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1315_c7_7e13_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1315_c11_ab9b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1315_c7_7e13_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1315_c11_ab9b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1315_c7_7e13_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1315_c11_ab9b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1315_c7_7e13_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1315_c11_ab9b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1315_c7_7e13_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1315_c11_ab9b_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1315_c7_7e13_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1315_c11_ab9b_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1318_c7_f51d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1318_c11_260d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1318_c7_f51d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1318_c11_260d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1318_c7_f51d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1318_c11_260d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1318_c7_f51d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1318_c11_260d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1318_c7_f51d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1318_c11_260d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1318_c7_f51d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1318_c11_260d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1318_c7_f51d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1318_c11_260d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1318_c7_f51d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1318_c11_260d_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1318_c7_f51d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1318_c11_260d_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1322_c7_34ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1322_c11_020c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1322_c7_34ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1322_c11_020c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1322_c7_34ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1322_c11_020c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1322_c7_34ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1322_c11_020c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1322_c7_34ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1322_c11_020c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1322_c7_34ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1322_c11_020c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1322_c7_34ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1322_c11_020c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1322_c7_34ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1322_c11_020c_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1325_c7_8f49_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1325_c11_3d10_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1325_c7_8f49_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1325_c11_3d10_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1325_c7_8f49_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1325_c11_3d10_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1325_c7_8f49_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1325_c11_3d10_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1325_c7_8f49_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1325_c11_3d10_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1325_c7_8f49_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1325_c11_3d10_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1325_c7_8f49_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1325_c11_3d10_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1325_c7_8f49_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1325_c11_3d10_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1331_c7_529e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1331_c11_dc70_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1331_c7_529e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1331_c11_dc70_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1331_c7_529e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1331_c11_dc70_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1331_c7_529e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1331_c11_dc70_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1331_c7_529e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1331_c11_dc70_return_output;
     VAR_MUX_uxn_opcodes_h_l1335_c24_ee45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1335_c24_887a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1337_c7_137d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1337_c11_4e9e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1337_c7_137d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1337_c11_4e9e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1309_c2_f5f8_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1325_l1322_l1318_l1315_l1309_DUPLICATE_5be4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1315_c7_7e13_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1325_l1322_l1318_l1315_l1309_DUPLICATE_5be4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1318_c7_f51d_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1325_l1322_l1318_l1315_l1309_DUPLICATE_5be4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1322_c7_34ee_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1325_l1322_l1318_l1315_l1309_DUPLICATE_5be4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1325_c7_8f49_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1325_l1322_l1318_l1315_l1309_DUPLICATE_5be4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1315_c7_7e13_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1337_l1331_l1325_l1322_l1318_l1315_DUPLICATE_e085_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1318_c7_f51d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1337_l1331_l1325_l1322_l1318_l1315_DUPLICATE_e085_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1322_c7_34ee_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1337_l1331_l1325_l1322_l1318_l1315_DUPLICATE_e085_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1325_c7_8f49_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1337_l1331_l1325_l1322_l1318_l1315_DUPLICATE_e085_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1331_c7_529e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1337_l1331_l1325_l1322_l1318_l1315_DUPLICATE_e085_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1337_c7_137d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1337_l1331_l1325_l1322_l1318_l1315_DUPLICATE_e085_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1309_c2_f5f8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1331_l1322_l1318_l1315_l1309_DUPLICATE_5768_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1315_c7_7e13_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1331_l1322_l1318_l1315_l1309_DUPLICATE_5768_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1318_c7_f51d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1331_l1322_l1318_l1315_l1309_DUPLICATE_5768_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1322_c7_34ee_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1331_l1322_l1318_l1315_l1309_DUPLICATE_5768_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1331_c7_529e_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1331_l1322_l1318_l1315_l1309_DUPLICATE_5768_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1315_c7_7e13_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1315_l1325_l1318_l1322_DUPLICATE_bf88_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1318_c7_f51d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1315_l1325_l1318_l1322_DUPLICATE_bf88_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1322_c7_34ee_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1315_l1325_l1318_l1322_DUPLICATE_bf88_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1325_c7_8f49_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1315_l1325_l1318_l1322_DUPLICATE_bf88_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1309_c2_f5f8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1337_l1325_l1322_l1318_l1315_l1309_DUPLICATE_acea_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1315_c7_7e13_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1337_l1325_l1322_l1318_l1315_l1309_DUPLICATE_acea_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1318_c7_f51d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1337_l1325_l1322_l1318_l1315_l1309_DUPLICATE_acea_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1322_c7_34ee_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1337_l1325_l1322_l1318_l1315_l1309_DUPLICATE_acea_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1325_c7_8f49_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1337_l1325_l1322_l1318_l1315_l1309_DUPLICATE_acea_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1337_c7_137d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1337_l1325_l1322_l1318_l1315_l1309_DUPLICATE_acea_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1325_c7_8f49_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1325_l1331_DUPLICATE_6af8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1331_c7_529e_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1325_l1331_DUPLICATE_6af8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1309_c2_f5f8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1331_l1325_l1322_l1318_l1315_l1309_DUPLICATE_222e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1315_c7_7e13_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1331_l1325_l1322_l1318_l1315_l1309_DUPLICATE_222e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1318_c7_f51d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1331_l1325_l1322_l1318_l1315_l1309_DUPLICATE_222e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1322_c7_34ee_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1331_l1325_l1322_l1318_l1315_l1309_DUPLICATE_222e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1325_c7_8f49_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1331_l1325_l1322_l1318_l1315_l1309_DUPLICATE_222e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1331_c7_529e_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1331_l1325_l1322_l1318_l1315_l1309_DUPLICATE_222e_return_output;
     -- t8_MUX[uxn_opcodes_h_l1318_c7_f51d] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1318_c7_f51d_cond <= VAR_t8_MUX_uxn_opcodes_h_l1318_c7_f51d_cond;
     t8_MUX_uxn_opcodes_h_l1318_c7_f51d_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1318_c7_f51d_iftrue;
     t8_MUX_uxn_opcodes_h_l1318_c7_f51d_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1318_c7_f51d_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1318_c7_f51d_return_output := t8_MUX_uxn_opcodes_h_l1318_c7_f51d_return_output;

     -- n8_MUX[uxn_opcodes_h_l1325_c7_8f49] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1325_c7_8f49_cond <= VAR_n8_MUX_uxn_opcodes_h_l1325_c7_8f49_cond;
     n8_MUX_uxn_opcodes_h_l1325_c7_8f49_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1325_c7_8f49_iftrue;
     n8_MUX_uxn_opcodes_h_l1325_c7_8f49_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1325_c7_8f49_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1325_c7_8f49_return_output := n8_MUX_uxn_opcodes_h_l1325_c7_8f49_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1331_c7_529e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1331_c7_529e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1331_c7_529e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1331_c7_529e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1331_c7_529e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1331_c7_529e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1331_c7_529e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1331_c7_529e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1331_c7_529e_return_output;

     -- MUX[uxn_opcodes_h_l1335_c24_ee45] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1335_c24_ee45_cond <= VAR_MUX_uxn_opcodes_h_l1335_c24_ee45_cond;
     MUX_uxn_opcodes_h_l1335_c24_ee45_iftrue <= VAR_MUX_uxn_opcodes_h_l1335_c24_ee45_iftrue;
     MUX_uxn_opcodes_h_l1335_c24_ee45_iffalse <= VAR_MUX_uxn_opcodes_h_l1335_c24_ee45_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1335_c24_ee45_return_output := MUX_uxn_opcodes_h_l1335_c24_ee45_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1309_c1_c97f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1309_c1_c97f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1309_c1_c97f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1309_c1_c97f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1309_c1_c97f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1309_c1_c97f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1309_c1_c97f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1309_c1_c97f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1309_c1_c97f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1337_c7_137d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1337_c7_137d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1337_c7_137d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1337_c7_137d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1337_c7_137d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1337_c7_137d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1337_c7_137d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1337_c7_137d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1337_c7_137d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1331_c7_529e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1331_c7_529e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1331_c7_529e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1331_c7_529e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1331_c7_529e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1331_c7_529e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1331_c7_529e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1331_c7_529e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1331_c7_529e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1337_c7_137d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1337_c7_137d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1337_c7_137d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1337_c7_137d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1337_c7_137d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1337_c7_137d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1337_c7_137d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1337_c7_137d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1337_c7_137d_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1329_c32_9cd2] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1329_c32_9cd2_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1329_c32_9cd2_left;
     BIN_OP_GT_uxn_opcodes_h_l1329_c32_9cd2_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1329_c32_9cd2_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1329_c32_9cd2_return_output := BIN_OP_GT_uxn_opcodes_h_l1329_c32_9cd2_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1325_c7_8f49] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1325_c7_8f49_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1325_c7_8f49_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1325_c7_8f49_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1325_c7_8f49_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1325_c7_8f49_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1325_c7_8f49_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1325_c7_8f49_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1325_c7_8f49_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1329_c32_e1b8_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1329_c32_9cd2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1331_c7_529e_iftrue := VAR_MUX_uxn_opcodes_h_l1335_c24_ee45_return_output;
     VAR_printf_uxn_opcodes_h_l1310_c3_e1f7_uxn_opcodes_h_l1310_c3_e1f7_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1309_c1_c97f_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1322_c7_34ee_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1325_c7_8f49_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1331_c7_529e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1337_c7_137d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1325_c7_8f49_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1331_c7_529e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1322_c7_34ee_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1325_c7_8f49_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1331_c7_529e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1337_c7_137d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1325_c7_8f49_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1331_c7_529e_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1315_c7_7e13_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1318_c7_f51d_return_output;
     -- n8_MUX[uxn_opcodes_h_l1322_c7_34ee] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1322_c7_34ee_cond <= VAR_n8_MUX_uxn_opcodes_h_l1322_c7_34ee_cond;
     n8_MUX_uxn_opcodes_h_l1322_c7_34ee_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1322_c7_34ee_iftrue;
     n8_MUX_uxn_opcodes_h_l1322_c7_34ee_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1322_c7_34ee_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1322_c7_34ee_return_output := n8_MUX_uxn_opcodes_h_l1322_c7_34ee_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1331_c7_529e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1331_c7_529e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1331_c7_529e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1331_c7_529e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1331_c7_529e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1331_c7_529e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1331_c7_529e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1331_c7_529e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1331_c7_529e_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1331_c7_529e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1331_c7_529e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1331_c7_529e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1331_c7_529e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1331_c7_529e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1331_c7_529e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1331_c7_529e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1331_c7_529e_return_output := result_stack_value_MUX_uxn_opcodes_h_l1331_c7_529e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1325_c7_8f49] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1325_c7_8f49_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1325_c7_8f49_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1325_c7_8f49_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1325_c7_8f49_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1325_c7_8f49_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1325_c7_8f49_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1325_c7_8f49_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1325_c7_8f49_return_output;

     -- printf_uxn_opcodes_h_l1310_c3_e1f7[uxn_opcodes_h_l1310_c3_e1f7] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1310_c3_e1f7_uxn_opcodes_h_l1310_c3_e1f7_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1310_c3_e1f7_uxn_opcodes_h_l1310_c3_e1f7_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1331_c7_529e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1331_c7_529e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1331_c7_529e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1331_c7_529e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1331_c7_529e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1331_c7_529e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1331_c7_529e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1331_c7_529e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1331_c7_529e_return_output;

     -- t8_MUX[uxn_opcodes_h_l1315_c7_7e13] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1315_c7_7e13_cond <= VAR_t8_MUX_uxn_opcodes_h_l1315_c7_7e13_cond;
     t8_MUX_uxn_opcodes_h_l1315_c7_7e13_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1315_c7_7e13_iftrue;
     t8_MUX_uxn_opcodes_h_l1315_c7_7e13_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1315_c7_7e13_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1315_c7_7e13_return_output := t8_MUX_uxn_opcodes_h_l1315_c7_7e13_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1325_c7_8f49] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1325_c7_8f49_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1325_c7_8f49_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1325_c7_8f49_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1325_c7_8f49_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1325_c7_8f49_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1325_c7_8f49_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1325_c7_8f49_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1325_c7_8f49_return_output;

     -- MUX[uxn_opcodes_h_l1329_c32_e1b8] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1329_c32_e1b8_cond <= VAR_MUX_uxn_opcodes_h_l1329_c32_e1b8_cond;
     MUX_uxn_opcodes_h_l1329_c32_e1b8_iftrue <= VAR_MUX_uxn_opcodes_h_l1329_c32_e1b8_iftrue;
     MUX_uxn_opcodes_h_l1329_c32_e1b8_iffalse <= VAR_MUX_uxn_opcodes_h_l1329_c32_e1b8_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1329_c32_e1b8_return_output := MUX_uxn_opcodes_h_l1329_c32_e1b8_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1322_c7_34ee] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1322_c7_34ee_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1322_c7_34ee_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1322_c7_34ee_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1322_c7_34ee_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1322_c7_34ee_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1322_c7_34ee_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1322_c7_34ee_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1322_c7_34ee_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1325_c7_8f49_iftrue := VAR_MUX_uxn_opcodes_h_l1329_c32_e1b8_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1318_c7_f51d_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1322_c7_34ee_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1325_c7_8f49_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1331_c7_529e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1322_c7_34ee_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1325_c7_8f49_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1318_c7_f51d_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1322_c7_34ee_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1325_c7_8f49_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1331_c7_529e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1322_c7_34ee_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1325_c7_8f49_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1325_c7_8f49_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1331_c7_529e_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1309_c2_f5f8_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1315_c7_7e13_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1322_c7_34ee] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1322_c7_34ee_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1322_c7_34ee_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1322_c7_34ee_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1322_c7_34ee_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1322_c7_34ee_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1322_c7_34ee_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1322_c7_34ee_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1322_c7_34ee_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1325_c7_8f49] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1325_c7_8f49_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1325_c7_8f49_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1325_c7_8f49_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1325_c7_8f49_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1325_c7_8f49_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1325_c7_8f49_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1325_c7_8f49_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1325_c7_8f49_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1325_c7_8f49] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1325_c7_8f49_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1325_c7_8f49_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1325_c7_8f49_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1325_c7_8f49_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1325_c7_8f49_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1325_c7_8f49_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1325_c7_8f49_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1325_c7_8f49_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1318_c7_f51d] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1318_c7_f51d_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1318_c7_f51d_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1318_c7_f51d_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1318_c7_f51d_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1318_c7_f51d_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1318_c7_f51d_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1318_c7_f51d_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1318_c7_f51d_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1325_c7_8f49] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1325_c7_8f49_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1325_c7_8f49_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1325_c7_8f49_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1325_c7_8f49_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1325_c7_8f49_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1325_c7_8f49_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1325_c7_8f49_return_output := result_stack_value_MUX_uxn_opcodes_h_l1325_c7_8f49_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1322_c7_34ee] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1322_c7_34ee_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1322_c7_34ee_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1322_c7_34ee_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1322_c7_34ee_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1322_c7_34ee_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1322_c7_34ee_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1322_c7_34ee_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1322_c7_34ee_return_output;

     -- n8_MUX[uxn_opcodes_h_l1318_c7_f51d] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1318_c7_f51d_cond <= VAR_n8_MUX_uxn_opcodes_h_l1318_c7_f51d_cond;
     n8_MUX_uxn_opcodes_h_l1318_c7_f51d_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1318_c7_f51d_iftrue;
     n8_MUX_uxn_opcodes_h_l1318_c7_f51d_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1318_c7_f51d_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1318_c7_f51d_return_output := n8_MUX_uxn_opcodes_h_l1318_c7_f51d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1325_c7_8f49] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1325_c7_8f49_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1325_c7_8f49_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1325_c7_8f49_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1325_c7_8f49_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1325_c7_8f49_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1325_c7_8f49_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1325_c7_8f49_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1325_c7_8f49_return_output;

     -- t8_MUX[uxn_opcodes_h_l1309_c2_f5f8] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1309_c2_f5f8_cond <= VAR_t8_MUX_uxn_opcodes_h_l1309_c2_f5f8_cond;
     t8_MUX_uxn_opcodes_h_l1309_c2_f5f8_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1309_c2_f5f8_iftrue;
     t8_MUX_uxn_opcodes_h_l1309_c2_f5f8_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1309_c2_f5f8_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1309_c2_f5f8_return_output := t8_MUX_uxn_opcodes_h_l1309_c2_f5f8_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l1315_c7_7e13_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1318_c7_f51d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1322_c7_34ee_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1325_c7_8f49_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1318_c7_f51d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1322_c7_34ee_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1315_c7_7e13_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1318_c7_f51d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1322_c7_34ee_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1325_c7_8f49_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1322_c7_34ee_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1325_c7_8f49_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1318_c7_f51d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1322_c7_34ee_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1322_c7_34ee_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1325_c7_8f49_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1309_c2_f5f8_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1322_c7_34ee] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1322_c7_34ee_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1322_c7_34ee_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1322_c7_34ee_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1322_c7_34ee_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1322_c7_34ee_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1322_c7_34ee_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1322_c7_34ee_return_output := result_stack_value_MUX_uxn_opcodes_h_l1322_c7_34ee_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1318_c7_f51d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1318_c7_f51d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1318_c7_f51d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1318_c7_f51d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1318_c7_f51d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1318_c7_f51d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1318_c7_f51d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1318_c7_f51d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1318_c7_f51d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1318_c7_f51d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1318_c7_f51d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1318_c7_f51d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1318_c7_f51d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1318_c7_f51d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1318_c7_f51d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1318_c7_f51d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1318_c7_f51d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1318_c7_f51d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1322_c7_34ee] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1322_c7_34ee_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1322_c7_34ee_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1322_c7_34ee_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1322_c7_34ee_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1322_c7_34ee_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1322_c7_34ee_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1322_c7_34ee_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1322_c7_34ee_return_output;

     -- n8_MUX[uxn_opcodes_h_l1315_c7_7e13] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1315_c7_7e13_cond <= VAR_n8_MUX_uxn_opcodes_h_l1315_c7_7e13_cond;
     n8_MUX_uxn_opcodes_h_l1315_c7_7e13_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1315_c7_7e13_iftrue;
     n8_MUX_uxn_opcodes_h_l1315_c7_7e13_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1315_c7_7e13_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1315_c7_7e13_return_output := n8_MUX_uxn_opcodes_h_l1315_c7_7e13_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1315_c7_7e13] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1315_c7_7e13_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1315_c7_7e13_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1315_c7_7e13_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1315_c7_7e13_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1315_c7_7e13_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1315_c7_7e13_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1315_c7_7e13_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1315_c7_7e13_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1322_c7_34ee] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1322_c7_34ee_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1322_c7_34ee_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1322_c7_34ee_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1322_c7_34ee_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1322_c7_34ee_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1322_c7_34ee_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1322_c7_34ee_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1322_c7_34ee_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1322_c7_34ee] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1322_c7_34ee_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1322_c7_34ee_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1322_c7_34ee_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1322_c7_34ee_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1322_c7_34ee_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1322_c7_34ee_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1322_c7_34ee_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1322_c7_34ee_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l1309_c2_f5f8_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1315_c7_7e13_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1318_c7_f51d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1322_c7_34ee_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1315_c7_7e13_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1318_c7_f51d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1309_c2_f5f8_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1315_c7_7e13_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1318_c7_f51d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1322_c7_34ee_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1318_c7_f51d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1322_c7_34ee_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1315_c7_7e13_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1318_c7_f51d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1318_c7_f51d_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1322_c7_34ee_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1318_c7_f51d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1318_c7_f51d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1318_c7_f51d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1318_c7_f51d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1318_c7_f51d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1318_c7_f51d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1318_c7_f51d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1318_c7_f51d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1318_c7_f51d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1318_c7_f51d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1318_c7_f51d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1318_c7_f51d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1318_c7_f51d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1318_c7_f51d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1318_c7_f51d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1318_c7_f51d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1318_c7_f51d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1318_c7_f51d_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1318_c7_f51d] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1318_c7_f51d_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1318_c7_f51d_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1318_c7_f51d_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1318_c7_f51d_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1318_c7_f51d_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1318_c7_f51d_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1318_c7_f51d_return_output := result_stack_value_MUX_uxn_opcodes_h_l1318_c7_f51d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1315_c7_7e13] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1315_c7_7e13_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1315_c7_7e13_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1315_c7_7e13_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1315_c7_7e13_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1315_c7_7e13_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1315_c7_7e13_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1315_c7_7e13_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1315_c7_7e13_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1309_c2_f5f8] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1309_c2_f5f8_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1309_c2_f5f8_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1309_c2_f5f8_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1309_c2_f5f8_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1309_c2_f5f8_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1309_c2_f5f8_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1309_c2_f5f8_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1309_c2_f5f8_return_output;

     -- n8_MUX[uxn_opcodes_h_l1309_c2_f5f8] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1309_c2_f5f8_cond <= VAR_n8_MUX_uxn_opcodes_h_l1309_c2_f5f8_cond;
     n8_MUX_uxn_opcodes_h_l1309_c2_f5f8_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1309_c2_f5f8_iftrue;
     n8_MUX_uxn_opcodes_h_l1309_c2_f5f8_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1309_c2_f5f8_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1309_c2_f5f8_return_output := n8_MUX_uxn_opcodes_h_l1309_c2_f5f8_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1318_c7_f51d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1318_c7_f51d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1318_c7_f51d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1318_c7_f51d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1318_c7_f51d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1318_c7_f51d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1318_c7_f51d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1318_c7_f51d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1318_c7_f51d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1315_c7_7e13] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1315_c7_7e13_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1315_c7_7e13_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1315_c7_7e13_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1315_c7_7e13_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1315_c7_7e13_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1315_c7_7e13_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1315_c7_7e13_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1315_c7_7e13_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l1309_c2_f5f8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1315_c7_7e13_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1318_c7_f51d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1309_c2_f5f8_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1315_c7_7e13_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1315_c7_7e13_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1318_c7_f51d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1315_c7_7e13_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1318_c7_f51d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1309_c2_f5f8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1315_c7_7e13_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1315_c7_7e13_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1318_c7_f51d_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1315_c7_7e13] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1315_c7_7e13_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1315_c7_7e13_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1315_c7_7e13_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1315_c7_7e13_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1315_c7_7e13_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1315_c7_7e13_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1315_c7_7e13_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1315_c7_7e13_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1309_c2_f5f8] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1309_c2_f5f8_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1309_c2_f5f8_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1309_c2_f5f8_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1309_c2_f5f8_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1309_c2_f5f8_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1309_c2_f5f8_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1309_c2_f5f8_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1309_c2_f5f8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1309_c2_f5f8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1309_c2_f5f8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1309_c2_f5f8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1309_c2_f5f8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1309_c2_f5f8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1309_c2_f5f8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1309_c2_f5f8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1309_c2_f5f8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1309_c2_f5f8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1315_c7_7e13] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1315_c7_7e13_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1315_c7_7e13_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1315_c7_7e13_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1315_c7_7e13_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1315_c7_7e13_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1315_c7_7e13_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1315_c7_7e13_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1315_c7_7e13_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1315_c7_7e13] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1315_c7_7e13_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1315_c7_7e13_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1315_c7_7e13_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1315_c7_7e13_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1315_c7_7e13_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1315_c7_7e13_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1315_c7_7e13_return_output := result_stack_value_MUX_uxn_opcodes_h_l1315_c7_7e13_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1315_c7_7e13] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1315_c7_7e13_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1315_c7_7e13_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1315_c7_7e13_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1315_c7_7e13_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1315_c7_7e13_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1315_c7_7e13_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1315_c7_7e13_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1315_c7_7e13_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1309_c2_f5f8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1315_c7_7e13_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1309_c2_f5f8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1315_c7_7e13_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1309_c2_f5f8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1315_c7_7e13_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1309_c2_f5f8_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1315_c7_7e13_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1309_c2_f5f8] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1309_c2_f5f8_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1309_c2_f5f8_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1309_c2_f5f8_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1309_c2_f5f8_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1309_c2_f5f8_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1309_c2_f5f8_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1309_c2_f5f8_return_output := result_stack_value_MUX_uxn_opcodes_h_l1309_c2_f5f8_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1309_c2_f5f8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1309_c2_f5f8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1309_c2_f5f8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1309_c2_f5f8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1309_c2_f5f8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1309_c2_f5f8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1309_c2_f5f8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1309_c2_f5f8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1309_c2_f5f8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1309_c2_f5f8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1309_c2_f5f8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1309_c2_f5f8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1309_c2_f5f8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1309_c2_f5f8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1309_c2_f5f8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1309_c2_f5f8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1309_c2_f5f8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1309_c2_f5f8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1309_c2_f5f8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1309_c2_f5f8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1309_c2_f5f8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1309_c2_f5f8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1309_c2_f5f8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1309_c2_f5f8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1309_c2_f5f8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1309_c2_f5f8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1309_c2_f5f8_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l1342_l1305_DUPLICATE_27e9 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l1342_l1305_DUPLICATE_27e9_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3(
     result,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1309_c2_f5f8_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1309_c2_f5f8_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1309_c2_f5f8_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1309_c2_f5f8_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1309_c2_f5f8_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1309_c2_f5f8_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1309_c2_f5f8_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l1342_l1305_DUPLICATE_27e9_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l1342_l1305_DUPLICATE_27e9_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_n8 <= REG_VAR_n8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     n8 <= REG_COMB_n8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
