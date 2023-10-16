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
-- Submodules: 78
entity sta_0CLK_89f6ba96 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end sta_0CLK_89f6ba96;
architecture arch of sta_0CLK_89f6ba96 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal n8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_n8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l2437_c6_a45b]
signal BIN_OP_EQ_uxn_opcodes_h_l2437_c6_a45b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2437_c6_a45b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2437_c6_a45b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2437_c1_24c9]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2437_c1_24c9_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2437_c1_24c9_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2437_c1_24c9_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2437_c1_24c9_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2437_c2_a348]
signal n8_MUX_uxn_opcodes_h_l2437_c2_a348_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2437_c2_a348_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2437_c2_a348_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2437_c2_a348_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2437_c2_a348]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2437_c2_a348_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2437_c2_a348_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2437_c2_a348_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2437_c2_a348_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2437_c2_a348]
signal result_u16_value_MUX_uxn_opcodes_h_l2437_c2_a348_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2437_c2_a348_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2437_c2_a348_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2437_c2_a348_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2437_c2_a348]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2437_c2_a348_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2437_c2_a348_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2437_c2_a348_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2437_c2_a348_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2437_c2_a348]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2437_c2_a348_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2437_c2_a348_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2437_c2_a348_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2437_c2_a348_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2437_c2_a348]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2437_c2_a348_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2437_c2_a348_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2437_c2_a348_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2437_c2_a348_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2437_c2_a348]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2437_c2_a348_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2437_c2_a348_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2437_c2_a348_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2437_c2_a348_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2437_c2_a348]
signal result_u8_value_MUX_uxn_opcodes_h_l2437_c2_a348_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2437_c2_a348_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2437_c2_a348_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2437_c2_a348_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2437_c2_a348]
signal t16_MUX_uxn_opcodes_h_l2437_c2_a348_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2437_c2_a348_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2437_c2_a348_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2437_c2_a348_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l2438_c3_ce8d[uxn_opcodes_h_l2438_c3_ce8d]
signal printf_uxn_opcodes_h_l2438_c3_ce8d_uxn_opcodes_h_l2438_c3_ce8d_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2442_c11_7c95]
signal BIN_OP_EQ_uxn_opcodes_h_l2442_c11_7c95_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2442_c11_7c95_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2442_c11_7c95_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2442_c7_02a4]
signal n8_MUX_uxn_opcodes_h_l2442_c7_02a4_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2442_c7_02a4_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2442_c7_02a4_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2442_c7_02a4_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2442_c7_02a4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2442_c7_02a4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2442_c7_02a4_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2442_c7_02a4_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2442_c7_02a4_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2442_c7_02a4]
signal result_u16_value_MUX_uxn_opcodes_h_l2442_c7_02a4_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2442_c7_02a4_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2442_c7_02a4_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2442_c7_02a4_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2442_c7_02a4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2442_c7_02a4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2442_c7_02a4_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2442_c7_02a4_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2442_c7_02a4_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2442_c7_02a4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2442_c7_02a4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2442_c7_02a4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2442_c7_02a4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2442_c7_02a4_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2442_c7_02a4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2442_c7_02a4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2442_c7_02a4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2442_c7_02a4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2442_c7_02a4_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2442_c7_02a4]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2442_c7_02a4_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2442_c7_02a4_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2442_c7_02a4_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2442_c7_02a4_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2442_c7_02a4]
signal result_u8_value_MUX_uxn_opcodes_h_l2442_c7_02a4_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2442_c7_02a4_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2442_c7_02a4_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2442_c7_02a4_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2442_c7_02a4]
signal t16_MUX_uxn_opcodes_h_l2442_c7_02a4_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2442_c7_02a4_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2442_c7_02a4_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2442_c7_02a4_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2445_c11_704b]
signal BIN_OP_EQ_uxn_opcodes_h_l2445_c11_704b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2445_c11_704b_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2445_c11_704b_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2445_c7_7189]
signal n8_MUX_uxn_opcodes_h_l2445_c7_7189_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2445_c7_7189_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2445_c7_7189_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2445_c7_7189_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2445_c7_7189]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2445_c7_7189_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2445_c7_7189_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2445_c7_7189_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2445_c7_7189_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2445_c7_7189]
signal result_u16_value_MUX_uxn_opcodes_h_l2445_c7_7189_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2445_c7_7189_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2445_c7_7189_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2445_c7_7189_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2445_c7_7189]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2445_c7_7189_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2445_c7_7189_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2445_c7_7189_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2445_c7_7189_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2445_c7_7189]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2445_c7_7189_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2445_c7_7189_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2445_c7_7189_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2445_c7_7189_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2445_c7_7189]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2445_c7_7189_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2445_c7_7189_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2445_c7_7189_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2445_c7_7189_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2445_c7_7189]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2445_c7_7189_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2445_c7_7189_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2445_c7_7189_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2445_c7_7189_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2445_c7_7189]
signal result_u8_value_MUX_uxn_opcodes_h_l2445_c7_7189_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2445_c7_7189_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2445_c7_7189_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2445_c7_7189_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2445_c7_7189]
signal t16_MUX_uxn_opcodes_h_l2445_c7_7189_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2445_c7_7189_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2445_c7_7189_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2445_c7_7189_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l2447_c3_5df8]
signal CONST_SL_8_uxn_opcodes_h_l2447_c3_5df8_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l2447_c3_5df8_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2450_c11_413b]
signal BIN_OP_EQ_uxn_opcodes_h_l2450_c11_413b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2450_c11_413b_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2450_c11_413b_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2450_c7_3a3b]
signal n8_MUX_uxn_opcodes_h_l2450_c7_3a3b_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2450_c7_3a3b_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2450_c7_3a3b_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2450_c7_3a3b_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2450_c7_3a3b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c7_3a3b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c7_3a3b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c7_3a3b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c7_3a3b_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2450_c7_3a3b]
signal result_u16_value_MUX_uxn_opcodes_h_l2450_c7_3a3b_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2450_c7_3a3b_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2450_c7_3a3b_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2450_c7_3a3b_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2450_c7_3a3b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c7_3a3b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c7_3a3b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c7_3a3b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c7_3a3b_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2450_c7_3a3b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c7_3a3b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c7_3a3b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c7_3a3b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c7_3a3b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2450_c7_3a3b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2450_c7_3a3b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2450_c7_3a3b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2450_c7_3a3b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2450_c7_3a3b_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2450_c7_3a3b]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2450_c7_3a3b_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2450_c7_3a3b_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2450_c7_3a3b_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2450_c7_3a3b_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2450_c7_3a3b]
signal result_u8_value_MUX_uxn_opcodes_h_l2450_c7_3a3b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2450_c7_3a3b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2450_c7_3a3b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2450_c7_3a3b_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2450_c7_3a3b]
signal t16_MUX_uxn_opcodes_h_l2450_c7_3a3b_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2450_c7_3a3b_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2450_c7_3a3b_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2450_c7_3a3b_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2453_c11_bb7a]
signal BIN_OP_EQ_uxn_opcodes_h_l2453_c11_bb7a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2453_c11_bb7a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2453_c11_bb7a_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2453_c7_2c0c]
signal n8_MUX_uxn_opcodes_h_l2453_c7_2c0c_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2453_c7_2c0c_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2453_c7_2c0c_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2453_c7_2c0c_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2453_c7_2c0c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2453_c7_2c0c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2453_c7_2c0c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2453_c7_2c0c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2453_c7_2c0c_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2453_c7_2c0c]
signal result_u16_value_MUX_uxn_opcodes_h_l2453_c7_2c0c_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2453_c7_2c0c_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2453_c7_2c0c_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2453_c7_2c0c_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2453_c7_2c0c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2453_c7_2c0c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2453_c7_2c0c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2453_c7_2c0c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2453_c7_2c0c_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2453_c7_2c0c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2453_c7_2c0c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2453_c7_2c0c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2453_c7_2c0c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2453_c7_2c0c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2453_c7_2c0c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2453_c7_2c0c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2453_c7_2c0c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2453_c7_2c0c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2453_c7_2c0c_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2453_c7_2c0c]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2453_c7_2c0c_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2453_c7_2c0c_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2453_c7_2c0c_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2453_c7_2c0c_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2453_c7_2c0c]
signal result_u8_value_MUX_uxn_opcodes_h_l2453_c7_2c0c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2453_c7_2c0c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2453_c7_2c0c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2453_c7_2c0c_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2453_c7_2c0c]
signal t16_MUX_uxn_opcodes_h_l2453_c7_2c0c_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2453_c7_2c0c_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2453_c7_2c0c_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2453_c7_2c0c_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2454_c3_14e8]
signal BIN_OP_OR_uxn_opcodes_h_l2454_c3_14e8_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2454_c3_14e8_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2454_c3_14e8_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2457_c11_a77f]
signal BIN_OP_EQ_uxn_opcodes_h_l2457_c11_a77f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2457_c11_a77f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2457_c11_a77f_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2457_c7_e164]
signal n8_MUX_uxn_opcodes_h_l2457_c7_e164_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2457_c7_e164_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2457_c7_e164_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2457_c7_e164_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2457_c7_e164]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2457_c7_e164_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2457_c7_e164_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2457_c7_e164_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2457_c7_e164_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2457_c7_e164]
signal result_u16_value_MUX_uxn_opcodes_h_l2457_c7_e164_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2457_c7_e164_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2457_c7_e164_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2457_c7_e164_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2457_c7_e164]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2457_c7_e164_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2457_c7_e164_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2457_c7_e164_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2457_c7_e164_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2457_c7_e164]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2457_c7_e164_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2457_c7_e164_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2457_c7_e164_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2457_c7_e164_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2457_c7_e164]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2457_c7_e164_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2457_c7_e164_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2457_c7_e164_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2457_c7_e164_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2457_c7_e164]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2457_c7_e164_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2457_c7_e164_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2457_c7_e164_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2457_c7_e164_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2457_c7_e164]
signal result_u8_value_MUX_uxn_opcodes_h_l2457_c7_e164_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2457_c7_e164_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2457_c7_e164_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2457_c7_e164_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2460_c11_6b8d]
signal BIN_OP_EQ_uxn_opcodes_h_l2460_c11_6b8d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2460_c11_6b8d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2460_c11_6b8d_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2460_c7_139e]
signal n8_MUX_uxn_opcodes_h_l2460_c7_139e_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2460_c7_139e_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2460_c7_139e_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2460_c7_139e_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2460_c7_139e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2460_c7_139e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2460_c7_139e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2460_c7_139e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2460_c7_139e_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2460_c7_139e]
signal result_u16_value_MUX_uxn_opcodes_h_l2460_c7_139e_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2460_c7_139e_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2460_c7_139e_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2460_c7_139e_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2460_c7_139e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2460_c7_139e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2460_c7_139e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2460_c7_139e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2460_c7_139e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2460_c7_139e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2460_c7_139e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2460_c7_139e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2460_c7_139e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2460_c7_139e_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2460_c7_139e]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2460_c7_139e_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2460_c7_139e_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2460_c7_139e_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2460_c7_139e_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2460_c7_139e]
signal result_u8_value_MUX_uxn_opcodes_h_l2460_c7_139e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2460_c7_139e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2460_c7_139e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2460_c7_139e_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2463_c30_417a]
signal sp_relative_shift_uxn_opcodes_h_l2463_c30_417a_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2463_c30_417a_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2463_c30_417a_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2463_c30_417a_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2468_c11_0cb9]
signal BIN_OP_EQ_uxn_opcodes_h_l2468_c11_0cb9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2468_c11_0cb9_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2468_c11_0cb9_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2468_c7_3fe9]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2468_c7_3fe9_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2468_c7_3fe9_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2468_c7_3fe9_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2468_c7_3fe9_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2468_c7_3fe9]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_3fe9_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_3fe9_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_3fe9_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_3fe9_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2468_c7_3fe9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_3fe9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_3fe9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_3fe9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_3fe9_return_output : unsigned(0 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_0ba7( ref_toks_0 : opcode_result_t;
 ref_toks_1 : signed;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.sp_relative_shift := ref_toks_1;
      base.u16_value := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.is_sp_shift := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.is_ram_write := ref_toks_6;
      base.u8_value := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2437_c6_a45b
BIN_OP_EQ_uxn_opcodes_h_l2437_c6_a45b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2437_c6_a45b_left,
BIN_OP_EQ_uxn_opcodes_h_l2437_c6_a45b_right,
BIN_OP_EQ_uxn_opcodes_h_l2437_c6_a45b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2437_c1_24c9
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2437_c1_24c9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2437_c1_24c9_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2437_c1_24c9_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2437_c1_24c9_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2437_c1_24c9_return_output);

-- n8_MUX_uxn_opcodes_h_l2437_c2_a348
n8_MUX_uxn_opcodes_h_l2437_c2_a348 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2437_c2_a348_cond,
n8_MUX_uxn_opcodes_h_l2437_c2_a348_iftrue,
n8_MUX_uxn_opcodes_h_l2437_c2_a348_iffalse,
n8_MUX_uxn_opcodes_h_l2437_c2_a348_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2437_c2_a348
result_sp_relative_shift_MUX_uxn_opcodes_h_l2437_c2_a348 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2437_c2_a348_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2437_c2_a348_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2437_c2_a348_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2437_c2_a348_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2437_c2_a348
result_u16_value_MUX_uxn_opcodes_h_l2437_c2_a348 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2437_c2_a348_cond,
result_u16_value_MUX_uxn_opcodes_h_l2437_c2_a348_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2437_c2_a348_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2437_c2_a348_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2437_c2_a348
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2437_c2_a348 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2437_c2_a348_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2437_c2_a348_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2437_c2_a348_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2437_c2_a348_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2437_c2_a348
result_is_sp_shift_MUX_uxn_opcodes_h_l2437_c2_a348 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2437_c2_a348_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2437_c2_a348_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2437_c2_a348_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2437_c2_a348_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2437_c2_a348
result_is_opc_done_MUX_uxn_opcodes_h_l2437_c2_a348 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2437_c2_a348_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2437_c2_a348_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2437_c2_a348_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2437_c2_a348_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2437_c2_a348
result_is_ram_write_MUX_uxn_opcodes_h_l2437_c2_a348 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2437_c2_a348_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2437_c2_a348_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2437_c2_a348_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2437_c2_a348_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2437_c2_a348
result_u8_value_MUX_uxn_opcodes_h_l2437_c2_a348 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2437_c2_a348_cond,
result_u8_value_MUX_uxn_opcodes_h_l2437_c2_a348_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2437_c2_a348_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2437_c2_a348_return_output);

-- t16_MUX_uxn_opcodes_h_l2437_c2_a348
t16_MUX_uxn_opcodes_h_l2437_c2_a348 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2437_c2_a348_cond,
t16_MUX_uxn_opcodes_h_l2437_c2_a348_iftrue,
t16_MUX_uxn_opcodes_h_l2437_c2_a348_iffalse,
t16_MUX_uxn_opcodes_h_l2437_c2_a348_return_output);

-- printf_uxn_opcodes_h_l2438_c3_ce8d_uxn_opcodes_h_l2438_c3_ce8d
printf_uxn_opcodes_h_l2438_c3_ce8d_uxn_opcodes_h_l2438_c3_ce8d : entity work.printf_uxn_opcodes_h_l2438_c3_ce8d_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2438_c3_ce8d_uxn_opcodes_h_l2438_c3_ce8d_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2442_c11_7c95
BIN_OP_EQ_uxn_opcodes_h_l2442_c11_7c95 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2442_c11_7c95_left,
BIN_OP_EQ_uxn_opcodes_h_l2442_c11_7c95_right,
BIN_OP_EQ_uxn_opcodes_h_l2442_c11_7c95_return_output);

-- n8_MUX_uxn_opcodes_h_l2442_c7_02a4
n8_MUX_uxn_opcodes_h_l2442_c7_02a4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2442_c7_02a4_cond,
n8_MUX_uxn_opcodes_h_l2442_c7_02a4_iftrue,
n8_MUX_uxn_opcodes_h_l2442_c7_02a4_iffalse,
n8_MUX_uxn_opcodes_h_l2442_c7_02a4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2442_c7_02a4
result_sp_relative_shift_MUX_uxn_opcodes_h_l2442_c7_02a4 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2442_c7_02a4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2442_c7_02a4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2442_c7_02a4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2442_c7_02a4_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2442_c7_02a4
result_u16_value_MUX_uxn_opcodes_h_l2442_c7_02a4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2442_c7_02a4_cond,
result_u16_value_MUX_uxn_opcodes_h_l2442_c7_02a4_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2442_c7_02a4_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2442_c7_02a4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2442_c7_02a4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2442_c7_02a4 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2442_c7_02a4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2442_c7_02a4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2442_c7_02a4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2442_c7_02a4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2442_c7_02a4
result_is_sp_shift_MUX_uxn_opcodes_h_l2442_c7_02a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2442_c7_02a4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2442_c7_02a4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2442_c7_02a4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2442_c7_02a4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2442_c7_02a4
result_is_opc_done_MUX_uxn_opcodes_h_l2442_c7_02a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2442_c7_02a4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2442_c7_02a4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2442_c7_02a4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2442_c7_02a4_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2442_c7_02a4
result_is_ram_write_MUX_uxn_opcodes_h_l2442_c7_02a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2442_c7_02a4_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2442_c7_02a4_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2442_c7_02a4_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2442_c7_02a4_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2442_c7_02a4
result_u8_value_MUX_uxn_opcodes_h_l2442_c7_02a4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2442_c7_02a4_cond,
result_u8_value_MUX_uxn_opcodes_h_l2442_c7_02a4_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2442_c7_02a4_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2442_c7_02a4_return_output);

-- t16_MUX_uxn_opcodes_h_l2442_c7_02a4
t16_MUX_uxn_opcodes_h_l2442_c7_02a4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2442_c7_02a4_cond,
t16_MUX_uxn_opcodes_h_l2442_c7_02a4_iftrue,
t16_MUX_uxn_opcodes_h_l2442_c7_02a4_iffalse,
t16_MUX_uxn_opcodes_h_l2442_c7_02a4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2445_c11_704b
BIN_OP_EQ_uxn_opcodes_h_l2445_c11_704b : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2445_c11_704b_left,
BIN_OP_EQ_uxn_opcodes_h_l2445_c11_704b_right,
BIN_OP_EQ_uxn_opcodes_h_l2445_c11_704b_return_output);

-- n8_MUX_uxn_opcodes_h_l2445_c7_7189
n8_MUX_uxn_opcodes_h_l2445_c7_7189 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2445_c7_7189_cond,
n8_MUX_uxn_opcodes_h_l2445_c7_7189_iftrue,
n8_MUX_uxn_opcodes_h_l2445_c7_7189_iffalse,
n8_MUX_uxn_opcodes_h_l2445_c7_7189_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2445_c7_7189
result_sp_relative_shift_MUX_uxn_opcodes_h_l2445_c7_7189 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2445_c7_7189_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2445_c7_7189_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2445_c7_7189_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2445_c7_7189_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2445_c7_7189
result_u16_value_MUX_uxn_opcodes_h_l2445_c7_7189 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2445_c7_7189_cond,
result_u16_value_MUX_uxn_opcodes_h_l2445_c7_7189_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2445_c7_7189_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2445_c7_7189_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2445_c7_7189
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2445_c7_7189 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2445_c7_7189_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2445_c7_7189_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2445_c7_7189_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2445_c7_7189_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2445_c7_7189
result_is_sp_shift_MUX_uxn_opcodes_h_l2445_c7_7189 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2445_c7_7189_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2445_c7_7189_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2445_c7_7189_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2445_c7_7189_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2445_c7_7189
result_is_opc_done_MUX_uxn_opcodes_h_l2445_c7_7189 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2445_c7_7189_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2445_c7_7189_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2445_c7_7189_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2445_c7_7189_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2445_c7_7189
result_is_ram_write_MUX_uxn_opcodes_h_l2445_c7_7189 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2445_c7_7189_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2445_c7_7189_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2445_c7_7189_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2445_c7_7189_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2445_c7_7189
result_u8_value_MUX_uxn_opcodes_h_l2445_c7_7189 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2445_c7_7189_cond,
result_u8_value_MUX_uxn_opcodes_h_l2445_c7_7189_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2445_c7_7189_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2445_c7_7189_return_output);

-- t16_MUX_uxn_opcodes_h_l2445_c7_7189
t16_MUX_uxn_opcodes_h_l2445_c7_7189 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2445_c7_7189_cond,
t16_MUX_uxn_opcodes_h_l2445_c7_7189_iftrue,
t16_MUX_uxn_opcodes_h_l2445_c7_7189_iffalse,
t16_MUX_uxn_opcodes_h_l2445_c7_7189_return_output);

-- CONST_SL_8_uxn_opcodes_h_l2447_c3_5df8
CONST_SL_8_uxn_opcodes_h_l2447_c3_5df8 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l2447_c3_5df8_x,
CONST_SL_8_uxn_opcodes_h_l2447_c3_5df8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2450_c11_413b
BIN_OP_EQ_uxn_opcodes_h_l2450_c11_413b : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2450_c11_413b_left,
BIN_OP_EQ_uxn_opcodes_h_l2450_c11_413b_right,
BIN_OP_EQ_uxn_opcodes_h_l2450_c11_413b_return_output);

-- n8_MUX_uxn_opcodes_h_l2450_c7_3a3b
n8_MUX_uxn_opcodes_h_l2450_c7_3a3b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2450_c7_3a3b_cond,
n8_MUX_uxn_opcodes_h_l2450_c7_3a3b_iftrue,
n8_MUX_uxn_opcodes_h_l2450_c7_3a3b_iffalse,
n8_MUX_uxn_opcodes_h_l2450_c7_3a3b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c7_3a3b
result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c7_3a3b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c7_3a3b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c7_3a3b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c7_3a3b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c7_3a3b_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2450_c7_3a3b
result_u16_value_MUX_uxn_opcodes_h_l2450_c7_3a3b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2450_c7_3a3b_cond,
result_u16_value_MUX_uxn_opcodes_h_l2450_c7_3a3b_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2450_c7_3a3b_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2450_c7_3a3b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c7_3a3b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c7_3a3b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c7_3a3b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c7_3a3b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c7_3a3b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c7_3a3b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c7_3a3b
result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c7_3a3b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c7_3a3b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c7_3a3b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c7_3a3b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c7_3a3b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2450_c7_3a3b
result_is_opc_done_MUX_uxn_opcodes_h_l2450_c7_3a3b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2450_c7_3a3b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2450_c7_3a3b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2450_c7_3a3b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2450_c7_3a3b_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2450_c7_3a3b
result_is_ram_write_MUX_uxn_opcodes_h_l2450_c7_3a3b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2450_c7_3a3b_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2450_c7_3a3b_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2450_c7_3a3b_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2450_c7_3a3b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2450_c7_3a3b
result_u8_value_MUX_uxn_opcodes_h_l2450_c7_3a3b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2450_c7_3a3b_cond,
result_u8_value_MUX_uxn_opcodes_h_l2450_c7_3a3b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2450_c7_3a3b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2450_c7_3a3b_return_output);

-- t16_MUX_uxn_opcodes_h_l2450_c7_3a3b
t16_MUX_uxn_opcodes_h_l2450_c7_3a3b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2450_c7_3a3b_cond,
t16_MUX_uxn_opcodes_h_l2450_c7_3a3b_iftrue,
t16_MUX_uxn_opcodes_h_l2450_c7_3a3b_iffalse,
t16_MUX_uxn_opcodes_h_l2450_c7_3a3b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2453_c11_bb7a
BIN_OP_EQ_uxn_opcodes_h_l2453_c11_bb7a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2453_c11_bb7a_left,
BIN_OP_EQ_uxn_opcodes_h_l2453_c11_bb7a_right,
BIN_OP_EQ_uxn_opcodes_h_l2453_c11_bb7a_return_output);

-- n8_MUX_uxn_opcodes_h_l2453_c7_2c0c
n8_MUX_uxn_opcodes_h_l2453_c7_2c0c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2453_c7_2c0c_cond,
n8_MUX_uxn_opcodes_h_l2453_c7_2c0c_iftrue,
n8_MUX_uxn_opcodes_h_l2453_c7_2c0c_iffalse,
n8_MUX_uxn_opcodes_h_l2453_c7_2c0c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2453_c7_2c0c
result_sp_relative_shift_MUX_uxn_opcodes_h_l2453_c7_2c0c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2453_c7_2c0c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2453_c7_2c0c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2453_c7_2c0c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2453_c7_2c0c_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2453_c7_2c0c
result_u16_value_MUX_uxn_opcodes_h_l2453_c7_2c0c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2453_c7_2c0c_cond,
result_u16_value_MUX_uxn_opcodes_h_l2453_c7_2c0c_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2453_c7_2c0c_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2453_c7_2c0c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2453_c7_2c0c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2453_c7_2c0c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2453_c7_2c0c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2453_c7_2c0c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2453_c7_2c0c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2453_c7_2c0c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2453_c7_2c0c
result_is_sp_shift_MUX_uxn_opcodes_h_l2453_c7_2c0c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2453_c7_2c0c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2453_c7_2c0c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2453_c7_2c0c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2453_c7_2c0c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2453_c7_2c0c
result_is_opc_done_MUX_uxn_opcodes_h_l2453_c7_2c0c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2453_c7_2c0c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2453_c7_2c0c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2453_c7_2c0c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2453_c7_2c0c_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2453_c7_2c0c
result_is_ram_write_MUX_uxn_opcodes_h_l2453_c7_2c0c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2453_c7_2c0c_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2453_c7_2c0c_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2453_c7_2c0c_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2453_c7_2c0c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2453_c7_2c0c
result_u8_value_MUX_uxn_opcodes_h_l2453_c7_2c0c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2453_c7_2c0c_cond,
result_u8_value_MUX_uxn_opcodes_h_l2453_c7_2c0c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2453_c7_2c0c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2453_c7_2c0c_return_output);

-- t16_MUX_uxn_opcodes_h_l2453_c7_2c0c
t16_MUX_uxn_opcodes_h_l2453_c7_2c0c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2453_c7_2c0c_cond,
t16_MUX_uxn_opcodes_h_l2453_c7_2c0c_iftrue,
t16_MUX_uxn_opcodes_h_l2453_c7_2c0c_iffalse,
t16_MUX_uxn_opcodes_h_l2453_c7_2c0c_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2454_c3_14e8
BIN_OP_OR_uxn_opcodes_h_l2454_c3_14e8 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2454_c3_14e8_left,
BIN_OP_OR_uxn_opcodes_h_l2454_c3_14e8_right,
BIN_OP_OR_uxn_opcodes_h_l2454_c3_14e8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2457_c11_a77f
BIN_OP_EQ_uxn_opcodes_h_l2457_c11_a77f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2457_c11_a77f_left,
BIN_OP_EQ_uxn_opcodes_h_l2457_c11_a77f_right,
BIN_OP_EQ_uxn_opcodes_h_l2457_c11_a77f_return_output);

-- n8_MUX_uxn_opcodes_h_l2457_c7_e164
n8_MUX_uxn_opcodes_h_l2457_c7_e164 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2457_c7_e164_cond,
n8_MUX_uxn_opcodes_h_l2457_c7_e164_iftrue,
n8_MUX_uxn_opcodes_h_l2457_c7_e164_iffalse,
n8_MUX_uxn_opcodes_h_l2457_c7_e164_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2457_c7_e164
result_sp_relative_shift_MUX_uxn_opcodes_h_l2457_c7_e164 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2457_c7_e164_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2457_c7_e164_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2457_c7_e164_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2457_c7_e164_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2457_c7_e164
result_u16_value_MUX_uxn_opcodes_h_l2457_c7_e164 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2457_c7_e164_cond,
result_u16_value_MUX_uxn_opcodes_h_l2457_c7_e164_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2457_c7_e164_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2457_c7_e164_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2457_c7_e164
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2457_c7_e164 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2457_c7_e164_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2457_c7_e164_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2457_c7_e164_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2457_c7_e164_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2457_c7_e164
result_is_sp_shift_MUX_uxn_opcodes_h_l2457_c7_e164 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2457_c7_e164_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2457_c7_e164_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2457_c7_e164_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2457_c7_e164_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2457_c7_e164
result_is_opc_done_MUX_uxn_opcodes_h_l2457_c7_e164 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2457_c7_e164_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2457_c7_e164_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2457_c7_e164_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2457_c7_e164_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2457_c7_e164
result_is_ram_write_MUX_uxn_opcodes_h_l2457_c7_e164 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2457_c7_e164_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2457_c7_e164_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2457_c7_e164_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2457_c7_e164_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2457_c7_e164
result_u8_value_MUX_uxn_opcodes_h_l2457_c7_e164 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2457_c7_e164_cond,
result_u8_value_MUX_uxn_opcodes_h_l2457_c7_e164_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2457_c7_e164_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2457_c7_e164_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2460_c11_6b8d
BIN_OP_EQ_uxn_opcodes_h_l2460_c11_6b8d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2460_c11_6b8d_left,
BIN_OP_EQ_uxn_opcodes_h_l2460_c11_6b8d_right,
BIN_OP_EQ_uxn_opcodes_h_l2460_c11_6b8d_return_output);

-- n8_MUX_uxn_opcodes_h_l2460_c7_139e
n8_MUX_uxn_opcodes_h_l2460_c7_139e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2460_c7_139e_cond,
n8_MUX_uxn_opcodes_h_l2460_c7_139e_iftrue,
n8_MUX_uxn_opcodes_h_l2460_c7_139e_iffalse,
n8_MUX_uxn_opcodes_h_l2460_c7_139e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2460_c7_139e
result_sp_relative_shift_MUX_uxn_opcodes_h_l2460_c7_139e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2460_c7_139e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2460_c7_139e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2460_c7_139e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2460_c7_139e_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2460_c7_139e
result_u16_value_MUX_uxn_opcodes_h_l2460_c7_139e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2460_c7_139e_cond,
result_u16_value_MUX_uxn_opcodes_h_l2460_c7_139e_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2460_c7_139e_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2460_c7_139e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2460_c7_139e
result_is_sp_shift_MUX_uxn_opcodes_h_l2460_c7_139e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2460_c7_139e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2460_c7_139e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2460_c7_139e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2460_c7_139e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2460_c7_139e
result_is_opc_done_MUX_uxn_opcodes_h_l2460_c7_139e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2460_c7_139e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2460_c7_139e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2460_c7_139e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2460_c7_139e_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2460_c7_139e
result_is_ram_write_MUX_uxn_opcodes_h_l2460_c7_139e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2460_c7_139e_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2460_c7_139e_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2460_c7_139e_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2460_c7_139e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2460_c7_139e
result_u8_value_MUX_uxn_opcodes_h_l2460_c7_139e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2460_c7_139e_cond,
result_u8_value_MUX_uxn_opcodes_h_l2460_c7_139e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2460_c7_139e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2460_c7_139e_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2463_c30_417a
sp_relative_shift_uxn_opcodes_h_l2463_c30_417a : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2463_c30_417a_ins,
sp_relative_shift_uxn_opcodes_h_l2463_c30_417a_x,
sp_relative_shift_uxn_opcodes_h_l2463_c30_417a_y,
sp_relative_shift_uxn_opcodes_h_l2463_c30_417a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2468_c11_0cb9
BIN_OP_EQ_uxn_opcodes_h_l2468_c11_0cb9 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2468_c11_0cb9_left,
BIN_OP_EQ_uxn_opcodes_h_l2468_c11_0cb9_right,
BIN_OP_EQ_uxn_opcodes_h_l2468_c11_0cb9_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2468_c7_3fe9
result_is_ram_write_MUX_uxn_opcodes_h_l2468_c7_3fe9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2468_c7_3fe9_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2468_c7_3fe9_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2468_c7_3fe9_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2468_c7_3fe9_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_3fe9
result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_3fe9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_3fe9_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_3fe9_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_3fe9_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_3fe9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_3fe9
result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_3fe9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_3fe9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_3fe9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_3fe9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_3fe9_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t16,
 n8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l2437_c6_a45b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2437_c1_24c9_return_output,
 n8_MUX_uxn_opcodes_h_l2437_c2_a348_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2437_c2_a348_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2437_c2_a348_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2437_c2_a348_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2437_c2_a348_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2437_c2_a348_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2437_c2_a348_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2437_c2_a348_return_output,
 t16_MUX_uxn_opcodes_h_l2437_c2_a348_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2442_c11_7c95_return_output,
 n8_MUX_uxn_opcodes_h_l2442_c7_02a4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2442_c7_02a4_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2442_c7_02a4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2442_c7_02a4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2442_c7_02a4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2442_c7_02a4_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2442_c7_02a4_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2442_c7_02a4_return_output,
 t16_MUX_uxn_opcodes_h_l2442_c7_02a4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2445_c11_704b_return_output,
 n8_MUX_uxn_opcodes_h_l2445_c7_7189_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2445_c7_7189_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2445_c7_7189_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2445_c7_7189_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2445_c7_7189_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2445_c7_7189_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2445_c7_7189_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2445_c7_7189_return_output,
 t16_MUX_uxn_opcodes_h_l2445_c7_7189_return_output,
 CONST_SL_8_uxn_opcodes_h_l2447_c3_5df8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2450_c11_413b_return_output,
 n8_MUX_uxn_opcodes_h_l2450_c7_3a3b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c7_3a3b_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2450_c7_3a3b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c7_3a3b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c7_3a3b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2450_c7_3a3b_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2450_c7_3a3b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2450_c7_3a3b_return_output,
 t16_MUX_uxn_opcodes_h_l2450_c7_3a3b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2453_c11_bb7a_return_output,
 n8_MUX_uxn_opcodes_h_l2453_c7_2c0c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2453_c7_2c0c_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2453_c7_2c0c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2453_c7_2c0c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2453_c7_2c0c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2453_c7_2c0c_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2453_c7_2c0c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2453_c7_2c0c_return_output,
 t16_MUX_uxn_opcodes_h_l2453_c7_2c0c_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2454_c3_14e8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2457_c11_a77f_return_output,
 n8_MUX_uxn_opcodes_h_l2457_c7_e164_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2457_c7_e164_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2457_c7_e164_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2457_c7_e164_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2457_c7_e164_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2457_c7_e164_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2457_c7_e164_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2457_c7_e164_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2460_c11_6b8d_return_output,
 n8_MUX_uxn_opcodes_h_l2460_c7_139e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2460_c7_139e_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2460_c7_139e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2460_c7_139e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2460_c7_139e_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2460_c7_139e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2460_c7_139e_return_output,
 sp_relative_shift_uxn_opcodes_h_l2463_c30_417a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2468_c11_0cb9_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2468_c7_3fe9_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_3fe9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_3fe9_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2437_c6_a45b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2437_c6_a45b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2437_c6_a45b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2437_c1_24c9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2437_c1_24c9_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2437_c1_24c9_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2437_c1_24c9_iffalse : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2437_c2_a348_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2437_c2_a348_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2442_c7_02a4_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2437_c2_a348_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2437_c2_a348_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2437_c2_a348_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2437_c2_a348_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2442_c7_02a4_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2437_c2_a348_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2437_c2_a348_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2437_c2_a348_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2437_c2_a348_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2442_c7_02a4_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2437_c2_a348_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2437_c2_a348_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2437_c2_a348_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2439_c3_e307 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2437_c2_a348_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2442_c7_02a4_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2437_c2_a348_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2437_c2_a348_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2437_c2_a348_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2437_c2_a348_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2442_c7_02a4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2437_c2_a348_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2437_c2_a348_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2437_c2_a348_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2437_c2_a348_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2442_c7_02a4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2437_c2_a348_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2437_c2_a348_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2437_c2_a348_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2437_c2_a348_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2442_c7_02a4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2437_c2_a348_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2437_c2_a348_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2437_c2_a348_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2437_c2_a348_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2442_c7_02a4_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2437_c2_a348_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2437_c2_a348_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2437_c2_a348_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2437_c2_a348_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2442_c7_02a4_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2437_c2_a348_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2437_c2_a348_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2438_c3_ce8d_uxn_opcodes_h_l2438_c3_ce8d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2442_c11_7c95_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2442_c11_7c95_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2442_c11_7c95_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2442_c7_02a4_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2442_c7_02a4_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2445_c7_7189_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2442_c7_02a4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2442_c7_02a4_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2442_c7_02a4_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2445_c7_7189_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2442_c7_02a4_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2442_c7_02a4_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2442_c7_02a4_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2445_c7_7189_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2442_c7_02a4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2442_c7_02a4_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2443_c3_2500 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2442_c7_02a4_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2445_c7_7189_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2442_c7_02a4_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2442_c7_02a4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2442_c7_02a4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2445_c7_7189_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2442_c7_02a4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2442_c7_02a4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2442_c7_02a4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2445_c7_7189_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2442_c7_02a4_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2442_c7_02a4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2442_c7_02a4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2445_c7_7189_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2442_c7_02a4_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2442_c7_02a4_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2442_c7_02a4_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2445_c7_7189_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2442_c7_02a4_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2442_c7_02a4_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2442_c7_02a4_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2445_c7_7189_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2442_c7_02a4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2445_c11_704b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2445_c11_704b_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2445_c11_704b_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2445_c7_7189_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2445_c7_7189_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2450_c7_3a3b_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2445_c7_7189_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2445_c7_7189_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2445_c7_7189_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c7_3a3b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2445_c7_7189_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2445_c7_7189_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2445_c7_7189_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2450_c7_3a3b_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2445_c7_7189_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2445_c7_7189_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2448_c3_50ab : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2445_c7_7189_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c7_3a3b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2445_c7_7189_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2445_c7_7189_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2445_c7_7189_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c7_3a3b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2445_c7_7189_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2445_c7_7189_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2445_c7_7189_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2450_c7_3a3b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2445_c7_7189_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2445_c7_7189_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2445_c7_7189_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2450_c7_3a3b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2445_c7_7189_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2445_c7_7189_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2445_c7_7189_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2450_c7_3a3b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2445_c7_7189_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2445_c7_7189_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2445_c7_7189_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2450_c7_3a3b_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2445_c7_7189_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2447_c3_5df8_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2447_c3_5df8_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2450_c11_413b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2450_c11_413b_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2450_c11_413b_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2450_c7_3a3b_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2450_c7_3a3b_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2453_c7_2c0c_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2450_c7_3a3b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c7_3a3b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c7_3a3b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2453_c7_2c0c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c7_3a3b_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2450_c7_3a3b_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2450_c7_3a3b_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2453_c7_2c0c_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2450_c7_3a3b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c7_3a3b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2451_c3_d1a5 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c7_3a3b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2453_c7_2c0c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c7_3a3b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c7_3a3b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c7_3a3b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2453_c7_2c0c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c7_3a3b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2450_c7_3a3b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2450_c7_3a3b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2453_c7_2c0c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2450_c7_3a3b_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2450_c7_3a3b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2450_c7_3a3b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2453_c7_2c0c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2450_c7_3a3b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2450_c7_3a3b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2450_c7_3a3b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2453_c7_2c0c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2450_c7_3a3b_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2450_c7_3a3b_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2450_c7_3a3b_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2453_c7_2c0c_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2450_c7_3a3b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2453_c11_bb7a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2453_c11_bb7a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2453_c11_bb7a_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2453_c7_2c0c_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2453_c7_2c0c_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2457_c7_e164_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2453_c7_2c0c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2453_c7_2c0c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2453_c7_2c0c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2457_c7_e164_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2453_c7_2c0c_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2453_c7_2c0c_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2453_c7_2c0c_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2457_c7_e164_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2453_c7_2c0c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2453_c7_2c0c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2455_c3_a19f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2453_c7_2c0c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2457_c7_e164_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2453_c7_2c0c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2453_c7_2c0c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2453_c7_2c0c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2457_c7_e164_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2453_c7_2c0c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2453_c7_2c0c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2453_c7_2c0c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2457_c7_e164_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2453_c7_2c0c_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2453_c7_2c0c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2453_c7_2c0c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2457_c7_e164_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2453_c7_2c0c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2453_c7_2c0c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2453_c7_2c0c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2457_c7_e164_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2453_c7_2c0c_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2453_c7_2c0c_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2453_c7_2c0c_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2453_c7_2c0c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2454_c3_14e8_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2454_c3_14e8_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2454_c3_14e8_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2457_c11_a77f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2457_c11_a77f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2457_c11_a77f_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2457_c7_e164_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2457_c7_e164_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2460_c7_139e_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2457_c7_e164_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2457_c7_e164_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2457_c7_e164_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2460_c7_139e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2457_c7_e164_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2457_c7_e164_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2457_c7_e164_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2460_c7_139e_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2457_c7_e164_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2457_c7_e164_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2458_c3_0408 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2457_c7_e164_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2457_c7_e164_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2457_c7_e164_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2457_c7_e164_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2457_c7_e164_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2460_c7_139e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2457_c7_e164_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2457_c7_e164_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2457_c7_e164_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2460_c7_139e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2457_c7_e164_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2457_c7_e164_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2457_c7_e164_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2460_c7_139e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2457_c7_e164_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2457_c7_e164_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2457_c7_e164_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2460_c7_139e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2457_c7_e164_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2460_c11_6b8d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2460_c11_6b8d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2460_c11_6b8d_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2460_c7_139e_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2460_c7_139e_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2460_c7_139e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2460_c7_139e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2460_c7_139e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2460_c7_139e_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2460_c7_139e_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2460_c7_139e_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2460_c7_139e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2460_c7_139e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2460_c7_139e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_3fe9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2460_c7_139e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2460_c7_139e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2460_c7_139e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_3fe9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2460_c7_139e_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2460_c7_139e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2460_c7_139e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2468_c7_3fe9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2460_c7_139e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2460_c7_139e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2460_c7_139e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2460_c7_139e_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2463_c30_417a_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2463_c30_417a_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2463_c30_417a_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2463_c30_417a_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2468_c11_0cb9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2468_c11_0cb9_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2468_c11_0cb9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2468_c7_3fe9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2468_c7_3fe9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2468_c7_3fe9_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_3fe9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_3fe9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_3fe9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_3fe9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_3fe9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_3fe9_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2457_l2453_l2450_l2445_l2442_l2437_l2460_DUPLICATE_78ef_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2457_l2453_l2450_l2445_l2442_l2437_l2460_DUPLICATE_eff7_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2457_l2453_l2450_l2445_l2442_l2468_l2437_DUPLICATE_39c2_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2457_l2453_l2450_l2445_l2442_l2468_l2437_DUPLICATE_18ec_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2457_l2453_l2450_l2445_l2442_l2437_l2460_DUPLICATE_fa86_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2457_l2453_l2450_l2445_l2442_l2468_l2460_DUPLICATE_3c4b_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2446_l2454_DUPLICATE_c5a9_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_0ba7_uxn_opcodes_h_l2474_l2432_DUPLICATE_de2d_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_n8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_n8 := n8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2460_c7_139e_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2437_c6_a45b_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2448_c3_50ab := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2445_c7_7189_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2448_c3_50ab;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_3fe9_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2468_c7_3fe9_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2455_c3_a19f := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2453_c7_2c0c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2455_c3_a19f;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2458_c3_0408 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2457_c7_e164_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2458_c3_0408;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2443_c3_2500 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2442_c7_02a4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2443_c3_2500;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2439_c3_e307 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2437_c2_a348_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2439_c3_e307;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2460_c7_139e_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2450_c11_413b_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2442_c11_7c95_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2451_c3_d1a5 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c7_3a3b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2451_c3_d1a5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2445_c11_704b_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2437_c2_a348_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_3fe9_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2437_c1_24c9_iffalse := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2463_c30_417a_x := signed(std_logic_vector(resize(to_unsigned(3, 2), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2457_c11_a77f_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2453_c11_bb7a_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2460_c11_6b8d_right := to_unsigned(6, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l2463_c30_417a_y := resize(to_signed(-3, 3), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2468_c11_0cb9_right := to_unsigned(7, 3);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2437_c1_24c9_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l2463_c30_417a_ins := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l2437_c2_a348_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2442_c7_02a4_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2445_c7_7189_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2450_c7_3a3b_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2453_c7_2c0c_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2457_c7_e164_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2460_c7_139e_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2437_c6_a45b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2442_c11_7c95_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2445_c11_704b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2450_c11_413b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2453_c11_bb7a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2457_c11_a77f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2460_c11_6b8d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2468_c11_0cb9_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l2460_c7_139e_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2460_c7_139e_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2454_c3_14e8_left := t16;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2460_c7_139e_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2437_c2_a348_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2442_c7_02a4_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2450_c7_3a3b_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2453_c7_2c0c_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l2457_c11_a77f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2457_c11_a77f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2457_c11_a77f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2457_c11_a77f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2457_c11_a77f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2457_c11_a77f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2457_c11_a77f_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2457_l2453_l2450_l2445_l2442_l2468_l2460_DUPLICATE_3c4b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2457_l2453_l2450_l2445_l2442_l2468_l2460_DUPLICATE_3c4b_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2457_l2453_l2450_l2445_l2442_l2468_l2437_DUPLICATE_39c2 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2457_l2453_l2450_l2445_l2442_l2468_l2437_DUPLICATE_39c2_return_output := result.is_sp_shift;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2446_l2454_DUPLICATE_c5a9 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2446_l2454_DUPLICATE_c5a9_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2457_l2453_l2450_l2445_l2442_l2468_l2437_DUPLICATE_18ec LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2457_l2453_l2450_l2445_l2442_l2468_l2437_DUPLICATE_18ec_return_output := result.is_ram_write;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2457_l2453_l2450_l2445_l2442_l2437_l2460_DUPLICATE_eff7 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2457_l2453_l2450_l2445_l2442_l2437_l2460_DUPLICATE_eff7_return_output := result.u16_value;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2457_l2453_l2450_l2445_l2442_l2437_l2460_DUPLICATE_fa86 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2457_l2453_l2450_l2445_l2442_l2437_l2460_DUPLICATE_fa86_return_output := result.u8_value;

     -- sp_relative_shift[uxn_opcodes_h_l2463_c30_417a] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2463_c30_417a_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2463_c30_417a_ins;
     sp_relative_shift_uxn_opcodes_h_l2463_c30_417a_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2463_c30_417a_x;
     sp_relative_shift_uxn_opcodes_h_l2463_c30_417a_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2463_c30_417a_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2463_c30_417a_return_output := sp_relative_shift_uxn_opcodes_h_l2463_c30_417a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2460_c11_6b8d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2460_c11_6b8d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2460_c11_6b8d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2460_c11_6b8d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2460_c11_6b8d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2460_c11_6b8d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2460_c11_6b8d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2450_c11_413b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2450_c11_413b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2450_c11_413b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2450_c11_413b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2450_c11_413b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2450_c11_413b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2450_c11_413b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2442_c11_7c95] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2442_c11_7c95_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2442_c11_7c95_left;
     BIN_OP_EQ_uxn_opcodes_h_l2442_c11_7c95_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2442_c11_7c95_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2442_c11_7c95_return_output := BIN_OP_EQ_uxn_opcodes_h_l2442_c11_7c95_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2457_l2453_l2450_l2445_l2442_l2437_l2460_DUPLICATE_78ef LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2457_l2453_l2450_l2445_l2442_l2437_l2460_DUPLICATE_78ef_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2437_c6_a45b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2437_c6_a45b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2437_c6_a45b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2437_c6_a45b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2437_c6_a45b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2437_c6_a45b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2437_c6_a45b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2445_c11_704b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2445_c11_704b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2445_c11_704b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2445_c11_704b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2445_c11_704b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2445_c11_704b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2445_c11_704b_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2457_c7_e164] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2457_c7_e164_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2468_c11_0cb9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2468_c11_0cb9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2468_c11_0cb9_left;
     BIN_OP_EQ_uxn_opcodes_h_l2468_c11_0cb9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2468_c11_0cb9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2468_c11_0cb9_return_output := BIN_OP_EQ_uxn_opcodes_h_l2468_c11_0cb9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2453_c11_bb7a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2453_c11_bb7a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2453_c11_bb7a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2453_c11_bb7a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2453_c11_bb7a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2453_c11_bb7a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2453_c11_bb7a_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2437_c1_24c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2437_c6_a45b_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2437_c2_a348_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2437_c6_a45b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2437_c2_a348_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2437_c6_a45b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2437_c2_a348_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2437_c6_a45b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2437_c2_a348_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2437_c6_a45b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2437_c2_a348_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2437_c6_a45b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2437_c2_a348_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2437_c6_a45b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2437_c2_a348_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2437_c6_a45b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2437_c2_a348_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2437_c6_a45b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2437_c2_a348_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2437_c6_a45b_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2442_c7_02a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2442_c11_7c95_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2442_c7_02a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2442_c11_7c95_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2442_c7_02a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2442_c11_7c95_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2442_c7_02a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2442_c11_7c95_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2442_c7_02a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2442_c11_7c95_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2442_c7_02a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2442_c11_7c95_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2442_c7_02a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2442_c11_7c95_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2442_c7_02a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2442_c11_7c95_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2442_c7_02a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2442_c11_7c95_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2445_c7_7189_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2445_c11_704b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2445_c7_7189_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2445_c11_704b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2445_c7_7189_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2445_c11_704b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2445_c7_7189_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2445_c11_704b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2445_c7_7189_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2445_c11_704b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2445_c7_7189_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2445_c11_704b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2445_c7_7189_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2445_c11_704b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2445_c7_7189_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2445_c11_704b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2445_c7_7189_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2445_c11_704b_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2450_c7_3a3b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2450_c11_413b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2450_c7_3a3b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2450_c11_413b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2450_c7_3a3b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2450_c11_413b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c7_3a3b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2450_c11_413b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c7_3a3b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2450_c11_413b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c7_3a3b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2450_c11_413b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2450_c7_3a3b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2450_c11_413b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2450_c7_3a3b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2450_c11_413b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2450_c7_3a3b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2450_c11_413b_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2453_c7_2c0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2453_c11_bb7a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2453_c7_2c0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2453_c11_bb7a_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2453_c7_2c0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2453_c11_bb7a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2453_c7_2c0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2453_c11_bb7a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2453_c7_2c0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2453_c11_bb7a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2453_c7_2c0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2453_c11_bb7a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2453_c7_2c0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2453_c11_bb7a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2453_c7_2c0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2453_c11_bb7a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2453_c7_2c0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2453_c11_bb7a_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2457_c7_e164_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2457_c11_a77f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2457_c7_e164_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2457_c11_a77f_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2457_c7_e164_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2457_c11_a77f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2457_c7_e164_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2457_c11_a77f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2457_c7_e164_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2457_c11_a77f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2457_c7_e164_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2457_c11_a77f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2457_c7_e164_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2457_c11_a77f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2457_c7_e164_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2457_c11_a77f_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2460_c7_139e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2460_c11_6b8d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2460_c7_139e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2460_c11_6b8d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2460_c7_139e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2460_c11_6b8d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2460_c7_139e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2460_c11_6b8d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2460_c7_139e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2460_c11_6b8d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2460_c7_139e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2460_c11_6b8d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2460_c7_139e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2460_c11_6b8d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_3fe9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2468_c11_0cb9_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2468_c7_3fe9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2468_c11_0cb9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_3fe9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2468_c11_0cb9_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2454_c3_14e8_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2446_l2454_DUPLICATE_c5a9_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l2447_c3_5df8_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2446_l2454_DUPLICATE_c5a9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2437_c2_a348_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2457_l2453_l2450_l2445_l2442_l2437_l2460_DUPLICATE_78ef_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2442_c7_02a4_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2457_l2453_l2450_l2445_l2442_l2437_l2460_DUPLICATE_78ef_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2445_c7_7189_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2457_l2453_l2450_l2445_l2442_l2437_l2460_DUPLICATE_78ef_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c7_3a3b_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2457_l2453_l2450_l2445_l2442_l2437_l2460_DUPLICATE_78ef_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2453_c7_2c0c_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2457_l2453_l2450_l2445_l2442_l2437_l2460_DUPLICATE_78ef_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2457_c7_e164_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2457_l2453_l2450_l2445_l2442_l2437_l2460_DUPLICATE_78ef_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2460_c7_139e_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2457_l2453_l2450_l2445_l2442_l2437_l2460_DUPLICATE_78ef_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2437_c2_a348_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2457_l2453_l2450_l2445_l2442_l2437_l2460_DUPLICATE_eff7_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2442_c7_02a4_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2457_l2453_l2450_l2445_l2442_l2437_l2460_DUPLICATE_eff7_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2445_c7_7189_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2457_l2453_l2450_l2445_l2442_l2437_l2460_DUPLICATE_eff7_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2450_c7_3a3b_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2457_l2453_l2450_l2445_l2442_l2437_l2460_DUPLICATE_eff7_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2453_c7_2c0c_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2457_l2453_l2450_l2445_l2442_l2437_l2460_DUPLICATE_eff7_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2457_c7_e164_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2457_l2453_l2450_l2445_l2442_l2437_l2460_DUPLICATE_eff7_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2460_c7_139e_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2457_l2453_l2450_l2445_l2442_l2437_l2460_DUPLICATE_eff7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2442_c7_02a4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2457_l2453_l2450_l2445_l2442_l2468_l2460_DUPLICATE_3c4b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2445_c7_7189_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2457_l2453_l2450_l2445_l2442_l2468_l2460_DUPLICATE_3c4b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2450_c7_3a3b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2457_l2453_l2450_l2445_l2442_l2468_l2460_DUPLICATE_3c4b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2453_c7_2c0c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2457_l2453_l2450_l2445_l2442_l2468_l2460_DUPLICATE_3c4b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2457_c7_e164_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2457_l2453_l2450_l2445_l2442_l2468_l2460_DUPLICATE_3c4b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2460_c7_139e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2457_l2453_l2450_l2445_l2442_l2468_l2460_DUPLICATE_3c4b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_3fe9_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2457_l2453_l2450_l2445_l2442_l2468_l2460_DUPLICATE_3c4b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2437_c2_a348_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2457_l2453_l2450_l2445_l2442_l2468_l2437_DUPLICATE_18ec_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2442_c7_02a4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2457_l2453_l2450_l2445_l2442_l2468_l2437_DUPLICATE_18ec_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2445_c7_7189_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2457_l2453_l2450_l2445_l2442_l2468_l2437_DUPLICATE_18ec_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2450_c7_3a3b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2457_l2453_l2450_l2445_l2442_l2468_l2437_DUPLICATE_18ec_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2453_c7_2c0c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2457_l2453_l2450_l2445_l2442_l2468_l2437_DUPLICATE_18ec_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2457_c7_e164_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2457_l2453_l2450_l2445_l2442_l2468_l2437_DUPLICATE_18ec_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2468_c7_3fe9_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2457_l2453_l2450_l2445_l2442_l2468_l2437_DUPLICATE_18ec_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2437_c2_a348_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2457_l2453_l2450_l2445_l2442_l2468_l2437_DUPLICATE_39c2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2442_c7_02a4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2457_l2453_l2450_l2445_l2442_l2468_l2437_DUPLICATE_39c2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2445_c7_7189_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2457_l2453_l2450_l2445_l2442_l2468_l2437_DUPLICATE_39c2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c7_3a3b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2457_l2453_l2450_l2445_l2442_l2468_l2437_DUPLICATE_39c2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2453_c7_2c0c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2457_l2453_l2450_l2445_l2442_l2468_l2437_DUPLICATE_39c2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2457_c7_e164_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2457_l2453_l2450_l2445_l2442_l2468_l2437_DUPLICATE_39c2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_3fe9_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2457_l2453_l2450_l2445_l2442_l2468_l2437_DUPLICATE_39c2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2437_c2_a348_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2457_l2453_l2450_l2445_l2442_l2437_l2460_DUPLICATE_fa86_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2442_c7_02a4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2457_l2453_l2450_l2445_l2442_l2437_l2460_DUPLICATE_fa86_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2445_c7_7189_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2457_l2453_l2450_l2445_l2442_l2437_l2460_DUPLICATE_fa86_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2450_c7_3a3b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2457_l2453_l2450_l2445_l2442_l2437_l2460_DUPLICATE_fa86_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2453_c7_2c0c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2457_l2453_l2450_l2445_l2442_l2437_l2460_DUPLICATE_fa86_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2457_c7_e164_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2457_l2453_l2450_l2445_l2442_l2437_l2460_DUPLICATE_fa86_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2460_c7_139e_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2457_l2453_l2450_l2445_l2442_l2437_l2460_DUPLICATE_fa86_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2457_c7_e164_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2457_c7_e164_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2460_c7_139e_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2463_c30_417a_return_output;
     -- n8_MUX[uxn_opcodes_h_l2460_c7_139e] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2460_c7_139e_cond <= VAR_n8_MUX_uxn_opcodes_h_l2460_c7_139e_cond;
     n8_MUX_uxn_opcodes_h_l2460_c7_139e_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2460_c7_139e_iftrue;
     n8_MUX_uxn_opcodes_h_l2460_c7_139e_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2460_c7_139e_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2460_c7_139e_return_output := n8_MUX_uxn_opcodes_h_l2460_c7_139e_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2460_c7_139e] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2460_c7_139e_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2460_c7_139e_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2460_c7_139e_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2460_c7_139e_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2460_c7_139e_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2460_c7_139e_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2460_c7_139e_return_output := result_u16_value_MUX_uxn_opcodes_h_l2460_c7_139e_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2454_c3_14e8] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2454_c3_14e8_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2454_c3_14e8_left;
     BIN_OP_OR_uxn_opcodes_h_l2454_c3_14e8_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2454_c3_14e8_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2454_c3_14e8_return_output := BIN_OP_OR_uxn_opcodes_h_l2454_c3_14e8_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2460_c7_139e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2460_c7_139e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2460_c7_139e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2460_c7_139e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2460_c7_139e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2460_c7_139e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2460_c7_139e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2460_c7_139e_return_output := result_u8_value_MUX_uxn_opcodes_h_l2460_c7_139e_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l2447_c3_5df8] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l2447_c3_5df8_x <= VAR_CONST_SL_8_uxn_opcodes_h_l2447_c3_5df8_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l2447_c3_5df8_return_output := CONST_SL_8_uxn_opcodes_h_l2447_c3_5df8_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2437_c1_24c9] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2437_c1_24c9_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2437_c1_24c9_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2437_c1_24c9_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2437_c1_24c9_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2437_c1_24c9_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2437_c1_24c9_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2437_c1_24c9_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2437_c1_24c9_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2468_c7_3fe9] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2468_c7_3fe9_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2468_c7_3fe9_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2468_c7_3fe9_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2468_c7_3fe9_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2468_c7_3fe9_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2468_c7_3fe9_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2468_c7_3fe9_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2468_c7_3fe9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2468_c7_3fe9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_3fe9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_3fe9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_3fe9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_3fe9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_3fe9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_3fe9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_3fe9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_3fe9_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2468_c7_3fe9] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_3fe9_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_3fe9_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_3fe9_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_3fe9_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_3fe9_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_3fe9_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_3fe9_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_3fe9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2460_c7_139e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2460_c7_139e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2460_c7_139e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2460_c7_139e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2460_c7_139e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2460_c7_139e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2460_c7_139e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2460_c7_139e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2460_c7_139e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2457_c7_e164] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2457_c7_e164_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2457_c7_e164_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2457_c7_e164_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2457_c7_e164_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2457_c7_e164_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2457_c7_e164_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2457_c7_e164_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2457_c7_e164_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l2453_c7_2c0c_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2454_c3_14e8_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2445_c7_7189_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l2447_c3_5df8_return_output;
     VAR_printf_uxn_opcodes_h_l2438_c3_ce8d_uxn_opcodes_h_l2438_c3_ce8d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2437_c1_24c9_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2457_c7_e164_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2460_c7_139e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2460_c7_139e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_3fe9_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2460_c7_139e_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2468_c7_3fe9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2460_c7_139e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_3fe9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2457_c7_e164_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2460_c7_139e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2453_c7_2c0c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2457_c7_e164_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2457_c7_e164_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2460_c7_139e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2457_c7_e164_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2460_c7_139e_return_output;
     -- printf_uxn_opcodes_h_l2438_c3_ce8d[uxn_opcodes_h_l2438_c3_ce8d] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2438_c3_ce8d_uxn_opcodes_h_l2438_c3_ce8d_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2438_c3_ce8d_uxn_opcodes_h_l2438_c3_ce8d_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2457_c7_e164] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2457_c7_e164_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2457_c7_e164_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2457_c7_e164_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2457_c7_e164_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2457_c7_e164_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2457_c7_e164_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2457_c7_e164_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2457_c7_e164_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2460_c7_139e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2460_c7_139e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2460_c7_139e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2460_c7_139e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2460_c7_139e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2460_c7_139e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2460_c7_139e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2460_c7_139e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2460_c7_139e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2460_c7_139e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2460_c7_139e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2460_c7_139e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2460_c7_139e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2460_c7_139e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2460_c7_139e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2460_c7_139e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2460_c7_139e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2460_c7_139e_return_output;

     -- t16_MUX[uxn_opcodes_h_l2453_c7_2c0c] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2453_c7_2c0c_cond <= VAR_t16_MUX_uxn_opcodes_h_l2453_c7_2c0c_cond;
     t16_MUX_uxn_opcodes_h_l2453_c7_2c0c_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2453_c7_2c0c_iftrue;
     t16_MUX_uxn_opcodes_h_l2453_c7_2c0c_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2453_c7_2c0c_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2453_c7_2c0c_return_output := t16_MUX_uxn_opcodes_h_l2453_c7_2c0c_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2457_c7_e164] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2457_c7_e164_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2457_c7_e164_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2457_c7_e164_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2457_c7_e164_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2457_c7_e164_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2457_c7_e164_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2457_c7_e164_return_output := result_u16_value_MUX_uxn_opcodes_h_l2457_c7_e164_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2457_c7_e164] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2457_c7_e164_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2457_c7_e164_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2457_c7_e164_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2457_c7_e164_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2457_c7_e164_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2457_c7_e164_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2457_c7_e164_return_output := result_u8_value_MUX_uxn_opcodes_h_l2457_c7_e164_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2453_c7_2c0c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2453_c7_2c0c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2453_c7_2c0c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2453_c7_2c0c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2453_c7_2c0c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2453_c7_2c0c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2453_c7_2c0c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2453_c7_2c0c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2453_c7_2c0c_return_output;

     -- n8_MUX[uxn_opcodes_h_l2457_c7_e164] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2457_c7_e164_cond <= VAR_n8_MUX_uxn_opcodes_h_l2457_c7_e164_cond;
     n8_MUX_uxn_opcodes_h_l2457_c7_e164_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2457_c7_e164_iftrue;
     n8_MUX_uxn_opcodes_h_l2457_c7_e164_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2457_c7_e164_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2457_c7_e164_return_output := n8_MUX_uxn_opcodes_h_l2457_c7_e164_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2460_c7_139e] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2460_c7_139e_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2460_c7_139e_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2460_c7_139e_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2460_c7_139e_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2460_c7_139e_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2460_c7_139e_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2460_c7_139e_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2460_c7_139e_return_output;

     -- Submodule level 3
     VAR_n8_MUX_uxn_opcodes_h_l2453_c7_2c0c_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2457_c7_e164_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2457_c7_e164_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2460_c7_139e_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2457_c7_e164_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2460_c7_139e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2457_c7_e164_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2460_c7_139e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2453_c7_2c0c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2457_c7_e164_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c7_3a3b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2453_c7_2c0c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2453_c7_2c0c_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2457_c7_e164_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2453_c7_2c0c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2457_c7_e164_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2450_c7_3a3b_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2453_c7_2c0c_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2450_c7_3a3b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c7_3a3b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c7_3a3b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c7_3a3b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c7_3a3b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c7_3a3b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c7_3a3b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c7_3a3b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c7_3a3b_return_output;

     -- n8_MUX[uxn_opcodes_h_l2453_c7_2c0c] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2453_c7_2c0c_cond <= VAR_n8_MUX_uxn_opcodes_h_l2453_c7_2c0c_cond;
     n8_MUX_uxn_opcodes_h_l2453_c7_2c0c_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2453_c7_2c0c_iftrue;
     n8_MUX_uxn_opcodes_h_l2453_c7_2c0c_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2453_c7_2c0c_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2453_c7_2c0c_return_output := n8_MUX_uxn_opcodes_h_l2453_c7_2c0c_return_output;

     -- t16_MUX[uxn_opcodes_h_l2450_c7_3a3b] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2450_c7_3a3b_cond <= VAR_t16_MUX_uxn_opcodes_h_l2450_c7_3a3b_cond;
     t16_MUX_uxn_opcodes_h_l2450_c7_3a3b_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2450_c7_3a3b_iftrue;
     t16_MUX_uxn_opcodes_h_l2450_c7_3a3b_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2450_c7_3a3b_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2450_c7_3a3b_return_output := t16_MUX_uxn_opcodes_h_l2450_c7_3a3b_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2457_c7_e164] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2457_c7_e164_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2457_c7_e164_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2457_c7_e164_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2457_c7_e164_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2457_c7_e164_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2457_c7_e164_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2457_c7_e164_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2457_c7_e164_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2453_c7_2c0c] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2453_c7_2c0c_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2453_c7_2c0c_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2453_c7_2c0c_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2453_c7_2c0c_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2453_c7_2c0c_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2453_c7_2c0c_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2453_c7_2c0c_return_output := result_u16_value_MUX_uxn_opcodes_h_l2453_c7_2c0c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2453_c7_2c0c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2453_c7_2c0c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2453_c7_2c0c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2453_c7_2c0c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2453_c7_2c0c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2453_c7_2c0c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2453_c7_2c0c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2453_c7_2c0c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2453_c7_2c0c_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2453_c7_2c0c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2453_c7_2c0c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2453_c7_2c0c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2453_c7_2c0c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2453_c7_2c0c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2453_c7_2c0c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2453_c7_2c0c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2453_c7_2c0c_return_output := result_u8_value_MUX_uxn_opcodes_h_l2453_c7_2c0c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2457_c7_e164] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2457_c7_e164_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2457_c7_e164_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2457_c7_e164_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2457_c7_e164_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2457_c7_e164_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2457_c7_e164_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2457_c7_e164_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2457_c7_e164_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2457_c7_e164] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2457_c7_e164_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2457_c7_e164_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2457_c7_e164_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2457_c7_e164_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2457_c7_e164_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2457_c7_e164_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2457_c7_e164_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2457_c7_e164_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l2450_c7_3a3b_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2453_c7_2c0c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2453_c7_2c0c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2457_c7_e164_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2453_c7_2c0c_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2457_c7_e164_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2453_c7_2c0c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2457_c7_e164_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c7_3a3b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2453_c7_2c0c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2445_c7_7189_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c7_3a3b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2450_c7_3a3b_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2453_c7_2c0c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2450_c7_3a3b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2453_c7_2c0c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2445_c7_7189_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2450_c7_3a3b_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l2453_c7_2c0c] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2453_c7_2c0c_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2453_c7_2c0c_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2453_c7_2c0c_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2453_c7_2c0c_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2453_c7_2c0c_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2453_c7_2c0c_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2453_c7_2c0c_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2453_c7_2c0c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2453_c7_2c0c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2453_c7_2c0c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2453_c7_2c0c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2453_c7_2c0c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2453_c7_2c0c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2453_c7_2c0c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2453_c7_2c0c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2453_c7_2c0c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2453_c7_2c0c_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2450_c7_3a3b] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2450_c7_3a3b_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2450_c7_3a3b_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2450_c7_3a3b_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2450_c7_3a3b_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2450_c7_3a3b_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2450_c7_3a3b_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2450_c7_3a3b_return_output := result_u16_value_MUX_uxn_opcodes_h_l2450_c7_3a3b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2453_c7_2c0c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2453_c7_2c0c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2453_c7_2c0c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2453_c7_2c0c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2453_c7_2c0c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2453_c7_2c0c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2453_c7_2c0c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2453_c7_2c0c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2453_c7_2c0c_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2450_c7_3a3b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2450_c7_3a3b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2450_c7_3a3b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2450_c7_3a3b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2450_c7_3a3b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2450_c7_3a3b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2450_c7_3a3b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2450_c7_3a3b_return_output := result_u8_value_MUX_uxn_opcodes_h_l2450_c7_3a3b_return_output;

     -- t16_MUX[uxn_opcodes_h_l2445_c7_7189] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2445_c7_7189_cond <= VAR_t16_MUX_uxn_opcodes_h_l2445_c7_7189_cond;
     t16_MUX_uxn_opcodes_h_l2445_c7_7189_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2445_c7_7189_iftrue;
     t16_MUX_uxn_opcodes_h_l2445_c7_7189_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2445_c7_7189_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2445_c7_7189_return_output := t16_MUX_uxn_opcodes_h_l2445_c7_7189_return_output;

     -- n8_MUX[uxn_opcodes_h_l2450_c7_3a3b] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2450_c7_3a3b_cond <= VAR_n8_MUX_uxn_opcodes_h_l2450_c7_3a3b_cond;
     n8_MUX_uxn_opcodes_h_l2450_c7_3a3b_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2450_c7_3a3b_iftrue;
     n8_MUX_uxn_opcodes_h_l2450_c7_3a3b_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2450_c7_3a3b_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2450_c7_3a3b_return_output := n8_MUX_uxn_opcodes_h_l2450_c7_3a3b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2450_c7_3a3b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c7_3a3b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c7_3a3b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c7_3a3b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c7_3a3b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c7_3a3b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c7_3a3b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c7_3a3b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c7_3a3b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2445_c7_7189] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2445_c7_7189_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2445_c7_7189_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2445_c7_7189_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2445_c7_7189_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2445_c7_7189_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2445_c7_7189_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2445_c7_7189_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2445_c7_7189_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l2445_c7_7189_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2450_c7_3a3b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2450_c7_3a3b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2453_c7_2c0c_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2450_c7_3a3b_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2453_c7_2c0c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c7_3a3b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2453_c7_2c0c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2445_c7_7189_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c7_3a3b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2442_c7_02a4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2445_c7_7189_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2445_c7_7189_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2450_c7_3a3b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2445_c7_7189_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2450_c7_3a3b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2442_c7_02a4_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2445_c7_7189_return_output;
     -- t16_MUX[uxn_opcodes_h_l2442_c7_02a4] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2442_c7_02a4_cond <= VAR_t16_MUX_uxn_opcodes_h_l2442_c7_02a4_cond;
     t16_MUX_uxn_opcodes_h_l2442_c7_02a4_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2442_c7_02a4_iftrue;
     t16_MUX_uxn_opcodes_h_l2442_c7_02a4_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2442_c7_02a4_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2442_c7_02a4_return_output := t16_MUX_uxn_opcodes_h_l2442_c7_02a4_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2445_c7_7189] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2445_c7_7189_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2445_c7_7189_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2445_c7_7189_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2445_c7_7189_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2445_c7_7189_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2445_c7_7189_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2445_c7_7189_return_output := result_u16_value_MUX_uxn_opcodes_h_l2445_c7_7189_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2445_c7_7189] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2445_c7_7189_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2445_c7_7189_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2445_c7_7189_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2445_c7_7189_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2445_c7_7189_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2445_c7_7189_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2445_c7_7189_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2445_c7_7189_return_output;

     -- n8_MUX[uxn_opcodes_h_l2445_c7_7189] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2445_c7_7189_cond <= VAR_n8_MUX_uxn_opcodes_h_l2445_c7_7189_cond;
     n8_MUX_uxn_opcodes_h_l2445_c7_7189_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2445_c7_7189_iftrue;
     n8_MUX_uxn_opcodes_h_l2445_c7_7189_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2445_c7_7189_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2445_c7_7189_return_output := n8_MUX_uxn_opcodes_h_l2445_c7_7189_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2450_c7_3a3b] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2450_c7_3a3b_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2450_c7_3a3b_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2450_c7_3a3b_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2450_c7_3a3b_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2450_c7_3a3b_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2450_c7_3a3b_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2450_c7_3a3b_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2450_c7_3a3b_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2445_c7_7189] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2445_c7_7189_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2445_c7_7189_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2445_c7_7189_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2445_c7_7189_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2445_c7_7189_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2445_c7_7189_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2445_c7_7189_return_output := result_u8_value_MUX_uxn_opcodes_h_l2445_c7_7189_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2450_c7_3a3b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2450_c7_3a3b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2450_c7_3a3b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2450_c7_3a3b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2450_c7_3a3b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2450_c7_3a3b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2450_c7_3a3b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2450_c7_3a3b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2450_c7_3a3b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2442_c7_02a4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2442_c7_02a4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2442_c7_02a4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2442_c7_02a4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2442_c7_02a4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2442_c7_02a4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2442_c7_02a4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2442_c7_02a4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2442_c7_02a4_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2450_c7_3a3b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c7_3a3b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c7_3a3b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c7_3a3b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c7_3a3b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c7_3a3b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c7_3a3b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c7_3a3b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c7_3a3b_return_output;

     -- Submodule level 6
     VAR_n8_MUX_uxn_opcodes_h_l2442_c7_02a4_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2445_c7_7189_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2445_c7_7189_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2450_c7_3a3b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2445_c7_7189_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2450_c7_3a3b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2445_c7_7189_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c7_3a3b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2442_c7_02a4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2445_c7_7189_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2437_c2_a348_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2442_c7_02a4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2442_c7_02a4_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2445_c7_7189_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2442_c7_02a4_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2445_c7_7189_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2437_c2_a348_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2442_c7_02a4_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2442_c7_02a4] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2442_c7_02a4_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2442_c7_02a4_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2442_c7_02a4_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2442_c7_02a4_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2442_c7_02a4_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2442_c7_02a4_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2442_c7_02a4_return_output := result_u8_value_MUX_uxn_opcodes_h_l2442_c7_02a4_return_output;

     -- n8_MUX[uxn_opcodes_h_l2442_c7_02a4] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2442_c7_02a4_cond <= VAR_n8_MUX_uxn_opcodes_h_l2442_c7_02a4_cond;
     n8_MUX_uxn_opcodes_h_l2442_c7_02a4_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2442_c7_02a4_iftrue;
     n8_MUX_uxn_opcodes_h_l2442_c7_02a4_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2442_c7_02a4_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2442_c7_02a4_return_output := n8_MUX_uxn_opcodes_h_l2442_c7_02a4_return_output;

     -- t16_MUX[uxn_opcodes_h_l2437_c2_a348] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2437_c2_a348_cond <= VAR_t16_MUX_uxn_opcodes_h_l2437_c2_a348_cond;
     t16_MUX_uxn_opcodes_h_l2437_c2_a348_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2437_c2_a348_iftrue;
     t16_MUX_uxn_opcodes_h_l2437_c2_a348_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2437_c2_a348_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2437_c2_a348_return_output := t16_MUX_uxn_opcodes_h_l2437_c2_a348_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2445_c7_7189] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2445_c7_7189_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2445_c7_7189_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2445_c7_7189_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2445_c7_7189_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2445_c7_7189_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2445_c7_7189_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2445_c7_7189_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2445_c7_7189_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2445_c7_7189] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2445_c7_7189_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2445_c7_7189_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2445_c7_7189_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2445_c7_7189_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2445_c7_7189_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2445_c7_7189_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2445_c7_7189_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2445_c7_7189_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2442_c7_02a4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2442_c7_02a4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2442_c7_02a4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2442_c7_02a4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2442_c7_02a4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2442_c7_02a4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2442_c7_02a4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2442_c7_02a4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2442_c7_02a4_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2442_c7_02a4] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2442_c7_02a4_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2442_c7_02a4_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2442_c7_02a4_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2442_c7_02a4_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2442_c7_02a4_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2442_c7_02a4_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2442_c7_02a4_return_output := result_u16_value_MUX_uxn_opcodes_h_l2442_c7_02a4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2445_c7_7189] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2445_c7_7189_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2445_c7_7189_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2445_c7_7189_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2445_c7_7189_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2445_c7_7189_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2445_c7_7189_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2445_c7_7189_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2445_c7_7189_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2437_c2_a348] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2437_c2_a348_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2437_c2_a348_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2437_c2_a348_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2437_c2_a348_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2437_c2_a348_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2437_c2_a348_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2437_c2_a348_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2437_c2_a348_return_output;

     -- Submodule level 7
     VAR_n8_MUX_uxn_opcodes_h_l2437_c2_a348_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2442_c7_02a4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2442_c7_02a4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2445_c7_7189_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2442_c7_02a4_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2445_c7_7189_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2442_c7_02a4_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2445_c7_7189_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2437_c2_a348_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2442_c7_02a4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2437_c2_a348_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2442_c7_02a4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2437_c2_a348_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2442_c7_02a4_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2437_c2_a348_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l2442_c7_02a4] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2442_c7_02a4_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2442_c7_02a4_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2442_c7_02a4_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2442_c7_02a4_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2442_c7_02a4_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2442_c7_02a4_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2442_c7_02a4_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2442_c7_02a4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2437_c2_a348] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2437_c2_a348_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2437_c2_a348_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2437_c2_a348_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2437_c2_a348_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2437_c2_a348_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2437_c2_a348_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2437_c2_a348_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2437_c2_a348_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2437_c2_a348] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2437_c2_a348_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2437_c2_a348_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2437_c2_a348_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2437_c2_a348_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2437_c2_a348_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2437_c2_a348_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2437_c2_a348_return_output := result_u16_value_MUX_uxn_opcodes_h_l2437_c2_a348_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2437_c2_a348] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2437_c2_a348_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2437_c2_a348_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2437_c2_a348_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2437_c2_a348_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2437_c2_a348_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2437_c2_a348_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2437_c2_a348_return_output := result_u8_value_MUX_uxn_opcodes_h_l2437_c2_a348_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2442_c7_02a4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2442_c7_02a4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2442_c7_02a4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2442_c7_02a4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2442_c7_02a4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2442_c7_02a4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2442_c7_02a4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2442_c7_02a4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2442_c7_02a4_return_output;

     -- n8_MUX[uxn_opcodes_h_l2437_c2_a348] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2437_c2_a348_cond <= VAR_n8_MUX_uxn_opcodes_h_l2437_c2_a348_cond;
     n8_MUX_uxn_opcodes_h_l2437_c2_a348_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2437_c2_a348_iftrue;
     n8_MUX_uxn_opcodes_h_l2437_c2_a348_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2437_c2_a348_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2437_c2_a348_return_output := n8_MUX_uxn_opcodes_h_l2437_c2_a348_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2442_c7_02a4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2442_c7_02a4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2442_c7_02a4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2442_c7_02a4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2442_c7_02a4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2442_c7_02a4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2442_c7_02a4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2442_c7_02a4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2442_c7_02a4_return_output;

     -- Submodule level 8
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l2437_c2_a348_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2437_c2_a348_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2442_c7_02a4_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2437_c2_a348_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2442_c7_02a4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2437_c2_a348_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2442_c7_02a4_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l2437_c2_a348] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2437_c2_a348_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2437_c2_a348_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2437_c2_a348_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2437_c2_a348_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2437_c2_a348_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2437_c2_a348_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2437_c2_a348_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2437_c2_a348_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2437_c2_a348] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2437_c2_a348_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2437_c2_a348_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2437_c2_a348_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2437_c2_a348_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2437_c2_a348_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2437_c2_a348_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2437_c2_a348_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2437_c2_a348_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2437_c2_a348] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2437_c2_a348_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2437_c2_a348_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2437_c2_a348_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2437_c2_a348_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2437_c2_a348_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2437_c2_a348_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2437_c2_a348_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2437_c2_a348_return_output;

     -- Submodule level 9
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_0ba7_uxn_opcodes_h_l2474_l2432_DUPLICATE_de2d LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_0ba7_uxn_opcodes_h_l2474_l2432_DUPLICATE_de2d_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_0ba7(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2437_c2_a348_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2437_c2_a348_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2437_c2_a348_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2437_c2_a348_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2437_c2_a348_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2437_c2_a348_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2437_c2_a348_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_0ba7_uxn_opcodes_h_l2474_l2432_DUPLICATE_de2d_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_0ba7_uxn_opcodes_h_l2474_l2432_DUPLICATE_de2d_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_n8 <= REG_VAR_n8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     n8 <= REG_COMB_n8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
