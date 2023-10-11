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
-- Submodules: 98
entity equ2_0CLK_5ccafc54 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end equ2_0CLK_5ccafc54;
architecture arch of equ2_0CLK_5ccafc54 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1287_c6_b035]
signal BIN_OP_EQ_uxn_opcodes_h_l1287_c6_b035_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1287_c6_b035_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1287_c6_b035_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1287_c1_2b75]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1287_c1_2b75_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1287_c1_2b75_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1287_c1_2b75_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1287_c1_2b75_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1287_c2_dbda]
signal n16_MUX_uxn_opcodes_h_l1287_c2_dbda_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1287_c2_dbda_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1287_c2_dbda_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1287_c2_dbda_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1287_c2_dbda]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1287_c2_dbda_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1287_c2_dbda_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1287_c2_dbda_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1287_c2_dbda_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1287_c2_dbda]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c2_dbda_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c2_dbda_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c2_dbda_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c2_dbda_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1287_c2_dbda]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1287_c2_dbda_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1287_c2_dbda_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1287_c2_dbda_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1287_c2_dbda_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1287_c2_dbda]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1287_c2_dbda_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1287_c2_dbda_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1287_c2_dbda_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1287_c2_dbda_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1287_c2_dbda]
signal result_stack_value_MUX_uxn_opcodes_h_l1287_c2_dbda_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1287_c2_dbda_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1287_c2_dbda_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1287_c2_dbda_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1287_c2_dbda]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c2_dbda_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c2_dbda_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c2_dbda_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c2_dbda_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1287_c2_dbda]
signal t16_MUX_uxn_opcodes_h_l1287_c2_dbda_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1287_c2_dbda_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1287_c2_dbda_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1287_c2_dbda_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l1288_c3_c87e[uxn_opcodes_h_l1288_c3_c87e]
signal printf_uxn_opcodes_h_l1288_c3_c87e_uxn_opcodes_h_l1288_c3_c87e_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1292_c11_9118]
signal BIN_OP_EQ_uxn_opcodes_h_l1292_c11_9118_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1292_c11_9118_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1292_c11_9118_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1292_c7_0a1b]
signal n16_MUX_uxn_opcodes_h_l1292_c7_0a1b_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1292_c7_0a1b_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1292_c7_0a1b_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1292_c7_0a1b_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1292_c7_0a1b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1292_c7_0a1b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1292_c7_0a1b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1292_c7_0a1b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1292_c7_0a1b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1292_c7_0a1b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1292_c7_0a1b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1292_c7_0a1b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1292_c7_0a1b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1292_c7_0a1b_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1292_c7_0a1b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1292_c7_0a1b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1292_c7_0a1b_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1292_c7_0a1b_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1292_c7_0a1b_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1292_c7_0a1b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1292_c7_0a1b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1292_c7_0a1b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1292_c7_0a1b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1292_c7_0a1b_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1292_c7_0a1b]
signal result_stack_value_MUX_uxn_opcodes_h_l1292_c7_0a1b_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1292_c7_0a1b_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1292_c7_0a1b_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1292_c7_0a1b_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1292_c7_0a1b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1292_c7_0a1b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1292_c7_0a1b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1292_c7_0a1b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1292_c7_0a1b_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1292_c7_0a1b]
signal t16_MUX_uxn_opcodes_h_l1292_c7_0a1b_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1292_c7_0a1b_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1292_c7_0a1b_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1292_c7_0a1b_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1295_c11_e3d9]
signal BIN_OP_EQ_uxn_opcodes_h_l1295_c11_e3d9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1295_c11_e3d9_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1295_c11_e3d9_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1295_c7_2896]
signal n16_MUX_uxn_opcodes_h_l1295_c7_2896_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1295_c7_2896_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1295_c7_2896_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1295_c7_2896_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1295_c7_2896]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1295_c7_2896_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1295_c7_2896_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1295_c7_2896_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1295_c7_2896_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1295_c7_2896]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1295_c7_2896_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1295_c7_2896_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1295_c7_2896_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1295_c7_2896_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1295_c7_2896]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1295_c7_2896_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1295_c7_2896_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1295_c7_2896_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1295_c7_2896_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1295_c7_2896]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1295_c7_2896_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1295_c7_2896_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1295_c7_2896_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1295_c7_2896_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1295_c7_2896]
signal result_stack_value_MUX_uxn_opcodes_h_l1295_c7_2896_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1295_c7_2896_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1295_c7_2896_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1295_c7_2896_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1295_c7_2896]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1295_c7_2896_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1295_c7_2896_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1295_c7_2896_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1295_c7_2896_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1295_c7_2896]
signal t16_MUX_uxn_opcodes_h_l1295_c7_2896_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1295_c7_2896_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1295_c7_2896_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1295_c7_2896_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1300_c11_9a73]
signal BIN_OP_EQ_uxn_opcodes_h_l1300_c11_9a73_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1300_c11_9a73_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1300_c11_9a73_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1300_c7_592d]
signal n16_MUX_uxn_opcodes_h_l1300_c7_592d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1300_c7_592d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1300_c7_592d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1300_c7_592d_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1300_c7_592d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_592d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_592d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_592d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_592d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1300_c7_592d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_592d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_592d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_592d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_592d_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1300_c7_592d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_592d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_592d_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_592d_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_592d_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1300_c7_592d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_592d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_592d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_592d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_592d_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1300_c7_592d]
signal result_stack_value_MUX_uxn_opcodes_h_l1300_c7_592d_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1300_c7_592d_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1300_c7_592d_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1300_c7_592d_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1300_c7_592d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_592d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_592d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_592d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_592d_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1300_c7_592d]
signal t16_MUX_uxn_opcodes_h_l1300_c7_592d_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1300_c7_592d_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1300_c7_592d_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1300_c7_592d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1303_c11_640d]
signal BIN_OP_EQ_uxn_opcodes_h_l1303_c11_640d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1303_c11_640d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1303_c11_640d_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1303_c7_2d6b]
signal n16_MUX_uxn_opcodes_h_l1303_c7_2d6b_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1303_c7_2d6b_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1303_c7_2d6b_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1303_c7_2d6b_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1303_c7_2d6b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_2d6b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_2d6b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_2d6b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_2d6b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1303_c7_2d6b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_2d6b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_2d6b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_2d6b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_2d6b_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1303_c7_2d6b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_2d6b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_2d6b_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_2d6b_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_2d6b_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1303_c7_2d6b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_2d6b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_2d6b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_2d6b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_2d6b_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1303_c7_2d6b]
signal result_stack_value_MUX_uxn_opcodes_h_l1303_c7_2d6b_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1303_c7_2d6b_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1303_c7_2d6b_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1303_c7_2d6b_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1303_c7_2d6b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1303_c7_2d6b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1303_c7_2d6b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1303_c7_2d6b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1303_c7_2d6b_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1303_c7_2d6b]
signal t16_MUX_uxn_opcodes_h_l1303_c7_2d6b_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1303_c7_2d6b_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1303_c7_2d6b_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1303_c7_2d6b_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1304_c3_648f]
signal BIN_OP_OR_uxn_opcodes_h_l1304_c3_648f_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1304_c3_648f_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1304_c3_648f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1307_c11_7a1e]
signal BIN_OP_EQ_uxn_opcodes_h_l1307_c11_7a1e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1307_c11_7a1e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1307_c11_7a1e_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1307_c7_3e32]
signal n16_MUX_uxn_opcodes_h_l1307_c7_3e32_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1307_c7_3e32_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1307_c7_3e32_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1307_c7_3e32_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1307_c7_3e32]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_3e32_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_3e32_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_3e32_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_3e32_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1307_c7_3e32]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_3e32_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_3e32_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_3e32_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_3e32_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1307_c7_3e32]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_3e32_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_3e32_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_3e32_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_3e32_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1307_c7_3e32]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_3e32_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_3e32_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_3e32_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_3e32_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1307_c7_3e32]
signal result_stack_value_MUX_uxn_opcodes_h_l1307_c7_3e32_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1307_c7_3e32_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1307_c7_3e32_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1307_c7_3e32_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1307_c7_3e32]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1307_c7_3e32_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1307_c7_3e32_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1307_c7_3e32_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1307_c7_3e32_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1310_c11_ca6f]
signal BIN_OP_EQ_uxn_opcodes_h_l1310_c11_ca6f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1310_c11_ca6f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1310_c11_ca6f_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1310_c7_661d]
signal n16_MUX_uxn_opcodes_h_l1310_c7_661d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1310_c7_661d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1310_c7_661d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1310_c7_661d_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1310_c7_661d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_661d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_661d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_661d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_661d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1310_c7_661d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_661d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_661d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_661d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_661d_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1310_c7_661d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_661d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_661d_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_661d_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_661d_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1310_c7_661d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_661d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_661d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_661d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_661d_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1310_c7_661d]
signal result_stack_value_MUX_uxn_opcodes_h_l1310_c7_661d_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1310_c7_661d_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1310_c7_661d_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1310_c7_661d_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1310_c7_661d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1310_c7_661d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1310_c7_661d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1310_c7_661d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1310_c7_661d_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1315_c11_4d4a]
signal BIN_OP_EQ_uxn_opcodes_h_l1315_c11_4d4a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1315_c11_4d4a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1315_c11_4d4a_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1315_c7_823e]
signal n16_MUX_uxn_opcodes_h_l1315_c7_823e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1315_c7_823e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1315_c7_823e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1315_c7_823e_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1315_c7_823e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1315_c7_823e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1315_c7_823e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1315_c7_823e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1315_c7_823e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1315_c7_823e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1315_c7_823e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1315_c7_823e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1315_c7_823e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1315_c7_823e_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1315_c7_823e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1315_c7_823e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1315_c7_823e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1315_c7_823e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1315_c7_823e_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1315_c7_823e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1315_c7_823e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1315_c7_823e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1315_c7_823e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1315_c7_823e_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1315_c7_823e]
signal result_stack_value_MUX_uxn_opcodes_h_l1315_c7_823e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1315_c7_823e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1315_c7_823e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1315_c7_823e_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1315_c7_823e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1315_c7_823e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1315_c7_823e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1315_c7_823e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1315_c7_823e_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1318_c11_e50a]
signal BIN_OP_EQ_uxn_opcodes_h_l1318_c11_e50a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1318_c11_e50a_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1318_c11_e50a_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1318_c7_ac14]
signal n16_MUX_uxn_opcodes_h_l1318_c7_ac14_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1318_c7_ac14_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1318_c7_ac14_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1318_c7_ac14_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1318_c7_ac14]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1318_c7_ac14_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1318_c7_ac14_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1318_c7_ac14_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1318_c7_ac14_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1318_c7_ac14]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1318_c7_ac14_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1318_c7_ac14_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1318_c7_ac14_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1318_c7_ac14_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1318_c7_ac14]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1318_c7_ac14_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1318_c7_ac14_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1318_c7_ac14_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1318_c7_ac14_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1318_c7_ac14]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1318_c7_ac14_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1318_c7_ac14_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1318_c7_ac14_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1318_c7_ac14_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1318_c7_ac14]
signal result_stack_value_MUX_uxn_opcodes_h_l1318_c7_ac14_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1318_c7_ac14_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1318_c7_ac14_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1318_c7_ac14_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1318_c7_ac14]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1318_c7_ac14_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1318_c7_ac14_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1318_c7_ac14_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1318_c7_ac14_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1319_c3_4ab1]
signal BIN_OP_OR_uxn_opcodes_h_l1319_c3_4ab1_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1319_c3_4ab1_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1319_c3_4ab1_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1321_c32_cf10]
signal BIN_OP_AND_uxn_opcodes_h_l1321_c32_cf10_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1321_c32_cf10_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1321_c32_cf10_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1321_c32_ae68]
signal BIN_OP_GT_uxn_opcodes_h_l1321_c32_ae68_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1321_c32_ae68_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1321_c32_ae68_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1321_c32_a73e]
signal MUX_uxn_opcodes_h_l1321_c32_a73e_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1321_c32_a73e_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1321_c32_a73e_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1321_c32_a73e_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1323_c11_8ab6]
signal BIN_OP_EQ_uxn_opcodes_h_l1323_c11_8ab6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1323_c11_8ab6_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1323_c11_8ab6_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1323_c7_7ed8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_7ed8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_7ed8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_7ed8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_7ed8_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1323_c7_7ed8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c7_7ed8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c7_7ed8_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c7_7ed8_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c7_7ed8_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1323_c7_7ed8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_7ed8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_7ed8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_7ed8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_7ed8_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1323_c7_7ed8]
signal result_stack_value_MUX_uxn_opcodes_h_l1323_c7_7ed8_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1323_c7_7ed8_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1323_c7_7ed8_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1323_c7_7ed8_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1323_c7_7ed8]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1323_c7_7ed8_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1323_c7_7ed8_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1323_c7_7ed8_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1323_c7_7ed8_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1327_c24_05e8]
signal BIN_OP_EQ_uxn_opcodes_h_l1327_c24_05e8_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1327_c24_05e8_right : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1327_c24_05e8_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1327_c24_7bf7]
signal MUX_uxn_opcodes_h_l1327_c24_7bf7_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1327_c24_7bf7_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1327_c24_7bf7_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1327_c24_7bf7_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1329_c11_bcc2]
signal BIN_OP_EQ_uxn_opcodes_h_l1329_c11_bcc2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1329_c11_bcc2_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1329_c11_bcc2_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1329_c7_b0c9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1329_c7_b0c9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1329_c7_b0c9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1329_c7_b0c9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1329_c7_b0c9_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1329_c7_b0c9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1329_c7_b0c9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1329_c7_b0c9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1329_c7_b0c9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1329_c7_b0c9_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1297_l1312_DUPLICATE_dd7f
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1297_l1312_DUPLICATE_dd7f_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1297_l1312_DUPLICATE_dd7f_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_53ff( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : signed;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_stack_write := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.stack_value := ref_toks_5;
      base.is_sp_shift := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1287_c6_b035
BIN_OP_EQ_uxn_opcodes_h_l1287_c6_b035 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1287_c6_b035_left,
BIN_OP_EQ_uxn_opcodes_h_l1287_c6_b035_right,
BIN_OP_EQ_uxn_opcodes_h_l1287_c6_b035_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1287_c1_2b75
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1287_c1_2b75 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1287_c1_2b75_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1287_c1_2b75_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1287_c1_2b75_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1287_c1_2b75_return_output);

-- n16_MUX_uxn_opcodes_h_l1287_c2_dbda
n16_MUX_uxn_opcodes_h_l1287_c2_dbda : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1287_c2_dbda_cond,
n16_MUX_uxn_opcodes_h_l1287_c2_dbda_iftrue,
n16_MUX_uxn_opcodes_h_l1287_c2_dbda_iffalse,
n16_MUX_uxn_opcodes_h_l1287_c2_dbda_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1287_c2_dbda
result_is_stack_write_MUX_uxn_opcodes_h_l1287_c2_dbda : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1287_c2_dbda_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1287_c2_dbda_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1287_c2_dbda_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1287_c2_dbda_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c2_dbda
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c2_dbda : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c2_dbda_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c2_dbda_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c2_dbda_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c2_dbda_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1287_c2_dbda
result_sp_relative_shift_MUX_uxn_opcodes_h_l1287_c2_dbda : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1287_c2_dbda_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1287_c2_dbda_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1287_c2_dbda_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1287_c2_dbda_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1287_c2_dbda
result_is_opc_done_MUX_uxn_opcodes_h_l1287_c2_dbda : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1287_c2_dbda_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1287_c2_dbda_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1287_c2_dbda_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1287_c2_dbda_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1287_c2_dbda
result_stack_value_MUX_uxn_opcodes_h_l1287_c2_dbda : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1287_c2_dbda_cond,
result_stack_value_MUX_uxn_opcodes_h_l1287_c2_dbda_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1287_c2_dbda_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1287_c2_dbda_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c2_dbda
result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c2_dbda : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c2_dbda_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c2_dbda_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c2_dbda_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c2_dbda_return_output);

-- t16_MUX_uxn_opcodes_h_l1287_c2_dbda
t16_MUX_uxn_opcodes_h_l1287_c2_dbda : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1287_c2_dbda_cond,
t16_MUX_uxn_opcodes_h_l1287_c2_dbda_iftrue,
t16_MUX_uxn_opcodes_h_l1287_c2_dbda_iffalse,
t16_MUX_uxn_opcodes_h_l1287_c2_dbda_return_output);

-- printf_uxn_opcodes_h_l1288_c3_c87e_uxn_opcodes_h_l1288_c3_c87e
printf_uxn_opcodes_h_l1288_c3_c87e_uxn_opcodes_h_l1288_c3_c87e : entity work.printf_uxn_opcodes_h_l1288_c3_c87e_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1288_c3_c87e_uxn_opcodes_h_l1288_c3_c87e_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1292_c11_9118
BIN_OP_EQ_uxn_opcodes_h_l1292_c11_9118 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1292_c11_9118_left,
BIN_OP_EQ_uxn_opcodes_h_l1292_c11_9118_right,
BIN_OP_EQ_uxn_opcodes_h_l1292_c11_9118_return_output);

-- n16_MUX_uxn_opcodes_h_l1292_c7_0a1b
n16_MUX_uxn_opcodes_h_l1292_c7_0a1b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1292_c7_0a1b_cond,
n16_MUX_uxn_opcodes_h_l1292_c7_0a1b_iftrue,
n16_MUX_uxn_opcodes_h_l1292_c7_0a1b_iffalse,
n16_MUX_uxn_opcodes_h_l1292_c7_0a1b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1292_c7_0a1b
result_is_stack_write_MUX_uxn_opcodes_h_l1292_c7_0a1b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1292_c7_0a1b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1292_c7_0a1b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1292_c7_0a1b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1292_c7_0a1b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1292_c7_0a1b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1292_c7_0a1b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1292_c7_0a1b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1292_c7_0a1b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1292_c7_0a1b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1292_c7_0a1b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1292_c7_0a1b
result_sp_relative_shift_MUX_uxn_opcodes_h_l1292_c7_0a1b : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1292_c7_0a1b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1292_c7_0a1b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1292_c7_0a1b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1292_c7_0a1b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1292_c7_0a1b
result_is_opc_done_MUX_uxn_opcodes_h_l1292_c7_0a1b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1292_c7_0a1b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1292_c7_0a1b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1292_c7_0a1b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1292_c7_0a1b_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1292_c7_0a1b
result_stack_value_MUX_uxn_opcodes_h_l1292_c7_0a1b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1292_c7_0a1b_cond,
result_stack_value_MUX_uxn_opcodes_h_l1292_c7_0a1b_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1292_c7_0a1b_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1292_c7_0a1b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1292_c7_0a1b
result_is_sp_shift_MUX_uxn_opcodes_h_l1292_c7_0a1b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1292_c7_0a1b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1292_c7_0a1b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1292_c7_0a1b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1292_c7_0a1b_return_output);

-- t16_MUX_uxn_opcodes_h_l1292_c7_0a1b
t16_MUX_uxn_opcodes_h_l1292_c7_0a1b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1292_c7_0a1b_cond,
t16_MUX_uxn_opcodes_h_l1292_c7_0a1b_iftrue,
t16_MUX_uxn_opcodes_h_l1292_c7_0a1b_iffalse,
t16_MUX_uxn_opcodes_h_l1292_c7_0a1b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1295_c11_e3d9
BIN_OP_EQ_uxn_opcodes_h_l1295_c11_e3d9 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1295_c11_e3d9_left,
BIN_OP_EQ_uxn_opcodes_h_l1295_c11_e3d9_right,
BIN_OP_EQ_uxn_opcodes_h_l1295_c11_e3d9_return_output);

-- n16_MUX_uxn_opcodes_h_l1295_c7_2896
n16_MUX_uxn_opcodes_h_l1295_c7_2896 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1295_c7_2896_cond,
n16_MUX_uxn_opcodes_h_l1295_c7_2896_iftrue,
n16_MUX_uxn_opcodes_h_l1295_c7_2896_iffalse,
n16_MUX_uxn_opcodes_h_l1295_c7_2896_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1295_c7_2896
result_is_stack_write_MUX_uxn_opcodes_h_l1295_c7_2896 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1295_c7_2896_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1295_c7_2896_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1295_c7_2896_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1295_c7_2896_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1295_c7_2896
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1295_c7_2896 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1295_c7_2896_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1295_c7_2896_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1295_c7_2896_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1295_c7_2896_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1295_c7_2896
result_sp_relative_shift_MUX_uxn_opcodes_h_l1295_c7_2896 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1295_c7_2896_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1295_c7_2896_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1295_c7_2896_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1295_c7_2896_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1295_c7_2896
result_is_opc_done_MUX_uxn_opcodes_h_l1295_c7_2896 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1295_c7_2896_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1295_c7_2896_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1295_c7_2896_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1295_c7_2896_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1295_c7_2896
result_stack_value_MUX_uxn_opcodes_h_l1295_c7_2896 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1295_c7_2896_cond,
result_stack_value_MUX_uxn_opcodes_h_l1295_c7_2896_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1295_c7_2896_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1295_c7_2896_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1295_c7_2896
result_is_sp_shift_MUX_uxn_opcodes_h_l1295_c7_2896 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1295_c7_2896_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1295_c7_2896_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1295_c7_2896_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1295_c7_2896_return_output);

-- t16_MUX_uxn_opcodes_h_l1295_c7_2896
t16_MUX_uxn_opcodes_h_l1295_c7_2896 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1295_c7_2896_cond,
t16_MUX_uxn_opcodes_h_l1295_c7_2896_iftrue,
t16_MUX_uxn_opcodes_h_l1295_c7_2896_iffalse,
t16_MUX_uxn_opcodes_h_l1295_c7_2896_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1300_c11_9a73
BIN_OP_EQ_uxn_opcodes_h_l1300_c11_9a73 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1300_c11_9a73_left,
BIN_OP_EQ_uxn_opcodes_h_l1300_c11_9a73_right,
BIN_OP_EQ_uxn_opcodes_h_l1300_c11_9a73_return_output);

-- n16_MUX_uxn_opcodes_h_l1300_c7_592d
n16_MUX_uxn_opcodes_h_l1300_c7_592d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1300_c7_592d_cond,
n16_MUX_uxn_opcodes_h_l1300_c7_592d_iftrue,
n16_MUX_uxn_opcodes_h_l1300_c7_592d_iffalse,
n16_MUX_uxn_opcodes_h_l1300_c7_592d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_592d
result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_592d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_592d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_592d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_592d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_592d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_592d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_592d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_592d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_592d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_592d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_592d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_592d
result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_592d : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_592d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_592d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_592d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_592d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_592d
result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_592d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_592d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_592d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_592d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_592d_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1300_c7_592d
result_stack_value_MUX_uxn_opcodes_h_l1300_c7_592d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1300_c7_592d_cond,
result_stack_value_MUX_uxn_opcodes_h_l1300_c7_592d_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1300_c7_592d_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1300_c7_592d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_592d
result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_592d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_592d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_592d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_592d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_592d_return_output);

-- t16_MUX_uxn_opcodes_h_l1300_c7_592d
t16_MUX_uxn_opcodes_h_l1300_c7_592d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1300_c7_592d_cond,
t16_MUX_uxn_opcodes_h_l1300_c7_592d_iftrue,
t16_MUX_uxn_opcodes_h_l1300_c7_592d_iffalse,
t16_MUX_uxn_opcodes_h_l1300_c7_592d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1303_c11_640d
BIN_OP_EQ_uxn_opcodes_h_l1303_c11_640d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1303_c11_640d_left,
BIN_OP_EQ_uxn_opcodes_h_l1303_c11_640d_right,
BIN_OP_EQ_uxn_opcodes_h_l1303_c11_640d_return_output);

-- n16_MUX_uxn_opcodes_h_l1303_c7_2d6b
n16_MUX_uxn_opcodes_h_l1303_c7_2d6b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1303_c7_2d6b_cond,
n16_MUX_uxn_opcodes_h_l1303_c7_2d6b_iftrue,
n16_MUX_uxn_opcodes_h_l1303_c7_2d6b_iffalse,
n16_MUX_uxn_opcodes_h_l1303_c7_2d6b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_2d6b
result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_2d6b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_2d6b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_2d6b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_2d6b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_2d6b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_2d6b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_2d6b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_2d6b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_2d6b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_2d6b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_2d6b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_2d6b
result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_2d6b : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_2d6b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_2d6b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_2d6b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_2d6b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_2d6b
result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_2d6b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_2d6b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_2d6b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_2d6b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_2d6b_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1303_c7_2d6b
result_stack_value_MUX_uxn_opcodes_h_l1303_c7_2d6b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1303_c7_2d6b_cond,
result_stack_value_MUX_uxn_opcodes_h_l1303_c7_2d6b_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1303_c7_2d6b_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1303_c7_2d6b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1303_c7_2d6b
result_is_sp_shift_MUX_uxn_opcodes_h_l1303_c7_2d6b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1303_c7_2d6b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1303_c7_2d6b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1303_c7_2d6b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1303_c7_2d6b_return_output);

-- t16_MUX_uxn_opcodes_h_l1303_c7_2d6b
t16_MUX_uxn_opcodes_h_l1303_c7_2d6b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1303_c7_2d6b_cond,
t16_MUX_uxn_opcodes_h_l1303_c7_2d6b_iftrue,
t16_MUX_uxn_opcodes_h_l1303_c7_2d6b_iffalse,
t16_MUX_uxn_opcodes_h_l1303_c7_2d6b_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1304_c3_648f
BIN_OP_OR_uxn_opcodes_h_l1304_c3_648f : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1304_c3_648f_left,
BIN_OP_OR_uxn_opcodes_h_l1304_c3_648f_right,
BIN_OP_OR_uxn_opcodes_h_l1304_c3_648f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1307_c11_7a1e
BIN_OP_EQ_uxn_opcodes_h_l1307_c11_7a1e : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1307_c11_7a1e_left,
BIN_OP_EQ_uxn_opcodes_h_l1307_c11_7a1e_right,
BIN_OP_EQ_uxn_opcodes_h_l1307_c11_7a1e_return_output);

-- n16_MUX_uxn_opcodes_h_l1307_c7_3e32
n16_MUX_uxn_opcodes_h_l1307_c7_3e32 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1307_c7_3e32_cond,
n16_MUX_uxn_opcodes_h_l1307_c7_3e32_iftrue,
n16_MUX_uxn_opcodes_h_l1307_c7_3e32_iffalse,
n16_MUX_uxn_opcodes_h_l1307_c7_3e32_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_3e32
result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_3e32 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_3e32_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_3e32_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_3e32_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_3e32_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_3e32
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_3e32 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_3e32_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_3e32_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_3e32_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_3e32_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_3e32
result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_3e32 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_3e32_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_3e32_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_3e32_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_3e32_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_3e32
result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_3e32 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_3e32_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_3e32_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_3e32_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_3e32_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1307_c7_3e32
result_stack_value_MUX_uxn_opcodes_h_l1307_c7_3e32 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1307_c7_3e32_cond,
result_stack_value_MUX_uxn_opcodes_h_l1307_c7_3e32_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1307_c7_3e32_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1307_c7_3e32_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1307_c7_3e32
result_is_sp_shift_MUX_uxn_opcodes_h_l1307_c7_3e32 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1307_c7_3e32_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1307_c7_3e32_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1307_c7_3e32_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1307_c7_3e32_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1310_c11_ca6f
BIN_OP_EQ_uxn_opcodes_h_l1310_c11_ca6f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1310_c11_ca6f_left,
BIN_OP_EQ_uxn_opcodes_h_l1310_c11_ca6f_right,
BIN_OP_EQ_uxn_opcodes_h_l1310_c11_ca6f_return_output);

-- n16_MUX_uxn_opcodes_h_l1310_c7_661d
n16_MUX_uxn_opcodes_h_l1310_c7_661d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1310_c7_661d_cond,
n16_MUX_uxn_opcodes_h_l1310_c7_661d_iftrue,
n16_MUX_uxn_opcodes_h_l1310_c7_661d_iffalse,
n16_MUX_uxn_opcodes_h_l1310_c7_661d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_661d
result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_661d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_661d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_661d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_661d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_661d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_661d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_661d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_661d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_661d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_661d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_661d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_661d
result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_661d : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_661d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_661d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_661d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_661d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_661d
result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_661d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_661d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_661d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_661d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_661d_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1310_c7_661d
result_stack_value_MUX_uxn_opcodes_h_l1310_c7_661d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1310_c7_661d_cond,
result_stack_value_MUX_uxn_opcodes_h_l1310_c7_661d_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1310_c7_661d_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1310_c7_661d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1310_c7_661d
result_is_sp_shift_MUX_uxn_opcodes_h_l1310_c7_661d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1310_c7_661d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1310_c7_661d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1310_c7_661d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1310_c7_661d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1315_c11_4d4a
BIN_OP_EQ_uxn_opcodes_h_l1315_c11_4d4a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1315_c11_4d4a_left,
BIN_OP_EQ_uxn_opcodes_h_l1315_c11_4d4a_right,
BIN_OP_EQ_uxn_opcodes_h_l1315_c11_4d4a_return_output);

-- n16_MUX_uxn_opcodes_h_l1315_c7_823e
n16_MUX_uxn_opcodes_h_l1315_c7_823e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1315_c7_823e_cond,
n16_MUX_uxn_opcodes_h_l1315_c7_823e_iftrue,
n16_MUX_uxn_opcodes_h_l1315_c7_823e_iffalse,
n16_MUX_uxn_opcodes_h_l1315_c7_823e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1315_c7_823e
result_is_stack_write_MUX_uxn_opcodes_h_l1315_c7_823e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1315_c7_823e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1315_c7_823e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1315_c7_823e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1315_c7_823e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1315_c7_823e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1315_c7_823e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1315_c7_823e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1315_c7_823e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1315_c7_823e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1315_c7_823e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1315_c7_823e
result_sp_relative_shift_MUX_uxn_opcodes_h_l1315_c7_823e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1315_c7_823e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1315_c7_823e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1315_c7_823e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1315_c7_823e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1315_c7_823e
result_is_opc_done_MUX_uxn_opcodes_h_l1315_c7_823e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1315_c7_823e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1315_c7_823e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1315_c7_823e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1315_c7_823e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1315_c7_823e
result_stack_value_MUX_uxn_opcodes_h_l1315_c7_823e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1315_c7_823e_cond,
result_stack_value_MUX_uxn_opcodes_h_l1315_c7_823e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1315_c7_823e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1315_c7_823e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1315_c7_823e
result_is_sp_shift_MUX_uxn_opcodes_h_l1315_c7_823e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1315_c7_823e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1315_c7_823e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1315_c7_823e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1315_c7_823e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1318_c11_e50a
BIN_OP_EQ_uxn_opcodes_h_l1318_c11_e50a : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1318_c11_e50a_left,
BIN_OP_EQ_uxn_opcodes_h_l1318_c11_e50a_right,
BIN_OP_EQ_uxn_opcodes_h_l1318_c11_e50a_return_output);

-- n16_MUX_uxn_opcodes_h_l1318_c7_ac14
n16_MUX_uxn_opcodes_h_l1318_c7_ac14 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1318_c7_ac14_cond,
n16_MUX_uxn_opcodes_h_l1318_c7_ac14_iftrue,
n16_MUX_uxn_opcodes_h_l1318_c7_ac14_iffalse,
n16_MUX_uxn_opcodes_h_l1318_c7_ac14_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1318_c7_ac14
result_is_stack_write_MUX_uxn_opcodes_h_l1318_c7_ac14 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1318_c7_ac14_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1318_c7_ac14_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1318_c7_ac14_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1318_c7_ac14_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1318_c7_ac14
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1318_c7_ac14 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1318_c7_ac14_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1318_c7_ac14_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1318_c7_ac14_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1318_c7_ac14_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1318_c7_ac14
result_sp_relative_shift_MUX_uxn_opcodes_h_l1318_c7_ac14 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1318_c7_ac14_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1318_c7_ac14_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1318_c7_ac14_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1318_c7_ac14_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1318_c7_ac14
result_is_opc_done_MUX_uxn_opcodes_h_l1318_c7_ac14 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1318_c7_ac14_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1318_c7_ac14_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1318_c7_ac14_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1318_c7_ac14_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1318_c7_ac14
result_stack_value_MUX_uxn_opcodes_h_l1318_c7_ac14 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1318_c7_ac14_cond,
result_stack_value_MUX_uxn_opcodes_h_l1318_c7_ac14_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1318_c7_ac14_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1318_c7_ac14_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1318_c7_ac14
result_is_sp_shift_MUX_uxn_opcodes_h_l1318_c7_ac14 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1318_c7_ac14_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1318_c7_ac14_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1318_c7_ac14_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1318_c7_ac14_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1319_c3_4ab1
BIN_OP_OR_uxn_opcodes_h_l1319_c3_4ab1 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1319_c3_4ab1_left,
BIN_OP_OR_uxn_opcodes_h_l1319_c3_4ab1_right,
BIN_OP_OR_uxn_opcodes_h_l1319_c3_4ab1_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1321_c32_cf10
BIN_OP_AND_uxn_opcodes_h_l1321_c32_cf10 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1321_c32_cf10_left,
BIN_OP_AND_uxn_opcodes_h_l1321_c32_cf10_right,
BIN_OP_AND_uxn_opcodes_h_l1321_c32_cf10_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1321_c32_ae68
BIN_OP_GT_uxn_opcodes_h_l1321_c32_ae68 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1321_c32_ae68_left,
BIN_OP_GT_uxn_opcodes_h_l1321_c32_ae68_right,
BIN_OP_GT_uxn_opcodes_h_l1321_c32_ae68_return_output);

-- MUX_uxn_opcodes_h_l1321_c32_a73e
MUX_uxn_opcodes_h_l1321_c32_a73e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1321_c32_a73e_cond,
MUX_uxn_opcodes_h_l1321_c32_a73e_iftrue,
MUX_uxn_opcodes_h_l1321_c32_a73e_iffalse,
MUX_uxn_opcodes_h_l1321_c32_a73e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1323_c11_8ab6
BIN_OP_EQ_uxn_opcodes_h_l1323_c11_8ab6 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1323_c11_8ab6_left,
BIN_OP_EQ_uxn_opcodes_h_l1323_c11_8ab6_right,
BIN_OP_EQ_uxn_opcodes_h_l1323_c11_8ab6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_7ed8
result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_7ed8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_7ed8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_7ed8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_7ed8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_7ed8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c7_7ed8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c7_7ed8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c7_7ed8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c7_7ed8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c7_7ed8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c7_7ed8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_7ed8
result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_7ed8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_7ed8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_7ed8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_7ed8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_7ed8_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1323_c7_7ed8
result_stack_value_MUX_uxn_opcodes_h_l1323_c7_7ed8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1323_c7_7ed8_cond,
result_stack_value_MUX_uxn_opcodes_h_l1323_c7_7ed8_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1323_c7_7ed8_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1323_c7_7ed8_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1323_c7_7ed8
result_is_sp_shift_MUX_uxn_opcodes_h_l1323_c7_7ed8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1323_c7_7ed8_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1323_c7_7ed8_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1323_c7_7ed8_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1323_c7_7ed8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1327_c24_05e8
BIN_OP_EQ_uxn_opcodes_h_l1327_c24_05e8 : entity work.BIN_OP_EQ_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1327_c24_05e8_left,
BIN_OP_EQ_uxn_opcodes_h_l1327_c24_05e8_right,
BIN_OP_EQ_uxn_opcodes_h_l1327_c24_05e8_return_output);

-- MUX_uxn_opcodes_h_l1327_c24_7bf7
MUX_uxn_opcodes_h_l1327_c24_7bf7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1327_c24_7bf7_cond,
MUX_uxn_opcodes_h_l1327_c24_7bf7_iftrue,
MUX_uxn_opcodes_h_l1327_c24_7bf7_iffalse,
MUX_uxn_opcodes_h_l1327_c24_7bf7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1329_c11_bcc2
BIN_OP_EQ_uxn_opcodes_h_l1329_c11_bcc2 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1329_c11_bcc2_left,
BIN_OP_EQ_uxn_opcodes_h_l1329_c11_bcc2_right,
BIN_OP_EQ_uxn_opcodes_h_l1329_c11_bcc2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1329_c7_b0c9
result_is_stack_write_MUX_uxn_opcodes_h_l1329_c7_b0c9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1329_c7_b0c9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1329_c7_b0c9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1329_c7_b0c9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1329_c7_b0c9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1329_c7_b0c9
result_is_opc_done_MUX_uxn_opcodes_h_l1329_c7_b0c9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1329_c7_b0c9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1329_c7_b0c9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1329_c7_b0c9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1329_c7_b0c9_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1297_l1312_DUPLICATE_dd7f
CONST_SL_8_uint16_t_uxn_opcodes_h_l1297_l1312_DUPLICATE_dd7f : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1297_l1312_DUPLICATE_dd7f_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1297_l1312_DUPLICATE_dd7f_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1287_c6_b035_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1287_c1_2b75_return_output,
 n16_MUX_uxn_opcodes_h_l1287_c2_dbda_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1287_c2_dbda_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c2_dbda_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1287_c2_dbda_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1287_c2_dbda_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1287_c2_dbda_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c2_dbda_return_output,
 t16_MUX_uxn_opcodes_h_l1287_c2_dbda_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1292_c11_9118_return_output,
 n16_MUX_uxn_opcodes_h_l1292_c7_0a1b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1292_c7_0a1b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1292_c7_0a1b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1292_c7_0a1b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1292_c7_0a1b_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1292_c7_0a1b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1292_c7_0a1b_return_output,
 t16_MUX_uxn_opcodes_h_l1292_c7_0a1b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1295_c11_e3d9_return_output,
 n16_MUX_uxn_opcodes_h_l1295_c7_2896_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1295_c7_2896_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1295_c7_2896_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1295_c7_2896_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1295_c7_2896_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1295_c7_2896_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1295_c7_2896_return_output,
 t16_MUX_uxn_opcodes_h_l1295_c7_2896_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1300_c11_9a73_return_output,
 n16_MUX_uxn_opcodes_h_l1300_c7_592d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_592d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_592d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_592d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_592d_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1300_c7_592d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_592d_return_output,
 t16_MUX_uxn_opcodes_h_l1300_c7_592d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1303_c11_640d_return_output,
 n16_MUX_uxn_opcodes_h_l1303_c7_2d6b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_2d6b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_2d6b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_2d6b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_2d6b_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1303_c7_2d6b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1303_c7_2d6b_return_output,
 t16_MUX_uxn_opcodes_h_l1303_c7_2d6b_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1304_c3_648f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1307_c11_7a1e_return_output,
 n16_MUX_uxn_opcodes_h_l1307_c7_3e32_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_3e32_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_3e32_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_3e32_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_3e32_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1307_c7_3e32_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1307_c7_3e32_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1310_c11_ca6f_return_output,
 n16_MUX_uxn_opcodes_h_l1310_c7_661d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_661d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_661d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_661d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_661d_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1310_c7_661d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1310_c7_661d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1315_c11_4d4a_return_output,
 n16_MUX_uxn_opcodes_h_l1315_c7_823e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1315_c7_823e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1315_c7_823e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1315_c7_823e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1315_c7_823e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1315_c7_823e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1315_c7_823e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1318_c11_e50a_return_output,
 n16_MUX_uxn_opcodes_h_l1318_c7_ac14_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1318_c7_ac14_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1318_c7_ac14_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1318_c7_ac14_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1318_c7_ac14_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1318_c7_ac14_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1318_c7_ac14_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1319_c3_4ab1_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1321_c32_cf10_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1321_c32_ae68_return_output,
 MUX_uxn_opcodes_h_l1321_c32_a73e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1323_c11_8ab6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_7ed8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c7_7ed8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_7ed8_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1323_c7_7ed8_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1323_c7_7ed8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1327_c24_05e8_return_output,
 MUX_uxn_opcodes_h_l1327_c24_7bf7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1329_c11_bcc2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1329_c7_b0c9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1329_c7_b0c9_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1297_l1312_DUPLICATE_dd7f_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1287_c6_b035_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1287_c6_b035_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1287_c6_b035_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1287_c1_2b75_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1287_c1_2b75_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1287_c1_2b75_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1287_c1_2b75_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1287_c2_dbda_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1287_c2_dbda_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1292_c7_0a1b_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1287_c2_dbda_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1287_c2_dbda_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1287_c2_dbda_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1287_c2_dbda_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1292_c7_0a1b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1287_c2_dbda_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1287_c2_dbda_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c2_dbda_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1289_c3_3ee5 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c2_dbda_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1292_c7_0a1b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c2_dbda_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c2_dbda_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1287_c2_dbda_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1287_c2_dbda_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1292_c7_0a1b_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1287_c2_dbda_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1287_c2_dbda_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1287_c2_dbda_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1287_c2_dbda_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1292_c7_0a1b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1287_c2_dbda_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1287_c2_dbda_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1287_c2_dbda_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1287_c2_dbda_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1292_c7_0a1b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1287_c2_dbda_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1287_c2_dbda_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c2_dbda_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c2_dbda_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1292_c7_0a1b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c2_dbda_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c2_dbda_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1287_c2_dbda_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1287_c2_dbda_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1292_c7_0a1b_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1287_c2_dbda_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1287_c2_dbda_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1288_c3_c87e_uxn_opcodes_h_l1288_c3_c87e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1292_c11_9118_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1292_c11_9118_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1292_c11_9118_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1292_c7_0a1b_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1292_c7_0a1b_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1295_c7_2896_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1292_c7_0a1b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1292_c7_0a1b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1292_c7_0a1b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1295_c7_2896_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1292_c7_0a1b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1292_c7_0a1b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1293_c3_f927 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1292_c7_0a1b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1295_c7_2896_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1292_c7_0a1b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1292_c7_0a1b_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1292_c7_0a1b_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1295_c7_2896_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1292_c7_0a1b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1292_c7_0a1b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1292_c7_0a1b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1295_c7_2896_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1292_c7_0a1b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1292_c7_0a1b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1292_c7_0a1b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1295_c7_2896_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1292_c7_0a1b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1292_c7_0a1b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1292_c7_0a1b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1295_c7_2896_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1292_c7_0a1b_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1292_c7_0a1b_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1292_c7_0a1b_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1295_c7_2896_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1292_c7_0a1b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1295_c11_e3d9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1295_c11_e3d9_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1295_c11_e3d9_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1295_c7_2896_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1295_c7_2896_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1300_c7_592d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1295_c7_2896_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1295_c7_2896_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1295_c7_2896_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_592d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1295_c7_2896_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1295_c7_2896_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1298_c3_237f : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1295_c7_2896_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_592d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1295_c7_2896_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1295_c7_2896_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1295_c7_2896_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_592d_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1295_c7_2896_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1295_c7_2896_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1295_c7_2896_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_592d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1295_c7_2896_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1295_c7_2896_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1295_c7_2896_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1300_c7_592d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1295_c7_2896_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1295_c7_2896_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1295_c7_2896_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_592d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1295_c7_2896_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1295_c7_2896_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1295_c7_2896_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1300_c7_592d_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1295_c7_2896_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1300_c11_9a73_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1300_c11_9a73_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1300_c11_9a73_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1300_c7_592d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1300_c7_592d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1303_c7_2d6b_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1300_c7_592d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_592d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_592d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_2d6b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_592d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_592d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1301_c3_3655 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_592d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_2d6b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_592d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_592d_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_592d_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_2d6b_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_592d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_592d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_592d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_2d6b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_592d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1300_c7_592d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1300_c7_592d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1303_c7_2d6b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1300_c7_592d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_592d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_592d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1303_c7_2d6b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_592d_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1300_c7_592d_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1300_c7_592d_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1303_c7_2d6b_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1300_c7_592d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1303_c11_640d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1303_c11_640d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1303_c11_640d_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1303_c7_2d6b_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1303_c7_2d6b_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1307_c7_3e32_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1303_c7_2d6b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_2d6b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_2d6b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_3e32_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_2d6b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_2d6b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1305_c3_1d30 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_2d6b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_3e32_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_2d6b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_2d6b_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_2d6b_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_3e32_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_2d6b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_2d6b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_2d6b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_3e32_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_2d6b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1303_c7_2d6b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1303_c7_2d6b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1307_c7_3e32_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1303_c7_2d6b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1303_c7_2d6b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1303_c7_2d6b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1307_c7_3e32_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1303_c7_2d6b_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1303_c7_2d6b_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1303_c7_2d6b_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1303_c7_2d6b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1304_c3_648f_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1304_c3_648f_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1304_c3_648f_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_7a1e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_7a1e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_7a1e_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1307_c7_3e32_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1307_c7_3e32_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1310_c7_661d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1307_c7_3e32_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_3e32_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_3e32_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_661d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_3e32_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_3e32_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1308_c3_57a9 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_3e32_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_661d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_3e32_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_3e32_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_3e32_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_661d_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_3e32_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_3e32_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_3e32_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_661d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_3e32_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1307_c7_3e32_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1307_c7_3e32_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1310_c7_661d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1307_c7_3e32_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1307_c7_3e32_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1307_c7_3e32_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1310_c7_661d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1307_c7_3e32_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1310_c11_ca6f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1310_c11_ca6f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1310_c11_ca6f_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1310_c7_661d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1310_c7_661d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1315_c7_823e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1310_c7_661d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_661d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_661d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1315_c7_823e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_661d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_661d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1313_c3_9f45 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_661d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1315_c7_823e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_661d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_661d_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_661d_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1315_c7_823e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_661d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_661d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_661d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1315_c7_823e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_661d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1310_c7_661d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1310_c7_661d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1315_c7_823e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1310_c7_661d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1310_c7_661d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1310_c7_661d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1315_c7_823e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1310_c7_661d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1315_c11_4d4a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1315_c11_4d4a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1315_c11_4d4a_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1315_c7_823e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1315_c7_823e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1318_c7_ac14_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1315_c7_823e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1315_c7_823e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1315_c7_823e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1318_c7_ac14_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1315_c7_823e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1315_c7_823e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1316_c3_7c66 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1315_c7_823e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1318_c7_ac14_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1315_c7_823e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1315_c7_823e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1315_c7_823e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1318_c7_ac14_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1315_c7_823e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1315_c7_823e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1315_c7_823e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1318_c7_ac14_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1315_c7_823e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1315_c7_823e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1315_c7_823e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1318_c7_ac14_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1315_c7_823e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1315_c7_823e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1315_c7_823e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1318_c7_ac14_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1315_c7_823e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1318_c11_e50a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1318_c11_e50a_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1318_c11_e50a_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1318_c7_ac14_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1318_c7_ac14_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1318_c7_ac14_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1318_c7_ac14_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1318_c7_ac14_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_7ed8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1318_c7_ac14_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1318_c7_ac14_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1318_c7_ac14_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c7_7ed8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1318_c7_ac14_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1318_c7_ac14_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1318_c7_ac14_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1318_c7_ac14_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1318_c7_ac14_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1318_c7_ac14_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_7ed8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1318_c7_ac14_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1318_c7_ac14_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1318_c7_ac14_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1323_c7_7ed8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1318_c7_ac14_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1318_c7_ac14_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1318_c7_ac14_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1323_c7_7ed8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1318_c7_ac14_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1319_c3_4ab1_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1319_c3_4ab1_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1319_c3_4ab1_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1321_c32_a73e_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1321_c32_a73e_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1321_c32_a73e_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1321_c32_cf10_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1321_c32_cf10_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1321_c32_cf10_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1321_c32_ae68_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1321_c32_ae68_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1321_c32_ae68_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1321_c32_a73e_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1323_c11_8ab6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1323_c11_8ab6_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1323_c11_8ab6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_7ed8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_7ed8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1329_c7_b0c9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_7ed8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c7_7ed8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1326_c3_9da3 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c7_7ed8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c7_7ed8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_7ed8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_7ed8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1329_c7_b0c9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_7ed8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1323_c7_7ed8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1323_c7_7ed8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1323_c7_7ed8_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1323_c7_7ed8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1323_c7_7ed8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1323_c7_7ed8_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1327_c24_7bf7_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1327_c24_7bf7_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1327_c24_7bf7_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1327_c24_05e8_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1327_c24_05e8_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1327_c24_05e8_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1327_c24_7bf7_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1329_c11_bcc2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1329_c11_bcc2_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1329_c11_bcc2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1329_c7_b0c9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1329_c7_b0c9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1329_c7_b0c9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1329_c7_b0c9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1329_c7_b0c9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1329_c7_b0c9_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1307_l1303_l1329_l1300_l1295_l1318_l1292_l1315_l1287_l1310_DUPLICATE_04da_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1307_l1303_l1300_l1295_l1318_l1292_l1315_l1287_l1310_DUPLICATE_df08_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1307_l1303_l1300_l1323_l1295_l1318_l1292_l1315_l1287_l1310_DUPLICATE_cf4a_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1307_l1303_l1300_l1323_l1295_l1292_l1315_l1287_l1310_DUPLICATE_5ca6_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1307_l1303_l1329_l1300_l1323_l1295_l1318_l1292_l1315_l1310_DUPLICATE_d93e_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1296_l1304_l1319_l1311_DUPLICATE_3f5f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1297_l1312_DUPLICATE_dd7f_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1297_l1312_DUPLICATE_dd7f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1318_l1323_DUPLICATE_6919_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l1334_l1283_DUPLICATE_e614_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1313_c3_9f45 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_661d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1313_c3_9f45;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1293_c3_f927 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1292_c7_0a1b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1293_c3_f927;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_7a1e_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1287_c6_b035_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1316_c3_7c66 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1315_c7_823e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1316_c3_7c66;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1321_c32_cf10_right := to_unsigned(128, 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1326_c3_9da3 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c7_7ed8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1326_c3_9da3;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1329_c7_b0c9_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1315_c11_4d4a_right := to_unsigned(7, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1305_c3_1d30 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_2d6b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1305_c3_1d30;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1300_c11_9a73_right := to_unsigned(3, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1318_c7_ac14_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1287_c1_2b75_iffalse := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1329_c7_b0c9_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1303_c11_640d_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1318_c11_e50a_right := to_unsigned(8, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1308_c3_57a9 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_3e32_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1308_c3_57a9;
     VAR_MUX_uxn_opcodes_h_l1321_c32_a73e_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1310_c11_ca6f_right := to_unsigned(6, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1287_c2_dbda_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1323_c11_8ab6_right := to_unsigned(9, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1329_c11_bcc2_right := to_unsigned(10, 4);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1323_c7_7ed8_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1295_c11_e3d9_right := to_unsigned(2, 2);
     VAR_MUX_uxn_opcodes_h_l1321_c32_a73e_iffalse := resize(to_signed(-3, 3), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1289_c3_3ee5 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c2_dbda_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1289_c3_3ee5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1292_c11_9118_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1298_c3_237f := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1295_c7_2896_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1298_c3_237f;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1301_c3_3655 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_592d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1301_c3_3655;
     VAR_MUX_uxn_opcodes_h_l1327_c24_7bf7_iftrue := resize(to_unsigned(1, 1), 8);
     VAR_BIN_OP_GT_uxn_opcodes_h_l1321_c32_ae68_right := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1327_c24_7bf7_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_7ed8_iftrue := to_unsigned(1, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1287_c1_2b75_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1321_c32_cf10_left := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1327_c24_05e8_left := n16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1319_c3_4ab1_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1287_c2_dbda_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1292_c7_0a1b_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1295_c7_2896_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1300_c7_592d_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1303_c7_2d6b_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1307_c7_3e32_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1315_c7_823e_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1318_c7_ac14_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1287_c6_b035_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1292_c11_9118_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1295_c11_e3d9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1300_c11_9a73_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1303_c11_640d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_7a1e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1310_c11_ca6f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1315_c11_4d4a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1318_c11_e50a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1323_c11_8ab6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1329_c11_bcc2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1327_c24_05e8_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1304_c3_648f_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1287_c2_dbda_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1292_c7_0a1b_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1300_c7_592d_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1303_c7_2d6b_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l1307_c11_7a1e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1307_c11_7a1e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_7a1e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1307_c11_7a1e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_7a1e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_7a1e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1307_c11_7a1e_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1307_l1303_l1300_l1323_l1295_l1292_l1315_l1287_l1310_DUPLICATE_5ca6 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1307_l1303_l1300_l1323_l1295_l1292_l1315_l1287_l1310_DUPLICATE_5ca6_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1307_l1303_l1300_l1323_l1295_l1318_l1292_l1315_l1287_l1310_DUPLICATE_cf4a LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1307_l1303_l1300_l1323_l1295_l1318_l1292_l1315_l1287_l1310_DUPLICATE_cf4a_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1318_c11_e50a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1318_c11_e50a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1318_c11_e50a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1318_c11_e50a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1318_c11_e50a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1318_c11_e50a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1318_c11_e50a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1300_c11_9a73] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1300_c11_9a73_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1300_c11_9a73_left;
     BIN_OP_EQ_uxn_opcodes_h_l1300_c11_9a73_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1300_c11_9a73_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1300_c11_9a73_return_output := BIN_OP_EQ_uxn_opcodes_h_l1300_c11_9a73_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1287_c6_b035] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1287_c6_b035_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1287_c6_b035_left;
     BIN_OP_EQ_uxn_opcodes_h_l1287_c6_b035_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1287_c6_b035_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1287_c6_b035_return_output := BIN_OP_EQ_uxn_opcodes_h_l1287_c6_b035_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1327_c24_05e8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1327_c24_05e8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1327_c24_05e8_left;
     BIN_OP_EQ_uxn_opcodes_h_l1327_c24_05e8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1327_c24_05e8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1327_c24_05e8_return_output := BIN_OP_EQ_uxn_opcodes_h_l1327_c24_05e8_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l1321_c32_cf10] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1321_c32_cf10_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1321_c32_cf10_left;
     BIN_OP_AND_uxn_opcodes_h_l1321_c32_cf10_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1321_c32_cf10_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1321_c32_cf10_return_output := BIN_OP_AND_uxn_opcodes_h_l1321_c32_cf10_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1323_c11_8ab6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1323_c11_8ab6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1323_c11_8ab6_left;
     BIN_OP_EQ_uxn_opcodes_h_l1323_c11_8ab6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1323_c11_8ab6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1323_c11_8ab6_return_output := BIN_OP_EQ_uxn_opcodes_h_l1323_c11_8ab6_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1307_l1303_l1329_l1300_l1295_l1318_l1292_l1315_l1287_l1310_DUPLICATE_04da LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1307_l1303_l1329_l1300_l1295_l1318_l1292_l1315_l1287_l1310_DUPLICATE_04da_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1303_c11_640d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1303_c11_640d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1303_c11_640d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1303_c11_640d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1303_c11_640d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1303_c11_640d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1303_c11_640d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1329_c11_bcc2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1329_c11_bcc2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1329_c11_bcc2_left;
     BIN_OP_EQ_uxn_opcodes_h_l1329_c11_bcc2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1329_c11_bcc2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1329_c11_bcc2_return_output := BIN_OP_EQ_uxn_opcodes_h_l1329_c11_bcc2_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1318_l1323_DUPLICATE_6919 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1318_l1323_DUPLICATE_6919_return_output := result.stack_address_sp_offset;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1296_l1304_l1319_l1311_DUPLICATE_3f5f LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1296_l1304_l1319_l1311_DUPLICATE_3f5f_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1292_c11_9118] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1292_c11_9118_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1292_c11_9118_left;
     BIN_OP_EQ_uxn_opcodes_h_l1292_c11_9118_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1292_c11_9118_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1292_c11_9118_return_output := BIN_OP_EQ_uxn_opcodes_h_l1292_c11_9118_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1307_l1303_l1329_l1300_l1323_l1295_l1318_l1292_l1315_l1310_DUPLICATE_d93e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1307_l1303_l1329_l1300_l1323_l1295_l1318_l1292_l1315_l1310_DUPLICATE_d93e_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1315_c11_4d4a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1315_c11_4d4a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1315_c11_4d4a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1315_c11_4d4a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1315_c11_4d4a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1315_c11_4d4a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1315_c11_4d4a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1310_c11_ca6f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1310_c11_ca6f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1310_c11_ca6f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1310_c11_ca6f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1310_c11_ca6f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1310_c11_ca6f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1310_c11_ca6f_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1307_l1303_l1300_l1295_l1318_l1292_l1315_l1287_l1310_DUPLICATE_df08 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1307_l1303_l1300_l1295_l1318_l1292_l1315_l1287_l1310_DUPLICATE_df08_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1295_c11_e3d9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1295_c11_e3d9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1295_c11_e3d9_left;
     BIN_OP_EQ_uxn_opcodes_h_l1295_c11_e3d9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1295_c11_e3d9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1295_c11_e3d9_return_output := BIN_OP_EQ_uxn_opcodes_h_l1295_c11_e3d9_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1321_c32_ae68_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1321_c32_cf10_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1287_c1_2b75_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1287_c6_b035_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1287_c2_dbda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1287_c6_b035_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1287_c2_dbda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1287_c6_b035_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c2_dbda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1287_c6_b035_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1287_c2_dbda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1287_c6_b035_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1287_c2_dbda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1287_c6_b035_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c2_dbda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1287_c6_b035_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1287_c2_dbda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1287_c6_b035_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1287_c2_dbda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1287_c6_b035_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1292_c7_0a1b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1292_c11_9118_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1292_c7_0a1b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1292_c11_9118_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1292_c7_0a1b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1292_c11_9118_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1292_c7_0a1b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1292_c11_9118_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1292_c7_0a1b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1292_c11_9118_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1292_c7_0a1b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1292_c11_9118_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1292_c7_0a1b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1292_c11_9118_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1292_c7_0a1b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1292_c11_9118_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1295_c7_2896_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1295_c11_e3d9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1295_c7_2896_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1295_c11_e3d9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1295_c7_2896_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1295_c11_e3d9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1295_c7_2896_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1295_c11_e3d9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1295_c7_2896_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1295_c11_e3d9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1295_c7_2896_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1295_c11_e3d9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1295_c7_2896_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1295_c11_e3d9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1295_c7_2896_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1295_c11_e3d9_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1300_c7_592d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1300_c11_9a73_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_592d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1300_c11_9a73_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_592d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1300_c11_9a73_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_592d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1300_c11_9a73_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_592d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1300_c11_9a73_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_592d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1300_c11_9a73_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1300_c7_592d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1300_c11_9a73_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1300_c7_592d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1300_c11_9a73_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1303_c7_2d6b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1303_c11_640d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_2d6b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1303_c11_640d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1303_c7_2d6b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1303_c11_640d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_2d6b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1303_c11_640d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_2d6b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1303_c11_640d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_2d6b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1303_c11_640d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1303_c7_2d6b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1303_c11_640d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1303_c7_2d6b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1303_c11_640d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1307_c7_3e32_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_7a1e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_3e32_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_7a1e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1307_c7_3e32_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_7a1e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_3e32_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_7a1e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_3e32_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_7a1e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_3e32_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_7a1e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1307_c7_3e32_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_7a1e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1310_c7_661d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1310_c11_ca6f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_661d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1310_c11_ca6f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1310_c7_661d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1310_c11_ca6f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_661d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1310_c11_ca6f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_661d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1310_c11_ca6f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_661d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1310_c11_ca6f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1310_c7_661d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1310_c11_ca6f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1315_c7_823e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1315_c11_4d4a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1315_c7_823e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1315_c11_4d4a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1315_c7_823e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1315_c11_4d4a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1315_c7_823e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1315_c11_4d4a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1315_c7_823e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1315_c11_4d4a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1315_c7_823e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1315_c11_4d4a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1315_c7_823e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1315_c11_4d4a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1318_c7_ac14_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1318_c11_e50a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1318_c7_ac14_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1318_c11_e50a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1318_c7_ac14_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1318_c11_e50a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1318_c7_ac14_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1318_c11_e50a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1318_c7_ac14_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1318_c11_e50a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1318_c7_ac14_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1318_c11_e50a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1318_c7_ac14_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1318_c11_e50a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_7ed8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1323_c11_8ab6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1323_c7_7ed8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1323_c11_8ab6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_7ed8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1323_c11_8ab6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c7_7ed8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1323_c11_8ab6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1323_c7_7ed8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1323_c11_8ab6_return_output;
     VAR_MUX_uxn_opcodes_h_l1327_c24_7bf7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1327_c24_05e8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1329_c7_b0c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1329_c11_bcc2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1329_c7_b0c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1329_c11_bcc2_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1304_c3_648f_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1296_l1304_l1319_l1311_DUPLICATE_3f5f_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1319_c3_4ab1_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1296_l1304_l1319_l1311_DUPLICATE_3f5f_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1297_l1312_DUPLICATE_dd7f_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1296_l1304_l1319_l1311_DUPLICATE_3f5f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1287_c2_dbda_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1307_l1303_l1300_l1295_l1318_l1292_l1315_l1287_l1310_DUPLICATE_df08_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1292_c7_0a1b_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1307_l1303_l1300_l1295_l1318_l1292_l1315_l1287_l1310_DUPLICATE_df08_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1295_c7_2896_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1307_l1303_l1300_l1295_l1318_l1292_l1315_l1287_l1310_DUPLICATE_df08_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_592d_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1307_l1303_l1300_l1295_l1318_l1292_l1315_l1287_l1310_DUPLICATE_df08_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_2d6b_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1307_l1303_l1300_l1295_l1318_l1292_l1315_l1287_l1310_DUPLICATE_df08_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_3e32_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1307_l1303_l1300_l1295_l1318_l1292_l1315_l1287_l1310_DUPLICATE_df08_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_661d_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1307_l1303_l1300_l1295_l1318_l1292_l1315_l1287_l1310_DUPLICATE_df08_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1315_c7_823e_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1307_l1303_l1300_l1295_l1318_l1292_l1315_l1287_l1310_DUPLICATE_df08_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1318_c7_ac14_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1307_l1303_l1300_l1295_l1318_l1292_l1315_l1287_l1310_DUPLICATE_df08_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1292_c7_0a1b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1307_l1303_l1329_l1300_l1323_l1295_l1318_l1292_l1315_l1310_DUPLICATE_d93e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1295_c7_2896_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1307_l1303_l1329_l1300_l1323_l1295_l1318_l1292_l1315_l1310_DUPLICATE_d93e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_592d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1307_l1303_l1329_l1300_l1323_l1295_l1318_l1292_l1315_l1310_DUPLICATE_d93e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_2d6b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1307_l1303_l1329_l1300_l1323_l1295_l1318_l1292_l1315_l1310_DUPLICATE_d93e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_3e32_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1307_l1303_l1329_l1300_l1323_l1295_l1318_l1292_l1315_l1310_DUPLICATE_d93e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_661d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1307_l1303_l1329_l1300_l1323_l1295_l1318_l1292_l1315_l1310_DUPLICATE_d93e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1315_c7_823e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1307_l1303_l1329_l1300_l1323_l1295_l1318_l1292_l1315_l1310_DUPLICATE_d93e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1318_c7_ac14_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1307_l1303_l1329_l1300_l1323_l1295_l1318_l1292_l1315_l1310_DUPLICATE_d93e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_7ed8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1307_l1303_l1329_l1300_l1323_l1295_l1318_l1292_l1315_l1310_DUPLICATE_d93e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1329_c7_b0c9_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1307_l1303_l1329_l1300_l1323_l1295_l1318_l1292_l1315_l1310_DUPLICATE_d93e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c2_dbda_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1307_l1303_l1300_l1323_l1295_l1292_l1315_l1287_l1310_DUPLICATE_5ca6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1292_c7_0a1b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1307_l1303_l1300_l1323_l1295_l1292_l1315_l1287_l1310_DUPLICATE_5ca6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1295_c7_2896_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1307_l1303_l1300_l1323_l1295_l1292_l1315_l1287_l1310_DUPLICATE_5ca6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_592d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1307_l1303_l1300_l1323_l1295_l1292_l1315_l1287_l1310_DUPLICATE_5ca6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1303_c7_2d6b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1307_l1303_l1300_l1323_l1295_l1292_l1315_l1287_l1310_DUPLICATE_5ca6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1307_c7_3e32_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1307_l1303_l1300_l1323_l1295_l1292_l1315_l1287_l1310_DUPLICATE_5ca6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1310_c7_661d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1307_l1303_l1300_l1323_l1295_l1292_l1315_l1287_l1310_DUPLICATE_5ca6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1315_c7_823e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1307_l1303_l1300_l1323_l1295_l1292_l1315_l1287_l1310_DUPLICATE_5ca6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1323_c7_7ed8_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1307_l1303_l1300_l1323_l1295_l1292_l1315_l1287_l1310_DUPLICATE_5ca6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1287_c2_dbda_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1307_l1303_l1329_l1300_l1295_l1318_l1292_l1315_l1287_l1310_DUPLICATE_04da_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1292_c7_0a1b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1307_l1303_l1329_l1300_l1295_l1318_l1292_l1315_l1287_l1310_DUPLICATE_04da_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1295_c7_2896_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1307_l1303_l1329_l1300_l1295_l1318_l1292_l1315_l1287_l1310_DUPLICATE_04da_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_592d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1307_l1303_l1329_l1300_l1295_l1318_l1292_l1315_l1287_l1310_DUPLICATE_04da_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_2d6b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1307_l1303_l1329_l1300_l1295_l1318_l1292_l1315_l1287_l1310_DUPLICATE_04da_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_3e32_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1307_l1303_l1329_l1300_l1295_l1318_l1292_l1315_l1287_l1310_DUPLICATE_04da_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_661d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1307_l1303_l1329_l1300_l1295_l1318_l1292_l1315_l1287_l1310_DUPLICATE_04da_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1315_c7_823e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1307_l1303_l1329_l1300_l1295_l1318_l1292_l1315_l1287_l1310_DUPLICATE_04da_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1318_c7_ac14_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1307_l1303_l1329_l1300_l1295_l1318_l1292_l1315_l1287_l1310_DUPLICATE_04da_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1329_c7_b0c9_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1307_l1303_l1329_l1300_l1295_l1318_l1292_l1315_l1287_l1310_DUPLICATE_04da_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1318_c7_ac14_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1318_l1323_DUPLICATE_6919_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c7_7ed8_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1318_l1323_DUPLICATE_6919_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1287_c2_dbda_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1307_l1303_l1300_l1323_l1295_l1318_l1292_l1315_l1287_l1310_DUPLICATE_cf4a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1292_c7_0a1b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1307_l1303_l1300_l1323_l1295_l1318_l1292_l1315_l1287_l1310_DUPLICATE_cf4a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1295_c7_2896_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1307_l1303_l1300_l1323_l1295_l1318_l1292_l1315_l1287_l1310_DUPLICATE_cf4a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1300_c7_592d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1307_l1303_l1300_l1323_l1295_l1318_l1292_l1315_l1287_l1310_DUPLICATE_cf4a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1303_c7_2d6b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1307_l1303_l1300_l1323_l1295_l1318_l1292_l1315_l1287_l1310_DUPLICATE_cf4a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1307_c7_3e32_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1307_l1303_l1300_l1323_l1295_l1318_l1292_l1315_l1287_l1310_DUPLICATE_cf4a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1310_c7_661d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1307_l1303_l1300_l1323_l1295_l1318_l1292_l1315_l1287_l1310_DUPLICATE_cf4a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1315_c7_823e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1307_l1303_l1300_l1323_l1295_l1318_l1292_l1315_l1287_l1310_DUPLICATE_cf4a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1318_c7_ac14_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1307_l1303_l1300_l1323_l1295_l1318_l1292_l1315_l1287_l1310_DUPLICATE_cf4a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1323_c7_7ed8_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1307_l1303_l1300_l1323_l1295_l1318_l1292_l1315_l1287_l1310_DUPLICATE_cf4a_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1323_c7_7ed8] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1323_c7_7ed8_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1323_c7_7ed8_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1323_c7_7ed8_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1323_c7_7ed8_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1323_c7_7ed8_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1323_c7_7ed8_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1323_c7_7ed8_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1323_c7_7ed8_return_output;

     -- MUX[uxn_opcodes_h_l1327_c24_7bf7] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1327_c24_7bf7_cond <= VAR_MUX_uxn_opcodes_h_l1327_c24_7bf7_cond;
     MUX_uxn_opcodes_h_l1327_c24_7bf7_iftrue <= VAR_MUX_uxn_opcodes_h_l1327_c24_7bf7_iftrue;
     MUX_uxn_opcodes_h_l1327_c24_7bf7_iffalse <= VAR_MUX_uxn_opcodes_h_l1327_c24_7bf7_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1327_c24_7bf7_return_output := MUX_uxn_opcodes_h_l1327_c24_7bf7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1323_c7_7ed8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c7_7ed8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c7_7ed8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c7_7ed8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c7_7ed8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c7_7ed8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c7_7ed8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c7_7ed8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c7_7ed8_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1304_c3_648f] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1304_c3_648f_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1304_c3_648f_left;
     BIN_OP_OR_uxn_opcodes_h_l1304_c3_648f_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1304_c3_648f_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1304_c3_648f_return_output := BIN_OP_OR_uxn_opcodes_h_l1304_c3_648f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1329_c7_b0c9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1329_c7_b0c9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1329_c7_b0c9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1329_c7_b0c9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1329_c7_b0c9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1329_c7_b0c9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1329_c7_b0c9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1329_c7_b0c9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1329_c7_b0c9_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1297_l1312_DUPLICATE_dd7f LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1297_l1312_DUPLICATE_dd7f_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1297_l1312_DUPLICATE_dd7f_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1297_l1312_DUPLICATE_dd7f_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1297_l1312_DUPLICATE_dd7f_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1287_c1_2b75] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1287_c1_2b75_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1287_c1_2b75_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1287_c1_2b75_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1287_c1_2b75_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1287_c1_2b75_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1287_c1_2b75_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1287_c1_2b75_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1287_c1_2b75_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1319_c3_4ab1] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1319_c3_4ab1_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1319_c3_4ab1_left;
     BIN_OP_OR_uxn_opcodes_h_l1319_c3_4ab1_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1319_c3_4ab1_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1319_c3_4ab1_return_output := BIN_OP_OR_uxn_opcodes_h_l1319_c3_4ab1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1329_c7_b0c9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1329_c7_b0c9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1329_c7_b0c9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1329_c7_b0c9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1329_c7_b0c9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1329_c7_b0c9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1329_c7_b0c9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1329_c7_b0c9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1329_c7_b0c9_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1321_c32_ae68] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1321_c32_ae68_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1321_c32_ae68_left;
     BIN_OP_GT_uxn_opcodes_h_l1321_c32_ae68_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1321_c32_ae68_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1321_c32_ae68_return_output := BIN_OP_GT_uxn_opcodes_h_l1321_c32_ae68_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1321_c32_a73e_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1321_c32_ae68_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1303_c7_2d6b_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1304_c3_648f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1318_c7_ac14_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1319_c3_4ab1_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1310_c7_661d_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1297_l1312_DUPLICATE_dd7f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1295_c7_2896_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1297_l1312_DUPLICATE_dd7f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1323_c7_7ed8_iftrue := VAR_MUX_uxn_opcodes_h_l1327_c24_7bf7_return_output;
     VAR_printf_uxn_opcodes_h_l1288_c3_c87e_uxn_opcodes_h_l1288_c3_c87e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1287_c1_2b75_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_7ed8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1329_c7_b0c9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1318_c7_ac14_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1323_c7_7ed8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_7ed8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1329_c7_b0c9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1318_c7_ac14_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c7_7ed8_return_output;
     -- printf_uxn_opcodes_h_l1288_c3_c87e[uxn_opcodes_h_l1288_c3_c87e] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1288_c3_c87e_uxn_opcodes_h_l1288_c3_c87e_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1288_c3_c87e_uxn_opcodes_h_l1288_c3_c87e_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- n16_MUX[uxn_opcodes_h_l1318_c7_ac14] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1318_c7_ac14_cond <= VAR_n16_MUX_uxn_opcodes_h_l1318_c7_ac14_cond;
     n16_MUX_uxn_opcodes_h_l1318_c7_ac14_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1318_c7_ac14_iftrue;
     n16_MUX_uxn_opcodes_h_l1318_c7_ac14_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1318_c7_ac14_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1318_c7_ac14_return_output := n16_MUX_uxn_opcodes_h_l1318_c7_ac14_return_output;

     -- t16_MUX[uxn_opcodes_h_l1303_c7_2d6b] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1303_c7_2d6b_cond <= VAR_t16_MUX_uxn_opcodes_h_l1303_c7_2d6b_cond;
     t16_MUX_uxn_opcodes_h_l1303_c7_2d6b_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1303_c7_2d6b_iftrue;
     t16_MUX_uxn_opcodes_h_l1303_c7_2d6b_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1303_c7_2d6b_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1303_c7_2d6b_return_output := t16_MUX_uxn_opcodes_h_l1303_c7_2d6b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1318_c7_ac14] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1318_c7_ac14_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1318_c7_ac14_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1318_c7_ac14_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1318_c7_ac14_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1318_c7_ac14_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1318_c7_ac14_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1318_c7_ac14_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1318_c7_ac14_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1323_c7_7ed8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_7ed8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_7ed8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_7ed8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_7ed8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_7ed8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_7ed8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_7ed8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_7ed8_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1318_c7_ac14] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1318_c7_ac14_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1318_c7_ac14_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1318_c7_ac14_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1318_c7_ac14_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1318_c7_ac14_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1318_c7_ac14_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1318_c7_ac14_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1318_c7_ac14_return_output;

     -- MUX[uxn_opcodes_h_l1321_c32_a73e] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1321_c32_a73e_cond <= VAR_MUX_uxn_opcodes_h_l1321_c32_a73e_cond;
     MUX_uxn_opcodes_h_l1321_c32_a73e_iftrue <= VAR_MUX_uxn_opcodes_h_l1321_c32_a73e_iftrue;
     MUX_uxn_opcodes_h_l1321_c32_a73e_iffalse <= VAR_MUX_uxn_opcodes_h_l1321_c32_a73e_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1321_c32_a73e_return_output := MUX_uxn_opcodes_h_l1321_c32_a73e_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1323_c7_7ed8] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1323_c7_7ed8_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1323_c7_7ed8_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1323_c7_7ed8_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1323_c7_7ed8_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1323_c7_7ed8_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1323_c7_7ed8_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1323_c7_7ed8_return_output := result_stack_value_MUX_uxn_opcodes_h_l1323_c7_7ed8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1323_c7_7ed8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_7ed8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_7ed8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_7ed8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_7ed8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_7ed8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_7ed8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_7ed8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_7ed8_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1318_c7_ac14_iftrue := VAR_MUX_uxn_opcodes_h_l1321_c32_a73e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1315_c7_823e_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1318_c7_ac14_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1318_c7_ac14_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_7ed8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1315_c7_823e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1318_c7_ac14_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1318_c7_ac14_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_7ed8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1315_c7_823e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1318_c7_ac14_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1318_c7_ac14_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1323_c7_7ed8_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1300_c7_592d_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1303_c7_2d6b_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1315_c7_823e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1315_c7_823e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1315_c7_823e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1315_c7_823e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1315_c7_823e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1315_c7_823e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1315_c7_823e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1315_c7_823e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1315_c7_823e_return_output;

     -- t16_MUX[uxn_opcodes_h_l1300_c7_592d] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1300_c7_592d_cond <= VAR_t16_MUX_uxn_opcodes_h_l1300_c7_592d_cond;
     t16_MUX_uxn_opcodes_h_l1300_c7_592d_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1300_c7_592d_iftrue;
     t16_MUX_uxn_opcodes_h_l1300_c7_592d_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1300_c7_592d_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1300_c7_592d_return_output := t16_MUX_uxn_opcodes_h_l1300_c7_592d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1318_c7_ac14] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1318_c7_ac14_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1318_c7_ac14_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1318_c7_ac14_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1318_c7_ac14_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1318_c7_ac14_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1318_c7_ac14_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1318_c7_ac14_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1318_c7_ac14_return_output;

     -- n16_MUX[uxn_opcodes_h_l1315_c7_823e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1315_c7_823e_cond <= VAR_n16_MUX_uxn_opcodes_h_l1315_c7_823e_cond;
     n16_MUX_uxn_opcodes_h_l1315_c7_823e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1315_c7_823e_iftrue;
     n16_MUX_uxn_opcodes_h_l1315_c7_823e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1315_c7_823e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1315_c7_823e_return_output := n16_MUX_uxn_opcodes_h_l1315_c7_823e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1318_c7_ac14] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1318_c7_ac14_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1318_c7_ac14_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1318_c7_ac14_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1318_c7_ac14_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1318_c7_ac14_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1318_c7_ac14_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1318_c7_ac14_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1318_c7_ac14_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1315_c7_823e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1315_c7_823e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1315_c7_823e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1315_c7_823e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1315_c7_823e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1315_c7_823e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1315_c7_823e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1315_c7_823e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1315_c7_823e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1318_c7_ac14] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1318_c7_ac14_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1318_c7_ac14_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1318_c7_ac14_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1318_c7_ac14_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1318_c7_ac14_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1318_c7_ac14_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1318_c7_ac14_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1318_c7_ac14_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1318_c7_ac14] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1318_c7_ac14_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1318_c7_ac14_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1318_c7_ac14_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1318_c7_ac14_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1318_c7_ac14_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1318_c7_ac14_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1318_c7_ac14_return_output := result_stack_value_MUX_uxn_opcodes_h_l1318_c7_ac14_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l1310_c7_661d_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1315_c7_823e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1315_c7_823e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1318_c7_ac14_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1310_c7_661d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1315_c7_823e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1315_c7_823e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1318_c7_ac14_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1315_c7_823e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1318_c7_ac14_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_661d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1315_c7_823e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1315_c7_823e_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1318_c7_ac14_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1295_c7_2896_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1300_c7_592d_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1315_c7_823e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1315_c7_823e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1315_c7_823e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1315_c7_823e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1315_c7_823e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1315_c7_823e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1315_c7_823e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1315_c7_823e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1315_c7_823e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1310_c7_661d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1310_c7_661d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1310_c7_661d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1310_c7_661d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1310_c7_661d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1310_c7_661d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1310_c7_661d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1310_c7_661d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1310_c7_661d_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1315_c7_823e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1315_c7_823e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1315_c7_823e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1315_c7_823e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1315_c7_823e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1315_c7_823e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1315_c7_823e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1315_c7_823e_return_output := result_stack_value_MUX_uxn_opcodes_h_l1315_c7_823e_return_output;

     -- n16_MUX[uxn_opcodes_h_l1310_c7_661d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1310_c7_661d_cond <= VAR_n16_MUX_uxn_opcodes_h_l1310_c7_661d_cond;
     n16_MUX_uxn_opcodes_h_l1310_c7_661d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1310_c7_661d_iftrue;
     n16_MUX_uxn_opcodes_h_l1310_c7_661d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1310_c7_661d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1310_c7_661d_return_output := n16_MUX_uxn_opcodes_h_l1310_c7_661d_return_output;

     -- t16_MUX[uxn_opcodes_h_l1295_c7_2896] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1295_c7_2896_cond <= VAR_t16_MUX_uxn_opcodes_h_l1295_c7_2896_cond;
     t16_MUX_uxn_opcodes_h_l1295_c7_2896_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1295_c7_2896_iftrue;
     t16_MUX_uxn_opcodes_h_l1295_c7_2896_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1295_c7_2896_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1295_c7_2896_return_output := t16_MUX_uxn_opcodes_h_l1295_c7_2896_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1315_c7_823e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1315_c7_823e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1315_c7_823e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1315_c7_823e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1315_c7_823e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1315_c7_823e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1315_c7_823e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1315_c7_823e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1315_c7_823e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1315_c7_823e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1315_c7_823e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1315_c7_823e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1315_c7_823e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1315_c7_823e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1315_c7_823e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1315_c7_823e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1315_c7_823e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1315_c7_823e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1310_c7_661d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_661d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_661d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_661d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_661d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_661d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_661d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_661d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_661d_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1307_c7_3e32_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1310_c7_661d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_661d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1315_c7_823e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1307_c7_3e32_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1310_c7_661d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_661d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1315_c7_823e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_661d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1315_c7_823e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_3e32_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_661d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1310_c7_661d_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1315_c7_823e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1292_c7_0a1b_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1295_c7_2896_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1310_c7_661d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_661d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_661d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_661d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_661d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_661d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_661d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_661d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_661d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1307_c7_3e32] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1307_c7_3e32_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1307_c7_3e32_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1307_c7_3e32_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1307_c7_3e32_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1307_c7_3e32_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1307_c7_3e32_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1307_c7_3e32_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1307_c7_3e32_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1310_c7_661d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_661d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_661d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_661d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_661d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_661d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_661d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_661d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_661d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1310_c7_661d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_661d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_661d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_661d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_661d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_661d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_661d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_661d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_661d_return_output;

     -- t16_MUX[uxn_opcodes_h_l1292_c7_0a1b] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1292_c7_0a1b_cond <= VAR_t16_MUX_uxn_opcodes_h_l1292_c7_0a1b_cond;
     t16_MUX_uxn_opcodes_h_l1292_c7_0a1b_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1292_c7_0a1b_iftrue;
     t16_MUX_uxn_opcodes_h_l1292_c7_0a1b_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1292_c7_0a1b_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1292_c7_0a1b_return_output := t16_MUX_uxn_opcodes_h_l1292_c7_0a1b_return_output;

     -- n16_MUX[uxn_opcodes_h_l1307_c7_3e32] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1307_c7_3e32_cond <= VAR_n16_MUX_uxn_opcodes_h_l1307_c7_3e32_cond;
     n16_MUX_uxn_opcodes_h_l1307_c7_3e32_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1307_c7_3e32_iftrue;
     n16_MUX_uxn_opcodes_h_l1307_c7_3e32_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1307_c7_3e32_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1307_c7_3e32_return_output := n16_MUX_uxn_opcodes_h_l1307_c7_3e32_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1310_c7_661d] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1310_c7_661d_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1310_c7_661d_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1310_c7_661d_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1310_c7_661d_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1310_c7_661d_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1310_c7_661d_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1310_c7_661d_return_output := result_stack_value_MUX_uxn_opcodes_h_l1310_c7_661d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1307_c7_3e32] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_3e32_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_3e32_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_3e32_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_3e32_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_3e32_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_3e32_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_3e32_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_3e32_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1303_c7_2d6b_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1307_c7_3e32_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_3e32_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_661d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1303_c7_2d6b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1307_c7_3e32_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_3e32_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_661d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_3e32_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_661d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_2d6b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_3e32_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1307_c7_3e32_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1310_c7_661d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1287_c2_dbda_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1292_c7_0a1b_return_output;
     -- n16_MUX[uxn_opcodes_h_l1303_c7_2d6b] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1303_c7_2d6b_cond <= VAR_n16_MUX_uxn_opcodes_h_l1303_c7_2d6b_cond;
     n16_MUX_uxn_opcodes_h_l1303_c7_2d6b_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1303_c7_2d6b_iftrue;
     n16_MUX_uxn_opcodes_h_l1303_c7_2d6b_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1303_c7_2d6b_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1303_c7_2d6b_return_output := n16_MUX_uxn_opcodes_h_l1303_c7_2d6b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1307_c7_3e32] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_3e32_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_3e32_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_3e32_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_3e32_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_3e32_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_3e32_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_3e32_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_3e32_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1303_c7_2d6b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1303_c7_2d6b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1303_c7_2d6b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1303_c7_2d6b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1303_c7_2d6b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1303_c7_2d6b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1303_c7_2d6b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1303_c7_2d6b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1303_c7_2d6b_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1307_c7_3e32] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1307_c7_3e32_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1307_c7_3e32_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1307_c7_3e32_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1307_c7_3e32_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1307_c7_3e32_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1307_c7_3e32_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1307_c7_3e32_return_output := result_stack_value_MUX_uxn_opcodes_h_l1307_c7_3e32_return_output;

     -- t16_MUX[uxn_opcodes_h_l1287_c2_dbda] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1287_c2_dbda_cond <= VAR_t16_MUX_uxn_opcodes_h_l1287_c2_dbda_cond;
     t16_MUX_uxn_opcodes_h_l1287_c2_dbda_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1287_c2_dbda_iftrue;
     t16_MUX_uxn_opcodes_h_l1287_c2_dbda_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1287_c2_dbda_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1287_c2_dbda_return_output := t16_MUX_uxn_opcodes_h_l1287_c2_dbda_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1307_c7_3e32] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_3e32_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_3e32_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_3e32_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_3e32_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_3e32_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_3e32_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_3e32_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_3e32_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1303_c7_2d6b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_2d6b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_2d6b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_2d6b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_2d6b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_2d6b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_2d6b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_2d6b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_2d6b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1307_c7_3e32] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_3e32_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_3e32_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_3e32_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_3e32_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_3e32_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_3e32_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_3e32_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_3e32_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1300_c7_592d_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1303_c7_2d6b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_2d6b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_3e32_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_592d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1303_c7_2d6b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_2d6b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_3e32_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_2d6b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_3e32_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_592d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_2d6b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1303_c7_2d6b_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1307_c7_3e32_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1287_c2_dbda_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1303_c7_2d6b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_2d6b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_2d6b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_2d6b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_2d6b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_2d6b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_2d6b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_2d6b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_2d6b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1303_c7_2d6b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_2d6b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_2d6b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_2d6b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_2d6b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_2d6b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_2d6b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_2d6b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_2d6b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1303_c7_2d6b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_2d6b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_2d6b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_2d6b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_2d6b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_2d6b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_2d6b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_2d6b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_2d6b_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1303_c7_2d6b] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1303_c7_2d6b_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1303_c7_2d6b_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1303_c7_2d6b_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1303_c7_2d6b_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1303_c7_2d6b_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1303_c7_2d6b_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1303_c7_2d6b_return_output := result_stack_value_MUX_uxn_opcodes_h_l1303_c7_2d6b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1300_c7_592d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_592d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_592d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_592d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_592d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_592d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_592d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_592d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_592d_return_output;

     -- n16_MUX[uxn_opcodes_h_l1300_c7_592d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1300_c7_592d_cond <= VAR_n16_MUX_uxn_opcodes_h_l1300_c7_592d_cond;
     n16_MUX_uxn_opcodes_h_l1300_c7_592d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1300_c7_592d_iftrue;
     n16_MUX_uxn_opcodes_h_l1300_c7_592d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1300_c7_592d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1300_c7_592d_return_output := n16_MUX_uxn_opcodes_h_l1300_c7_592d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1300_c7_592d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_592d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_592d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_592d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_592d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_592d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_592d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_592d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_592d_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l1295_c7_2896_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1300_c7_592d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_592d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_2d6b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1295_c7_2896_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_592d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_592d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_2d6b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_592d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_2d6b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1295_c7_2896_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_592d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1300_c7_592d_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1303_c7_2d6b_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1300_c7_592d] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1300_c7_592d_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1300_c7_592d_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1300_c7_592d_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1300_c7_592d_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1300_c7_592d_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1300_c7_592d_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1300_c7_592d_return_output := result_stack_value_MUX_uxn_opcodes_h_l1300_c7_592d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1300_c7_592d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_592d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_592d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_592d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_592d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_592d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_592d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_592d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_592d_return_output;

     -- n16_MUX[uxn_opcodes_h_l1295_c7_2896] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1295_c7_2896_cond <= VAR_n16_MUX_uxn_opcodes_h_l1295_c7_2896_cond;
     n16_MUX_uxn_opcodes_h_l1295_c7_2896_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1295_c7_2896_iftrue;
     n16_MUX_uxn_opcodes_h_l1295_c7_2896_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1295_c7_2896_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1295_c7_2896_return_output := n16_MUX_uxn_opcodes_h_l1295_c7_2896_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1300_c7_592d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_592d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_592d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_592d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_592d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_592d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_592d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_592d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_592d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1300_c7_592d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_592d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_592d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_592d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_592d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_592d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_592d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_592d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_592d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1295_c7_2896] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1295_c7_2896_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1295_c7_2896_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1295_c7_2896_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1295_c7_2896_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1295_c7_2896_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1295_c7_2896_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1295_c7_2896_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1295_c7_2896_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1295_c7_2896] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1295_c7_2896_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1295_c7_2896_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1295_c7_2896_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1295_c7_2896_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1295_c7_2896_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1295_c7_2896_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1295_c7_2896_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1295_c7_2896_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l1292_c7_0a1b_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1295_c7_2896_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1295_c7_2896_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_592d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1292_c7_0a1b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1295_c7_2896_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1295_c7_2896_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_592d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1295_c7_2896_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_592d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1292_c7_0a1b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1295_c7_2896_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1295_c7_2896_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1300_c7_592d_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1295_c7_2896] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1295_c7_2896_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1295_c7_2896_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1295_c7_2896_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1295_c7_2896_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1295_c7_2896_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1295_c7_2896_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1295_c7_2896_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1295_c7_2896_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1295_c7_2896] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1295_c7_2896_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1295_c7_2896_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1295_c7_2896_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1295_c7_2896_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1295_c7_2896_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1295_c7_2896_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1295_c7_2896_return_output := result_stack_value_MUX_uxn_opcodes_h_l1295_c7_2896_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1295_c7_2896] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1295_c7_2896_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1295_c7_2896_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1295_c7_2896_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1295_c7_2896_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1295_c7_2896_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1295_c7_2896_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1295_c7_2896_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1295_c7_2896_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1295_c7_2896] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1295_c7_2896_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1295_c7_2896_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1295_c7_2896_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1295_c7_2896_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1295_c7_2896_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1295_c7_2896_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1295_c7_2896_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1295_c7_2896_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1292_c7_0a1b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1292_c7_0a1b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1292_c7_0a1b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1292_c7_0a1b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1292_c7_0a1b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1292_c7_0a1b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1292_c7_0a1b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1292_c7_0a1b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1292_c7_0a1b_return_output;

     -- n16_MUX[uxn_opcodes_h_l1292_c7_0a1b] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1292_c7_0a1b_cond <= VAR_n16_MUX_uxn_opcodes_h_l1292_c7_0a1b_cond;
     n16_MUX_uxn_opcodes_h_l1292_c7_0a1b_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1292_c7_0a1b_iftrue;
     n16_MUX_uxn_opcodes_h_l1292_c7_0a1b_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1292_c7_0a1b_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1292_c7_0a1b_return_output := n16_MUX_uxn_opcodes_h_l1292_c7_0a1b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1292_c7_0a1b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1292_c7_0a1b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1292_c7_0a1b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1292_c7_0a1b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1292_c7_0a1b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1292_c7_0a1b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1292_c7_0a1b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1292_c7_0a1b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1292_c7_0a1b_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l1287_c2_dbda_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1292_c7_0a1b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1292_c7_0a1b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1295_c7_2896_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c2_dbda_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1292_c7_0a1b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1292_c7_0a1b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1295_c7_2896_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1292_c7_0a1b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1295_c7_2896_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c2_dbda_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1292_c7_0a1b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1292_c7_0a1b_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1295_c7_2896_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1292_c7_0a1b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1292_c7_0a1b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1292_c7_0a1b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1292_c7_0a1b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1292_c7_0a1b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1292_c7_0a1b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1292_c7_0a1b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1292_c7_0a1b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1292_c7_0a1b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1287_c2_dbda] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c2_dbda_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c2_dbda_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c2_dbda_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c2_dbda_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c2_dbda_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c2_dbda_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c2_dbda_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c2_dbda_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1292_c7_0a1b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1292_c7_0a1b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1292_c7_0a1b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1292_c7_0a1b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1292_c7_0a1b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1292_c7_0a1b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1292_c7_0a1b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1292_c7_0a1b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1292_c7_0a1b_return_output;

     -- n16_MUX[uxn_opcodes_h_l1287_c2_dbda] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1287_c2_dbda_cond <= VAR_n16_MUX_uxn_opcodes_h_l1287_c2_dbda_cond;
     n16_MUX_uxn_opcodes_h_l1287_c2_dbda_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1287_c2_dbda_iftrue;
     n16_MUX_uxn_opcodes_h_l1287_c2_dbda_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1287_c2_dbda_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1287_c2_dbda_return_output := n16_MUX_uxn_opcodes_h_l1287_c2_dbda_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1287_c2_dbda] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c2_dbda_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c2_dbda_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c2_dbda_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c2_dbda_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c2_dbda_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c2_dbda_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c2_dbda_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c2_dbda_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1292_c7_0a1b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1292_c7_0a1b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1292_c7_0a1b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1292_c7_0a1b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1292_c7_0a1b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1292_c7_0a1b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1292_c7_0a1b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1292_c7_0a1b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1292_c7_0a1b_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1292_c7_0a1b] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1292_c7_0a1b_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1292_c7_0a1b_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1292_c7_0a1b_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1292_c7_0a1b_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1292_c7_0a1b_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1292_c7_0a1b_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1292_c7_0a1b_return_output := result_stack_value_MUX_uxn_opcodes_h_l1292_c7_0a1b_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1287_c2_dbda_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1287_c2_dbda_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1292_c7_0a1b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1287_c2_dbda_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1292_c7_0a1b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1287_c2_dbda_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1292_c7_0a1b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1287_c2_dbda_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1292_c7_0a1b_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1287_c2_dbda] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1287_c2_dbda_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1287_c2_dbda_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1287_c2_dbda_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1287_c2_dbda_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1287_c2_dbda_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1287_c2_dbda_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1287_c2_dbda_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1287_c2_dbda_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1287_c2_dbda] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1287_c2_dbda_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1287_c2_dbda_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1287_c2_dbda_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1287_c2_dbda_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1287_c2_dbda_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1287_c2_dbda_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1287_c2_dbda_return_output := result_stack_value_MUX_uxn_opcodes_h_l1287_c2_dbda_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1287_c2_dbda] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1287_c2_dbda_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1287_c2_dbda_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1287_c2_dbda_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1287_c2_dbda_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1287_c2_dbda_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1287_c2_dbda_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1287_c2_dbda_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1287_c2_dbda_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1287_c2_dbda] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1287_c2_dbda_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1287_c2_dbda_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1287_c2_dbda_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1287_c2_dbda_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1287_c2_dbda_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1287_c2_dbda_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1287_c2_dbda_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1287_c2_dbda_return_output;

     -- Submodule level 12
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l1334_l1283_DUPLICATE_e614 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l1334_l1283_DUPLICATE_e614_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_53ff(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1287_c2_dbda_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c2_dbda_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1287_c2_dbda_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1287_c2_dbda_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1287_c2_dbda_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c2_dbda_return_output);

     -- Submodule level 13
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l1334_l1283_DUPLICATE_e614_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l1334_l1283_DUPLICATE_e614_return_output;
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
