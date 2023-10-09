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
-- Submodules: 81
entity dup2_0CLK_8f02dccf is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end dup2_0CLK_8f02dccf;
architecture arch of dup2_0CLK_8f02dccf is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l3214_c6_005a]
signal BIN_OP_EQ_uxn_opcodes_h_l3214_c6_005a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3214_c6_005a_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3214_c6_005a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3214_c1_9b99]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3214_c1_9b99_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3214_c1_9b99_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3214_c1_9b99_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3214_c1_9b99_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l3214_c2_7dc6]
signal t16_MUX_uxn_opcodes_h_l3214_c2_7dc6_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l3214_c2_7dc6_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l3214_c2_7dc6_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l3214_c2_7dc6_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l3214_c2_7dc6]
signal result_is_stack_read_MUX_uxn_opcodes_h_l3214_c2_7dc6_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3214_c2_7dc6_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3214_c2_7dc6_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3214_c2_7dc6_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l3214_c2_7dc6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3214_c2_7dc6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3214_c2_7dc6_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3214_c2_7dc6_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3214_c2_7dc6_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3214_c2_7dc6]
signal result_stack_value_MUX_uxn_opcodes_h_l3214_c2_7dc6_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3214_c2_7dc6_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3214_c2_7dc6_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3214_c2_7dc6_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l3214_c2_7dc6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3214_c2_7dc6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3214_c2_7dc6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3214_c2_7dc6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3214_c2_7dc6_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3214_c2_7dc6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3214_c2_7dc6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3214_c2_7dc6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3214_c2_7dc6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3214_c2_7dc6_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3214_c2_7dc6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3214_c2_7dc6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3214_c2_7dc6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3214_c2_7dc6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3214_c2_7dc6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3214_c2_7dc6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3214_c2_7dc6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3214_c2_7dc6_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3214_c2_7dc6_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3214_c2_7dc6_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l3215_c3_c459[uxn_opcodes_h_l3215_c3_c459]
signal printf_uxn_opcodes_h_l3215_c3_c459_uxn_opcodes_h_l3215_c3_c459_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3220_c11_e954]
signal BIN_OP_EQ_uxn_opcodes_h_l3220_c11_e954_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3220_c11_e954_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3220_c11_e954_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l3220_c7_6bf4]
signal t16_MUX_uxn_opcodes_h_l3220_c7_6bf4_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l3220_c7_6bf4_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l3220_c7_6bf4_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l3220_c7_6bf4_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l3220_c7_6bf4]
signal result_is_stack_read_MUX_uxn_opcodes_h_l3220_c7_6bf4_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3220_c7_6bf4_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3220_c7_6bf4_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3220_c7_6bf4_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l3220_c7_6bf4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3220_c7_6bf4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3220_c7_6bf4_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3220_c7_6bf4_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3220_c7_6bf4_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3220_c7_6bf4]
signal result_stack_value_MUX_uxn_opcodes_h_l3220_c7_6bf4_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3220_c7_6bf4_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3220_c7_6bf4_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3220_c7_6bf4_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l3220_c7_6bf4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3220_c7_6bf4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3220_c7_6bf4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3220_c7_6bf4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3220_c7_6bf4_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3220_c7_6bf4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3220_c7_6bf4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3220_c7_6bf4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3220_c7_6bf4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3220_c7_6bf4_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3220_c7_6bf4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3220_c7_6bf4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3220_c7_6bf4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3220_c7_6bf4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3220_c7_6bf4_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3220_c7_6bf4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3220_c7_6bf4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3220_c7_6bf4_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3220_c7_6bf4_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3220_c7_6bf4_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3223_c11_50f1]
signal BIN_OP_EQ_uxn_opcodes_h_l3223_c11_50f1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3223_c11_50f1_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3223_c11_50f1_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l3223_c7_1656]
signal t16_MUX_uxn_opcodes_h_l3223_c7_1656_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l3223_c7_1656_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l3223_c7_1656_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l3223_c7_1656_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l3223_c7_1656]
signal result_is_stack_read_MUX_uxn_opcodes_h_l3223_c7_1656_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3223_c7_1656_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3223_c7_1656_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3223_c7_1656_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l3223_c7_1656]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3223_c7_1656_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3223_c7_1656_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3223_c7_1656_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3223_c7_1656_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3223_c7_1656]
signal result_stack_value_MUX_uxn_opcodes_h_l3223_c7_1656_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3223_c7_1656_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3223_c7_1656_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3223_c7_1656_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l3223_c7_1656]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3223_c7_1656_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3223_c7_1656_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3223_c7_1656_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3223_c7_1656_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3223_c7_1656]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3223_c7_1656_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3223_c7_1656_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3223_c7_1656_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3223_c7_1656_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3223_c7_1656]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3223_c7_1656_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3223_c7_1656_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3223_c7_1656_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3223_c7_1656_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3223_c7_1656]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3223_c7_1656_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3223_c7_1656_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3223_c7_1656_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3223_c7_1656_return_output : unsigned(7 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l3225_c3_18df]
signal CONST_SL_8_uxn_opcodes_h_l3225_c3_18df_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l3225_c3_18df_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3228_c11_7dd4]
signal BIN_OP_EQ_uxn_opcodes_h_l3228_c11_7dd4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3228_c11_7dd4_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3228_c11_7dd4_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l3228_c7_9021]
signal t16_MUX_uxn_opcodes_h_l3228_c7_9021_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l3228_c7_9021_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l3228_c7_9021_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l3228_c7_9021_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l3228_c7_9021]
signal result_is_stack_read_MUX_uxn_opcodes_h_l3228_c7_9021_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3228_c7_9021_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3228_c7_9021_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3228_c7_9021_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l3228_c7_9021]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3228_c7_9021_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3228_c7_9021_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3228_c7_9021_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3228_c7_9021_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3228_c7_9021]
signal result_stack_value_MUX_uxn_opcodes_h_l3228_c7_9021_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3228_c7_9021_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3228_c7_9021_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3228_c7_9021_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l3228_c7_9021]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3228_c7_9021_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3228_c7_9021_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3228_c7_9021_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3228_c7_9021_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3228_c7_9021]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3228_c7_9021_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3228_c7_9021_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3228_c7_9021_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3228_c7_9021_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3228_c7_9021]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3228_c7_9021_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3228_c7_9021_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3228_c7_9021_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3228_c7_9021_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3228_c7_9021]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3228_c7_9021_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3228_c7_9021_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3228_c7_9021_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3228_c7_9021_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3231_c11_8ec5]
signal BIN_OP_EQ_uxn_opcodes_h_l3231_c11_8ec5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3231_c11_8ec5_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3231_c11_8ec5_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l3231_c7_fe31]
signal t16_MUX_uxn_opcodes_h_l3231_c7_fe31_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l3231_c7_fe31_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l3231_c7_fe31_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l3231_c7_fe31_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l3231_c7_fe31]
signal result_is_stack_read_MUX_uxn_opcodes_h_l3231_c7_fe31_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3231_c7_fe31_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3231_c7_fe31_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3231_c7_fe31_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l3231_c7_fe31]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3231_c7_fe31_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3231_c7_fe31_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3231_c7_fe31_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3231_c7_fe31_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3231_c7_fe31]
signal result_stack_value_MUX_uxn_opcodes_h_l3231_c7_fe31_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3231_c7_fe31_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3231_c7_fe31_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3231_c7_fe31_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l3231_c7_fe31]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3231_c7_fe31_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3231_c7_fe31_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3231_c7_fe31_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3231_c7_fe31_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3231_c7_fe31]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3231_c7_fe31_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3231_c7_fe31_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3231_c7_fe31_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3231_c7_fe31_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3231_c7_fe31]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3231_c7_fe31_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3231_c7_fe31_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3231_c7_fe31_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3231_c7_fe31_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3231_c7_fe31]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3231_c7_fe31_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3231_c7_fe31_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3231_c7_fe31_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3231_c7_fe31_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l3232_c3_f6d1]
signal BIN_OP_OR_uxn_opcodes_h_l3232_c3_f6d1_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l3232_c3_f6d1_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l3232_c3_f6d1_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l3235_c32_3515]
signal BIN_OP_AND_uxn_opcodes_h_l3235_c32_3515_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l3235_c32_3515_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l3235_c32_3515_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l3235_c32_ad71]
signal BIN_OP_GT_uxn_opcodes_h_l3235_c32_ad71_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l3235_c32_ad71_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l3235_c32_ad71_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l3235_c32_419c]
signal MUX_uxn_opcodes_h_l3235_c32_419c_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l3235_c32_419c_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l3235_c32_419c_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l3235_c32_419c_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3237_c11_96a7]
signal BIN_OP_EQ_uxn_opcodes_h_l3237_c11_96a7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3237_c11_96a7_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3237_c11_96a7_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l3237_c7_2a68]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3237_c7_2a68_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3237_c7_2a68_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3237_c7_2a68_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3237_c7_2a68_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3237_c7_2a68]
signal result_stack_value_MUX_uxn_opcodes_h_l3237_c7_2a68_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3237_c7_2a68_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3237_c7_2a68_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3237_c7_2a68_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3237_c7_2a68]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3237_c7_2a68_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3237_c7_2a68_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3237_c7_2a68_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3237_c7_2a68_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3237_c7_2a68]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3237_c7_2a68_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3237_c7_2a68_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3237_c7_2a68_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3237_c7_2a68_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3237_c7_2a68]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3237_c7_2a68_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3237_c7_2a68_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3237_c7_2a68_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3237_c7_2a68_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3243_c11_ad91]
signal BIN_OP_EQ_uxn_opcodes_h_l3243_c11_ad91_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3243_c11_ad91_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3243_c11_ad91_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3243_c7_efe1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3243_c7_efe1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3243_c7_efe1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3243_c7_efe1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3243_c7_efe1_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3243_c7_efe1]
signal result_stack_value_MUX_uxn_opcodes_h_l3243_c7_efe1_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3243_c7_efe1_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3243_c7_efe1_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3243_c7_efe1_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3243_c7_efe1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3243_c7_efe1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3243_c7_efe1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3243_c7_efe1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3243_c7_efe1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3243_c7_efe1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3243_c7_efe1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3243_c7_efe1_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3243_c7_efe1_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3243_c7_efe1_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3247_c11_394e]
signal BIN_OP_EQ_uxn_opcodes_h_l3247_c11_394e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3247_c11_394e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3247_c11_394e_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3247_c7_9e9f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3247_c7_9e9f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3247_c7_9e9f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3247_c7_9e9f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3247_c7_9e9f_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3247_c7_9e9f]
signal result_stack_value_MUX_uxn_opcodes_h_l3247_c7_9e9f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3247_c7_9e9f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3247_c7_9e9f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3247_c7_9e9f_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3247_c7_9e9f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3247_c7_9e9f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3247_c7_9e9f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3247_c7_9e9f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3247_c7_9e9f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3247_c7_9e9f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3247_c7_9e9f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3247_c7_9e9f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3247_c7_9e9f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3247_c7_9e9f_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3251_c11_2ddc]
signal BIN_OP_EQ_uxn_opcodes_h_l3251_c11_2ddc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3251_c11_2ddc_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3251_c11_2ddc_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3251_c7_0163]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3251_c7_0163_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3251_c7_0163_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3251_c7_0163_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3251_c7_0163_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3251_c7_0163]
signal result_stack_value_MUX_uxn_opcodes_h_l3251_c7_0163_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3251_c7_0163_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3251_c7_0163_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3251_c7_0163_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3251_c7_0163]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3251_c7_0163_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3251_c7_0163_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3251_c7_0163_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3251_c7_0163_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3251_c7_0163]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3251_c7_0163_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3251_c7_0163_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3251_c7_0163_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3251_c7_0163_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3255_c11_3688]
signal BIN_OP_EQ_uxn_opcodes_h_l3255_c11_3688_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3255_c11_3688_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3255_c11_3688_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3255_c7_e1a5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3255_c7_e1a5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3255_c7_e1a5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3255_c7_e1a5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3255_c7_e1a5_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3255_c7_e1a5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3255_c7_e1a5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3255_c7_e1a5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3255_c7_e1a5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3255_c7_e1a5_return_output : unsigned(0 downto 0);

-- CONST_SR_8_uint16_t_uxn_opcodes_h_l3253_l3245_DUPLICATE_63b6
signal CONST_SR_8_uint16_t_uxn_opcodes_h_l3253_l3245_DUPLICATE_63b6_x : unsigned(15 downto 0);
signal CONST_SR_8_uint16_t_uxn_opcodes_h_l3253_l3245_DUPLICATE_63b6_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CAST_TO_uint8_t_uint16_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(15 downto 0);
  variable return_output : unsigned(7 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

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
-- BIN_OP_EQ_uxn_opcodes_h_l3214_c6_005a
BIN_OP_EQ_uxn_opcodes_h_l3214_c6_005a : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3214_c6_005a_left,
BIN_OP_EQ_uxn_opcodes_h_l3214_c6_005a_right,
BIN_OP_EQ_uxn_opcodes_h_l3214_c6_005a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3214_c1_9b99
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3214_c1_9b99 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3214_c1_9b99_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3214_c1_9b99_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3214_c1_9b99_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3214_c1_9b99_return_output);

-- t16_MUX_uxn_opcodes_h_l3214_c2_7dc6
t16_MUX_uxn_opcodes_h_l3214_c2_7dc6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l3214_c2_7dc6_cond,
t16_MUX_uxn_opcodes_h_l3214_c2_7dc6_iftrue,
t16_MUX_uxn_opcodes_h_l3214_c2_7dc6_iffalse,
t16_MUX_uxn_opcodes_h_l3214_c2_7dc6_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l3214_c2_7dc6
result_is_stack_read_MUX_uxn_opcodes_h_l3214_c2_7dc6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l3214_c2_7dc6_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l3214_c2_7dc6_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l3214_c2_7dc6_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l3214_c2_7dc6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l3214_c2_7dc6
result_sp_relative_shift_MUX_uxn_opcodes_h_l3214_c2_7dc6 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l3214_c2_7dc6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3214_c2_7dc6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3214_c2_7dc6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3214_c2_7dc6_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3214_c2_7dc6
result_stack_value_MUX_uxn_opcodes_h_l3214_c2_7dc6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3214_c2_7dc6_cond,
result_stack_value_MUX_uxn_opcodes_h_l3214_c2_7dc6_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3214_c2_7dc6_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3214_c2_7dc6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l3214_c2_7dc6
result_is_sp_shift_MUX_uxn_opcodes_h_l3214_c2_7dc6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l3214_c2_7dc6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l3214_c2_7dc6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l3214_c2_7dc6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l3214_c2_7dc6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3214_c2_7dc6
result_is_stack_write_MUX_uxn_opcodes_h_l3214_c2_7dc6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3214_c2_7dc6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3214_c2_7dc6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3214_c2_7dc6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3214_c2_7dc6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3214_c2_7dc6
result_is_opc_done_MUX_uxn_opcodes_h_l3214_c2_7dc6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3214_c2_7dc6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3214_c2_7dc6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3214_c2_7dc6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3214_c2_7dc6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3214_c2_7dc6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3214_c2_7dc6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3214_c2_7dc6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3214_c2_7dc6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3214_c2_7dc6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3214_c2_7dc6_return_output);

-- printf_uxn_opcodes_h_l3215_c3_c459_uxn_opcodes_h_l3215_c3_c459
printf_uxn_opcodes_h_l3215_c3_c459_uxn_opcodes_h_l3215_c3_c459 : entity work.printf_uxn_opcodes_h_l3215_c3_c459_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l3215_c3_c459_uxn_opcodes_h_l3215_c3_c459_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l3220_c11_e954
BIN_OP_EQ_uxn_opcodes_h_l3220_c11_e954 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3220_c11_e954_left,
BIN_OP_EQ_uxn_opcodes_h_l3220_c11_e954_right,
BIN_OP_EQ_uxn_opcodes_h_l3220_c11_e954_return_output);

-- t16_MUX_uxn_opcodes_h_l3220_c7_6bf4
t16_MUX_uxn_opcodes_h_l3220_c7_6bf4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l3220_c7_6bf4_cond,
t16_MUX_uxn_opcodes_h_l3220_c7_6bf4_iftrue,
t16_MUX_uxn_opcodes_h_l3220_c7_6bf4_iffalse,
t16_MUX_uxn_opcodes_h_l3220_c7_6bf4_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l3220_c7_6bf4
result_is_stack_read_MUX_uxn_opcodes_h_l3220_c7_6bf4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l3220_c7_6bf4_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l3220_c7_6bf4_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l3220_c7_6bf4_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l3220_c7_6bf4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l3220_c7_6bf4
result_sp_relative_shift_MUX_uxn_opcodes_h_l3220_c7_6bf4 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l3220_c7_6bf4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3220_c7_6bf4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3220_c7_6bf4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3220_c7_6bf4_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3220_c7_6bf4
result_stack_value_MUX_uxn_opcodes_h_l3220_c7_6bf4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3220_c7_6bf4_cond,
result_stack_value_MUX_uxn_opcodes_h_l3220_c7_6bf4_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3220_c7_6bf4_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3220_c7_6bf4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l3220_c7_6bf4
result_is_sp_shift_MUX_uxn_opcodes_h_l3220_c7_6bf4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l3220_c7_6bf4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l3220_c7_6bf4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l3220_c7_6bf4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l3220_c7_6bf4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3220_c7_6bf4
result_is_stack_write_MUX_uxn_opcodes_h_l3220_c7_6bf4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3220_c7_6bf4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3220_c7_6bf4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3220_c7_6bf4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3220_c7_6bf4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3220_c7_6bf4
result_is_opc_done_MUX_uxn_opcodes_h_l3220_c7_6bf4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3220_c7_6bf4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3220_c7_6bf4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3220_c7_6bf4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3220_c7_6bf4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3220_c7_6bf4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3220_c7_6bf4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3220_c7_6bf4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3220_c7_6bf4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3220_c7_6bf4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3220_c7_6bf4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3223_c11_50f1
BIN_OP_EQ_uxn_opcodes_h_l3223_c11_50f1 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3223_c11_50f1_left,
BIN_OP_EQ_uxn_opcodes_h_l3223_c11_50f1_right,
BIN_OP_EQ_uxn_opcodes_h_l3223_c11_50f1_return_output);

-- t16_MUX_uxn_opcodes_h_l3223_c7_1656
t16_MUX_uxn_opcodes_h_l3223_c7_1656 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l3223_c7_1656_cond,
t16_MUX_uxn_opcodes_h_l3223_c7_1656_iftrue,
t16_MUX_uxn_opcodes_h_l3223_c7_1656_iffalse,
t16_MUX_uxn_opcodes_h_l3223_c7_1656_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l3223_c7_1656
result_is_stack_read_MUX_uxn_opcodes_h_l3223_c7_1656 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l3223_c7_1656_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l3223_c7_1656_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l3223_c7_1656_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l3223_c7_1656_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l3223_c7_1656
result_sp_relative_shift_MUX_uxn_opcodes_h_l3223_c7_1656 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l3223_c7_1656_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3223_c7_1656_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3223_c7_1656_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3223_c7_1656_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3223_c7_1656
result_stack_value_MUX_uxn_opcodes_h_l3223_c7_1656 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3223_c7_1656_cond,
result_stack_value_MUX_uxn_opcodes_h_l3223_c7_1656_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3223_c7_1656_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3223_c7_1656_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l3223_c7_1656
result_is_sp_shift_MUX_uxn_opcodes_h_l3223_c7_1656 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l3223_c7_1656_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l3223_c7_1656_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l3223_c7_1656_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l3223_c7_1656_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3223_c7_1656
result_is_stack_write_MUX_uxn_opcodes_h_l3223_c7_1656 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3223_c7_1656_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3223_c7_1656_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3223_c7_1656_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3223_c7_1656_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3223_c7_1656
result_is_opc_done_MUX_uxn_opcodes_h_l3223_c7_1656 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3223_c7_1656_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3223_c7_1656_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3223_c7_1656_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3223_c7_1656_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3223_c7_1656
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3223_c7_1656 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3223_c7_1656_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3223_c7_1656_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3223_c7_1656_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3223_c7_1656_return_output);

-- CONST_SL_8_uxn_opcodes_h_l3225_c3_18df
CONST_SL_8_uxn_opcodes_h_l3225_c3_18df : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l3225_c3_18df_x,
CONST_SL_8_uxn_opcodes_h_l3225_c3_18df_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3228_c11_7dd4
BIN_OP_EQ_uxn_opcodes_h_l3228_c11_7dd4 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3228_c11_7dd4_left,
BIN_OP_EQ_uxn_opcodes_h_l3228_c11_7dd4_right,
BIN_OP_EQ_uxn_opcodes_h_l3228_c11_7dd4_return_output);

-- t16_MUX_uxn_opcodes_h_l3228_c7_9021
t16_MUX_uxn_opcodes_h_l3228_c7_9021 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l3228_c7_9021_cond,
t16_MUX_uxn_opcodes_h_l3228_c7_9021_iftrue,
t16_MUX_uxn_opcodes_h_l3228_c7_9021_iffalse,
t16_MUX_uxn_opcodes_h_l3228_c7_9021_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l3228_c7_9021
result_is_stack_read_MUX_uxn_opcodes_h_l3228_c7_9021 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l3228_c7_9021_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l3228_c7_9021_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l3228_c7_9021_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l3228_c7_9021_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l3228_c7_9021
result_sp_relative_shift_MUX_uxn_opcodes_h_l3228_c7_9021 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l3228_c7_9021_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3228_c7_9021_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3228_c7_9021_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3228_c7_9021_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3228_c7_9021
result_stack_value_MUX_uxn_opcodes_h_l3228_c7_9021 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3228_c7_9021_cond,
result_stack_value_MUX_uxn_opcodes_h_l3228_c7_9021_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3228_c7_9021_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3228_c7_9021_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l3228_c7_9021
result_is_sp_shift_MUX_uxn_opcodes_h_l3228_c7_9021 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l3228_c7_9021_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l3228_c7_9021_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l3228_c7_9021_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l3228_c7_9021_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3228_c7_9021
result_is_stack_write_MUX_uxn_opcodes_h_l3228_c7_9021 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3228_c7_9021_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3228_c7_9021_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3228_c7_9021_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3228_c7_9021_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3228_c7_9021
result_is_opc_done_MUX_uxn_opcodes_h_l3228_c7_9021 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3228_c7_9021_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3228_c7_9021_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3228_c7_9021_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3228_c7_9021_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3228_c7_9021
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3228_c7_9021 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3228_c7_9021_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3228_c7_9021_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3228_c7_9021_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3228_c7_9021_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3231_c11_8ec5
BIN_OP_EQ_uxn_opcodes_h_l3231_c11_8ec5 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3231_c11_8ec5_left,
BIN_OP_EQ_uxn_opcodes_h_l3231_c11_8ec5_right,
BIN_OP_EQ_uxn_opcodes_h_l3231_c11_8ec5_return_output);

-- t16_MUX_uxn_opcodes_h_l3231_c7_fe31
t16_MUX_uxn_opcodes_h_l3231_c7_fe31 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l3231_c7_fe31_cond,
t16_MUX_uxn_opcodes_h_l3231_c7_fe31_iftrue,
t16_MUX_uxn_opcodes_h_l3231_c7_fe31_iffalse,
t16_MUX_uxn_opcodes_h_l3231_c7_fe31_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l3231_c7_fe31
result_is_stack_read_MUX_uxn_opcodes_h_l3231_c7_fe31 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l3231_c7_fe31_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l3231_c7_fe31_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l3231_c7_fe31_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l3231_c7_fe31_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l3231_c7_fe31
result_sp_relative_shift_MUX_uxn_opcodes_h_l3231_c7_fe31 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l3231_c7_fe31_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3231_c7_fe31_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3231_c7_fe31_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3231_c7_fe31_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3231_c7_fe31
result_stack_value_MUX_uxn_opcodes_h_l3231_c7_fe31 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3231_c7_fe31_cond,
result_stack_value_MUX_uxn_opcodes_h_l3231_c7_fe31_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3231_c7_fe31_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3231_c7_fe31_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l3231_c7_fe31
result_is_sp_shift_MUX_uxn_opcodes_h_l3231_c7_fe31 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l3231_c7_fe31_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l3231_c7_fe31_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l3231_c7_fe31_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l3231_c7_fe31_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3231_c7_fe31
result_is_stack_write_MUX_uxn_opcodes_h_l3231_c7_fe31 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3231_c7_fe31_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3231_c7_fe31_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3231_c7_fe31_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3231_c7_fe31_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3231_c7_fe31
result_is_opc_done_MUX_uxn_opcodes_h_l3231_c7_fe31 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3231_c7_fe31_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3231_c7_fe31_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3231_c7_fe31_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3231_c7_fe31_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3231_c7_fe31
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3231_c7_fe31 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3231_c7_fe31_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3231_c7_fe31_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3231_c7_fe31_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3231_c7_fe31_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l3232_c3_f6d1
BIN_OP_OR_uxn_opcodes_h_l3232_c3_f6d1 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l3232_c3_f6d1_left,
BIN_OP_OR_uxn_opcodes_h_l3232_c3_f6d1_right,
BIN_OP_OR_uxn_opcodes_h_l3232_c3_f6d1_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l3235_c32_3515
BIN_OP_AND_uxn_opcodes_h_l3235_c32_3515 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l3235_c32_3515_left,
BIN_OP_AND_uxn_opcodes_h_l3235_c32_3515_right,
BIN_OP_AND_uxn_opcodes_h_l3235_c32_3515_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l3235_c32_ad71
BIN_OP_GT_uxn_opcodes_h_l3235_c32_ad71 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l3235_c32_ad71_left,
BIN_OP_GT_uxn_opcodes_h_l3235_c32_ad71_right,
BIN_OP_GT_uxn_opcodes_h_l3235_c32_ad71_return_output);

-- MUX_uxn_opcodes_h_l3235_c32_419c
MUX_uxn_opcodes_h_l3235_c32_419c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l3235_c32_419c_cond,
MUX_uxn_opcodes_h_l3235_c32_419c_iftrue,
MUX_uxn_opcodes_h_l3235_c32_419c_iffalse,
MUX_uxn_opcodes_h_l3235_c32_419c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3237_c11_96a7
BIN_OP_EQ_uxn_opcodes_h_l3237_c11_96a7 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3237_c11_96a7_left,
BIN_OP_EQ_uxn_opcodes_h_l3237_c11_96a7_right,
BIN_OP_EQ_uxn_opcodes_h_l3237_c11_96a7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l3237_c7_2a68
result_is_sp_shift_MUX_uxn_opcodes_h_l3237_c7_2a68 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l3237_c7_2a68_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l3237_c7_2a68_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l3237_c7_2a68_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l3237_c7_2a68_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3237_c7_2a68
result_stack_value_MUX_uxn_opcodes_h_l3237_c7_2a68 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3237_c7_2a68_cond,
result_stack_value_MUX_uxn_opcodes_h_l3237_c7_2a68_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3237_c7_2a68_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3237_c7_2a68_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3237_c7_2a68
result_is_stack_write_MUX_uxn_opcodes_h_l3237_c7_2a68 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3237_c7_2a68_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3237_c7_2a68_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3237_c7_2a68_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3237_c7_2a68_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3237_c7_2a68
result_is_opc_done_MUX_uxn_opcodes_h_l3237_c7_2a68 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3237_c7_2a68_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3237_c7_2a68_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3237_c7_2a68_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3237_c7_2a68_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3237_c7_2a68
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3237_c7_2a68 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3237_c7_2a68_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3237_c7_2a68_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3237_c7_2a68_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3237_c7_2a68_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3243_c11_ad91
BIN_OP_EQ_uxn_opcodes_h_l3243_c11_ad91 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3243_c11_ad91_left,
BIN_OP_EQ_uxn_opcodes_h_l3243_c11_ad91_right,
BIN_OP_EQ_uxn_opcodes_h_l3243_c11_ad91_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3243_c7_efe1
result_is_stack_write_MUX_uxn_opcodes_h_l3243_c7_efe1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3243_c7_efe1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3243_c7_efe1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3243_c7_efe1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3243_c7_efe1_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3243_c7_efe1
result_stack_value_MUX_uxn_opcodes_h_l3243_c7_efe1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3243_c7_efe1_cond,
result_stack_value_MUX_uxn_opcodes_h_l3243_c7_efe1_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3243_c7_efe1_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3243_c7_efe1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3243_c7_efe1
result_is_opc_done_MUX_uxn_opcodes_h_l3243_c7_efe1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3243_c7_efe1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3243_c7_efe1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3243_c7_efe1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3243_c7_efe1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3243_c7_efe1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3243_c7_efe1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3243_c7_efe1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3243_c7_efe1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3243_c7_efe1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3243_c7_efe1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3247_c11_394e
BIN_OP_EQ_uxn_opcodes_h_l3247_c11_394e : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3247_c11_394e_left,
BIN_OP_EQ_uxn_opcodes_h_l3247_c11_394e_right,
BIN_OP_EQ_uxn_opcodes_h_l3247_c11_394e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3247_c7_9e9f
result_is_stack_write_MUX_uxn_opcodes_h_l3247_c7_9e9f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3247_c7_9e9f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3247_c7_9e9f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3247_c7_9e9f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3247_c7_9e9f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3247_c7_9e9f
result_stack_value_MUX_uxn_opcodes_h_l3247_c7_9e9f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3247_c7_9e9f_cond,
result_stack_value_MUX_uxn_opcodes_h_l3247_c7_9e9f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3247_c7_9e9f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3247_c7_9e9f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3247_c7_9e9f
result_is_opc_done_MUX_uxn_opcodes_h_l3247_c7_9e9f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3247_c7_9e9f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3247_c7_9e9f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3247_c7_9e9f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3247_c7_9e9f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3247_c7_9e9f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3247_c7_9e9f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3247_c7_9e9f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3247_c7_9e9f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3247_c7_9e9f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3247_c7_9e9f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3251_c11_2ddc
BIN_OP_EQ_uxn_opcodes_h_l3251_c11_2ddc : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3251_c11_2ddc_left,
BIN_OP_EQ_uxn_opcodes_h_l3251_c11_2ddc_right,
BIN_OP_EQ_uxn_opcodes_h_l3251_c11_2ddc_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3251_c7_0163
result_is_stack_write_MUX_uxn_opcodes_h_l3251_c7_0163 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3251_c7_0163_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3251_c7_0163_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3251_c7_0163_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3251_c7_0163_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3251_c7_0163
result_stack_value_MUX_uxn_opcodes_h_l3251_c7_0163 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3251_c7_0163_cond,
result_stack_value_MUX_uxn_opcodes_h_l3251_c7_0163_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3251_c7_0163_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3251_c7_0163_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3251_c7_0163
result_is_opc_done_MUX_uxn_opcodes_h_l3251_c7_0163 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3251_c7_0163_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3251_c7_0163_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3251_c7_0163_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3251_c7_0163_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3251_c7_0163
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3251_c7_0163 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3251_c7_0163_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3251_c7_0163_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3251_c7_0163_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3251_c7_0163_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3255_c11_3688
BIN_OP_EQ_uxn_opcodes_h_l3255_c11_3688 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3255_c11_3688_left,
BIN_OP_EQ_uxn_opcodes_h_l3255_c11_3688_right,
BIN_OP_EQ_uxn_opcodes_h_l3255_c11_3688_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3255_c7_e1a5
result_is_stack_write_MUX_uxn_opcodes_h_l3255_c7_e1a5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3255_c7_e1a5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3255_c7_e1a5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3255_c7_e1a5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3255_c7_e1a5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3255_c7_e1a5
result_is_opc_done_MUX_uxn_opcodes_h_l3255_c7_e1a5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3255_c7_e1a5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3255_c7_e1a5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3255_c7_e1a5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3255_c7_e1a5_return_output);

-- CONST_SR_8_uint16_t_uxn_opcodes_h_l3253_l3245_DUPLICATE_63b6
CONST_SR_8_uint16_t_uxn_opcodes_h_l3253_l3245_DUPLICATE_63b6 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uint16_t_uxn_opcodes_h_l3253_l3245_DUPLICATE_63b6_x,
CONST_SR_8_uint16_t_uxn_opcodes_h_l3253_l3245_DUPLICATE_63b6_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l3214_c6_005a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3214_c1_9b99_return_output,
 t16_MUX_uxn_opcodes_h_l3214_c2_7dc6_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l3214_c2_7dc6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l3214_c2_7dc6_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3214_c2_7dc6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l3214_c2_7dc6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3214_c2_7dc6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3214_c2_7dc6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3214_c2_7dc6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3220_c11_e954_return_output,
 t16_MUX_uxn_opcodes_h_l3220_c7_6bf4_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l3220_c7_6bf4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l3220_c7_6bf4_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3220_c7_6bf4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l3220_c7_6bf4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3220_c7_6bf4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3220_c7_6bf4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3220_c7_6bf4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3223_c11_50f1_return_output,
 t16_MUX_uxn_opcodes_h_l3223_c7_1656_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l3223_c7_1656_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l3223_c7_1656_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3223_c7_1656_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l3223_c7_1656_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3223_c7_1656_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3223_c7_1656_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3223_c7_1656_return_output,
 CONST_SL_8_uxn_opcodes_h_l3225_c3_18df_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3228_c11_7dd4_return_output,
 t16_MUX_uxn_opcodes_h_l3228_c7_9021_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l3228_c7_9021_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l3228_c7_9021_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3228_c7_9021_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l3228_c7_9021_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3228_c7_9021_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3228_c7_9021_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3228_c7_9021_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3231_c11_8ec5_return_output,
 t16_MUX_uxn_opcodes_h_l3231_c7_fe31_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l3231_c7_fe31_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l3231_c7_fe31_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3231_c7_fe31_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l3231_c7_fe31_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3231_c7_fe31_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3231_c7_fe31_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3231_c7_fe31_return_output,
 BIN_OP_OR_uxn_opcodes_h_l3232_c3_f6d1_return_output,
 BIN_OP_AND_uxn_opcodes_h_l3235_c32_3515_return_output,
 BIN_OP_GT_uxn_opcodes_h_l3235_c32_ad71_return_output,
 MUX_uxn_opcodes_h_l3235_c32_419c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3237_c11_96a7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l3237_c7_2a68_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3237_c7_2a68_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3237_c7_2a68_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3237_c7_2a68_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3237_c7_2a68_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3243_c11_ad91_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3243_c7_efe1_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3243_c7_efe1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3243_c7_efe1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3243_c7_efe1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3247_c11_394e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3247_c7_9e9f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3247_c7_9e9f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3247_c7_9e9f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3247_c7_9e9f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3251_c11_2ddc_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3251_c7_0163_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3251_c7_0163_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3251_c7_0163_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3251_c7_0163_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3255_c11_3688_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3255_c7_e1a5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3255_c7_e1a5_return_output,
 CONST_SR_8_uint16_t_uxn_opcodes_h_l3253_l3245_DUPLICATE_63b6_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3214_c6_005a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3214_c6_005a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3214_c6_005a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3214_c1_9b99_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3214_c1_9b99_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3214_c1_9b99_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3214_c1_9b99_iffalse : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3214_c2_7dc6_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3214_c2_7dc6_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3220_c7_6bf4_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3214_c2_7dc6_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3214_c2_7dc6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3214_c2_7dc6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3214_c2_7dc6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3220_c7_6bf4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3214_c2_7dc6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3214_c2_7dc6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3214_c2_7dc6_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3214_c2_7dc6_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3220_c7_6bf4_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3214_c2_7dc6_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3214_c2_7dc6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3214_c2_7dc6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3214_c2_7dc6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3220_c7_6bf4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3214_c2_7dc6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3214_c2_7dc6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3214_c2_7dc6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3214_c2_7dc6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3220_c7_6bf4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3214_c2_7dc6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3214_c2_7dc6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3214_c2_7dc6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3214_c2_7dc6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3220_c7_6bf4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3214_c2_7dc6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3214_c2_7dc6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3214_c2_7dc6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3214_c2_7dc6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3220_c7_6bf4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3214_c2_7dc6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3214_c2_7dc6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3214_c2_7dc6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3217_c3_9aa5 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3214_c2_7dc6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3220_c7_6bf4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3214_c2_7dc6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3214_c2_7dc6_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l3215_c3_c459_uxn_opcodes_h_l3215_c3_c459_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3220_c11_e954_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3220_c11_e954_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3220_c11_e954_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3220_c7_6bf4_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3220_c7_6bf4_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3223_c7_1656_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3220_c7_6bf4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3220_c7_6bf4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3220_c7_6bf4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3223_c7_1656_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3220_c7_6bf4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3220_c7_6bf4_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3220_c7_6bf4_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3223_c7_1656_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3220_c7_6bf4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3220_c7_6bf4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3220_c7_6bf4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3223_c7_1656_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3220_c7_6bf4_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3220_c7_6bf4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3220_c7_6bf4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3223_c7_1656_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3220_c7_6bf4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3220_c7_6bf4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3220_c7_6bf4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3223_c7_1656_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3220_c7_6bf4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3220_c7_6bf4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3220_c7_6bf4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3223_c7_1656_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3220_c7_6bf4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3220_c7_6bf4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3221_c3_106f : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3220_c7_6bf4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3223_c7_1656_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3220_c7_6bf4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3223_c11_50f1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3223_c11_50f1_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3223_c11_50f1_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3223_c7_1656_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3223_c7_1656_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3228_c7_9021_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3223_c7_1656_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3223_c7_1656_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3223_c7_1656_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3228_c7_9021_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3223_c7_1656_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3223_c7_1656_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3223_c7_1656_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3228_c7_9021_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3223_c7_1656_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3223_c7_1656_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3223_c7_1656_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3228_c7_9021_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3223_c7_1656_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3223_c7_1656_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3223_c7_1656_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3228_c7_9021_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3223_c7_1656_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3223_c7_1656_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3223_c7_1656_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3228_c7_9021_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3223_c7_1656_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3223_c7_1656_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3223_c7_1656_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3228_c7_9021_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3223_c7_1656_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3223_c7_1656_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3226_c3_29b6 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3223_c7_1656_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3228_c7_9021_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3223_c7_1656_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l3225_c3_18df_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l3225_c3_18df_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3228_c11_7dd4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3228_c11_7dd4_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3228_c11_7dd4_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3228_c7_9021_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3228_c7_9021_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3231_c7_fe31_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3228_c7_9021_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3228_c7_9021_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3228_c7_9021_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3231_c7_fe31_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3228_c7_9021_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3228_c7_9021_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3228_c7_9021_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3231_c7_fe31_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3228_c7_9021_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3228_c7_9021_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3228_c7_9021_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3231_c7_fe31_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3228_c7_9021_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3228_c7_9021_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3228_c7_9021_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3231_c7_fe31_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3228_c7_9021_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3228_c7_9021_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3228_c7_9021_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3231_c7_fe31_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3228_c7_9021_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3228_c7_9021_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3228_c7_9021_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3231_c7_fe31_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3228_c7_9021_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3228_c7_9021_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3229_c3_34f9 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3228_c7_9021_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3231_c7_fe31_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3228_c7_9021_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3231_c11_8ec5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3231_c11_8ec5_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3231_c11_8ec5_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3231_c7_fe31_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3231_c7_fe31_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3231_c7_fe31_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3231_c7_fe31_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3231_c7_fe31_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3231_c7_fe31_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3231_c7_fe31_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3231_c7_fe31_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3231_c7_fe31_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3231_c7_fe31_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3231_c7_fe31_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3237_c7_2a68_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3231_c7_fe31_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3231_c7_fe31_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3231_c7_fe31_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3237_c7_2a68_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3231_c7_fe31_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3231_c7_fe31_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3231_c7_fe31_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3237_c7_2a68_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3231_c7_fe31_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3231_c7_fe31_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3231_c7_fe31_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3237_c7_2a68_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3231_c7_fe31_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3231_c7_fe31_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3231_c7_fe31_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3237_c7_2a68_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3231_c7_fe31_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l3232_c3_f6d1_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l3232_c3_f6d1_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l3232_c3_f6d1_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3235_c32_419c_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3235_c32_419c_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3235_c32_419c_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l3235_c32_3515_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l3235_c32_3515_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l3235_c32_3515_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l3235_c32_ad71_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l3235_c32_ad71_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l3235_c32_ad71_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3235_c32_419c_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3237_c11_96a7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3237_c11_96a7_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3237_c11_96a7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3237_c7_2a68_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3237_c7_2a68_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3237_c7_2a68_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3237_c7_2a68_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3237_c7_2a68_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3243_c7_efe1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3237_c7_2a68_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3237_c7_2a68_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3237_c7_2a68_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3243_c7_efe1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3237_c7_2a68_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3237_c7_2a68_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3237_c7_2a68_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3243_c7_efe1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3237_c7_2a68_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3237_c7_2a68_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3240_c3_c39a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3237_c7_2a68_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3243_c7_efe1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3237_c7_2a68_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3243_c11_ad91_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3243_c11_ad91_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3243_c11_ad91_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3243_c7_efe1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3243_c7_efe1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3247_c7_9e9f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3243_c7_efe1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3243_c7_efe1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3243_c7_efe1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3247_c7_9e9f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3243_c7_efe1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3243_c7_efe1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3243_c7_efe1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3247_c7_9e9f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3243_c7_efe1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3243_c7_efe1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3244_c3_048b : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3243_c7_efe1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3247_c7_9e9f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3243_c7_efe1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3247_c11_394e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3247_c11_394e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3247_c11_394e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3247_c7_9e9f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3247_c7_9e9f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3251_c7_0163_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3247_c7_9e9f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3247_c7_9e9f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3247_c7_9e9f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3251_c7_0163_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3247_c7_9e9f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3247_c7_9e9f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3247_c7_9e9f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3251_c7_0163_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3247_c7_9e9f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3247_c7_9e9f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3248_c3_2078 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3247_c7_9e9f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3251_c7_0163_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3247_c7_9e9f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3251_c11_2ddc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3251_c11_2ddc_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3251_c11_2ddc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3251_c7_0163_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3251_c7_0163_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3255_c7_e1a5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3251_c7_0163_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3251_c7_0163_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3251_c7_0163_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3251_c7_0163_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3251_c7_0163_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3251_c7_0163_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3255_c7_e1a5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3251_c7_0163_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3251_c7_0163_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3252_c3_bc0e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3251_c7_0163_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3251_c7_0163_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3255_c11_3688_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3255_c11_3688_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3255_c11_3688_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3255_c7_e1a5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3255_c7_e1a5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3255_c7_e1a5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3255_c7_e1a5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3255_c7_e1a5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3255_c7_e1a5_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3220_l3214_l3231_l3228_l3223_DUPLICATE_d864_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3251_l3220_l3214_l3231_l3228_l3223_DUPLICATE_c182_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3220_l3214_l3237_l3228_l3223_DUPLICATE_5f93_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3251_l3220_l3247_l3214_l3243_l3231_l3228_l3255_l3223_DUPLICATE_5a18_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l3228_l3220_l3231_l3223_DUPLICATE_6864_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3251_l3220_l3247_l3243_l3237_l3231_l3228_l3255_l3223_DUPLICATE_2d52_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l3232_l3224_DUPLICATE_27a5_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l3251_l3231_DUPLICATE_0f7f_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l3241_l3249_DUPLICATE_92c3_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l3253_l3245_DUPLICATE_63b6_x : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l3253_l3245_DUPLICATE_63b6_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l3245_l3253_DUPLICATE_e0f9_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l3210_l3260_DUPLICATE_f9e6_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3255_c11_3688_right := to_unsigned(9, 4);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3255_c7_e1a5_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3214_c2_7dc6_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3237_c7_2a68_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3231_c7_fe31_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3217_c3_9aa5 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3214_c2_7dc6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3217_c3_9aa5;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3214_c2_7dc6_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3214_c6_005a_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3237_c11_96a7_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3226_c3_29b6 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3223_c7_1656_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3226_c3_29b6;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3240_c3_c39a := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3237_c7_2a68_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3240_c3_c39a;
     VAR_MUX_uxn_opcodes_h_l3235_c32_419c_iffalse := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3214_c1_9b99_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3243_c11_ad91_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3220_c11_e954_right := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l3235_c32_419c_iftrue := signed(std_logic_vector(resize(to_unsigned(4, 3), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3228_c11_7dd4_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3252_c3_bc0e := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3251_c7_0163_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3252_c3_bc0e;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3237_c7_2a68_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3223_c11_50f1_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3248_c3_2078 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3247_c7_9e9f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3248_c3_2078;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3255_c7_e1a5_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3231_c11_8ec5_right := to_unsigned(4, 3);
     VAR_BIN_OP_GT_uxn_opcodes_h_l3235_c32_ad71_right := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3231_c7_fe31_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3229_c3_34f9 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3228_c7_9021_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3229_c3_34f9;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3221_c3_106f := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3220_c7_6bf4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3221_c3_106f;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3244_c3_048b := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3243_c7_efe1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3244_c3_048b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3251_c11_2ddc_right := to_unsigned(8, 4);
     VAR_BIN_OP_AND_uxn_opcodes_h_l3235_c32_3515_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3247_c11_394e_right := to_unsigned(7, 3);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3214_c1_9b99_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l3235_c32_3515_left := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3214_c6_005a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3220_c11_e954_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3223_c11_50f1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3228_c11_7dd4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3231_c11_8ec5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3237_c11_96a7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3243_c11_ad91_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3247_c11_394e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3251_c11_2ddc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3255_c11_3688_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l3232_c3_f6d1_left := t16;
     VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l3253_l3245_DUPLICATE_63b6_x := t16;
     VAR_t16_MUX_uxn_opcodes_h_l3214_c2_7dc6_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l3220_c7_6bf4_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l3228_c7_9021_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l3231_c7_fe31_iffalse := t16;
     -- CONST_SR_8_uint16_t_uxn_opcodes_h_l3253_l3245_DUPLICATE_63b6 LATENCY=0
     -- Inputs
     CONST_SR_8_uint16_t_uxn_opcodes_h_l3253_l3245_DUPLICATE_63b6_x <= VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l3253_l3245_DUPLICATE_63b6_x;
     -- Outputs
     VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l3253_l3245_DUPLICATE_63b6_return_output := CONST_SR_8_uint16_t_uxn_opcodes_h_l3253_l3245_DUPLICATE_63b6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3231_c11_8ec5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3231_c11_8ec5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3231_c11_8ec5_left;
     BIN_OP_EQ_uxn_opcodes_h_l3231_c11_8ec5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3231_c11_8ec5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3231_c11_8ec5_return_output := BIN_OP_EQ_uxn_opcodes_h_l3231_c11_8ec5_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3220_l3214_l3231_l3228_l3223_DUPLICATE_d864 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3220_l3214_l3231_l3228_l3223_DUPLICATE_d864_return_output := result.sp_relative_shift;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l3232_l3224_DUPLICATE_27a5 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l3232_l3224_DUPLICATE_27a5_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l3243_c11_ad91] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3243_c11_ad91_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3243_c11_ad91_left;
     BIN_OP_EQ_uxn_opcodes_h_l3243_c11_ad91_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3243_c11_ad91_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3243_c11_ad91_return_output := BIN_OP_EQ_uxn_opcodes_h_l3243_c11_ad91_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3251_l3220_l3247_l3214_l3243_l3231_l3228_l3255_l3223_DUPLICATE_5a18 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3251_l3220_l3247_l3214_l3243_l3231_l3228_l3255_l3223_DUPLICATE_5a18_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l3247_c11_394e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3247_c11_394e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3247_c11_394e_left;
     BIN_OP_EQ_uxn_opcodes_h_l3247_c11_394e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3247_c11_394e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3247_c11_394e_return_output := BIN_OP_EQ_uxn_opcodes_h_l3247_c11_394e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3214_c6_005a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3214_c6_005a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3214_c6_005a_left;
     BIN_OP_EQ_uxn_opcodes_h_l3214_c6_005a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3214_c6_005a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3214_c6_005a_return_output := BIN_OP_EQ_uxn_opcodes_h_l3214_c6_005a_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3251_l3220_l3247_l3243_l3237_l3231_l3228_l3255_l3223_DUPLICATE_2d52 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3251_l3220_l3247_l3243_l3237_l3231_l3228_l3255_l3223_DUPLICATE_2d52_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l3255_c11_3688] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3255_c11_3688_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3255_c11_3688_left;
     BIN_OP_EQ_uxn_opcodes_h_l3255_c11_3688_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3255_c11_3688_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3255_c11_3688_return_output := BIN_OP_EQ_uxn_opcodes_h_l3255_c11_3688_return_output;

     -- CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l3241_l3249_DUPLICATE_92c3 LATENCY=0
     VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l3241_l3249_DUPLICATE_92c3_return_output := CAST_TO_uint8_t_uint16_t(
     t16);

     -- BIN_OP_EQ[uxn_opcodes_h_l3220_c11_e954] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3220_c11_e954_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3220_c11_e954_left;
     BIN_OP_EQ_uxn_opcodes_h_l3220_c11_e954_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3220_c11_e954_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3220_c11_e954_return_output := BIN_OP_EQ_uxn_opcodes_h_l3220_c11_e954_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l3228_l3220_l3231_l3223_DUPLICATE_6864 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l3228_l3220_l3231_l3223_DUPLICATE_6864_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l3251_c11_2ddc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3251_c11_2ddc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3251_c11_2ddc_left;
     BIN_OP_EQ_uxn_opcodes_h_l3251_c11_2ddc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3251_c11_2ddc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3251_c11_2ddc_return_output := BIN_OP_EQ_uxn_opcodes_h_l3251_c11_2ddc_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3228_c11_7dd4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3228_c11_7dd4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3228_c11_7dd4_left;
     BIN_OP_EQ_uxn_opcodes_h_l3228_c11_7dd4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3228_c11_7dd4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3228_c11_7dd4_return_output := BIN_OP_EQ_uxn_opcodes_h_l3228_c11_7dd4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3223_c11_50f1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3223_c11_50f1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3223_c11_50f1_left;
     BIN_OP_EQ_uxn_opcodes_h_l3223_c11_50f1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3223_c11_50f1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3223_c11_50f1_return_output := BIN_OP_EQ_uxn_opcodes_h_l3223_c11_50f1_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3251_l3220_l3214_l3231_l3228_l3223_DUPLICATE_c182 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3251_l3220_l3214_l3231_l3228_l3223_DUPLICATE_c182_return_output := result.stack_value;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l3251_l3231_DUPLICATE_0f7f LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l3251_l3231_DUPLICATE_0f7f_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l3237_c11_96a7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3237_c11_96a7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3237_c11_96a7_left;
     BIN_OP_EQ_uxn_opcodes_h_l3237_c11_96a7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3237_c11_96a7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3237_c11_96a7_return_output := BIN_OP_EQ_uxn_opcodes_h_l3237_c11_96a7_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3220_l3214_l3237_l3228_l3223_DUPLICATE_5f93 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3220_l3214_l3237_l3228_l3223_DUPLICATE_5f93_return_output := result.is_sp_shift;

     -- BIN_OP_AND[uxn_opcodes_h_l3235_c32_3515] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l3235_c32_3515_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l3235_c32_3515_left;
     BIN_OP_AND_uxn_opcodes_h_l3235_c32_3515_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l3235_c32_3515_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l3235_c32_3515_return_output := BIN_OP_AND_uxn_opcodes_h_l3235_c32_3515_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l3235_c32_ad71_left := VAR_BIN_OP_AND_uxn_opcodes_h_l3235_c32_3515_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3214_c1_9b99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3214_c6_005a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3214_c2_7dc6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3214_c6_005a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3214_c2_7dc6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3214_c6_005a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3214_c2_7dc6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3214_c6_005a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3214_c2_7dc6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3214_c6_005a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3214_c2_7dc6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3214_c6_005a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3214_c2_7dc6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3214_c6_005a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3214_c2_7dc6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3214_c6_005a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l3214_c2_7dc6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3214_c6_005a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3220_c7_6bf4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3220_c11_e954_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3220_c7_6bf4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3220_c11_e954_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3220_c7_6bf4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3220_c11_e954_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3220_c7_6bf4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3220_c11_e954_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3220_c7_6bf4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3220_c11_e954_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3220_c7_6bf4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3220_c11_e954_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3220_c7_6bf4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3220_c11_e954_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l3220_c7_6bf4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3220_c11_e954_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3223_c7_1656_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3223_c11_50f1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3223_c7_1656_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3223_c11_50f1_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3223_c7_1656_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3223_c11_50f1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3223_c7_1656_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3223_c11_50f1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3223_c7_1656_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3223_c11_50f1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3223_c7_1656_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3223_c11_50f1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3223_c7_1656_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3223_c11_50f1_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l3223_c7_1656_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3223_c11_50f1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3228_c7_9021_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3228_c11_7dd4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3228_c7_9021_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3228_c11_7dd4_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3228_c7_9021_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3228_c11_7dd4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3228_c7_9021_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3228_c11_7dd4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3228_c7_9021_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3228_c11_7dd4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3228_c7_9021_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3228_c11_7dd4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3228_c7_9021_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3228_c11_7dd4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l3228_c7_9021_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3228_c11_7dd4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3231_c7_fe31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3231_c11_8ec5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3231_c7_fe31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3231_c11_8ec5_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3231_c7_fe31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3231_c11_8ec5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3231_c7_fe31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3231_c11_8ec5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3231_c7_fe31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3231_c11_8ec5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3231_c7_fe31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3231_c11_8ec5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3231_c7_fe31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3231_c11_8ec5_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l3231_c7_fe31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3231_c11_8ec5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3237_c7_2a68_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3237_c11_96a7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3237_c7_2a68_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3237_c11_96a7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3237_c7_2a68_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3237_c11_96a7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3237_c7_2a68_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3237_c11_96a7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3237_c7_2a68_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3237_c11_96a7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3243_c7_efe1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3243_c11_ad91_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3243_c7_efe1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3243_c11_ad91_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3243_c7_efe1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3243_c11_ad91_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3243_c7_efe1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3243_c11_ad91_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3247_c7_9e9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3247_c11_394e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3247_c7_9e9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3247_c11_394e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3247_c7_9e9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3247_c11_394e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3247_c7_9e9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3247_c11_394e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3251_c7_0163_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3251_c11_2ddc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3251_c7_0163_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3251_c11_2ddc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3251_c7_0163_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3251_c11_2ddc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3251_c7_0163_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3251_c11_2ddc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3255_c7_e1a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3255_c11_3688_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3255_c7_e1a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3255_c11_3688_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l3232_c3_f6d1_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l3232_l3224_DUPLICATE_27a5_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l3225_c3_18df_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l3232_l3224_DUPLICATE_27a5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3237_c7_2a68_iftrue := VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l3241_l3249_DUPLICATE_92c3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3247_c7_9e9f_iftrue := VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l3241_l3249_DUPLICATE_92c3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3214_c2_7dc6_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3220_l3214_l3231_l3228_l3223_DUPLICATE_d864_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3220_c7_6bf4_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3220_l3214_l3231_l3228_l3223_DUPLICATE_d864_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3223_c7_1656_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3220_l3214_l3231_l3228_l3223_DUPLICATE_d864_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3228_c7_9021_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3220_l3214_l3231_l3228_l3223_DUPLICATE_d864_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3231_c7_fe31_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3220_l3214_l3231_l3228_l3223_DUPLICATE_d864_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3220_c7_6bf4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3251_l3220_l3247_l3243_l3237_l3231_l3228_l3255_l3223_DUPLICATE_2d52_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3223_c7_1656_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3251_l3220_l3247_l3243_l3237_l3231_l3228_l3255_l3223_DUPLICATE_2d52_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3228_c7_9021_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3251_l3220_l3247_l3243_l3237_l3231_l3228_l3255_l3223_DUPLICATE_2d52_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3231_c7_fe31_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3251_l3220_l3247_l3243_l3237_l3231_l3228_l3255_l3223_DUPLICATE_2d52_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3237_c7_2a68_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3251_l3220_l3247_l3243_l3237_l3231_l3228_l3255_l3223_DUPLICATE_2d52_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3243_c7_efe1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3251_l3220_l3247_l3243_l3237_l3231_l3228_l3255_l3223_DUPLICATE_2d52_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3247_c7_9e9f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3251_l3220_l3247_l3243_l3237_l3231_l3228_l3255_l3223_DUPLICATE_2d52_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3251_c7_0163_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3251_l3220_l3247_l3243_l3237_l3231_l3228_l3255_l3223_DUPLICATE_2d52_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3255_c7_e1a5_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3251_l3220_l3247_l3243_l3237_l3231_l3228_l3255_l3223_DUPLICATE_2d52_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3214_c2_7dc6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3220_l3214_l3237_l3228_l3223_DUPLICATE_5f93_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3220_c7_6bf4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3220_l3214_l3237_l3228_l3223_DUPLICATE_5f93_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3223_c7_1656_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3220_l3214_l3237_l3228_l3223_DUPLICATE_5f93_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3228_c7_9021_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3220_l3214_l3237_l3228_l3223_DUPLICATE_5f93_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3237_c7_2a68_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3220_l3214_l3237_l3228_l3223_DUPLICATE_5f93_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3220_c7_6bf4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l3228_l3220_l3231_l3223_DUPLICATE_6864_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3223_c7_1656_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l3228_l3220_l3231_l3223_DUPLICATE_6864_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3228_c7_9021_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l3228_l3220_l3231_l3223_DUPLICATE_6864_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3231_c7_fe31_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l3228_l3220_l3231_l3223_DUPLICATE_6864_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3214_c2_7dc6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3251_l3220_l3247_l3214_l3243_l3231_l3228_l3255_l3223_DUPLICATE_5a18_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3220_c7_6bf4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3251_l3220_l3247_l3214_l3243_l3231_l3228_l3255_l3223_DUPLICATE_5a18_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3223_c7_1656_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3251_l3220_l3247_l3214_l3243_l3231_l3228_l3255_l3223_DUPLICATE_5a18_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3228_c7_9021_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3251_l3220_l3247_l3214_l3243_l3231_l3228_l3255_l3223_DUPLICATE_5a18_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3231_c7_fe31_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3251_l3220_l3247_l3214_l3243_l3231_l3228_l3255_l3223_DUPLICATE_5a18_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3243_c7_efe1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3251_l3220_l3247_l3214_l3243_l3231_l3228_l3255_l3223_DUPLICATE_5a18_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3247_c7_9e9f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3251_l3220_l3247_l3214_l3243_l3231_l3228_l3255_l3223_DUPLICATE_5a18_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3251_c7_0163_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3251_l3220_l3247_l3214_l3243_l3231_l3228_l3255_l3223_DUPLICATE_5a18_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3255_c7_e1a5_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3251_l3220_l3247_l3214_l3243_l3231_l3228_l3255_l3223_DUPLICATE_5a18_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3231_c7_fe31_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l3251_l3231_DUPLICATE_0f7f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3251_c7_0163_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l3251_l3231_DUPLICATE_0f7f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3214_c2_7dc6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3251_l3220_l3214_l3231_l3228_l3223_DUPLICATE_c182_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3220_c7_6bf4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3251_l3220_l3214_l3231_l3228_l3223_DUPLICATE_c182_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3223_c7_1656_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3251_l3220_l3214_l3231_l3228_l3223_DUPLICATE_c182_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3228_c7_9021_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3251_l3220_l3214_l3231_l3228_l3223_DUPLICATE_c182_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3231_c7_fe31_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3251_l3220_l3214_l3231_l3228_l3223_DUPLICATE_c182_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3251_c7_0163_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3251_l3220_l3214_l3231_l3228_l3223_DUPLICATE_c182_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3251_c7_0163] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3251_c7_0163_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3251_c7_0163_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3251_c7_0163_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3251_c7_0163_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3251_c7_0163_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3251_c7_0163_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3251_c7_0163_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3251_c7_0163_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l3225_c3_18df] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l3225_c3_18df_x <= VAR_CONST_SL_8_uxn_opcodes_h_l3225_c3_18df_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l3225_c3_18df_return_output := CONST_SL_8_uxn_opcodes_h_l3225_c3_18df_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l3237_c7_2a68] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l3237_c7_2a68_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3237_c7_2a68_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3237_c7_2a68_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3237_c7_2a68_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3237_c7_2a68_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3237_c7_2a68_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3237_c7_2a68_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l3237_c7_2a68_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l3235_c32_ad71] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l3235_c32_ad71_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l3235_c32_ad71_left;
     BIN_OP_GT_uxn_opcodes_h_l3235_c32_ad71_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l3235_c32_ad71_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l3235_c32_ad71_return_output := BIN_OP_GT_uxn_opcodes_h_l3235_c32_ad71_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3255_c7_e1a5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3255_c7_e1a5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3255_c7_e1a5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3255_c7_e1a5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3255_c7_e1a5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3255_c7_e1a5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3255_c7_e1a5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3255_c7_e1a5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3255_c7_e1a5_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l3231_c7_fe31] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l3231_c7_fe31_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3231_c7_fe31_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l3231_c7_fe31_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3231_c7_fe31_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l3231_c7_fe31_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3231_c7_fe31_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3231_c7_fe31_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l3231_c7_fe31_return_output;

     -- CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l3245_l3253_DUPLICATE_e0f9 LATENCY=0
     VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l3245_l3253_DUPLICATE_e0f9_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l3253_l3245_DUPLICATE_63b6_return_output);

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3255_c7_e1a5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3255_c7_e1a5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3255_c7_e1a5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3255_c7_e1a5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3255_c7_e1a5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3255_c7_e1a5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3255_c7_e1a5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3255_c7_e1a5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3255_c7_e1a5_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3214_c1_9b99] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3214_c1_9b99_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3214_c1_9b99_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3214_c1_9b99_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3214_c1_9b99_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3214_c1_9b99_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3214_c1_9b99_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3214_c1_9b99_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3214_c1_9b99_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l3232_c3_f6d1] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l3232_c3_f6d1_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l3232_c3_f6d1_left;
     BIN_OP_OR_uxn_opcodes_h_l3232_c3_f6d1_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l3232_c3_f6d1_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l3232_c3_f6d1_return_output := BIN_OP_OR_uxn_opcodes_h_l3232_c3_f6d1_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l3235_c32_419c_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l3235_c32_ad71_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l3231_c7_fe31_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l3232_c3_f6d1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3243_c7_efe1_iftrue := VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l3245_l3253_DUPLICATE_e0f9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3251_c7_0163_iftrue := VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l3245_l3253_DUPLICATE_e0f9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l3223_c7_1656_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l3225_c3_18df_return_output;
     VAR_printf_uxn_opcodes_h_l3215_c3_c459_uxn_opcodes_h_l3215_c3_c459_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3214_c1_9b99_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3251_c7_0163_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3255_c7_e1a5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3231_c7_fe31_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3237_c7_2a68_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3228_c7_9021_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3231_c7_fe31_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3251_c7_0163_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3255_c7_e1a5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3247_c7_9e9f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3251_c7_0163_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3247_c7_9e9f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3247_c7_9e9f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3247_c7_9e9f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3247_c7_9e9f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3247_c7_9e9f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3247_c7_9e9f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3247_c7_9e9f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3247_c7_9e9f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3247_c7_9e9f_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l3228_c7_9021] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l3228_c7_9021_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3228_c7_9021_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l3228_c7_9021_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3228_c7_9021_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l3228_c7_9021_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3228_c7_9021_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3228_c7_9021_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l3228_c7_9021_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l3251_c7_0163] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3251_c7_0163_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3251_c7_0163_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3251_c7_0163_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3251_c7_0163_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3251_c7_0163_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3251_c7_0163_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3251_c7_0163_return_output := result_stack_value_MUX_uxn_opcodes_h_l3251_c7_0163_return_output;

     -- t16_MUX[uxn_opcodes_h_l3231_c7_fe31] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l3231_c7_fe31_cond <= VAR_t16_MUX_uxn_opcodes_h_l3231_c7_fe31_cond;
     t16_MUX_uxn_opcodes_h_l3231_c7_fe31_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l3231_c7_fe31_iftrue;
     t16_MUX_uxn_opcodes_h_l3231_c7_fe31_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l3231_c7_fe31_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l3231_c7_fe31_return_output := t16_MUX_uxn_opcodes_h_l3231_c7_fe31_return_output;

     -- printf_uxn_opcodes_h_l3215_c3_c459[uxn_opcodes_h_l3215_c3_c459] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l3215_c3_c459_uxn_opcodes_h_l3215_c3_c459_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l3215_c3_c459_uxn_opcodes_h_l3215_c3_c459_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l3231_c7_fe31] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l3231_c7_fe31_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3231_c7_fe31_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3231_c7_fe31_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3231_c7_fe31_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3231_c7_fe31_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3231_c7_fe31_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3231_c7_fe31_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l3231_c7_fe31_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3251_c7_0163] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3251_c7_0163_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3251_c7_0163_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3251_c7_0163_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3251_c7_0163_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3251_c7_0163_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3251_c7_0163_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3251_c7_0163_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3251_c7_0163_return_output;

     -- MUX[uxn_opcodes_h_l3235_c32_419c] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l3235_c32_419c_cond <= VAR_MUX_uxn_opcodes_h_l3235_c32_419c_cond;
     MUX_uxn_opcodes_h_l3235_c32_419c_iftrue <= VAR_MUX_uxn_opcodes_h_l3235_c32_419c_iftrue;
     MUX_uxn_opcodes_h_l3235_c32_419c_iffalse <= VAR_MUX_uxn_opcodes_h_l3235_c32_419c_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l3235_c32_419c_return_output := MUX_uxn_opcodes_h_l3235_c32_419c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3251_c7_0163] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3251_c7_0163_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3251_c7_0163_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3251_c7_0163_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3251_c7_0163_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3251_c7_0163_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3251_c7_0163_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3251_c7_0163_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3251_c7_0163_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3231_c7_fe31_iftrue := VAR_MUX_uxn_opcodes_h_l3235_c32_419c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3247_c7_9e9f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3251_c7_0163_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3228_c7_9021_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3231_c7_fe31_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3223_c7_1656_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3228_c7_9021_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3247_c7_9e9f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3251_c7_0163_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3243_c7_efe1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3247_c7_9e9f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3247_c7_9e9f_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3251_c7_0163_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l3228_c7_9021_iffalse := VAR_t16_MUX_uxn_opcodes_h_l3231_c7_fe31_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l3223_c7_1656] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l3223_c7_1656_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3223_c7_1656_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l3223_c7_1656_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3223_c7_1656_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l3223_c7_1656_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3223_c7_1656_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3223_c7_1656_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l3223_c7_1656_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3247_c7_9e9f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3247_c7_9e9f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3247_c7_9e9f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3247_c7_9e9f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3247_c7_9e9f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3247_c7_9e9f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3247_c7_9e9f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3247_c7_9e9f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3247_c7_9e9f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3247_c7_9e9f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3247_c7_9e9f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3247_c7_9e9f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3247_c7_9e9f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3247_c7_9e9f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3247_c7_9e9f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3247_c7_9e9f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3247_c7_9e9f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3247_c7_9e9f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l3228_c7_9021] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l3228_c7_9021_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3228_c7_9021_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3228_c7_9021_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3228_c7_9021_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3228_c7_9021_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3228_c7_9021_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3228_c7_9021_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l3228_c7_9021_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l3231_c7_fe31] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3231_c7_fe31_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3231_c7_fe31_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3231_c7_fe31_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3231_c7_fe31_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3231_c7_fe31_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3231_c7_fe31_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3231_c7_fe31_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l3231_c7_fe31_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3243_c7_efe1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3243_c7_efe1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3243_c7_efe1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3243_c7_efe1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3243_c7_efe1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3243_c7_efe1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3243_c7_efe1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3243_c7_efe1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3243_c7_efe1_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l3247_c7_9e9f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3247_c7_9e9f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3247_c7_9e9f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3247_c7_9e9f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3247_c7_9e9f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3247_c7_9e9f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3247_c7_9e9f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3247_c7_9e9f_return_output := result_stack_value_MUX_uxn_opcodes_h_l3247_c7_9e9f_return_output;

     -- t16_MUX[uxn_opcodes_h_l3228_c7_9021] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l3228_c7_9021_cond <= VAR_t16_MUX_uxn_opcodes_h_l3228_c7_9021_cond;
     t16_MUX_uxn_opcodes_h_l3228_c7_9021_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l3228_c7_9021_iftrue;
     t16_MUX_uxn_opcodes_h_l3228_c7_9021_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l3228_c7_9021_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l3228_c7_9021_return_output := t16_MUX_uxn_opcodes_h_l3228_c7_9021_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3243_c7_efe1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3247_c7_9e9f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3223_c7_1656_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3228_c7_9021_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3220_c7_6bf4_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3223_c7_1656_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3243_c7_efe1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3247_c7_9e9f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3228_c7_9021_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3231_c7_fe31_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3237_c7_2a68_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3243_c7_efe1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3243_c7_efe1_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3247_c7_9e9f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l3223_c7_1656_iffalse := VAR_t16_MUX_uxn_opcodes_h_l3228_c7_9021_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3237_c7_2a68] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3237_c7_2a68_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3237_c7_2a68_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3237_c7_2a68_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3237_c7_2a68_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3237_c7_2a68_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3237_c7_2a68_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3237_c7_2a68_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3237_c7_2a68_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3243_c7_efe1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3243_c7_efe1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3243_c7_efe1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3243_c7_efe1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3243_c7_efe1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3243_c7_efe1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3243_c7_efe1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3243_c7_efe1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3243_c7_efe1_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l3228_c7_9021] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3228_c7_9021_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3228_c7_9021_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3228_c7_9021_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3228_c7_9021_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3228_c7_9021_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3228_c7_9021_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3228_c7_9021_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l3228_c7_9021_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3243_c7_efe1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3243_c7_efe1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3243_c7_efe1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3243_c7_efe1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3243_c7_efe1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3243_c7_efe1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3243_c7_efe1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3243_c7_efe1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3243_c7_efe1_return_output;

     -- t16_MUX[uxn_opcodes_h_l3223_c7_1656] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l3223_c7_1656_cond <= VAR_t16_MUX_uxn_opcodes_h_l3223_c7_1656_cond;
     t16_MUX_uxn_opcodes_h_l3223_c7_1656_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l3223_c7_1656_iftrue;
     t16_MUX_uxn_opcodes_h_l3223_c7_1656_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l3223_c7_1656_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l3223_c7_1656_return_output := t16_MUX_uxn_opcodes_h_l3223_c7_1656_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l3220_c7_6bf4] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l3220_c7_6bf4_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3220_c7_6bf4_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l3220_c7_6bf4_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3220_c7_6bf4_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l3220_c7_6bf4_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3220_c7_6bf4_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3220_c7_6bf4_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l3220_c7_6bf4_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l3223_c7_1656] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l3223_c7_1656_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3223_c7_1656_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3223_c7_1656_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3223_c7_1656_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3223_c7_1656_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3223_c7_1656_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3223_c7_1656_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l3223_c7_1656_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l3243_c7_efe1] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3243_c7_efe1_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3243_c7_efe1_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3243_c7_efe1_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3243_c7_efe1_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3243_c7_efe1_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3243_c7_efe1_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3243_c7_efe1_return_output := result_stack_value_MUX_uxn_opcodes_h_l3243_c7_efe1_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3237_c7_2a68_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3243_c7_efe1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3220_c7_6bf4_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3223_c7_1656_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3214_c2_7dc6_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3220_c7_6bf4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3237_c7_2a68_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3243_c7_efe1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3223_c7_1656_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3228_c7_9021_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3231_c7_fe31_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3237_c7_2a68_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3237_c7_2a68_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3243_c7_efe1_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l3220_c7_6bf4_iffalse := VAR_t16_MUX_uxn_opcodes_h_l3223_c7_1656_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l3237_c7_2a68] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3237_c7_2a68_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3237_c7_2a68_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3237_c7_2a68_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3237_c7_2a68_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3237_c7_2a68_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3237_c7_2a68_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3237_c7_2a68_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3237_c7_2a68_return_output;

     -- t16_MUX[uxn_opcodes_h_l3220_c7_6bf4] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l3220_c7_6bf4_cond <= VAR_t16_MUX_uxn_opcodes_h_l3220_c7_6bf4_cond;
     t16_MUX_uxn_opcodes_h_l3220_c7_6bf4_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l3220_c7_6bf4_iftrue;
     t16_MUX_uxn_opcodes_h_l3220_c7_6bf4_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l3220_c7_6bf4_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l3220_c7_6bf4_return_output := t16_MUX_uxn_opcodes_h_l3220_c7_6bf4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3231_c7_fe31] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3231_c7_fe31_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3231_c7_fe31_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3231_c7_fe31_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3231_c7_fe31_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3231_c7_fe31_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3231_c7_fe31_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3231_c7_fe31_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3231_c7_fe31_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l3237_c7_2a68] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3237_c7_2a68_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3237_c7_2a68_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3237_c7_2a68_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3237_c7_2a68_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3237_c7_2a68_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3237_c7_2a68_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3237_c7_2a68_return_output := result_stack_value_MUX_uxn_opcodes_h_l3237_c7_2a68_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l3223_c7_1656] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3223_c7_1656_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3223_c7_1656_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3223_c7_1656_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3223_c7_1656_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3223_c7_1656_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3223_c7_1656_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3223_c7_1656_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l3223_c7_1656_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3237_c7_2a68] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3237_c7_2a68_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3237_c7_2a68_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3237_c7_2a68_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3237_c7_2a68_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3237_c7_2a68_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3237_c7_2a68_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3237_c7_2a68_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3237_c7_2a68_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l3220_c7_6bf4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l3220_c7_6bf4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3220_c7_6bf4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3220_c7_6bf4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3220_c7_6bf4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3220_c7_6bf4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3220_c7_6bf4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3220_c7_6bf4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l3220_c7_6bf4_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l3214_c2_7dc6] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l3214_c2_7dc6_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3214_c2_7dc6_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l3214_c2_7dc6_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3214_c2_7dc6_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l3214_c2_7dc6_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3214_c2_7dc6_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3214_c2_7dc6_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l3214_c2_7dc6_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3231_c7_fe31_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3237_c7_2a68_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3214_c2_7dc6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3220_c7_6bf4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3231_c7_fe31_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3237_c7_2a68_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3220_c7_6bf4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3223_c7_1656_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3228_c7_9021_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3231_c7_fe31_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3231_c7_fe31_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3237_c7_2a68_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l3214_c2_7dc6_iffalse := VAR_t16_MUX_uxn_opcodes_h_l3220_c7_6bf4_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l3214_c2_7dc6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l3214_c2_7dc6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3214_c2_7dc6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3214_c2_7dc6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3214_c2_7dc6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3214_c2_7dc6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3214_c2_7dc6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3214_c2_7dc6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l3214_c2_7dc6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3228_c7_9021] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3228_c7_9021_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3228_c7_9021_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3228_c7_9021_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3228_c7_9021_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3228_c7_9021_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3228_c7_9021_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3228_c7_9021_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3228_c7_9021_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l3231_c7_fe31] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3231_c7_fe31_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3231_c7_fe31_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3231_c7_fe31_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3231_c7_fe31_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3231_c7_fe31_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3231_c7_fe31_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3231_c7_fe31_return_output := result_stack_value_MUX_uxn_opcodes_h_l3231_c7_fe31_return_output;

     -- t16_MUX[uxn_opcodes_h_l3214_c2_7dc6] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l3214_c2_7dc6_cond <= VAR_t16_MUX_uxn_opcodes_h_l3214_c2_7dc6_cond;
     t16_MUX_uxn_opcodes_h_l3214_c2_7dc6_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l3214_c2_7dc6_iftrue;
     t16_MUX_uxn_opcodes_h_l3214_c2_7dc6_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l3214_c2_7dc6_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l3214_c2_7dc6_return_output := t16_MUX_uxn_opcodes_h_l3214_c2_7dc6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3231_c7_fe31] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3231_c7_fe31_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3231_c7_fe31_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3231_c7_fe31_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3231_c7_fe31_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3231_c7_fe31_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3231_c7_fe31_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3231_c7_fe31_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3231_c7_fe31_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3231_c7_fe31] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3231_c7_fe31_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3231_c7_fe31_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3231_c7_fe31_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3231_c7_fe31_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3231_c7_fe31_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3231_c7_fe31_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3231_c7_fe31_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3231_c7_fe31_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l3220_c7_6bf4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3220_c7_6bf4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3220_c7_6bf4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3220_c7_6bf4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3220_c7_6bf4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3220_c7_6bf4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3220_c7_6bf4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3220_c7_6bf4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l3220_c7_6bf4_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3228_c7_9021_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3231_c7_fe31_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3228_c7_9021_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3231_c7_fe31_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3214_c2_7dc6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3220_c7_6bf4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3223_c7_1656_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3228_c7_9021_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3228_c7_9021_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3231_c7_fe31_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l3214_c2_7dc6_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l3214_c2_7dc6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3214_c2_7dc6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3214_c2_7dc6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3214_c2_7dc6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3214_c2_7dc6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3214_c2_7dc6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3214_c2_7dc6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3214_c2_7dc6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l3214_c2_7dc6_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l3228_c7_9021] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3228_c7_9021_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3228_c7_9021_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3228_c7_9021_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3228_c7_9021_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3228_c7_9021_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3228_c7_9021_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3228_c7_9021_return_output := result_stack_value_MUX_uxn_opcodes_h_l3228_c7_9021_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3228_c7_9021] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3228_c7_9021_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3228_c7_9021_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3228_c7_9021_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3228_c7_9021_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3228_c7_9021_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3228_c7_9021_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3228_c7_9021_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3228_c7_9021_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3228_c7_9021] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3228_c7_9021_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3228_c7_9021_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3228_c7_9021_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3228_c7_9021_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3228_c7_9021_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3228_c7_9021_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3228_c7_9021_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3228_c7_9021_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3223_c7_1656] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3223_c7_1656_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3223_c7_1656_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3223_c7_1656_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3223_c7_1656_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3223_c7_1656_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3223_c7_1656_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3223_c7_1656_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3223_c7_1656_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3223_c7_1656_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3228_c7_9021_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3223_c7_1656_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3228_c7_9021_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3220_c7_6bf4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3223_c7_1656_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3223_c7_1656_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3228_c7_9021_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l3223_c7_1656] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3223_c7_1656_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3223_c7_1656_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3223_c7_1656_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3223_c7_1656_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3223_c7_1656_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3223_c7_1656_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3223_c7_1656_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3223_c7_1656_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3220_c7_6bf4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3220_c7_6bf4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3220_c7_6bf4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3220_c7_6bf4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3220_c7_6bf4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3220_c7_6bf4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3220_c7_6bf4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3220_c7_6bf4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3220_c7_6bf4_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l3223_c7_1656] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3223_c7_1656_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3223_c7_1656_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3223_c7_1656_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3223_c7_1656_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3223_c7_1656_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3223_c7_1656_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3223_c7_1656_return_output := result_stack_value_MUX_uxn_opcodes_h_l3223_c7_1656_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3223_c7_1656] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3223_c7_1656_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3223_c7_1656_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3223_c7_1656_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3223_c7_1656_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3223_c7_1656_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3223_c7_1656_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3223_c7_1656_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3223_c7_1656_return_output;

     -- Submodule level 9
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3220_c7_6bf4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3223_c7_1656_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3220_c7_6bf4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3223_c7_1656_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3214_c2_7dc6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3220_c7_6bf4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3220_c7_6bf4_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3223_c7_1656_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l3220_c7_6bf4] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3220_c7_6bf4_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3220_c7_6bf4_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3220_c7_6bf4_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3220_c7_6bf4_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3220_c7_6bf4_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3220_c7_6bf4_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3220_c7_6bf4_return_output := result_stack_value_MUX_uxn_opcodes_h_l3220_c7_6bf4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3214_c2_7dc6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3214_c2_7dc6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3214_c2_7dc6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3214_c2_7dc6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3214_c2_7dc6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3214_c2_7dc6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3214_c2_7dc6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3214_c2_7dc6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3214_c2_7dc6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3220_c7_6bf4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3220_c7_6bf4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3220_c7_6bf4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3220_c7_6bf4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3220_c7_6bf4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3220_c7_6bf4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3220_c7_6bf4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3220_c7_6bf4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3220_c7_6bf4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3220_c7_6bf4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3220_c7_6bf4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3220_c7_6bf4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3220_c7_6bf4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3220_c7_6bf4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3220_c7_6bf4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3220_c7_6bf4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3220_c7_6bf4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3220_c7_6bf4_return_output;

     -- Submodule level 10
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3214_c2_7dc6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3220_c7_6bf4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3214_c2_7dc6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3220_c7_6bf4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3214_c2_7dc6_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3220_c7_6bf4_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l3214_c2_7dc6] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3214_c2_7dc6_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3214_c2_7dc6_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3214_c2_7dc6_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3214_c2_7dc6_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3214_c2_7dc6_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3214_c2_7dc6_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3214_c2_7dc6_return_output := result_stack_value_MUX_uxn_opcodes_h_l3214_c2_7dc6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3214_c2_7dc6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3214_c2_7dc6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3214_c2_7dc6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3214_c2_7dc6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3214_c2_7dc6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3214_c2_7dc6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3214_c2_7dc6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3214_c2_7dc6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3214_c2_7dc6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3214_c2_7dc6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3214_c2_7dc6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3214_c2_7dc6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3214_c2_7dc6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3214_c2_7dc6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3214_c2_7dc6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3214_c2_7dc6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3214_c2_7dc6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3214_c2_7dc6_return_output;

     -- Submodule level 11
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l3210_l3260_DUPLICATE_f9e6 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l3210_l3260_DUPLICATE_f9e6_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3(
     result,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3214_c2_7dc6_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3214_c2_7dc6_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3214_c2_7dc6_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3214_c2_7dc6_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3214_c2_7dc6_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3214_c2_7dc6_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3214_c2_7dc6_return_output);

     -- Submodule level 12
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l3210_l3260_DUPLICATE_f9e6_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l3210_l3260_DUPLICATE_f9e6_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
