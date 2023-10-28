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
-- Submodules: 61
entity ovr_0CLK_a1f536f9 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end ovr_0CLK_a1f536f9;
architecture arch of ovr_0CLK_a1f536f9 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l304_c6_0666]
signal BIN_OP_EQ_uxn_opcodes_h_l304_c6_0666_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l304_c6_0666_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l304_c6_0666_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l304_c1_27f0]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l304_c1_27f0_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l304_c1_27f0_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l304_c1_27f0_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l304_c1_27f0_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l304_c2_578c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l304_c2_578c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l304_c2_578c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l304_c2_578c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l304_c2_578c_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l304_c2_578c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l304_c2_578c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l304_c2_578c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l304_c2_578c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l304_c2_578c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l304_c2_578c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l304_c2_578c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l304_c2_578c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l304_c2_578c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l304_c2_578c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l304_c2_578c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l304_c2_578c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l304_c2_578c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l304_c2_578c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l304_c2_578c_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l304_c2_578c]
signal result_u8_value_MUX_uxn_opcodes_h_l304_c2_578c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l304_c2_578c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l304_c2_578c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l304_c2_578c_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l304_c2_578c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l304_c2_578c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l304_c2_578c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l304_c2_578c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l304_c2_578c_return_output : signed(3 downto 0);

-- t8_MUX[uxn_opcodes_h_l304_c2_578c]
signal t8_MUX_uxn_opcodes_h_l304_c2_578c_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l304_c2_578c_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l304_c2_578c_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l304_c2_578c_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l304_c2_578c]
signal n8_MUX_uxn_opcodes_h_l304_c2_578c_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l304_c2_578c_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l304_c2_578c_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l304_c2_578c_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l305_c3_d7f3[uxn_opcodes_h_l305_c3_d7f3]
signal printf_uxn_opcodes_h_l305_c3_d7f3_uxn_opcodes_h_l305_c3_d7f3_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l309_c11_cf94]
signal BIN_OP_EQ_uxn_opcodes_h_l309_c11_cf94_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l309_c11_cf94_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l309_c11_cf94_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l309_c7_6d81]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_6d81_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_6d81_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_6d81_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_6d81_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l309_c7_6d81]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l309_c7_6d81_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l309_c7_6d81_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l309_c7_6d81_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l309_c7_6d81_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l309_c7_6d81]
signal result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_6d81_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_6d81_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_6d81_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_6d81_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l309_c7_6d81]
signal result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_6d81_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_6d81_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_6d81_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_6d81_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l309_c7_6d81]
signal result_u8_value_MUX_uxn_opcodes_h_l309_c7_6d81_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l309_c7_6d81_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l309_c7_6d81_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l309_c7_6d81_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l309_c7_6d81]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l309_c7_6d81_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l309_c7_6d81_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l309_c7_6d81_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l309_c7_6d81_return_output : signed(3 downto 0);

-- t8_MUX[uxn_opcodes_h_l309_c7_6d81]
signal t8_MUX_uxn_opcodes_h_l309_c7_6d81_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l309_c7_6d81_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l309_c7_6d81_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l309_c7_6d81_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l309_c7_6d81]
signal n8_MUX_uxn_opcodes_h_l309_c7_6d81_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l309_c7_6d81_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l309_c7_6d81_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l309_c7_6d81_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l312_c11_99f1]
signal BIN_OP_EQ_uxn_opcodes_h_l312_c11_99f1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l312_c11_99f1_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l312_c11_99f1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l312_c7_cac9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l312_c7_cac9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l312_c7_cac9_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l312_c7_cac9_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l312_c7_cac9_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l312_c7_cac9]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l312_c7_cac9_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l312_c7_cac9_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l312_c7_cac9_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l312_c7_cac9_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l312_c7_cac9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l312_c7_cac9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l312_c7_cac9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l312_c7_cac9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l312_c7_cac9_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l312_c7_cac9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l312_c7_cac9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l312_c7_cac9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l312_c7_cac9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l312_c7_cac9_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l312_c7_cac9]
signal result_u8_value_MUX_uxn_opcodes_h_l312_c7_cac9_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l312_c7_cac9_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l312_c7_cac9_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l312_c7_cac9_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l312_c7_cac9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l312_c7_cac9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l312_c7_cac9_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l312_c7_cac9_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l312_c7_cac9_return_output : signed(3 downto 0);

-- t8_MUX[uxn_opcodes_h_l312_c7_cac9]
signal t8_MUX_uxn_opcodes_h_l312_c7_cac9_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l312_c7_cac9_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l312_c7_cac9_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l312_c7_cac9_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l312_c7_cac9]
signal n8_MUX_uxn_opcodes_h_l312_c7_cac9_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l312_c7_cac9_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l312_c7_cac9_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l312_c7_cac9_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l316_c11_b733]
signal BIN_OP_EQ_uxn_opcodes_h_l316_c11_b733_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l316_c11_b733_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l316_c11_b733_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l316_c7_0533]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l316_c7_0533_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l316_c7_0533_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l316_c7_0533_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l316_c7_0533_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l316_c7_0533]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l316_c7_0533_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l316_c7_0533_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l316_c7_0533_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l316_c7_0533_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l316_c7_0533]
signal result_is_opc_done_MUX_uxn_opcodes_h_l316_c7_0533_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l316_c7_0533_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l316_c7_0533_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l316_c7_0533_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l316_c7_0533]
signal result_is_stack_write_MUX_uxn_opcodes_h_l316_c7_0533_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l316_c7_0533_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l316_c7_0533_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l316_c7_0533_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l316_c7_0533]
signal result_u8_value_MUX_uxn_opcodes_h_l316_c7_0533_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l316_c7_0533_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l316_c7_0533_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l316_c7_0533_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l316_c7_0533]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l316_c7_0533_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l316_c7_0533_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l316_c7_0533_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l316_c7_0533_return_output : signed(3 downto 0);

-- n8_MUX[uxn_opcodes_h_l316_c7_0533]
signal n8_MUX_uxn_opcodes_h_l316_c7_0533_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l316_c7_0533_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l316_c7_0533_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l316_c7_0533_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l319_c11_33d8]
signal BIN_OP_EQ_uxn_opcodes_h_l319_c11_33d8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l319_c11_33d8_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l319_c11_33d8_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l319_c7_267e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l319_c7_267e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l319_c7_267e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l319_c7_267e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l319_c7_267e_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l319_c7_267e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l319_c7_267e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l319_c7_267e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l319_c7_267e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l319_c7_267e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l319_c7_267e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l319_c7_267e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l319_c7_267e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l319_c7_267e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l319_c7_267e_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l319_c7_267e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l319_c7_267e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l319_c7_267e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l319_c7_267e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l319_c7_267e_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l319_c7_267e]
signal result_u8_value_MUX_uxn_opcodes_h_l319_c7_267e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l319_c7_267e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l319_c7_267e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l319_c7_267e_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l319_c7_267e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l319_c7_267e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l319_c7_267e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l319_c7_267e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l319_c7_267e_return_output : signed(3 downto 0);

-- n8_MUX[uxn_opcodes_h_l319_c7_267e]
signal n8_MUX_uxn_opcodes_h_l319_c7_267e_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l319_c7_267e_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l319_c7_267e_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l319_c7_267e_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l322_c30_f7ce]
signal sp_relative_shift_uxn_opcodes_h_l322_c30_f7ce_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l322_c30_f7ce_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l322_c30_f7ce_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l322_c30_f7ce_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l327_c11_61a3]
signal BIN_OP_EQ_uxn_opcodes_h_l327_c11_61a3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l327_c11_61a3_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l327_c11_61a3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l327_c7_ee15]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l327_c7_ee15_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l327_c7_ee15_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l327_c7_ee15_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l327_c7_ee15_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l327_c7_ee15]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l327_c7_ee15_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l327_c7_ee15_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l327_c7_ee15_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l327_c7_ee15_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l327_c7_ee15]
signal result_is_opc_done_MUX_uxn_opcodes_h_l327_c7_ee15_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l327_c7_ee15_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l327_c7_ee15_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l327_c7_ee15_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l327_c7_ee15]
signal result_is_stack_write_MUX_uxn_opcodes_h_l327_c7_ee15_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l327_c7_ee15_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l327_c7_ee15_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l327_c7_ee15_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l327_c7_ee15]
signal result_u8_value_MUX_uxn_opcodes_h_l327_c7_ee15_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l327_c7_ee15_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l327_c7_ee15_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l327_c7_ee15_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l332_c11_6781]
signal BIN_OP_EQ_uxn_opcodes_h_l332_c11_6781_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l332_c11_6781_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l332_c11_6781_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l332_c7_cae2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_cae2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_cae2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_cae2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_cae2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l332_c7_cae2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_cae2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_cae2_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_cae2_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_cae2_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l332_c7_cae2]
signal result_u8_value_MUX_uxn_opcodes_h_l332_c7_cae2_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l332_c7_cae2_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l332_c7_cae2_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l332_c7_cae2_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l332_c7_cae2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_cae2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_cae2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_cae2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_cae2_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l336_c11_f98e]
signal BIN_OP_EQ_uxn_opcodes_h_l336_c11_f98e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l336_c11_f98e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l336_c11_f98e_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l336_c7_b812]
signal result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_b812_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_b812_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_b812_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_b812_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l336_c7_b812]
signal result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_b812_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_b812_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_b812_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_b812_return_output : unsigned(0 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l304_c6_0666
BIN_OP_EQ_uxn_opcodes_h_l304_c6_0666 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l304_c6_0666_left,
BIN_OP_EQ_uxn_opcodes_h_l304_c6_0666_right,
BIN_OP_EQ_uxn_opcodes_h_l304_c6_0666_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l304_c1_27f0
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l304_c1_27f0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l304_c1_27f0_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l304_c1_27f0_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l304_c1_27f0_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l304_c1_27f0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l304_c2_578c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l304_c2_578c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l304_c2_578c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l304_c2_578c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l304_c2_578c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l304_c2_578c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l304_c2_578c
result_is_sp_shift_MUX_uxn_opcodes_h_l304_c2_578c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l304_c2_578c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l304_c2_578c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l304_c2_578c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l304_c2_578c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l304_c2_578c
result_is_opc_done_MUX_uxn_opcodes_h_l304_c2_578c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l304_c2_578c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l304_c2_578c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l304_c2_578c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l304_c2_578c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l304_c2_578c
result_is_stack_write_MUX_uxn_opcodes_h_l304_c2_578c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l304_c2_578c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l304_c2_578c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l304_c2_578c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l304_c2_578c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l304_c2_578c
result_u8_value_MUX_uxn_opcodes_h_l304_c2_578c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l304_c2_578c_cond,
result_u8_value_MUX_uxn_opcodes_h_l304_c2_578c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l304_c2_578c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l304_c2_578c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l304_c2_578c
result_sp_relative_shift_MUX_uxn_opcodes_h_l304_c2_578c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l304_c2_578c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l304_c2_578c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l304_c2_578c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l304_c2_578c_return_output);

-- t8_MUX_uxn_opcodes_h_l304_c2_578c
t8_MUX_uxn_opcodes_h_l304_c2_578c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l304_c2_578c_cond,
t8_MUX_uxn_opcodes_h_l304_c2_578c_iftrue,
t8_MUX_uxn_opcodes_h_l304_c2_578c_iffalse,
t8_MUX_uxn_opcodes_h_l304_c2_578c_return_output);

-- n8_MUX_uxn_opcodes_h_l304_c2_578c
n8_MUX_uxn_opcodes_h_l304_c2_578c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l304_c2_578c_cond,
n8_MUX_uxn_opcodes_h_l304_c2_578c_iftrue,
n8_MUX_uxn_opcodes_h_l304_c2_578c_iffalse,
n8_MUX_uxn_opcodes_h_l304_c2_578c_return_output);

-- printf_uxn_opcodes_h_l305_c3_d7f3_uxn_opcodes_h_l305_c3_d7f3
printf_uxn_opcodes_h_l305_c3_d7f3_uxn_opcodes_h_l305_c3_d7f3 : entity work.printf_uxn_opcodes_h_l305_c3_d7f3_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l305_c3_d7f3_uxn_opcodes_h_l305_c3_d7f3_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l309_c11_cf94
BIN_OP_EQ_uxn_opcodes_h_l309_c11_cf94 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l309_c11_cf94_left,
BIN_OP_EQ_uxn_opcodes_h_l309_c11_cf94_right,
BIN_OP_EQ_uxn_opcodes_h_l309_c11_cf94_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_6d81
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_6d81 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_6d81_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_6d81_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_6d81_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_6d81_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l309_c7_6d81
result_is_sp_shift_MUX_uxn_opcodes_h_l309_c7_6d81 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l309_c7_6d81_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l309_c7_6d81_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l309_c7_6d81_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l309_c7_6d81_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_6d81
result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_6d81 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_6d81_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_6d81_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_6d81_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_6d81_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_6d81
result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_6d81 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_6d81_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_6d81_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_6d81_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_6d81_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l309_c7_6d81
result_u8_value_MUX_uxn_opcodes_h_l309_c7_6d81 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l309_c7_6d81_cond,
result_u8_value_MUX_uxn_opcodes_h_l309_c7_6d81_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l309_c7_6d81_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l309_c7_6d81_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l309_c7_6d81
result_sp_relative_shift_MUX_uxn_opcodes_h_l309_c7_6d81 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l309_c7_6d81_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l309_c7_6d81_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l309_c7_6d81_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l309_c7_6d81_return_output);

-- t8_MUX_uxn_opcodes_h_l309_c7_6d81
t8_MUX_uxn_opcodes_h_l309_c7_6d81 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l309_c7_6d81_cond,
t8_MUX_uxn_opcodes_h_l309_c7_6d81_iftrue,
t8_MUX_uxn_opcodes_h_l309_c7_6d81_iffalse,
t8_MUX_uxn_opcodes_h_l309_c7_6d81_return_output);

-- n8_MUX_uxn_opcodes_h_l309_c7_6d81
n8_MUX_uxn_opcodes_h_l309_c7_6d81 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l309_c7_6d81_cond,
n8_MUX_uxn_opcodes_h_l309_c7_6d81_iftrue,
n8_MUX_uxn_opcodes_h_l309_c7_6d81_iffalse,
n8_MUX_uxn_opcodes_h_l309_c7_6d81_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l312_c11_99f1
BIN_OP_EQ_uxn_opcodes_h_l312_c11_99f1 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l312_c11_99f1_left,
BIN_OP_EQ_uxn_opcodes_h_l312_c11_99f1_right,
BIN_OP_EQ_uxn_opcodes_h_l312_c11_99f1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l312_c7_cac9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l312_c7_cac9 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l312_c7_cac9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l312_c7_cac9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l312_c7_cac9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l312_c7_cac9_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l312_c7_cac9
result_is_sp_shift_MUX_uxn_opcodes_h_l312_c7_cac9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l312_c7_cac9_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l312_c7_cac9_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l312_c7_cac9_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l312_c7_cac9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l312_c7_cac9
result_is_opc_done_MUX_uxn_opcodes_h_l312_c7_cac9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l312_c7_cac9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l312_c7_cac9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l312_c7_cac9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l312_c7_cac9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l312_c7_cac9
result_is_stack_write_MUX_uxn_opcodes_h_l312_c7_cac9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l312_c7_cac9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l312_c7_cac9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l312_c7_cac9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l312_c7_cac9_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l312_c7_cac9
result_u8_value_MUX_uxn_opcodes_h_l312_c7_cac9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l312_c7_cac9_cond,
result_u8_value_MUX_uxn_opcodes_h_l312_c7_cac9_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l312_c7_cac9_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l312_c7_cac9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l312_c7_cac9
result_sp_relative_shift_MUX_uxn_opcodes_h_l312_c7_cac9 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l312_c7_cac9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l312_c7_cac9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l312_c7_cac9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l312_c7_cac9_return_output);

-- t8_MUX_uxn_opcodes_h_l312_c7_cac9
t8_MUX_uxn_opcodes_h_l312_c7_cac9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l312_c7_cac9_cond,
t8_MUX_uxn_opcodes_h_l312_c7_cac9_iftrue,
t8_MUX_uxn_opcodes_h_l312_c7_cac9_iffalse,
t8_MUX_uxn_opcodes_h_l312_c7_cac9_return_output);

-- n8_MUX_uxn_opcodes_h_l312_c7_cac9
n8_MUX_uxn_opcodes_h_l312_c7_cac9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l312_c7_cac9_cond,
n8_MUX_uxn_opcodes_h_l312_c7_cac9_iftrue,
n8_MUX_uxn_opcodes_h_l312_c7_cac9_iffalse,
n8_MUX_uxn_opcodes_h_l312_c7_cac9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l316_c11_b733
BIN_OP_EQ_uxn_opcodes_h_l316_c11_b733 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l316_c11_b733_left,
BIN_OP_EQ_uxn_opcodes_h_l316_c11_b733_right,
BIN_OP_EQ_uxn_opcodes_h_l316_c11_b733_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l316_c7_0533
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l316_c7_0533 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l316_c7_0533_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l316_c7_0533_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l316_c7_0533_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l316_c7_0533_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l316_c7_0533
result_is_sp_shift_MUX_uxn_opcodes_h_l316_c7_0533 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l316_c7_0533_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l316_c7_0533_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l316_c7_0533_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l316_c7_0533_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l316_c7_0533
result_is_opc_done_MUX_uxn_opcodes_h_l316_c7_0533 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l316_c7_0533_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l316_c7_0533_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l316_c7_0533_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l316_c7_0533_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l316_c7_0533
result_is_stack_write_MUX_uxn_opcodes_h_l316_c7_0533 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l316_c7_0533_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l316_c7_0533_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l316_c7_0533_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l316_c7_0533_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l316_c7_0533
result_u8_value_MUX_uxn_opcodes_h_l316_c7_0533 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l316_c7_0533_cond,
result_u8_value_MUX_uxn_opcodes_h_l316_c7_0533_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l316_c7_0533_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l316_c7_0533_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l316_c7_0533
result_sp_relative_shift_MUX_uxn_opcodes_h_l316_c7_0533 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l316_c7_0533_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l316_c7_0533_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l316_c7_0533_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l316_c7_0533_return_output);

-- n8_MUX_uxn_opcodes_h_l316_c7_0533
n8_MUX_uxn_opcodes_h_l316_c7_0533 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l316_c7_0533_cond,
n8_MUX_uxn_opcodes_h_l316_c7_0533_iftrue,
n8_MUX_uxn_opcodes_h_l316_c7_0533_iffalse,
n8_MUX_uxn_opcodes_h_l316_c7_0533_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l319_c11_33d8
BIN_OP_EQ_uxn_opcodes_h_l319_c11_33d8 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l319_c11_33d8_left,
BIN_OP_EQ_uxn_opcodes_h_l319_c11_33d8_right,
BIN_OP_EQ_uxn_opcodes_h_l319_c11_33d8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l319_c7_267e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l319_c7_267e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l319_c7_267e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l319_c7_267e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l319_c7_267e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l319_c7_267e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l319_c7_267e
result_is_sp_shift_MUX_uxn_opcodes_h_l319_c7_267e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l319_c7_267e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l319_c7_267e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l319_c7_267e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l319_c7_267e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l319_c7_267e
result_is_opc_done_MUX_uxn_opcodes_h_l319_c7_267e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l319_c7_267e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l319_c7_267e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l319_c7_267e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l319_c7_267e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l319_c7_267e
result_is_stack_write_MUX_uxn_opcodes_h_l319_c7_267e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l319_c7_267e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l319_c7_267e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l319_c7_267e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l319_c7_267e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l319_c7_267e
result_u8_value_MUX_uxn_opcodes_h_l319_c7_267e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l319_c7_267e_cond,
result_u8_value_MUX_uxn_opcodes_h_l319_c7_267e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l319_c7_267e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l319_c7_267e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l319_c7_267e
result_sp_relative_shift_MUX_uxn_opcodes_h_l319_c7_267e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l319_c7_267e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l319_c7_267e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l319_c7_267e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l319_c7_267e_return_output);

-- n8_MUX_uxn_opcodes_h_l319_c7_267e
n8_MUX_uxn_opcodes_h_l319_c7_267e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l319_c7_267e_cond,
n8_MUX_uxn_opcodes_h_l319_c7_267e_iftrue,
n8_MUX_uxn_opcodes_h_l319_c7_267e_iffalse,
n8_MUX_uxn_opcodes_h_l319_c7_267e_return_output);

-- sp_relative_shift_uxn_opcodes_h_l322_c30_f7ce
sp_relative_shift_uxn_opcodes_h_l322_c30_f7ce : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l322_c30_f7ce_ins,
sp_relative_shift_uxn_opcodes_h_l322_c30_f7ce_x,
sp_relative_shift_uxn_opcodes_h_l322_c30_f7ce_y,
sp_relative_shift_uxn_opcodes_h_l322_c30_f7ce_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l327_c11_61a3
BIN_OP_EQ_uxn_opcodes_h_l327_c11_61a3 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l327_c11_61a3_left,
BIN_OP_EQ_uxn_opcodes_h_l327_c11_61a3_right,
BIN_OP_EQ_uxn_opcodes_h_l327_c11_61a3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l327_c7_ee15
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l327_c7_ee15 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l327_c7_ee15_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l327_c7_ee15_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l327_c7_ee15_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l327_c7_ee15_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l327_c7_ee15
result_is_sp_shift_MUX_uxn_opcodes_h_l327_c7_ee15 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l327_c7_ee15_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l327_c7_ee15_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l327_c7_ee15_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l327_c7_ee15_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l327_c7_ee15
result_is_opc_done_MUX_uxn_opcodes_h_l327_c7_ee15 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l327_c7_ee15_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l327_c7_ee15_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l327_c7_ee15_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l327_c7_ee15_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l327_c7_ee15
result_is_stack_write_MUX_uxn_opcodes_h_l327_c7_ee15 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l327_c7_ee15_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l327_c7_ee15_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l327_c7_ee15_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l327_c7_ee15_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l327_c7_ee15
result_u8_value_MUX_uxn_opcodes_h_l327_c7_ee15 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l327_c7_ee15_cond,
result_u8_value_MUX_uxn_opcodes_h_l327_c7_ee15_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l327_c7_ee15_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l327_c7_ee15_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l332_c11_6781
BIN_OP_EQ_uxn_opcodes_h_l332_c11_6781 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l332_c11_6781_left,
BIN_OP_EQ_uxn_opcodes_h_l332_c11_6781_right,
BIN_OP_EQ_uxn_opcodes_h_l332_c11_6781_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_cae2
result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_cae2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_cae2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_cae2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_cae2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_cae2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_cae2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_cae2 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_cae2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_cae2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_cae2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_cae2_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l332_c7_cae2
result_u8_value_MUX_uxn_opcodes_h_l332_c7_cae2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l332_c7_cae2_cond,
result_u8_value_MUX_uxn_opcodes_h_l332_c7_cae2_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l332_c7_cae2_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l332_c7_cae2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_cae2
result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_cae2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_cae2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_cae2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_cae2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_cae2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l336_c11_f98e
BIN_OP_EQ_uxn_opcodes_h_l336_c11_f98e : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l336_c11_f98e_left,
BIN_OP_EQ_uxn_opcodes_h_l336_c11_f98e_right,
BIN_OP_EQ_uxn_opcodes_h_l336_c11_f98e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_b812
result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_b812 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_b812_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_b812_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_b812_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_b812_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_b812
result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_b812 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_b812_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_b812_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_b812_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_b812_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l304_c6_0666_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l304_c1_27f0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l304_c2_578c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l304_c2_578c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l304_c2_578c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l304_c2_578c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l304_c2_578c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l304_c2_578c_return_output,
 t8_MUX_uxn_opcodes_h_l304_c2_578c_return_output,
 n8_MUX_uxn_opcodes_h_l304_c2_578c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l309_c11_cf94_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_6d81_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l309_c7_6d81_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_6d81_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_6d81_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l309_c7_6d81_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l309_c7_6d81_return_output,
 t8_MUX_uxn_opcodes_h_l309_c7_6d81_return_output,
 n8_MUX_uxn_opcodes_h_l309_c7_6d81_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l312_c11_99f1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l312_c7_cac9_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l312_c7_cac9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l312_c7_cac9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l312_c7_cac9_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l312_c7_cac9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l312_c7_cac9_return_output,
 t8_MUX_uxn_opcodes_h_l312_c7_cac9_return_output,
 n8_MUX_uxn_opcodes_h_l312_c7_cac9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l316_c11_b733_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l316_c7_0533_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l316_c7_0533_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l316_c7_0533_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l316_c7_0533_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l316_c7_0533_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l316_c7_0533_return_output,
 n8_MUX_uxn_opcodes_h_l316_c7_0533_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l319_c11_33d8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l319_c7_267e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l319_c7_267e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l319_c7_267e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l319_c7_267e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l319_c7_267e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l319_c7_267e_return_output,
 n8_MUX_uxn_opcodes_h_l319_c7_267e_return_output,
 sp_relative_shift_uxn_opcodes_h_l322_c30_f7ce_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l327_c11_61a3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l327_c7_ee15_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l327_c7_ee15_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l327_c7_ee15_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l327_c7_ee15_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l327_c7_ee15_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l332_c11_6781_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_cae2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_cae2_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l332_c7_cae2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_cae2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l336_c11_f98e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_b812_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_b812_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l304_c6_0666_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l304_c6_0666_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l304_c6_0666_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l304_c1_27f0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l304_c1_27f0_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l304_c1_27f0_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l304_c1_27f0_iffalse : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l304_c2_578c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l306_c3_c182 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l304_c2_578c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_6d81_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l304_c2_578c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l304_c2_578c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l304_c2_578c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l304_c2_578c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l309_c7_6d81_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l304_c2_578c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l304_c2_578c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l304_c2_578c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l304_c2_578c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_6d81_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l304_c2_578c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l304_c2_578c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l304_c2_578c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l304_c2_578c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_6d81_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l304_c2_578c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l304_c2_578c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l304_c2_578c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l304_c2_578c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l309_c7_6d81_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l304_c2_578c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l304_c2_578c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l304_c2_578c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l304_c2_578c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l309_c7_6d81_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l304_c2_578c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l304_c2_578c_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l304_c2_578c_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l304_c2_578c_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l309_c7_6d81_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l304_c2_578c_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l304_c2_578c_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l304_c2_578c_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l304_c2_578c_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l309_c7_6d81_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l304_c2_578c_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l304_c2_578c_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l305_c3_d7f3_uxn_opcodes_h_l305_c3_d7f3_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l309_c11_cf94_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l309_c11_cf94_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l309_c11_cf94_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_6d81_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l310_c3_4447 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_6d81_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l312_c7_cac9_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_6d81_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l309_c7_6d81_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l309_c7_6d81_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l312_c7_cac9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l309_c7_6d81_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_6d81_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_6d81_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l312_c7_cac9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_6d81_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_6d81_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_6d81_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l312_c7_cac9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_6d81_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l309_c7_6d81_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l309_c7_6d81_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l312_c7_cac9_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l309_c7_6d81_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l309_c7_6d81_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l309_c7_6d81_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l312_c7_cac9_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l309_c7_6d81_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l309_c7_6d81_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l309_c7_6d81_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l312_c7_cac9_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l309_c7_6d81_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l309_c7_6d81_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l309_c7_6d81_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l312_c7_cac9_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l309_c7_6d81_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l312_c11_99f1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l312_c11_99f1_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l312_c11_99f1_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l312_c7_cac9_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l314_c3_4ba5 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l312_c7_cac9_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l316_c7_0533_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l312_c7_cac9_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l312_c7_cac9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l312_c7_cac9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l316_c7_0533_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l312_c7_cac9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l312_c7_cac9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l312_c7_cac9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l316_c7_0533_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l312_c7_cac9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l312_c7_cac9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l312_c7_cac9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l316_c7_0533_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l312_c7_cac9_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l312_c7_cac9_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l312_c7_cac9_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l316_c7_0533_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l312_c7_cac9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l312_c7_cac9_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l312_c7_cac9_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l316_c7_0533_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l312_c7_cac9_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l312_c7_cac9_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l312_c7_cac9_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l312_c7_cac9_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l312_c7_cac9_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l312_c7_cac9_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l316_c7_0533_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l312_c7_cac9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l316_c11_b733_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l316_c11_b733_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l316_c11_b733_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l316_c7_0533_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l317_c3_eff9 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l316_c7_0533_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l319_c7_267e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l316_c7_0533_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l316_c7_0533_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l316_c7_0533_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l319_c7_267e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l316_c7_0533_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l316_c7_0533_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l316_c7_0533_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l319_c7_267e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l316_c7_0533_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l316_c7_0533_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l316_c7_0533_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l319_c7_267e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l316_c7_0533_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l316_c7_0533_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l316_c7_0533_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l319_c7_267e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l316_c7_0533_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l316_c7_0533_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l316_c7_0533_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l319_c7_267e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l316_c7_0533_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l316_c7_0533_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l316_c7_0533_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l319_c7_267e_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l316_c7_0533_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l319_c11_33d8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l319_c11_33d8_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l319_c11_33d8_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l319_c7_267e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l324_c3_c6f4 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l319_c7_267e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l327_c7_ee15_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l319_c7_267e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l319_c7_267e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l319_c7_267e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l327_c7_ee15_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l319_c7_267e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l319_c7_267e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l319_c7_267e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l327_c7_ee15_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l319_c7_267e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l319_c7_267e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l319_c7_267e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l327_c7_ee15_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l319_c7_267e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l319_c7_267e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l319_c7_267e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l327_c7_ee15_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l319_c7_267e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l319_c7_267e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l319_c7_267e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l319_c7_267e_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l319_c7_267e_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l319_c7_267e_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l319_c7_267e_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l322_c30_f7ce_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l322_c30_f7ce_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l322_c30_f7ce_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l322_c30_f7ce_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l327_c11_61a3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l327_c11_61a3_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l327_c11_61a3_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l327_c7_ee15_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l329_c3_116d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l327_c7_ee15_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_cae2_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l327_c7_ee15_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l327_c7_ee15_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l327_c7_ee15_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l327_c7_ee15_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l327_c7_ee15_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l327_c7_ee15_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_cae2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l327_c7_ee15_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l327_c7_ee15_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l327_c7_ee15_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_cae2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l327_c7_ee15_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l327_c7_ee15_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l327_c7_ee15_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l332_c7_cae2_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l327_c7_ee15_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l332_c11_6781_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l332_c11_6781_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l332_c11_6781_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_cae2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_cae2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_b812_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_cae2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_cae2_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l333_c3_af73 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_cae2_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l332_c7_cae2_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_cae2_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l332_c7_cae2_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l332_c7_cae2_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l332_c7_cae2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_cae2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_cae2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_b812_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_cae2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_f98e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_f98e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_f98e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_b812_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_b812_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_b812_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_b812_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_b812_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_b812_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l327_l316_l309_l312_l304_DUPLICATE_e17c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l336_l327_l332_l316_l309_l312_l304_DUPLICATE_f57a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l332_l316_l309_l312_l304_DUPLICATE_c927_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l319_l316_l309_l312_l304_DUPLICATE_ef61_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l336_l327_l332_l319_l316_l309_l312_DUPLICATE_6946_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_641b_uxn_opcodes_h_l300_l341_DUPLICATE_8374_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l317_c3_eff9 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l316_c7_0533_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l317_c3_eff9;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l304_c1_27f0_iffalse := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l327_c7_ee15_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l329_c3_116d := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l327_c7_ee15_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l329_c3_116d;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l332_c11_6781_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l327_c11_61a3_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l312_c11_99f1_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l310_c3_4447 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_6d81_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l310_c3_4447;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l319_c11_33d8_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l306_c3_c182 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l304_c2_578c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l306_c3_c182;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l319_c7_267e_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l309_c11_cf94_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_f98e_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l304_c6_0666_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l316_c11_b733_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l324_c3_c6f4 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l319_c7_267e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l324_c3_c6f4;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l304_c2_578c_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_b812_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l333_c3_af73 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_cae2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l333_c3_af73;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l319_c7_267e_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l322_c30_f7ce_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l314_c3_4ba5 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l312_c7_cac9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l314_c3_4ba5;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_b812_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l322_c30_f7ce_y := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l304_c1_27f0_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l322_c30_f7ce_ins := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l304_c2_578c_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l309_c7_6d81_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l312_c7_cac9_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l316_c7_0533_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l319_c7_267e_iffalse := n8;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l332_c7_cae2_iftrue := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l304_c6_0666_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l309_c11_cf94_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l312_c11_99f1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l316_c11_b733_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l319_c11_33d8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l327_c11_61a3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l332_c11_6781_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_f98e_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l319_c7_267e_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l319_c7_267e_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l312_c7_cac9_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l327_c7_ee15_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l304_c2_578c_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l309_c7_6d81_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l312_c7_cac9_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l336_c11_f98e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l336_c11_f98e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_f98e_left;
     BIN_OP_EQ_uxn_opcodes_h_l336_c11_f98e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_f98e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_f98e_return_output := BIN_OP_EQ_uxn_opcodes_h_l336_c11_f98e_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l322_c30_f7ce] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l322_c30_f7ce_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l322_c30_f7ce_ins;
     sp_relative_shift_uxn_opcodes_h_l322_c30_f7ce_x <= VAR_sp_relative_shift_uxn_opcodes_h_l322_c30_f7ce_x;
     sp_relative_shift_uxn_opcodes_h_l322_c30_f7ce_y <= VAR_sp_relative_shift_uxn_opcodes_h_l322_c30_f7ce_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l322_c30_f7ce_return_output := sp_relative_shift_uxn_opcodes_h_l322_c30_f7ce_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l304_c6_0666] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l304_c6_0666_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l304_c6_0666_left;
     BIN_OP_EQ_uxn_opcodes_h_l304_c6_0666_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l304_c6_0666_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l304_c6_0666_return_output := BIN_OP_EQ_uxn_opcodes_h_l304_c6_0666_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l332_c7_cae2] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l332_c7_cae2_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l316_c11_b733] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l316_c11_b733_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l316_c11_b733_left;
     BIN_OP_EQ_uxn_opcodes_h_l316_c11_b733_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l316_c11_b733_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l316_c11_b733_return_output := BIN_OP_EQ_uxn_opcodes_h_l316_c11_b733_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l327_l316_l309_l312_l304_DUPLICATE_e17c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l327_l316_l309_l312_l304_DUPLICATE_e17c_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l312_c11_99f1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l312_c11_99f1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l312_c11_99f1_left;
     BIN_OP_EQ_uxn_opcodes_h_l312_c11_99f1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l312_c11_99f1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l312_c11_99f1_return_output := BIN_OP_EQ_uxn_opcodes_h_l312_c11_99f1_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l319_l316_l309_l312_l304_DUPLICATE_ef61 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l319_l316_l309_l312_l304_DUPLICATE_ef61_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l332_c11_6781] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l332_c11_6781_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l332_c11_6781_left;
     BIN_OP_EQ_uxn_opcodes_h_l332_c11_6781_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l332_c11_6781_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l332_c11_6781_return_output := BIN_OP_EQ_uxn_opcodes_h_l332_c11_6781_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l319_c11_33d8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l319_c11_33d8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l319_c11_33d8_left;
     BIN_OP_EQ_uxn_opcodes_h_l319_c11_33d8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l319_c11_33d8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l319_c11_33d8_return_output := BIN_OP_EQ_uxn_opcodes_h_l319_c11_33d8_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l336_l327_l332_l316_l309_l312_l304_DUPLICATE_f57a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l336_l327_l332_l316_l309_l312_l304_DUPLICATE_f57a_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l332_l316_l309_l312_l304_DUPLICATE_c927 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l332_l316_l309_l312_l304_DUPLICATE_c927_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l309_c11_cf94] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l309_c11_cf94_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l309_c11_cf94_left;
     BIN_OP_EQ_uxn_opcodes_h_l309_c11_cf94_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l309_c11_cf94_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l309_c11_cf94_return_output := BIN_OP_EQ_uxn_opcodes_h_l309_c11_cf94_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l336_l327_l332_l319_l316_l309_l312_DUPLICATE_6946 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l336_l327_l332_l319_l316_l309_l312_DUPLICATE_6946_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l327_c11_61a3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l327_c11_61a3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l327_c11_61a3_left;
     BIN_OP_EQ_uxn_opcodes_h_l327_c11_61a3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l327_c11_61a3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l327_c11_61a3_return_output := BIN_OP_EQ_uxn_opcodes_h_l327_c11_61a3_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l304_c1_27f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l304_c6_0666_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l304_c2_578c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l304_c6_0666_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l304_c2_578c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l304_c6_0666_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l304_c2_578c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l304_c6_0666_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l304_c2_578c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l304_c6_0666_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l304_c2_578c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l304_c6_0666_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l304_c2_578c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l304_c6_0666_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l304_c2_578c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l304_c6_0666_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l304_c2_578c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l304_c6_0666_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l309_c7_6d81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l309_c11_cf94_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_6d81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l309_c11_cf94_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l309_c7_6d81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l309_c11_cf94_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_6d81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l309_c11_cf94_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l309_c7_6d81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l309_c11_cf94_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_6d81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l309_c11_cf94_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l309_c7_6d81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l309_c11_cf94_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l309_c7_6d81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l309_c11_cf94_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l312_c7_cac9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l312_c11_99f1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l312_c7_cac9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l312_c11_99f1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l312_c7_cac9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l312_c11_99f1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l312_c7_cac9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l312_c11_99f1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l312_c7_cac9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l312_c11_99f1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l312_c7_cac9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l312_c11_99f1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l312_c7_cac9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l312_c11_99f1_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l312_c7_cac9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l312_c11_99f1_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l316_c7_0533_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l316_c11_b733_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l316_c7_0533_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l316_c11_b733_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l316_c7_0533_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l316_c11_b733_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l316_c7_0533_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l316_c11_b733_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l316_c7_0533_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l316_c11_b733_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l316_c7_0533_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l316_c11_b733_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l316_c7_0533_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l316_c11_b733_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l319_c7_267e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l319_c11_33d8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l319_c7_267e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l319_c11_33d8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l319_c7_267e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l319_c11_33d8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l319_c7_267e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l319_c11_33d8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l319_c7_267e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l319_c11_33d8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l319_c7_267e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l319_c11_33d8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l319_c7_267e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l319_c11_33d8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l327_c7_ee15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l327_c11_61a3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l327_c7_ee15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l327_c11_61a3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l327_c7_ee15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l327_c11_61a3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l327_c7_ee15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l327_c11_61a3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l327_c7_ee15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l327_c11_61a3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_cae2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l332_c11_6781_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_cae2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l332_c11_6781_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_cae2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l332_c11_6781_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l332_c7_cae2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l332_c11_6781_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_b812_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_f98e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_b812_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_f98e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l304_c2_578c_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l319_l316_l309_l312_l304_DUPLICATE_ef61_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l309_c7_6d81_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l319_l316_l309_l312_l304_DUPLICATE_ef61_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l312_c7_cac9_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l319_l316_l309_l312_l304_DUPLICATE_ef61_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l316_c7_0533_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l319_l316_l309_l312_l304_DUPLICATE_ef61_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l319_c7_267e_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l319_l316_l309_l312_l304_DUPLICATE_ef61_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_6d81_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l336_l327_l332_l319_l316_l309_l312_DUPLICATE_6946_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l312_c7_cac9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l336_l327_l332_l319_l316_l309_l312_DUPLICATE_6946_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l316_c7_0533_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l336_l327_l332_l319_l316_l309_l312_DUPLICATE_6946_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l319_c7_267e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l336_l327_l332_l319_l316_l309_l312_DUPLICATE_6946_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l327_c7_ee15_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l336_l327_l332_l319_l316_l309_l312_DUPLICATE_6946_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_cae2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l336_l327_l332_l319_l316_l309_l312_DUPLICATE_6946_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_b812_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l336_l327_l332_l319_l316_l309_l312_DUPLICATE_6946_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l304_c2_578c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l327_l316_l309_l312_l304_DUPLICATE_e17c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l309_c7_6d81_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l327_l316_l309_l312_l304_DUPLICATE_e17c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l312_c7_cac9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l327_l316_l309_l312_l304_DUPLICATE_e17c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l316_c7_0533_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l327_l316_l309_l312_l304_DUPLICATE_e17c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l327_c7_ee15_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l327_l316_l309_l312_l304_DUPLICATE_e17c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l304_c2_578c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l336_l327_l332_l316_l309_l312_l304_DUPLICATE_f57a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_6d81_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l336_l327_l332_l316_l309_l312_l304_DUPLICATE_f57a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l312_c7_cac9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l336_l327_l332_l316_l309_l312_l304_DUPLICATE_f57a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l316_c7_0533_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l336_l327_l332_l316_l309_l312_l304_DUPLICATE_f57a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l327_c7_ee15_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l336_l327_l332_l316_l309_l312_l304_DUPLICATE_f57a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_cae2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l336_l327_l332_l316_l309_l312_l304_DUPLICATE_f57a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_b812_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l336_l327_l332_l316_l309_l312_l304_DUPLICATE_f57a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l304_c2_578c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l332_l316_l309_l312_l304_DUPLICATE_c927_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l309_c7_6d81_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l332_l316_l309_l312_l304_DUPLICATE_c927_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l312_c7_cac9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l332_l316_l309_l312_l304_DUPLICATE_c927_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l316_c7_0533_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l332_l316_l309_l312_l304_DUPLICATE_c927_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l332_c7_cae2_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l332_l316_l309_l312_l304_DUPLICATE_c927_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_cae2_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l332_c7_cae2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l319_c7_267e_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l322_c30_f7ce_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l332_c7_cae2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_cae2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_cae2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_cae2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_cae2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_cae2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_cae2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_cae2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_cae2_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l327_c7_ee15] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l327_c7_ee15_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l327_c7_ee15_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l327_c7_ee15_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l327_c7_ee15_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l327_c7_ee15_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l327_c7_ee15_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l327_c7_ee15_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l327_c7_ee15_return_output;

     -- n8_MUX[uxn_opcodes_h_l319_c7_267e] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l319_c7_267e_cond <= VAR_n8_MUX_uxn_opcodes_h_l319_c7_267e_cond;
     n8_MUX_uxn_opcodes_h_l319_c7_267e_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l319_c7_267e_iftrue;
     n8_MUX_uxn_opcodes_h_l319_c7_267e_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l319_c7_267e_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l319_c7_267e_return_output := n8_MUX_uxn_opcodes_h_l319_c7_267e_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l332_c7_cae2] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l332_c7_cae2_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l332_c7_cae2_cond;
     result_u8_value_MUX_uxn_opcodes_h_l332_c7_cae2_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l332_c7_cae2_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l332_c7_cae2_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l332_c7_cae2_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l332_c7_cae2_return_output := result_u8_value_MUX_uxn_opcodes_h_l332_c7_cae2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l319_c7_267e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l319_c7_267e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l319_c7_267e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l319_c7_267e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l319_c7_267e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l319_c7_267e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l319_c7_267e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l319_c7_267e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l319_c7_267e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l336_c7_b812] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_b812_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_b812_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_b812_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_b812_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_b812_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_b812_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_b812_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_b812_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l336_c7_b812] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_b812_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_b812_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_b812_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_b812_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_b812_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_b812_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_b812_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_b812_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l304_c1_27f0] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l304_c1_27f0_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l304_c1_27f0_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l304_c1_27f0_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l304_c1_27f0_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l304_c1_27f0_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l304_c1_27f0_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l304_c1_27f0_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l304_c1_27f0_return_output;

     -- t8_MUX[uxn_opcodes_h_l312_c7_cac9] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l312_c7_cac9_cond <= VAR_t8_MUX_uxn_opcodes_h_l312_c7_cac9_cond;
     t8_MUX_uxn_opcodes_h_l312_c7_cac9_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l312_c7_cac9_iftrue;
     t8_MUX_uxn_opcodes_h_l312_c7_cac9_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l312_c7_cac9_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l312_c7_cac9_return_output := t8_MUX_uxn_opcodes_h_l312_c7_cac9_return_output;

     -- Submodule level 2
     VAR_printf_uxn_opcodes_h_l305_c3_d7f3_uxn_opcodes_h_l305_c3_d7f3_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l304_c1_27f0_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l316_c7_0533_iffalse := VAR_n8_MUX_uxn_opcodes_h_l319_c7_267e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_cae2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_b812_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l319_c7_267e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l327_c7_ee15_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_cae2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_b812_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l316_c7_0533_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l319_c7_267e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l327_c7_ee15_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_cae2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l327_c7_ee15_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l332_c7_cae2_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l309_c7_6d81_iffalse := VAR_t8_MUX_uxn_opcodes_h_l312_c7_cac9_return_output;
     -- n8_MUX[uxn_opcodes_h_l316_c7_0533] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l316_c7_0533_cond <= VAR_n8_MUX_uxn_opcodes_h_l316_c7_0533_cond;
     n8_MUX_uxn_opcodes_h_l316_c7_0533_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l316_c7_0533_iftrue;
     n8_MUX_uxn_opcodes_h_l316_c7_0533_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l316_c7_0533_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l316_c7_0533_return_output := n8_MUX_uxn_opcodes_h_l316_c7_0533_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l327_c7_ee15] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l327_c7_ee15_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l327_c7_ee15_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l327_c7_ee15_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l327_c7_ee15_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l327_c7_ee15_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l327_c7_ee15_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l327_c7_ee15_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l327_c7_ee15_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l332_c7_cae2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_cae2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_cae2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_cae2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_cae2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_cae2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_cae2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_cae2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_cae2_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l327_c7_ee15] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l327_c7_ee15_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l327_c7_ee15_cond;
     result_u8_value_MUX_uxn_opcodes_h_l327_c7_ee15_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l327_c7_ee15_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l327_c7_ee15_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l327_c7_ee15_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l327_c7_ee15_return_output := result_u8_value_MUX_uxn_opcodes_h_l327_c7_ee15_return_output;

     -- printf_uxn_opcodes_h_l305_c3_d7f3[uxn_opcodes_h_l305_c3_d7f3] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l305_c3_d7f3_uxn_opcodes_h_l305_c3_d7f3_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l305_c3_d7f3_uxn_opcodes_h_l305_c3_d7f3_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- t8_MUX[uxn_opcodes_h_l309_c7_6d81] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l309_c7_6d81_cond <= VAR_t8_MUX_uxn_opcodes_h_l309_c7_6d81_cond;
     t8_MUX_uxn_opcodes_h_l309_c7_6d81_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l309_c7_6d81_iftrue;
     t8_MUX_uxn_opcodes_h_l309_c7_6d81_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l309_c7_6d81_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l309_c7_6d81_return_output := t8_MUX_uxn_opcodes_h_l309_c7_6d81_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l319_c7_267e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l319_c7_267e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l319_c7_267e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l319_c7_267e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l319_c7_267e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l319_c7_267e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l319_c7_267e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l319_c7_267e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l319_c7_267e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l316_c7_0533] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l316_c7_0533_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l316_c7_0533_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l316_c7_0533_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l316_c7_0533_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l316_c7_0533_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l316_c7_0533_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l316_c7_0533_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l316_c7_0533_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l332_c7_cae2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_cae2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_cae2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_cae2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_cae2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_cae2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_cae2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_cae2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_cae2_return_output;

     -- Submodule level 3
     VAR_n8_MUX_uxn_opcodes_h_l312_c7_cac9_iffalse := VAR_n8_MUX_uxn_opcodes_h_l316_c7_0533_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l327_c7_ee15_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_cae2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l316_c7_0533_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l319_c7_267e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l327_c7_ee15_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_cae2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l312_c7_cac9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l316_c7_0533_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l319_c7_267e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l327_c7_ee15_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l319_c7_267e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l327_c7_ee15_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l304_c2_578c_iffalse := VAR_t8_MUX_uxn_opcodes_h_l309_c7_6d81_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l327_c7_ee15] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l327_c7_ee15_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l327_c7_ee15_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l327_c7_ee15_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l327_c7_ee15_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l327_c7_ee15_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l327_c7_ee15_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l327_c7_ee15_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l327_c7_ee15_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l319_c7_267e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l319_c7_267e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l319_c7_267e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l319_c7_267e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l319_c7_267e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l319_c7_267e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l319_c7_267e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l319_c7_267e_return_output := result_u8_value_MUX_uxn_opcodes_h_l319_c7_267e_return_output;

     -- t8_MUX[uxn_opcodes_h_l304_c2_578c] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l304_c2_578c_cond <= VAR_t8_MUX_uxn_opcodes_h_l304_c2_578c_cond;
     t8_MUX_uxn_opcodes_h_l304_c2_578c_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l304_c2_578c_iftrue;
     t8_MUX_uxn_opcodes_h_l304_c2_578c_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l304_c2_578c_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l304_c2_578c_return_output := t8_MUX_uxn_opcodes_h_l304_c2_578c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l319_c7_267e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l319_c7_267e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l319_c7_267e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l319_c7_267e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l319_c7_267e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l319_c7_267e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l319_c7_267e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l319_c7_267e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l319_c7_267e_return_output;

     -- n8_MUX[uxn_opcodes_h_l312_c7_cac9] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l312_c7_cac9_cond <= VAR_n8_MUX_uxn_opcodes_h_l312_c7_cac9_cond;
     n8_MUX_uxn_opcodes_h_l312_c7_cac9_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l312_c7_cac9_iftrue;
     n8_MUX_uxn_opcodes_h_l312_c7_cac9_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l312_c7_cac9_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l312_c7_cac9_return_output := n8_MUX_uxn_opcodes_h_l312_c7_cac9_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l316_c7_0533] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l316_c7_0533_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l316_c7_0533_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l316_c7_0533_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l316_c7_0533_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l316_c7_0533_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l316_c7_0533_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l316_c7_0533_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l316_c7_0533_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l327_c7_ee15] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l327_c7_ee15_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l327_c7_ee15_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l327_c7_ee15_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l327_c7_ee15_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l327_c7_ee15_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l327_c7_ee15_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l327_c7_ee15_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l327_c7_ee15_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l312_c7_cac9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l312_c7_cac9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l312_c7_cac9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l312_c7_cac9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l312_c7_cac9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l312_c7_cac9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l312_c7_cac9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l312_c7_cac9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l312_c7_cac9_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l309_c7_6d81_iffalse := VAR_n8_MUX_uxn_opcodes_h_l312_c7_cac9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l319_c7_267e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l327_c7_ee15_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l312_c7_cac9_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l316_c7_0533_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l319_c7_267e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l327_c7_ee15_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l309_c7_6d81_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l312_c7_cac9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l316_c7_0533_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l319_c7_267e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l316_c7_0533_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l319_c7_267e_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l304_c2_578c_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l316_c7_0533] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l316_c7_0533_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l316_c7_0533_cond;
     result_u8_value_MUX_uxn_opcodes_h_l316_c7_0533_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l316_c7_0533_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l316_c7_0533_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l316_c7_0533_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l316_c7_0533_return_output := result_u8_value_MUX_uxn_opcodes_h_l316_c7_0533_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l319_c7_267e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l319_c7_267e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l319_c7_267e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l319_c7_267e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l319_c7_267e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l319_c7_267e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l319_c7_267e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l319_c7_267e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l319_c7_267e_return_output;

     -- n8_MUX[uxn_opcodes_h_l309_c7_6d81] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l309_c7_6d81_cond <= VAR_n8_MUX_uxn_opcodes_h_l309_c7_6d81_cond;
     n8_MUX_uxn_opcodes_h_l309_c7_6d81_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l309_c7_6d81_iftrue;
     n8_MUX_uxn_opcodes_h_l309_c7_6d81_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l309_c7_6d81_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l309_c7_6d81_return_output := n8_MUX_uxn_opcodes_h_l309_c7_6d81_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l316_c7_0533] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l316_c7_0533_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l316_c7_0533_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l316_c7_0533_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l316_c7_0533_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l316_c7_0533_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l316_c7_0533_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l316_c7_0533_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l316_c7_0533_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l312_c7_cac9] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l312_c7_cac9_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l312_c7_cac9_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l312_c7_cac9_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l312_c7_cac9_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l312_c7_cac9_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l312_c7_cac9_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l312_c7_cac9_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l312_c7_cac9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l319_c7_267e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l319_c7_267e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l319_c7_267e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l319_c7_267e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l319_c7_267e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l319_c7_267e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l319_c7_267e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l319_c7_267e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l319_c7_267e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l309_c7_6d81] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l309_c7_6d81_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l309_c7_6d81_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l309_c7_6d81_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l309_c7_6d81_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l309_c7_6d81_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l309_c7_6d81_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l309_c7_6d81_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l309_c7_6d81_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l304_c2_578c_iffalse := VAR_n8_MUX_uxn_opcodes_h_l309_c7_6d81_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l316_c7_0533_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l319_c7_267e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l309_c7_6d81_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l312_c7_cac9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l316_c7_0533_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l319_c7_267e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l304_c2_578c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l309_c7_6d81_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l312_c7_cac9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l316_c7_0533_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l312_c7_cac9_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l316_c7_0533_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l304_c2_578c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l304_c2_578c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l304_c2_578c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l304_c2_578c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l304_c2_578c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l304_c2_578c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l304_c2_578c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l304_c2_578c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l304_c2_578c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l316_c7_0533] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l316_c7_0533_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l316_c7_0533_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l316_c7_0533_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l316_c7_0533_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l316_c7_0533_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l316_c7_0533_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l316_c7_0533_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l316_c7_0533_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l316_c7_0533] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l316_c7_0533_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l316_c7_0533_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l316_c7_0533_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l316_c7_0533_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l316_c7_0533_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l316_c7_0533_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l316_c7_0533_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l316_c7_0533_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l312_c7_cac9] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l312_c7_cac9_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l312_c7_cac9_cond;
     result_u8_value_MUX_uxn_opcodes_h_l312_c7_cac9_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l312_c7_cac9_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l312_c7_cac9_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l312_c7_cac9_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l312_c7_cac9_return_output := result_u8_value_MUX_uxn_opcodes_h_l312_c7_cac9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l312_c7_cac9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l312_c7_cac9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l312_c7_cac9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l312_c7_cac9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l312_c7_cac9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l312_c7_cac9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l312_c7_cac9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l312_c7_cac9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l312_c7_cac9_return_output;

     -- n8_MUX[uxn_opcodes_h_l304_c2_578c] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l304_c2_578c_cond <= VAR_n8_MUX_uxn_opcodes_h_l304_c2_578c_cond;
     n8_MUX_uxn_opcodes_h_l304_c2_578c_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l304_c2_578c_iftrue;
     n8_MUX_uxn_opcodes_h_l304_c2_578c_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l304_c2_578c_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l304_c2_578c_return_output := n8_MUX_uxn_opcodes_h_l304_c2_578c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l309_c7_6d81] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l309_c7_6d81_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l309_c7_6d81_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l309_c7_6d81_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l309_c7_6d81_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l309_c7_6d81_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l309_c7_6d81_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l309_c7_6d81_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l309_c7_6d81_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l304_c2_578c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l312_c7_cac9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l316_c7_0533_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l304_c2_578c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l309_c7_6d81_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l312_c7_cac9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l316_c7_0533_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_6d81_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l312_c7_cac9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l309_c7_6d81_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l312_c7_cac9_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l312_c7_cac9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l312_c7_cac9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l312_c7_cac9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l312_c7_cac9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l312_c7_cac9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l312_c7_cac9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l312_c7_cac9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l312_c7_cac9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l312_c7_cac9_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l309_c7_6d81] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l309_c7_6d81_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l309_c7_6d81_cond;
     result_u8_value_MUX_uxn_opcodes_h_l309_c7_6d81_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l309_c7_6d81_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l309_c7_6d81_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l309_c7_6d81_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l309_c7_6d81_return_output := result_u8_value_MUX_uxn_opcodes_h_l309_c7_6d81_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l312_c7_cac9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l312_c7_cac9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l312_c7_cac9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l312_c7_cac9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l312_c7_cac9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l312_c7_cac9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l312_c7_cac9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l312_c7_cac9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l312_c7_cac9_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l304_c2_578c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l304_c2_578c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l304_c2_578c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l304_c2_578c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l304_c2_578c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l304_c2_578c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l304_c2_578c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l304_c2_578c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l304_c2_578c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l309_c7_6d81] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_6d81_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_6d81_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_6d81_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_6d81_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_6d81_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_6d81_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_6d81_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_6d81_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_6d81_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l312_c7_cac9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_6d81_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l312_c7_cac9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l304_c2_578c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_6d81_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l304_c2_578c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l309_c7_6d81_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l304_c2_578c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l304_c2_578c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l304_c2_578c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l304_c2_578c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l304_c2_578c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l304_c2_578c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l304_c2_578c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l304_c2_578c_return_output := result_u8_value_MUX_uxn_opcodes_h_l304_c2_578c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l309_c7_6d81] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_6d81_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_6d81_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_6d81_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_6d81_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_6d81_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_6d81_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_6d81_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_6d81_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l304_c2_578c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l304_c2_578c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l304_c2_578c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l304_c2_578c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l304_c2_578c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l304_c2_578c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l304_c2_578c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l304_c2_578c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l304_c2_578c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l309_c7_6d81] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_6d81_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_6d81_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_6d81_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_6d81_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_6d81_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_6d81_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_6d81_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_6d81_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l304_c2_578c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_6d81_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l304_c2_578c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_6d81_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l304_c2_578c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l304_c2_578c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l304_c2_578c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l304_c2_578c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l304_c2_578c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l304_c2_578c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l304_c2_578c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l304_c2_578c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l304_c2_578c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l304_c2_578c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l304_c2_578c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l304_c2_578c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l304_c2_578c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l304_c2_578c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l304_c2_578c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l304_c2_578c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l304_c2_578c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l304_c2_578c_return_output;

     -- Submodule level 9
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_641b_uxn_opcodes_h_l300_l341_DUPLICATE_8374 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_641b_uxn_opcodes_h_l300_l341_DUPLICATE_8374_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_641b(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l304_c2_578c_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l304_c2_578c_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l304_c2_578c_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l304_c2_578c_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l304_c2_578c_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l304_c2_578c_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_641b_uxn_opcodes_h_l300_l341_DUPLICATE_8374_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_641b_uxn_opcodes_h_l300_l341_DUPLICATE_8374_return_output;
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
