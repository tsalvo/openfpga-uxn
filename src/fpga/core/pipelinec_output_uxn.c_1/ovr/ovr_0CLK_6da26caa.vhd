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
-- -- use ieee.float_pkg.all;
use work.c_structs_pkg.all;
-- Submodules: 59
entity ovr_0CLK_6da26caa is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end ovr_0CLK_6da26caa;
architecture arch of ovr_0CLK_6da26caa is
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
-- BIN_OP_EQ[uxn_opcodes_h_l304_c6_ce95]
signal BIN_OP_EQ_uxn_opcodes_h_l304_c6_ce95_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l304_c6_ce95_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l304_c6_ce95_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l304_c2_55ca]
signal n8_MUX_uxn_opcodes_h_l304_c2_55ca_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l304_c2_55ca_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l304_c2_55ca_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l304_c2_55ca_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l304_c2_55ca]
signal t8_MUX_uxn_opcodes_h_l304_c2_55ca_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l304_c2_55ca_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l304_c2_55ca_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l304_c2_55ca_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l304_c2_55ca]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l304_c2_55ca_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l304_c2_55ca_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l304_c2_55ca_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l304_c2_55ca_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l304_c2_55ca]
signal result_u8_value_MUX_uxn_opcodes_h_l304_c2_55ca_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l304_c2_55ca_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l304_c2_55ca_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l304_c2_55ca_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l304_c2_55ca]
signal result_is_stack_write_MUX_uxn_opcodes_h_l304_c2_55ca_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l304_c2_55ca_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l304_c2_55ca_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l304_c2_55ca_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l304_c2_55ca]
signal result_is_opc_done_MUX_uxn_opcodes_h_l304_c2_55ca_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l304_c2_55ca_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l304_c2_55ca_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l304_c2_55ca_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l304_c2_55ca]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l304_c2_55ca_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l304_c2_55ca_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l304_c2_55ca_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l304_c2_55ca_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l304_c2_55ca]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l304_c2_55ca_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l304_c2_55ca_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l304_c2_55ca_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l304_c2_55ca_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l309_c11_8109]
signal BIN_OP_EQ_uxn_opcodes_h_l309_c11_8109_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l309_c11_8109_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l309_c11_8109_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l309_c7_9210]
signal n8_MUX_uxn_opcodes_h_l309_c7_9210_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l309_c7_9210_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l309_c7_9210_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l309_c7_9210_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l309_c7_9210]
signal t8_MUX_uxn_opcodes_h_l309_c7_9210_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l309_c7_9210_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l309_c7_9210_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l309_c7_9210_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l309_c7_9210]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_9210_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_9210_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_9210_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_9210_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l309_c7_9210]
signal result_u8_value_MUX_uxn_opcodes_h_l309_c7_9210_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l309_c7_9210_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l309_c7_9210_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l309_c7_9210_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l309_c7_9210]
signal result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_9210_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_9210_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_9210_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_9210_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l309_c7_9210]
signal result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_9210_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_9210_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_9210_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_9210_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l309_c7_9210]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l309_c7_9210_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l309_c7_9210_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l309_c7_9210_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l309_c7_9210_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l309_c7_9210]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l309_c7_9210_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l309_c7_9210_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l309_c7_9210_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l309_c7_9210_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l312_c11_6008]
signal BIN_OP_EQ_uxn_opcodes_h_l312_c11_6008_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l312_c11_6008_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l312_c11_6008_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l312_c7_1cf4]
signal n8_MUX_uxn_opcodes_h_l312_c7_1cf4_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l312_c7_1cf4_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l312_c7_1cf4_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l312_c7_1cf4_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l312_c7_1cf4]
signal t8_MUX_uxn_opcodes_h_l312_c7_1cf4_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l312_c7_1cf4_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l312_c7_1cf4_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l312_c7_1cf4_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l312_c7_1cf4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l312_c7_1cf4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l312_c7_1cf4_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l312_c7_1cf4_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l312_c7_1cf4_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l312_c7_1cf4]
signal result_u8_value_MUX_uxn_opcodes_h_l312_c7_1cf4_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l312_c7_1cf4_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l312_c7_1cf4_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l312_c7_1cf4_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l312_c7_1cf4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l312_c7_1cf4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l312_c7_1cf4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l312_c7_1cf4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l312_c7_1cf4_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l312_c7_1cf4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l312_c7_1cf4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l312_c7_1cf4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l312_c7_1cf4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l312_c7_1cf4_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l312_c7_1cf4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l312_c7_1cf4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l312_c7_1cf4_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l312_c7_1cf4_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l312_c7_1cf4_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l312_c7_1cf4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l312_c7_1cf4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l312_c7_1cf4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l312_c7_1cf4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l312_c7_1cf4_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l316_c11_a1ca]
signal BIN_OP_EQ_uxn_opcodes_h_l316_c11_a1ca_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l316_c11_a1ca_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l316_c11_a1ca_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l316_c7_a348]
signal n8_MUX_uxn_opcodes_h_l316_c7_a348_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l316_c7_a348_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l316_c7_a348_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l316_c7_a348_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l316_c7_a348]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l316_c7_a348_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l316_c7_a348_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l316_c7_a348_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l316_c7_a348_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l316_c7_a348]
signal result_u8_value_MUX_uxn_opcodes_h_l316_c7_a348_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l316_c7_a348_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l316_c7_a348_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l316_c7_a348_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l316_c7_a348]
signal result_is_stack_write_MUX_uxn_opcodes_h_l316_c7_a348_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l316_c7_a348_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l316_c7_a348_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l316_c7_a348_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l316_c7_a348]
signal result_is_opc_done_MUX_uxn_opcodes_h_l316_c7_a348_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l316_c7_a348_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l316_c7_a348_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l316_c7_a348_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l316_c7_a348]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l316_c7_a348_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l316_c7_a348_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l316_c7_a348_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l316_c7_a348_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l316_c7_a348]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l316_c7_a348_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l316_c7_a348_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l316_c7_a348_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l316_c7_a348_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l319_c11_f31e]
signal BIN_OP_EQ_uxn_opcodes_h_l319_c11_f31e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l319_c11_f31e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l319_c11_f31e_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l319_c7_36cc]
signal n8_MUX_uxn_opcodes_h_l319_c7_36cc_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l319_c7_36cc_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l319_c7_36cc_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l319_c7_36cc_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l319_c7_36cc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l319_c7_36cc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l319_c7_36cc_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l319_c7_36cc_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l319_c7_36cc_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l319_c7_36cc]
signal result_u8_value_MUX_uxn_opcodes_h_l319_c7_36cc_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l319_c7_36cc_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l319_c7_36cc_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l319_c7_36cc_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l319_c7_36cc]
signal result_is_stack_write_MUX_uxn_opcodes_h_l319_c7_36cc_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l319_c7_36cc_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l319_c7_36cc_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l319_c7_36cc_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l319_c7_36cc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l319_c7_36cc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l319_c7_36cc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l319_c7_36cc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l319_c7_36cc_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l319_c7_36cc]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l319_c7_36cc_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l319_c7_36cc_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l319_c7_36cc_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l319_c7_36cc_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l319_c7_36cc]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l319_c7_36cc_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l319_c7_36cc_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l319_c7_36cc_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l319_c7_36cc_return_output : unsigned(0 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l322_c30_93db]
signal sp_relative_shift_uxn_opcodes_h_l322_c30_93db_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l322_c30_93db_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l322_c30_93db_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l322_c30_93db_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l327_c11_5444]
signal BIN_OP_EQ_uxn_opcodes_h_l327_c11_5444_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l327_c11_5444_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l327_c11_5444_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l327_c7_b3a5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l327_c7_b3a5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l327_c7_b3a5_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l327_c7_b3a5_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l327_c7_b3a5_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l327_c7_b3a5]
signal result_u8_value_MUX_uxn_opcodes_h_l327_c7_b3a5_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l327_c7_b3a5_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l327_c7_b3a5_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l327_c7_b3a5_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l327_c7_b3a5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l327_c7_b3a5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l327_c7_b3a5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l327_c7_b3a5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l327_c7_b3a5_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l327_c7_b3a5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l327_c7_b3a5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l327_c7_b3a5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l327_c7_b3a5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l327_c7_b3a5_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l327_c7_b3a5]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l327_c7_b3a5_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l327_c7_b3a5_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l327_c7_b3a5_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l327_c7_b3a5_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l332_c11_cc97]
signal BIN_OP_EQ_uxn_opcodes_h_l332_c11_cc97_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l332_c11_cc97_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l332_c11_cc97_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l332_c7_d939]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_d939_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_d939_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_d939_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_d939_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l332_c7_d939]
signal result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_d939_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_d939_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_d939_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_d939_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l332_c7_d939]
signal result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_d939_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_d939_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_d939_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_d939_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l332_c7_d939]
signal result_u8_value_MUX_uxn_opcodes_h_l332_c7_d939_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l332_c7_d939_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l332_c7_d939_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l332_c7_d939_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l336_c11_f69c]
signal BIN_OP_EQ_uxn_opcodes_h_l336_c11_f69c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l336_c11_f69c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l336_c11_f69c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l336_c7_e9f9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_e9f9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_e9f9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_e9f9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_e9f9_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l336_c7_e9f9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_e9f9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_e9f9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_e9f9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_e9f9_return_output : unsigned(0 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_3345( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : signed;
 ref_toks_6 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.stack_address_sp_offset := ref_toks_1;
      base.u8_value := ref_toks_2;
      base.is_stack_write := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.is_sp_shift := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l304_c6_ce95
BIN_OP_EQ_uxn_opcodes_h_l304_c6_ce95 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l304_c6_ce95_left,
BIN_OP_EQ_uxn_opcodes_h_l304_c6_ce95_right,
BIN_OP_EQ_uxn_opcodes_h_l304_c6_ce95_return_output);

-- n8_MUX_uxn_opcodes_h_l304_c2_55ca
n8_MUX_uxn_opcodes_h_l304_c2_55ca : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l304_c2_55ca_cond,
n8_MUX_uxn_opcodes_h_l304_c2_55ca_iftrue,
n8_MUX_uxn_opcodes_h_l304_c2_55ca_iffalse,
n8_MUX_uxn_opcodes_h_l304_c2_55ca_return_output);

-- t8_MUX_uxn_opcodes_h_l304_c2_55ca
t8_MUX_uxn_opcodes_h_l304_c2_55ca : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l304_c2_55ca_cond,
t8_MUX_uxn_opcodes_h_l304_c2_55ca_iftrue,
t8_MUX_uxn_opcodes_h_l304_c2_55ca_iffalse,
t8_MUX_uxn_opcodes_h_l304_c2_55ca_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l304_c2_55ca
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l304_c2_55ca : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l304_c2_55ca_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l304_c2_55ca_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l304_c2_55ca_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l304_c2_55ca_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l304_c2_55ca
result_u8_value_MUX_uxn_opcodes_h_l304_c2_55ca : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l304_c2_55ca_cond,
result_u8_value_MUX_uxn_opcodes_h_l304_c2_55ca_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l304_c2_55ca_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l304_c2_55ca_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l304_c2_55ca
result_is_stack_write_MUX_uxn_opcodes_h_l304_c2_55ca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l304_c2_55ca_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l304_c2_55ca_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l304_c2_55ca_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l304_c2_55ca_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l304_c2_55ca
result_is_opc_done_MUX_uxn_opcodes_h_l304_c2_55ca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l304_c2_55ca_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l304_c2_55ca_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l304_c2_55ca_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l304_c2_55ca_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l304_c2_55ca
result_sp_relative_shift_MUX_uxn_opcodes_h_l304_c2_55ca : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l304_c2_55ca_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l304_c2_55ca_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l304_c2_55ca_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l304_c2_55ca_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l304_c2_55ca
result_is_sp_shift_MUX_uxn_opcodes_h_l304_c2_55ca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l304_c2_55ca_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l304_c2_55ca_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l304_c2_55ca_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l304_c2_55ca_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l309_c11_8109
BIN_OP_EQ_uxn_opcodes_h_l309_c11_8109 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l309_c11_8109_left,
BIN_OP_EQ_uxn_opcodes_h_l309_c11_8109_right,
BIN_OP_EQ_uxn_opcodes_h_l309_c11_8109_return_output);

-- n8_MUX_uxn_opcodes_h_l309_c7_9210
n8_MUX_uxn_opcodes_h_l309_c7_9210 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l309_c7_9210_cond,
n8_MUX_uxn_opcodes_h_l309_c7_9210_iftrue,
n8_MUX_uxn_opcodes_h_l309_c7_9210_iffalse,
n8_MUX_uxn_opcodes_h_l309_c7_9210_return_output);

-- t8_MUX_uxn_opcodes_h_l309_c7_9210
t8_MUX_uxn_opcodes_h_l309_c7_9210 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l309_c7_9210_cond,
t8_MUX_uxn_opcodes_h_l309_c7_9210_iftrue,
t8_MUX_uxn_opcodes_h_l309_c7_9210_iffalse,
t8_MUX_uxn_opcodes_h_l309_c7_9210_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_9210
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_9210 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_9210_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_9210_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_9210_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_9210_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l309_c7_9210
result_u8_value_MUX_uxn_opcodes_h_l309_c7_9210 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l309_c7_9210_cond,
result_u8_value_MUX_uxn_opcodes_h_l309_c7_9210_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l309_c7_9210_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l309_c7_9210_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_9210
result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_9210 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_9210_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_9210_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_9210_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_9210_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_9210
result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_9210 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_9210_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_9210_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_9210_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_9210_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l309_c7_9210
result_sp_relative_shift_MUX_uxn_opcodes_h_l309_c7_9210 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l309_c7_9210_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l309_c7_9210_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l309_c7_9210_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l309_c7_9210_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l309_c7_9210
result_is_sp_shift_MUX_uxn_opcodes_h_l309_c7_9210 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l309_c7_9210_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l309_c7_9210_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l309_c7_9210_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l309_c7_9210_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l312_c11_6008
BIN_OP_EQ_uxn_opcodes_h_l312_c11_6008 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l312_c11_6008_left,
BIN_OP_EQ_uxn_opcodes_h_l312_c11_6008_right,
BIN_OP_EQ_uxn_opcodes_h_l312_c11_6008_return_output);

-- n8_MUX_uxn_opcodes_h_l312_c7_1cf4
n8_MUX_uxn_opcodes_h_l312_c7_1cf4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l312_c7_1cf4_cond,
n8_MUX_uxn_opcodes_h_l312_c7_1cf4_iftrue,
n8_MUX_uxn_opcodes_h_l312_c7_1cf4_iffalse,
n8_MUX_uxn_opcodes_h_l312_c7_1cf4_return_output);

-- t8_MUX_uxn_opcodes_h_l312_c7_1cf4
t8_MUX_uxn_opcodes_h_l312_c7_1cf4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l312_c7_1cf4_cond,
t8_MUX_uxn_opcodes_h_l312_c7_1cf4_iftrue,
t8_MUX_uxn_opcodes_h_l312_c7_1cf4_iffalse,
t8_MUX_uxn_opcodes_h_l312_c7_1cf4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l312_c7_1cf4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l312_c7_1cf4 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l312_c7_1cf4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l312_c7_1cf4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l312_c7_1cf4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l312_c7_1cf4_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l312_c7_1cf4
result_u8_value_MUX_uxn_opcodes_h_l312_c7_1cf4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l312_c7_1cf4_cond,
result_u8_value_MUX_uxn_opcodes_h_l312_c7_1cf4_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l312_c7_1cf4_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l312_c7_1cf4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l312_c7_1cf4
result_is_stack_write_MUX_uxn_opcodes_h_l312_c7_1cf4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l312_c7_1cf4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l312_c7_1cf4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l312_c7_1cf4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l312_c7_1cf4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l312_c7_1cf4
result_is_opc_done_MUX_uxn_opcodes_h_l312_c7_1cf4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l312_c7_1cf4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l312_c7_1cf4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l312_c7_1cf4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l312_c7_1cf4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l312_c7_1cf4
result_sp_relative_shift_MUX_uxn_opcodes_h_l312_c7_1cf4 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l312_c7_1cf4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l312_c7_1cf4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l312_c7_1cf4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l312_c7_1cf4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l312_c7_1cf4
result_is_sp_shift_MUX_uxn_opcodes_h_l312_c7_1cf4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l312_c7_1cf4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l312_c7_1cf4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l312_c7_1cf4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l312_c7_1cf4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l316_c11_a1ca
BIN_OP_EQ_uxn_opcodes_h_l316_c11_a1ca : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l316_c11_a1ca_left,
BIN_OP_EQ_uxn_opcodes_h_l316_c11_a1ca_right,
BIN_OP_EQ_uxn_opcodes_h_l316_c11_a1ca_return_output);

-- n8_MUX_uxn_opcodes_h_l316_c7_a348
n8_MUX_uxn_opcodes_h_l316_c7_a348 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l316_c7_a348_cond,
n8_MUX_uxn_opcodes_h_l316_c7_a348_iftrue,
n8_MUX_uxn_opcodes_h_l316_c7_a348_iffalse,
n8_MUX_uxn_opcodes_h_l316_c7_a348_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l316_c7_a348
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l316_c7_a348 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l316_c7_a348_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l316_c7_a348_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l316_c7_a348_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l316_c7_a348_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l316_c7_a348
result_u8_value_MUX_uxn_opcodes_h_l316_c7_a348 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l316_c7_a348_cond,
result_u8_value_MUX_uxn_opcodes_h_l316_c7_a348_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l316_c7_a348_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l316_c7_a348_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l316_c7_a348
result_is_stack_write_MUX_uxn_opcodes_h_l316_c7_a348 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l316_c7_a348_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l316_c7_a348_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l316_c7_a348_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l316_c7_a348_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l316_c7_a348
result_is_opc_done_MUX_uxn_opcodes_h_l316_c7_a348 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l316_c7_a348_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l316_c7_a348_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l316_c7_a348_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l316_c7_a348_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l316_c7_a348
result_sp_relative_shift_MUX_uxn_opcodes_h_l316_c7_a348 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l316_c7_a348_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l316_c7_a348_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l316_c7_a348_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l316_c7_a348_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l316_c7_a348
result_is_sp_shift_MUX_uxn_opcodes_h_l316_c7_a348 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l316_c7_a348_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l316_c7_a348_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l316_c7_a348_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l316_c7_a348_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l319_c11_f31e
BIN_OP_EQ_uxn_opcodes_h_l319_c11_f31e : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l319_c11_f31e_left,
BIN_OP_EQ_uxn_opcodes_h_l319_c11_f31e_right,
BIN_OP_EQ_uxn_opcodes_h_l319_c11_f31e_return_output);

-- n8_MUX_uxn_opcodes_h_l319_c7_36cc
n8_MUX_uxn_opcodes_h_l319_c7_36cc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l319_c7_36cc_cond,
n8_MUX_uxn_opcodes_h_l319_c7_36cc_iftrue,
n8_MUX_uxn_opcodes_h_l319_c7_36cc_iffalse,
n8_MUX_uxn_opcodes_h_l319_c7_36cc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l319_c7_36cc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l319_c7_36cc : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l319_c7_36cc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l319_c7_36cc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l319_c7_36cc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l319_c7_36cc_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l319_c7_36cc
result_u8_value_MUX_uxn_opcodes_h_l319_c7_36cc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l319_c7_36cc_cond,
result_u8_value_MUX_uxn_opcodes_h_l319_c7_36cc_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l319_c7_36cc_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l319_c7_36cc_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l319_c7_36cc
result_is_stack_write_MUX_uxn_opcodes_h_l319_c7_36cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l319_c7_36cc_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l319_c7_36cc_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l319_c7_36cc_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l319_c7_36cc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l319_c7_36cc
result_is_opc_done_MUX_uxn_opcodes_h_l319_c7_36cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l319_c7_36cc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l319_c7_36cc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l319_c7_36cc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l319_c7_36cc_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l319_c7_36cc
result_sp_relative_shift_MUX_uxn_opcodes_h_l319_c7_36cc : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l319_c7_36cc_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l319_c7_36cc_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l319_c7_36cc_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l319_c7_36cc_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l319_c7_36cc
result_is_sp_shift_MUX_uxn_opcodes_h_l319_c7_36cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l319_c7_36cc_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l319_c7_36cc_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l319_c7_36cc_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l319_c7_36cc_return_output);

-- sp_relative_shift_uxn_opcodes_h_l322_c30_93db
sp_relative_shift_uxn_opcodes_h_l322_c30_93db : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l322_c30_93db_ins,
sp_relative_shift_uxn_opcodes_h_l322_c30_93db_x,
sp_relative_shift_uxn_opcodes_h_l322_c30_93db_y,
sp_relative_shift_uxn_opcodes_h_l322_c30_93db_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l327_c11_5444
BIN_OP_EQ_uxn_opcodes_h_l327_c11_5444 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l327_c11_5444_left,
BIN_OP_EQ_uxn_opcodes_h_l327_c11_5444_right,
BIN_OP_EQ_uxn_opcodes_h_l327_c11_5444_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l327_c7_b3a5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l327_c7_b3a5 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l327_c7_b3a5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l327_c7_b3a5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l327_c7_b3a5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l327_c7_b3a5_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l327_c7_b3a5
result_u8_value_MUX_uxn_opcodes_h_l327_c7_b3a5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l327_c7_b3a5_cond,
result_u8_value_MUX_uxn_opcodes_h_l327_c7_b3a5_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l327_c7_b3a5_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l327_c7_b3a5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l327_c7_b3a5
result_is_stack_write_MUX_uxn_opcodes_h_l327_c7_b3a5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l327_c7_b3a5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l327_c7_b3a5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l327_c7_b3a5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l327_c7_b3a5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l327_c7_b3a5
result_is_opc_done_MUX_uxn_opcodes_h_l327_c7_b3a5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l327_c7_b3a5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l327_c7_b3a5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l327_c7_b3a5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l327_c7_b3a5_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l327_c7_b3a5
result_is_sp_shift_MUX_uxn_opcodes_h_l327_c7_b3a5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l327_c7_b3a5_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l327_c7_b3a5_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l327_c7_b3a5_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l327_c7_b3a5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l332_c11_cc97
BIN_OP_EQ_uxn_opcodes_h_l332_c11_cc97 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l332_c11_cc97_left,
BIN_OP_EQ_uxn_opcodes_h_l332_c11_cc97_right,
BIN_OP_EQ_uxn_opcodes_h_l332_c11_cc97_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_d939
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_d939 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_d939_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_d939_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_d939_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_d939_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_d939
result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_d939 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_d939_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_d939_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_d939_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_d939_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_d939
result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_d939 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_d939_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_d939_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_d939_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_d939_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l332_c7_d939
result_u8_value_MUX_uxn_opcodes_h_l332_c7_d939 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l332_c7_d939_cond,
result_u8_value_MUX_uxn_opcodes_h_l332_c7_d939_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l332_c7_d939_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l332_c7_d939_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l336_c11_f69c
BIN_OP_EQ_uxn_opcodes_h_l336_c11_f69c : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l336_c11_f69c_left,
BIN_OP_EQ_uxn_opcodes_h_l336_c11_f69c_right,
BIN_OP_EQ_uxn_opcodes_h_l336_c11_f69c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_e9f9
result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_e9f9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_e9f9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_e9f9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_e9f9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_e9f9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_e9f9
result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_e9f9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_e9f9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_e9f9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_e9f9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_e9f9_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l304_c6_ce95_return_output,
 n8_MUX_uxn_opcodes_h_l304_c2_55ca_return_output,
 t8_MUX_uxn_opcodes_h_l304_c2_55ca_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l304_c2_55ca_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l304_c2_55ca_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l304_c2_55ca_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l304_c2_55ca_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l304_c2_55ca_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l304_c2_55ca_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l309_c11_8109_return_output,
 n8_MUX_uxn_opcodes_h_l309_c7_9210_return_output,
 t8_MUX_uxn_opcodes_h_l309_c7_9210_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_9210_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l309_c7_9210_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_9210_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_9210_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l309_c7_9210_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l309_c7_9210_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l312_c11_6008_return_output,
 n8_MUX_uxn_opcodes_h_l312_c7_1cf4_return_output,
 t8_MUX_uxn_opcodes_h_l312_c7_1cf4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l312_c7_1cf4_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l312_c7_1cf4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l312_c7_1cf4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l312_c7_1cf4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l312_c7_1cf4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l312_c7_1cf4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l316_c11_a1ca_return_output,
 n8_MUX_uxn_opcodes_h_l316_c7_a348_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l316_c7_a348_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l316_c7_a348_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l316_c7_a348_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l316_c7_a348_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l316_c7_a348_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l316_c7_a348_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l319_c11_f31e_return_output,
 n8_MUX_uxn_opcodes_h_l319_c7_36cc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l319_c7_36cc_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l319_c7_36cc_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l319_c7_36cc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l319_c7_36cc_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l319_c7_36cc_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l319_c7_36cc_return_output,
 sp_relative_shift_uxn_opcodes_h_l322_c30_93db_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l327_c11_5444_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l327_c7_b3a5_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l327_c7_b3a5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l327_c7_b3a5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l327_c7_b3a5_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l327_c7_b3a5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l332_c11_cc97_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_d939_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_d939_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_d939_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l332_c7_d939_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l336_c11_f69c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_e9f9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_e9f9_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l304_c6_ce95_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l304_c6_ce95_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l304_c6_ce95_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l304_c2_55ca_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l304_c2_55ca_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l309_c7_9210_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l304_c2_55ca_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l304_c2_55ca_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l304_c2_55ca_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l304_c2_55ca_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l309_c7_9210_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l304_c2_55ca_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l304_c2_55ca_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l304_c2_55ca_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l306_c3_653c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l304_c2_55ca_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_9210_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l304_c2_55ca_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l304_c2_55ca_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l304_c2_55ca_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l304_c2_55ca_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l309_c7_9210_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l304_c2_55ca_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l304_c2_55ca_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l304_c2_55ca_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l304_c2_55ca_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_9210_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l304_c2_55ca_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l304_c2_55ca_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l304_c2_55ca_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l304_c2_55ca_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_9210_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l304_c2_55ca_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l304_c2_55ca_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l304_c2_55ca_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l304_c2_55ca_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l309_c7_9210_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l304_c2_55ca_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l304_c2_55ca_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l304_c2_55ca_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l304_c2_55ca_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l309_c7_9210_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l304_c2_55ca_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l304_c2_55ca_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l309_c11_8109_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l309_c11_8109_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l309_c11_8109_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l309_c7_9210_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l309_c7_9210_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l312_c7_1cf4_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l309_c7_9210_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l309_c7_9210_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l309_c7_9210_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l312_c7_1cf4_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l309_c7_9210_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_9210_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l310_c3_7722 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_9210_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l312_c7_1cf4_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_9210_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l309_c7_9210_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l309_c7_9210_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l312_c7_1cf4_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l309_c7_9210_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_9210_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_9210_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l312_c7_1cf4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_9210_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_9210_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_9210_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l312_c7_1cf4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_9210_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l309_c7_9210_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l309_c7_9210_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l312_c7_1cf4_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l309_c7_9210_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l309_c7_9210_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l309_c7_9210_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l312_c7_1cf4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l309_c7_9210_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l312_c11_6008_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l312_c11_6008_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l312_c11_6008_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l312_c7_1cf4_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l312_c7_1cf4_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l316_c7_a348_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l312_c7_1cf4_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l312_c7_1cf4_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l312_c7_1cf4_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l312_c7_1cf4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l312_c7_1cf4_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l314_c3_b358 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l312_c7_1cf4_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l316_c7_a348_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l312_c7_1cf4_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l312_c7_1cf4_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l312_c7_1cf4_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l316_c7_a348_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l312_c7_1cf4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l312_c7_1cf4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l312_c7_1cf4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l316_c7_a348_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l312_c7_1cf4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l312_c7_1cf4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l312_c7_1cf4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l316_c7_a348_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l312_c7_1cf4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l312_c7_1cf4_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l312_c7_1cf4_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l316_c7_a348_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l312_c7_1cf4_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l312_c7_1cf4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l312_c7_1cf4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l316_c7_a348_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l312_c7_1cf4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l316_c11_a1ca_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l316_c11_a1ca_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l316_c11_a1ca_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l316_c7_a348_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l316_c7_a348_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l319_c7_36cc_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l316_c7_a348_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l316_c7_a348_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l317_c3_5c41 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l316_c7_a348_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l319_c7_36cc_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l316_c7_a348_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l316_c7_a348_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l316_c7_a348_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l319_c7_36cc_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l316_c7_a348_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l316_c7_a348_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l316_c7_a348_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l319_c7_36cc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l316_c7_a348_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l316_c7_a348_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l316_c7_a348_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l319_c7_36cc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l316_c7_a348_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l316_c7_a348_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l316_c7_a348_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l319_c7_36cc_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l316_c7_a348_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l316_c7_a348_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l316_c7_a348_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l319_c7_36cc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l316_c7_a348_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l319_c11_f31e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l319_c11_f31e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l319_c11_f31e_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l319_c7_36cc_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l319_c7_36cc_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l319_c7_36cc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l319_c7_36cc_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l324_c3_7600 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l319_c7_36cc_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l327_c7_b3a5_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l319_c7_36cc_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l319_c7_36cc_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l319_c7_36cc_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l327_c7_b3a5_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l319_c7_36cc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l319_c7_36cc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l319_c7_36cc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l327_c7_b3a5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l319_c7_36cc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l319_c7_36cc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l319_c7_36cc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l327_c7_b3a5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l319_c7_36cc_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l319_c7_36cc_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l319_c7_36cc_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l319_c7_36cc_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l319_c7_36cc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l319_c7_36cc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l327_c7_b3a5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l319_c7_36cc_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l322_c30_93db_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l322_c30_93db_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l322_c30_93db_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l322_c30_93db_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l327_c11_5444_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l327_c11_5444_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l327_c11_5444_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l327_c7_b3a5_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l329_c3_ec31 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l327_c7_b3a5_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_d939_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l327_c7_b3a5_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l327_c7_b3a5_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l327_c7_b3a5_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l332_c7_d939_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l327_c7_b3a5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l327_c7_b3a5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l327_c7_b3a5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_d939_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l327_c7_b3a5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l327_c7_b3a5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l327_c7_b3a5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_d939_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l327_c7_b3a5_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l327_c7_b3a5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l327_c7_b3a5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l327_c7_b3a5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l332_c11_cc97_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l332_c11_cc97_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l332_c11_cc97_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_d939_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l333_c3_9b96 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_d939_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l332_c7_d939_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_d939_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_d939_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_d939_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_e9f9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_d939_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_d939_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_d939_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_e9f9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_d939_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l332_c7_d939_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l332_c7_d939_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l332_c7_d939_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_f69c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_f69c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_f69c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_e9f9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_e9f9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_e9f9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_e9f9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_e9f9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_e9f9_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l316_l312_l309_l304_l332_DUPLICATE_9dd0_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l327_l316_l312_l309_l336_l304_l332_DUPLICATE_3303_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l319_l316_l312_l309_l304_DUPLICATE_144c_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l327_l316_l312_l309_l304_DUPLICATE_8fcc_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l327_l319_l316_l312_l309_l336_l332_DUPLICATE_7cb5_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3345_uxn_opcodes_h_l341_l300_DUPLICATE_d4a6_return_output : opcode_result_t;
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
     VAR_sp_relative_shift_uxn_opcodes_h_l322_c30_93db_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_sp_relative_shift_uxn_opcodes_h_l322_c30_93db_y := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l304_c6_ce95_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l310_c3_7722 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_9210_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l310_c3_7722;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l314_c3_b358 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l312_c7_1cf4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l314_c3_b358;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l327_c7_b3a5_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l309_c11_8109_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l316_c11_a1ca_right := to_unsigned(3, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_e9f9_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l306_c3_653c := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l304_c2_55ca_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l306_c3_653c;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l319_c7_36cc_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l319_c11_f31e_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l329_c3_ec31 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l327_c7_b3a5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l329_c3_ec31;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l319_c7_36cc_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_f69c_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l312_c11_6008_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l324_c3_7600 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l319_c7_36cc_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l324_c3_7600;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l332_c11_cc97_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l317_c3_5c41 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l316_c7_a348_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l317_c3_5c41;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_e9f9_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l327_c11_5444_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l333_c3_9b96 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_d939_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l333_c3_9b96;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l304_c2_55ca_iftrue := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l322_c30_93db_ins := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l304_c2_55ca_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l309_c7_9210_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l312_c7_1cf4_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l316_c7_a348_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l319_c7_36cc_iffalse := n8;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l332_c7_d939_iftrue := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l304_c6_ce95_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l309_c11_8109_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l312_c11_6008_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l316_c11_a1ca_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l319_c11_f31e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l327_c11_5444_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l332_c11_cc97_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_f69c_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l319_c7_36cc_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l319_c7_36cc_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l312_c7_1cf4_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l327_c7_b3a5_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l304_c2_55ca_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l309_c7_9210_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l312_c7_1cf4_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l336_c11_f69c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l336_c11_f69c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_f69c_left;
     BIN_OP_EQ_uxn_opcodes_h_l336_c11_f69c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_f69c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_f69c_return_output := BIN_OP_EQ_uxn_opcodes_h_l336_c11_f69c_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l327_l316_l312_l309_l304_DUPLICATE_8fcc LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l327_l316_l312_l309_l304_DUPLICATE_8fcc_return_output := result.is_sp_shift;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l332_c7_d939] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l332_c7_d939_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l319_l316_l312_l309_l304_DUPLICATE_144c LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l319_l316_l312_l309_l304_DUPLICATE_144c_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l319_c11_f31e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l319_c11_f31e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l319_c11_f31e_left;
     BIN_OP_EQ_uxn_opcodes_h_l319_c11_f31e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l319_c11_f31e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l319_c11_f31e_return_output := BIN_OP_EQ_uxn_opcodes_h_l319_c11_f31e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l304_c6_ce95] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l304_c6_ce95_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l304_c6_ce95_left;
     BIN_OP_EQ_uxn_opcodes_h_l304_c6_ce95_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l304_c6_ce95_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l304_c6_ce95_return_output := BIN_OP_EQ_uxn_opcodes_h_l304_c6_ce95_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l316_c11_a1ca] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l316_c11_a1ca_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l316_c11_a1ca_left;
     BIN_OP_EQ_uxn_opcodes_h_l316_c11_a1ca_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l316_c11_a1ca_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l316_c11_a1ca_return_output := BIN_OP_EQ_uxn_opcodes_h_l316_c11_a1ca_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l327_c11_5444] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l327_c11_5444_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l327_c11_5444_left;
     BIN_OP_EQ_uxn_opcodes_h_l327_c11_5444_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l327_c11_5444_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l327_c11_5444_return_output := BIN_OP_EQ_uxn_opcodes_h_l327_c11_5444_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l332_c11_cc97] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l332_c11_cc97_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l332_c11_cc97_left;
     BIN_OP_EQ_uxn_opcodes_h_l332_c11_cc97_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l332_c11_cc97_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l332_c11_cc97_return_output := BIN_OP_EQ_uxn_opcodes_h_l332_c11_cc97_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l309_c11_8109] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l309_c11_8109_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l309_c11_8109_left;
     BIN_OP_EQ_uxn_opcodes_h_l309_c11_8109_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l309_c11_8109_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l309_c11_8109_return_output := BIN_OP_EQ_uxn_opcodes_h_l309_c11_8109_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l327_l316_l312_l309_l336_l304_l332_DUPLICATE_3303 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l327_l316_l312_l309_l336_l304_l332_DUPLICATE_3303_return_output := result.is_stack_write;

     -- sp_relative_shift[uxn_opcodes_h_l322_c30_93db] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l322_c30_93db_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l322_c30_93db_ins;
     sp_relative_shift_uxn_opcodes_h_l322_c30_93db_x <= VAR_sp_relative_shift_uxn_opcodes_h_l322_c30_93db_x;
     sp_relative_shift_uxn_opcodes_h_l322_c30_93db_y <= VAR_sp_relative_shift_uxn_opcodes_h_l322_c30_93db_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l322_c30_93db_return_output := sp_relative_shift_uxn_opcodes_h_l322_c30_93db_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l316_l312_l309_l304_l332_DUPLICATE_9dd0 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l316_l312_l309_l304_l332_DUPLICATE_9dd0_return_output := result.u8_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l327_l319_l316_l312_l309_l336_l332_DUPLICATE_7cb5 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l327_l319_l316_l312_l309_l336_l332_DUPLICATE_7cb5_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l312_c11_6008] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l312_c11_6008_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l312_c11_6008_left;
     BIN_OP_EQ_uxn_opcodes_h_l312_c11_6008_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l312_c11_6008_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l312_c11_6008_return_output := BIN_OP_EQ_uxn_opcodes_h_l312_c11_6008_return_output;

     -- Submodule level 1
     VAR_n8_MUX_uxn_opcodes_h_l304_c2_55ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l304_c6_ce95_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l304_c2_55ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l304_c6_ce95_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l304_c2_55ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l304_c6_ce95_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l304_c2_55ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l304_c6_ce95_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l304_c2_55ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l304_c6_ce95_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l304_c2_55ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l304_c6_ce95_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l304_c2_55ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l304_c6_ce95_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l304_c2_55ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l304_c6_ce95_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l309_c7_9210_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l309_c11_8109_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_9210_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l309_c11_8109_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l309_c7_9210_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l309_c11_8109_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_9210_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l309_c11_8109_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l309_c7_9210_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l309_c11_8109_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_9210_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l309_c11_8109_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l309_c7_9210_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l309_c11_8109_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l309_c7_9210_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l309_c11_8109_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l312_c7_1cf4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l312_c11_6008_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l312_c7_1cf4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l312_c11_6008_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l312_c7_1cf4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l312_c11_6008_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l312_c7_1cf4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l312_c11_6008_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l312_c7_1cf4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l312_c11_6008_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l312_c7_1cf4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l312_c11_6008_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l312_c7_1cf4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l312_c11_6008_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l312_c7_1cf4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l312_c11_6008_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l316_c7_a348_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l316_c11_a1ca_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l316_c7_a348_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l316_c11_a1ca_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l316_c7_a348_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l316_c11_a1ca_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l316_c7_a348_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l316_c11_a1ca_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l316_c7_a348_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l316_c11_a1ca_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l316_c7_a348_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l316_c11_a1ca_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l316_c7_a348_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l316_c11_a1ca_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l319_c7_36cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l319_c11_f31e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l319_c7_36cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l319_c11_f31e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l319_c7_36cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l319_c11_f31e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l319_c7_36cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l319_c11_f31e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l319_c7_36cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l319_c11_f31e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l319_c7_36cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l319_c11_f31e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l319_c7_36cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l319_c11_f31e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l327_c7_b3a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l327_c11_5444_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l327_c7_b3a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l327_c11_5444_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l327_c7_b3a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l327_c11_5444_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l327_c7_b3a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l327_c11_5444_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l327_c7_b3a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l327_c11_5444_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_d939_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l332_c11_cc97_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_d939_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l332_c11_cc97_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_d939_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l332_c11_cc97_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l332_c7_d939_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l332_c11_cc97_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_e9f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_f69c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_e9f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_f69c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l304_c2_55ca_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l319_l316_l312_l309_l304_DUPLICATE_144c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l309_c7_9210_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l319_l316_l312_l309_l304_DUPLICATE_144c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l312_c7_1cf4_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l319_l316_l312_l309_l304_DUPLICATE_144c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l316_c7_a348_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l319_l316_l312_l309_l304_DUPLICATE_144c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l319_c7_36cc_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l319_l316_l312_l309_l304_DUPLICATE_144c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_9210_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l327_l319_l316_l312_l309_l336_l332_DUPLICATE_7cb5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l312_c7_1cf4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l327_l319_l316_l312_l309_l336_l332_DUPLICATE_7cb5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l316_c7_a348_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l327_l319_l316_l312_l309_l336_l332_DUPLICATE_7cb5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l319_c7_36cc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l327_l319_l316_l312_l309_l336_l332_DUPLICATE_7cb5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l327_c7_b3a5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l327_l319_l316_l312_l309_l336_l332_DUPLICATE_7cb5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_d939_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l327_l319_l316_l312_l309_l336_l332_DUPLICATE_7cb5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_e9f9_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l327_l319_l316_l312_l309_l336_l332_DUPLICATE_7cb5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l304_c2_55ca_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l327_l316_l312_l309_l304_DUPLICATE_8fcc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l309_c7_9210_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l327_l316_l312_l309_l304_DUPLICATE_8fcc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l312_c7_1cf4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l327_l316_l312_l309_l304_DUPLICATE_8fcc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l316_c7_a348_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l327_l316_l312_l309_l304_DUPLICATE_8fcc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l327_c7_b3a5_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l327_l316_l312_l309_l304_DUPLICATE_8fcc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l304_c2_55ca_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l327_l316_l312_l309_l336_l304_l332_DUPLICATE_3303_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_9210_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l327_l316_l312_l309_l336_l304_l332_DUPLICATE_3303_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l312_c7_1cf4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l327_l316_l312_l309_l336_l304_l332_DUPLICATE_3303_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l316_c7_a348_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l327_l316_l312_l309_l336_l304_l332_DUPLICATE_3303_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l327_c7_b3a5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l327_l316_l312_l309_l336_l304_l332_DUPLICATE_3303_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_d939_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l327_l316_l312_l309_l336_l304_l332_DUPLICATE_3303_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_e9f9_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l327_l316_l312_l309_l336_l304_l332_DUPLICATE_3303_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l304_c2_55ca_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l316_l312_l309_l304_l332_DUPLICATE_9dd0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l309_c7_9210_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l316_l312_l309_l304_l332_DUPLICATE_9dd0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l312_c7_1cf4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l316_l312_l309_l304_l332_DUPLICATE_9dd0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l316_c7_a348_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l316_l312_l309_l304_l332_DUPLICATE_9dd0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l332_c7_d939_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l316_l312_l309_l304_l332_DUPLICATE_9dd0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_d939_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l332_c7_d939_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l319_c7_36cc_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l322_c30_93db_return_output;
     -- n8_MUX[uxn_opcodes_h_l319_c7_36cc] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l319_c7_36cc_cond <= VAR_n8_MUX_uxn_opcodes_h_l319_c7_36cc_cond;
     n8_MUX_uxn_opcodes_h_l319_c7_36cc_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l319_c7_36cc_iftrue;
     n8_MUX_uxn_opcodes_h_l319_c7_36cc_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l319_c7_36cc_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l319_c7_36cc_return_output := n8_MUX_uxn_opcodes_h_l319_c7_36cc_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l319_c7_36cc] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l319_c7_36cc_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l319_c7_36cc_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l319_c7_36cc_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l319_c7_36cc_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l319_c7_36cc_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l319_c7_36cc_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l319_c7_36cc_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l319_c7_36cc_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l336_c7_e9f9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_e9f9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_e9f9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_e9f9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_e9f9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_e9f9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_e9f9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_e9f9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_e9f9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l336_c7_e9f9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_e9f9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_e9f9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_e9f9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_e9f9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_e9f9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_e9f9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_e9f9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_e9f9_return_output;

     -- t8_MUX[uxn_opcodes_h_l312_c7_1cf4] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l312_c7_1cf4_cond <= VAR_t8_MUX_uxn_opcodes_h_l312_c7_1cf4_cond;
     t8_MUX_uxn_opcodes_h_l312_c7_1cf4_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l312_c7_1cf4_iftrue;
     t8_MUX_uxn_opcodes_h_l312_c7_1cf4_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l312_c7_1cf4_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l312_c7_1cf4_return_output := t8_MUX_uxn_opcodes_h_l312_c7_1cf4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l332_c7_d939] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_d939_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_d939_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_d939_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_d939_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_d939_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_d939_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_d939_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_d939_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l332_c7_d939] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l332_c7_d939_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l332_c7_d939_cond;
     result_u8_value_MUX_uxn_opcodes_h_l332_c7_d939_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l332_c7_d939_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l332_c7_d939_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l332_c7_d939_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l332_c7_d939_return_output := result_u8_value_MUX_uxn_opcodes_h_l332_c7_d939_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l327_c7_b3a5] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l327_c7_b3a5_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l327_c7_b3a5_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l327_c7_b3a5_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l327_c7_b3a5_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l327_c7_b3a5_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l327_c7_b3a5_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l327_c7_b3a5_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l327_c7_b3a5_return_output;

     -- Submodule level 2
     VAR_n8_MUX_uxn_opcodes_h_l316_c7_a348_iffalse := VAR_n8_MUX_uxn_opcodes_h_l319_c7_36cc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_d939_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_e9f9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l319_c7_36cc_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l327_c7_b3a5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_d939_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_e9f9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l316_c7_a348_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l319_c7_36cc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l327_c7_b3a5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_d939_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l327_c7_b3a5_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l332_c7_d939_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l309_c7_9210_iffalse := VAR_t8_MUX_uxn_opcodes_h_l312_c7_1cf4_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l332_c7_d939] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_d939_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_d939_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_d939_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_d939_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_d939_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_d939_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_d939_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_d939_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l327_c7_b3a5] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l327_c7_b3a5_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l327_c7_b3a5_cond;
     result_u8_value_MUX_uxn_opcodes_h_l327_c7_b3a5_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l327_c7_b3a5_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l327_c7_b3a5_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l327_c7_b3a5_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l327_c7_b3a5_return_output := result_u8_value_MUX_uxn_opcodes_h_l327_c7_b3a5_return_output;

     -- t8_MUX[uxn_opcodes_h_l309_c7_9210] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l309_c7_9210_cond <= VAR_t8_MUX_uxn_opcodes_h_l309_c7_9210_cond;
     t8_MUX_uxn_opcodes_h_l309_c7_9210_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l309_c7_9210_iftrue;
     t8_MUX_uxn_opcodes_h_l309_c7_9210_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l309_c7_9210_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l309_c7_9210_return_output := t8_MUX_uxn_opcodes_h_l309_c7_9210_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l316_c7_a348] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l316_c7_a348_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l316_c7_a348_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l316_c7_a348_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l316_c7_a348_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l316_c7_a348_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l316_c7_a348_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l316_c7_a348_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l316_c7_a348_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l319_c7_36cc] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l319_c7_36cc_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l319_c7_36cc_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l319_c7_36cc_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l319_c7_36cc_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l319_c7_36cc_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l319_c7_36cc_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l319_c7_36cc_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l319_c7_36cc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l332_c7_d939] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_d939_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_d939_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_d939_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_d939_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_d939_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_d939_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_d939_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_d939_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l327_c7_b3a5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l327_c7_b3a5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l327_c7_b3a5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l327_c7_b3a5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l327_c7_b3a5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l327_c7_b3a5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l327_c7_b3a5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l327_c7_b3a5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l327_c7_b3a5_return_output;

     -- n8_MUX[uxn_opcodes_h_l316_c7_a348] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l316_c7_a348_cond <= VAR_n8_MUX_uxn_opcodes_h_l316_c7_a348_cond;
     n8_MUX_uxn_opcodes_h_l316_c7_a348_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l316_c7_a348_iftrue;
     n8_MUX_uxn_opcodes_h_l316_c7_a348_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l316_c7_a348_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l316_c7_a348_return_output := n8_MUX_uxn_opcodes_h_l316_c7_a348_return_output;

     -- Submodule level 3
     VAR_n8_MUX_uxn_opcodes_h_l312_c7_1cf4_iffalse := VAR_n8_MUX_uxn_opcodes_h_l316_c7_a348_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l327_c7_b3a5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_d939_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l316_c7_a348_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l319_c7_36cc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l327_c7_b3a5_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_d939_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l312_c7_1cf4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l316_c7_a348_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l319_c7_36cc_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l327_c7_b3a5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l319_c7_36cc_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l327_c7_b3a5_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l304_c2_55ca_iffalse := VAR_t8_MUX_uxn_opcodes_h_l309_c7_9210_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l312_c7_1cf4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l312_c7_1cf4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l312_c7_1cf4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l312_c7_1cf4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l312_c7_1cf4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l312_c7_1cf4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l312_c7_1cf4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l312_c7_1cf4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l312_c7_1cf4_return_output;

     -- t8_MUX[uxn_opcodes_h_l304_c2_55ca] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l304_c2_55ca_cond <= VAR_t8_MUX_uxn_opcodes_h_l304_c2_55ca_cond;
     t8_MUX_uxn_opcodes_h_l304_c2_55ca_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l304_c2_55ca_iftrue;
     t8_MUX_uxn_opcodes_h_l304_c2_55ca_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l304_c2_55ca_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l304_c2_55ca_return_output := t8_MUX_uxn_opcodes_h_l304_c2_55ca_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l316_c7_a348] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l316_c7_a348_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l316_c7_a348_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l316_c7_a348_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l316_c7_a348_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l316_c7_a348_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l316_c7_a348_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l316_c7_a348_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l316_c7_a348_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l327_c7_b3a5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l327_c7_b3a5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l327_c7_b3a5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l327_c7_b3a5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l327_c7_b3a5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l327_c7_b3a5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l327_c7_b3a5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l327_c7_b3a5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l327_c7_b3a5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l319_c7_36cc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l319_c7_36cc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l319_c7_36cc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l319_c7_36cc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l319_c7_36cc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l319_c7_36cc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l319_c7_36cc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l319_c7_36cc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l319_c7_36cc_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l327_c7_b3a5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l327_c7_b3a5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l327_c7_b3a5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l327_c7_b3a5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l327_c7_b3a5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l327_c7_b3a5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l327_c7_b3a5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l327_c7_b3a5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l327_c7_b3a5_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l319_c7_36cc] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l319_c7_36cc_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l319_c7_36cc_cond;
     result_u8_value_MUX_uxn_opcodes_h_l319_c7_36cc_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l319_c7_36cc_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l319_c7_36cc_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l319_c7_36cc_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l319_c7_36cc_return_output := result_u8_value_MUX_uxn_opcodes_h_l319_c7_36cc_return_output;

     -- n8_MUX[uxn_opcodes_h_l312_c7_1cf4] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l312_c7_1cf4_cond <= VAR_n8_MUX_uxn_opcodes_h_l312_c7_1cf4_cond;
     n8_MUX_uxn_opcodes_h_l312_c7_1cf4_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l312_c7_1cf4_iftrue;
     n8_MUX_uxn_opcodes_h_l312_c7_1cf4_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l312_c7_1cf4_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l312_c7_1cf4_return_output := n8_MUX_uxn_opcodes_h_l312_c7_1cf4_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l309_c7_9210_iffalse := VAR_n8_MUX_uxn_opcodes_h_l312_c7_1cf4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l319_c7_36cc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l327_c7_b3a5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l312_c7_1cf4_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l316_c7_a348_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l319_c7_36cc_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l327_c7_b3a5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l309_c7_9210_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l312_c7_1cf4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l316_c7_a348_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l319_c7_36cc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l316_c7_a348_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l319_c7_36cc_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l304_c2_55ca_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l309_c7_9210] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l309_c7_9210_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l309_c7_9210_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l309_c7_9210_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l309_c7_9210_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l309_c7_9210_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l309_c7_9210_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l309_c7_9210_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l309_c7_9210_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l319_c7_36cc] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l319_c7_36cc_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l319_c7_36cc_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l319_c7_36cc_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l319_c7_36cc_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l319_c7_36cc_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l319_c7_36cc_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l319_c7_36cc_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l319_c7_36cc_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l316_c7_a348] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l316_c7_a348_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l316_c7_a348_cond;
     result_u8_value_MUX_uxn_opcodes_h_l316_c7_a348_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l316_c7_a348_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l316_c7_a348_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l316_c7_a348_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l316_c7_a348_return_output := result_u8_value_MUX_uxn_opcodes_h_l316_c7_a348_return_output;

     -- n8_MUX[uxn_opcodes_h_l309_c7_9210] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l309_c7_9210_cond <= VAR_n8_MUX_uxn_opcodes_h_l309_c7_9210_cond;
     n8_MUX_uxn_opcodes_h_l309_c7_9210_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l309_c7_9210_iftrue;
     n8_MUX_uxn_opcodes_h_l309_c7_9210_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l309_c7_9210_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l309_c7_9210_return_output := n8_MUX_uxn_opcodes_h_l309_c7_9210_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l312_c7_1cf4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l312_c7_1cf4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l312_c7_1cf4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l312_c7_1cf4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l312_c7_1cf4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l312_c7_1cf4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l312_c7_1cf4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l312_c7_1cf4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l312_c7_1cf4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l319_c7_36cc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l319_c7_36cc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l319_c7_36cc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l319_c7_36cc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l319_c7_36cc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l319_c7_36cc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l319_c7_36cc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l319_c7_36cc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l319_c7_36cc_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l316_c7_a348] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l316_c7_a348_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l316_c7_a348_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l316_c7_a348_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l316_c7_a348_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l316_c7_a348_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l316_c7_a348_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l316_c7_a348_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l316_c7_a348_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l304_c2_55ca_iffalse := VAR_n8_MUX_uxn_opcodes_h_l309_c7_9210_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l316_c7_a348_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l319_c7_36cc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l309_c7_9210_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l312_c7_1cf4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l316_c7_a348_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l319_c7_36cc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l304_c2_55ca_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l309_c7_9210_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l312_c7_1cf4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l316_c7_a348_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l312_c7_1cf4_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l316_c7_a348_return_output;
     -- n8_MUX[uxn_opcodes_h_l304_c2_55ca] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l304_c2_55ca_cond <= VAR_n8_MUX_uxn_opcodes_h_l304_c2_55ca_cond;
     n8_MUX_uxn_opcodes_h_l304_c2_55ca_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l304_c2_55ca_iftrue;
     n8_MUX_uxn_opcodes_h_l304_c2_55ca_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l304_c2_55ca_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l304_c2_55ca_return_output := n8_MUX_uxn_opcodes_h_l304_c2_55ca_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l316_c7_a348] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l316_c7_a348_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l316_c7_a348_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l316_c7_a348_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l316_c7_a348_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l316_c7_a348_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l316_c7_a348_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l316_c7_a348_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l316_c7_a348_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l309_c7_9210] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l309_c7_9210_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l309_c7_9210_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l309_c7_9210_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l309_c7_9210_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l309_c7_9210_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l309_c7_9210_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l309_c7_9210_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l309_c7_9210_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l312_c7_1cf4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l312_c7_1cf4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l312_c7_1cf4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l312_c7_1cf4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l312_c7_1cf4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l312_c7_1cf4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l312_c7_1cf4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l312_c7_1cf4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l312_c7_1cf4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l316_c7_a348] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l316_c7_a348_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l316_c7_a348_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l316_c7_a348_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l316_c7_a348_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l316_c7_a348_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l316_c7_a348_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l316_c7_a348_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l316_c7_a348_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l304_c2_55ca] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l304_c2_55ca_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l304_c2_55ca_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l304_c2_55ca_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l304_c2_55ca_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l304_c2_55ca_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l304_c2_55ca_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l304_c2_55ca_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l304_c2_55ca_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l312_c7_1cf4] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l312_c7_1cf4_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l312_c7_1cf4_cond;
     result_u8_value_MUX_uxn_opcodes_h_l312_c7_1cf4_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l312_c7_1cf4_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l312_c7_1cf4_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l312_c7_1cf4_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l312_c7_1cf4_return_output := result_u8_value_MUX_uxn_opcodes_h_l312_c7_1cf4_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l304_c2_55ca_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l312_c7_1cf4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l316_c7_a348_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l304_c2_55ca_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l309_c7_9210_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l312_c7_1cf4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l316_c7_a348_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_9210_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l312_c7_1cf4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l309_c7_9210_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l312_c7_1cf4_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l312_c7_1cf4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l312_c7_1cf4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l312_c7_1cf4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l312_c7_1cf4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l312_c7_1cf4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l312_c7_1cf4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l312_c7_1cf4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l312_c7_1cf4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l312_c7_1cf4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l312_c7_1cf4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l312_c7_1cf4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l312_c7_1cf4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l312_c7_1cf4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l312_c7_1cf4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l312_c7_1cf4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l312_c7_1cf4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l312_c7_1cf4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l312_c7_1cf4_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l304_c2_55ca] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l304_c2_55ca_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l304_c2_55ca_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l304_c2_55ca_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l304_c2_55ca_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l304_c2_55ca_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l304_c2_55ca_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l304_c2_55ca_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l304_c2_55ca_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l309_c7_9210] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l309_c7_9210_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l309_c7_9210_cond;
     result_u8_value_MUX_uxn_opcodes_h_l309_c7_9210_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l309_c7_9210_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l309_c7_9210_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l309_c7_9210_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l309_c7_9210_return_output := result_u8_value_MUX_uxn_opcodes_h_l309_c7_9210_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l309_c7_9210] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_9210_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_9210_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_9210_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_9210_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_9210_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_9210_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_9210_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_9210_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_9210_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l312_c7_1cf4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_9210_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l312_c7_1cf4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l304_c2_55ca_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_9210_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l304_c2_55ca_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l309_c7_9210_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l304_c2_55ca] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l304_c2_55ca_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l304_c2_55ca_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l304_c2_55ca_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l304_c2_55ca_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l304_c2_55ca_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l304_c2_55ca_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l304_c2_55ca_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l304_c2_55ca_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l309_c7_9210] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_9210_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_9210_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_9210_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_9210_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_9210_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_9210_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_9210_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_9210_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l309_c7_9210] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_9210_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_9210_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_9210_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_9210_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_9210_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_9210_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_9210_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_9210_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l304_c2_55ca] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l304_c2_55ca_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l304_c2_55ca_cond;
     result_u8_value_MUX_uxn_opcodes_h_l304_c2_55ca_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l304_c2_55ca_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l304_c2_55ca_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l304_c2_55ca_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l304_c2_55ca_return_output := result_u8_value_MUX_uxn_opcodes_h_l304_c2_55ca_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l304_c2_55ca_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_9210_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l304_c2_55ca_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_9210_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l304_c2_55ca] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l304_c2_55ca_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l304_c2_55ca_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l304_c2_55ca_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l304_c2_55ca_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l304_c2_55ca_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l304_c2_55ca_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l304_c2_55ca_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l304_c2_55ca_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l304_c2_55ca] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l304_c2_55ca_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l304_c2_55ca_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l304_c2_55ca_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l304_c2_55ca_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l304_c2_55ca_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l304_c2_55ca_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l304_c2_55ca_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l304_c2_55ca_return_output;

     -- Submodule level 9
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_3345_uxn_opcodes_h_l341_l300_DUPLICATE_d4a6 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3345_uxn_opcodes_h_l341_l300_DUPLICATE_d4a6_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3345(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l304_c2_55ca_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l304_c2_55ca_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l304_c2_55ca_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l304_c2_55ca_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l304_c2_55ca_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l304_c2_55ca_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3345_uxn_opcodes_h_l341_l300_DUPLICATE_d4a6_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3345_uxn_opcodes_h_l341_l300_DUPLICATE_d4a6_return_output;
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
