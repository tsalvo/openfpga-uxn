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
entity and2_0CLK_201aeef3 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end and2_0CLK_201aeef3;
architecture arch of and2_0CLK_201aeef3 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l877_c6_a79d]
signal BIN_OP_EQ_uxn_opcodes_h_l877_c6_a79d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l877_c6_a79d_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l877_c6_a79d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l877_c1_6504]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l877_c1_6504_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l877_c1_6504_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l877_c1_6504_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l877_c1_6504_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l877_c2_f9d9]
signal n16_MUX_uxn_opcodes_h_l877_c2_f9d9_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l877_c2_f9d9_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l877_c2_f9d9_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l877_c2_f9d9_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l877_c2_f9d9]
signal result_stack_value_MUX_uxn_opcodes_h_l877_c2_f9d9_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l877_c2_f9d9_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l877_c2_f9d9_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l877_c2_f9d9_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l877_c2_f9d9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l877_c2_f9d9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l877_c2_f9d9_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l877_c2_f9d9_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l877_c2_f9d9_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l877_c2_f9d9]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l877_c2_f9d9_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l877_c2_f9d9_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l877_c2_f9d9_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l877_c2_f9d9_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l877_c2_f9d9]
signal result_is_stack_read_MUX_uxn_opcodes_h_l877_c2_f9d9_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l877_c2_f9d9_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l877_c2_f9d9_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l877_c2_f9d9_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l877_c2_f9d9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l877_c2_f9d9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l877_c2_f9d9_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l877_c2_f9d9_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l877_c2_f9d9_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l877_c2_f9d9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l877_c2_f9d9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l877_c2_f9d9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l877_c2_f9d9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l877_c2_f9d9_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l877_c2_f9d9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l877_c2_f9d9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l877_c2_f9d9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l877_c2_f9d9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l877_c2_f9d9_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l877_c2_f9d9]
signal tmp16_MUX_uxn_opcodes_h_l877_c2_f9d9_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l877_c2_f9d9_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l877_c2_f9d9_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l877_c2_f9d9_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l877_c2_f9d9]
signal t16_MUX_uxn_opcodes_h_l877_c2_f9d9_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l877_c2_f9d9_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l877_c2_f9d9_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l877_c2_f9d9_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l878_c3_37eb[uxn_opcodes_h_l878_c3_37eb]
signal printf_uxn_opcodes_h_l878_c3_37eb_uxn_opcodes_h_l878_c3_37eb_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l883_c11_1eef]
signal BIN_OP_EQ_uxn_opcodes_h_l883_c11_1eef_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l883_c11_1eef_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l883_c11_1eef_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l883_c7_6aff]
signal n16_MUX_uxn_opcodes_h_l883_c7_6aff_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l883_c7_6aff_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l883_c7_6aff_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l883_c7_6aff_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l883_c7_6aff]
signal result_stack_value_MUX_uxn_opcodes_h_l883_c7_6aff_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l883_c7_6aff_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l883_c7_6aff_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l883_c7_6aff_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l883_c7_6aff]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_6aff_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_6aff_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_6aff_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_6aff_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l883_c7_6aff]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l883_c7_6aff_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l883_c7_6aff_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l883_c7_6aff_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l883_c7_6aff_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l883_c7_6aff]
signal result_is_stack_read_MUX_uxn_opcodes_h_l883_c7_6aff_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l883_c7_6aff_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l883_c7_6aff_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l883_c7_6aff_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l883_c7_6aff]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_6aff_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_6aff_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_6aff_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_6aff_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l883_c7_6aff]
signal result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_6aff_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_6aff_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_6aff_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_6aff_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l883_c7_6aff]
signal result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_6aff_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_6aff_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_6aff_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_6aff_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l883_c7_6aff]
signal tmp16_MUX_uxn_opcodes_h_l883_c7_6aff_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l883_c7_6aff_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l883_c7_6aff_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l883_c7_6aff_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l883_c7_6aff]
signal t16_MUX_uxn_opcodes_h_l883_c7_6aff_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l883_c7_6aff_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l883_c7_6aff_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l883_c7_6aff_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l886_c11_b1c6]
signal BIN_OP_EQ_uxn_opcodes_h_l886_c11_b1c6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l886_c11_b1c6_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l886_c11_b1c6_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l886_c7_7686]
signal n16_MUX_uxn_opcodes_h_l886_c7_7686_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l886_c7_7686_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l886_c7_7686_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l886_c7_7686_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l886_c7_7686]
signal result_stack_value_MUX_uxn_opcodes_h_l886_c7_7686_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l886_c7_7686_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l886_c7_7686_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l886_c7_7686_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l886_c7_7686]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l886_c7_7686_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l886_c7_7686_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l886_c7_7686_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l886_c7_7686_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l886_c7_7686]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l886_c7_7686_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l886_c7_7686_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l886_c7_7686_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l886_c7_7686_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l886_c7_7686]
signal result_is_stack_read_MUX_uxn_opcodes_h_l886_c7_7686_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l886_c7_7686_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l886_c7_7686_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l886_c7_7686_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l886_c7_7686]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l886_c7_7686_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l886_c7_7686_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l886_c7_7686_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l886_c7_7686_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l886_c7_7686]
signal result_is_stack_write_MUX_uxn_opcodes_h_l886_c7_7686_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l886_c7_7686_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l886_c7_7686_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l886_c7_7686_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l886_c7_7686]
signal result_is_opc_done_MUX_uxn_opcodes_h_l886_c7_7686_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l886_c7_7686_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l886_c7_7686_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l886_c7_7686_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l886_c7_7686]
signal tmp16_MUX_uxn_opcodes_h_l886_c7_7686_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l886_c7_7686_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l886_c7_7686_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l886_c7_7686_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l886_c7_7686]
signal t16_MUX_uxn_opcodes_h_l886_c7_7686_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l886_c7_7686_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l886_c7_7686_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l886_c7_7686_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l891_c11_c596]
signal BIN_OP_EQ_uxn_opcodes_h_l891_c11_c596_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l891_c11_c596_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l891_c11_c596_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l891_c7_e574]
signal n16_MUX_uxn_opcodes_h_l891_c7_e574_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l891_c7_e574_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l891_c7_e574_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l891_c7_e574_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l891_c7_e574]
signal result_stack_value_MUX_uxn_opcodes_h_l891_c7_e574_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l891_c7_e574_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l891_c7_e574_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l891_c7_e574_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l891_c7_e574]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_e574_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_e574_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_e574_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_e574_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l891_c7_e574]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l891_c7_e574_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l891_c7_e574_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l891_c7_e574_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l891_c7_e574_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l891_c7_e574]
signal result_is_stack_read_MUX_uxn_opcodes_h_l891_c7_e574_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l891_c7_e574_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l891_c7_e574_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l891_c7_e574_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l891_c7_e574]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_e574_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_e574_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_e574_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_e574_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l891_c7_e574]
signal result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_e574_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_e574_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_e574_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_e574_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l891_c7_e574]
signal result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_e574_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_e574_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_e574_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_e574_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l891_c7_e574]
signal tmp16_MUX_uxn_opcodes_h_l891_c7_e574_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l891_c7_e574_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l891_c7_e574_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l891_c7_e574_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l891_c7_e574]
signal t16_MUX_uxn_opcodes_h_l891_c7_e574_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l891_c7_e574_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l891_c7_e574_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l891_c7_e574_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l894_c11_f6a7]
signal BIN_OP_EQ_uxn_opcodes_h_l894_c11_f6a7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l894_c11_f6a7_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l894_c11_f6a7_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l894_c7_5816]
signal n16_MUX_uxn_opcodes_h_l894_c7_5816_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l894_c7_5816_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l894_c7_5816_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l894_c7_5816_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l894_c7_5816]
signal result_stack_value_MUX_uxn_opcodes_h_l894_c7_5816_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l894_c7_5816_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l894_c7_5816_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l894_c7_5816_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l894_c7_5816]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l894_c7_5816_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l894_c7_5816_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l894_c7_5816_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l894_c7_5816_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l894_c7_5816]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l894_c7_5816_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l894_c7_5816_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l894_c7_5816_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l894_c7_5816_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l894_c7_5816]
signal result_is_stack_read_MUX_uxn_opcodes_h_l894_c7_5816_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l894_c7_5816_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l894_c7_5816_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l894_c7_5816_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l894_c7_5816]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l894_c7_5816_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l894_c7_5816_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l894_c7_5816_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l894_c7_5816_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l894_c7_5816]
signal result_is_stack_write_MUX_uxn_opcodes_h_l894_c7_5816_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l894_c7_5816_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l894_c7_5816_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l894_c7_5816_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l894_c7_5816]
signal result_is_opc_done_MUX_uxn_opcodes_h_l894_c7_5816_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l894_c7_5816_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l894_c7_5816_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l894_c7_5816_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l894_c7_5816]
signal tmp16_MUX_uxn_opcodes_h_l894_c7_5816_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l894_c7_5816_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l894_c7_5816_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l894_c7_5816_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l894_c7_5816]
signal t16_MUX_uxn_opcodes_h_l894_c7_5816_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l894_c7_5816_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l894_c7_5816_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l894_c7_5816_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l895_c3_ce44]
signal BIN_OP_OR_uxn_opcodes_h_l895_c3_ce44_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l895_c3_ce44_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l895_c3_ce44_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l898_c11_1860]
signal BIN_OP_EQ_uxn_opcodes_h_l898_c11_1860_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l898_c11_1860_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l898_c11_1860_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l898_c7_4e92]
signal n16_MUX_uxn_opcodes_h_l898_c7_4e92_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l898_c7_4e92_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l898_c7_4e92_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l898_c7_4e92_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l898_c7_4e92]
signal result_stack_value_MUX_uxn_opcodes_h_l898_c7_4e92_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l898_c7_4e92_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l898_c7_4e92_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l898_c7_4e92_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l898_c7_4e92]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l898_c7_4e92_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l898_c7_4e92_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l898_c7_4e92_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l898_c7_4e92_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l898_c7_4e92]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l898_c7_4e92_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l898_c7_4e92_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l898_c7_4e92_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l898_c7_4e92_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l898_c7_4e92]
signal result_is_stack_read_MUX_uxn_opcodes_h_l898_c7_4e92_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l898_c7_4e92_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l898_c7_4e92_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l898_c7_4e92_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l898_c7_4e92]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l898_c7_4e92_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l898_c7_4e92_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l898_c7_4e92_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l898_c7_4e92_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l898_c7_4e92]
signal result_is_stack_write_MUX_uxn_opcodes_h_l898_c7_4e92_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l898_c7_4e92_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l898_c7_4e92_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l898_c7_4e92_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l898_c7_4e92]
signal result_is_opc_done_MUX_uxn_opcodes_h_l898_c7_4e92_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l898_c7_4e92_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l898_c7_4e92_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l898_c7_4e92_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l898_c7_4e92]
signal tmp16_MUX_uxn_opcodes_h_l898_c7_4e92_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l898_c7_4e92_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l898_c7_4e92_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l898_c7_4e92_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l901_c11_bb0d]
signal BIN_OP_EQ_uxn_opcodes_h_l901_c11_bb0d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l901_c11_bb0d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l901_c11_bb0d_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l901_c7_9ea4]
signal n16_MUX_uxn_opcodes_h_l901_c7_9ea4_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l901_c7_9ea4_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l901_c7_9ea4_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l901_c7_9ea4_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l901_c7_9ea4]
signal result_stack_value_MUX_uxn_opcodes_h_l901_c7_9ea4_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l901_c7_9ea4_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l901_c7_9ea4_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l901_c7_9ea4_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l901_c7_9ea4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c7_9ea4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c7_9ea4_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c7_9ea4_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c7_9ea4_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l901_c7_9ea4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l901_c7_9ea4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l901_c7_9ea4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l901_c7_9ea4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l901_c7_9ea4_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l901_c7_9ea4]
signal result_is_stack_read_MUX_uxn_opcodes_h_l901_c7_9ea4_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l901_c7_9ea4_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l901_c7_9ea4_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l901_c7_9ea4_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l901_c7_9ea4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c7_9ea4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c7_9ea4_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c7_9ea4_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c7_9ea4_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l901_c7_9ea4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l901_c7_9ea4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l901_c7_9ea4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l901_c7_9ea4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l901_c7_9ea4_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l901_c7_9ea4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l901_c7_9ea4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l901_c7_9ea4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l901_c7_9ea4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l901_c7_9ea4_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l901_c7_9ea4]
signal tmp16_MUX_uxn_opcodes_h_l901_c7_9ea4_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l901_c7_9ea4_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l901_c7_9ea4_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l901_c7_9ea4_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l906_c11_8b5a]
signal BIN_OP_EQ_uxn_opcodes_h_l906_c11_8b5a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l906_c11_8b5a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l906_c11_8b5a_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l906_c7_f3e4]
signal n16_MUX_uxn_opcodes_h_l906_c7_f3e4_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l906_c7_f3e4_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l906_c7_f3e4_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l906_c7_f3e4_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l906_c7_f3e4]
signal result_stack_value_MUX_uxn_opcodes_h_l906_c7_f3e4_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l906_c7_f3e4_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l906_c7_f3e4_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l906_c7_f3e4_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l906_c7_f3e4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_f3e4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_f3e4_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_f3e4_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_f3e4_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l906_c7_f3e4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_f3e4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_f3e4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_f3e4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_f3e4_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l906_c7_f3e4]
signal result_is_stack_read_MUX_uxn_opcodes_h_l906_c7_f3e4_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l906_c7_f3e4_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l906_c7_f3e4_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l906_c7_f3e4_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l906_c7_f3e4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_f3e4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_f3e4_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_f3e4_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_f3e4_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l906_c7_f3e4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_f3e4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_f3e4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_f3e4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_f3e4_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l906_c7_f3e4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_f3e4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_f3e4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_f3e4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_f3e4_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l906_c7_f3e4]
signal tmp16_MUX_uxn_opcodes_h_l906_c7_f3e4_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l906_c7_f3e4_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l906_c7_f3e4_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l906_c7_f3e4_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l909_c11_5d69]
signal BIN_OP_EQ_uxn_opcodes_h_l909_c11_5d69_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l909_c11_5d69_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l909_c11_5d69_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l909_c7_7461]
signal n16_MUX_uxn_opcodes_h_l909_c7_7461_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l909_c7_7461_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l909_c7_7461_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l909_c7_7461_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l909_c7_7461]
signal result_stack_value_MUX_uxn_opcodes_h_l909_c7_7461_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l909_c7_7461_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l909_c7_7461_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l909_c7_7461_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l909_c7_7461]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c7_7461_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c7_7461_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c7_7461_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c7_7461_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l909_c7_7461]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l909_c7_7461_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l909_c7_7461_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l909_c7_7461_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l909_c7_7461_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l909_c7_7461]
signal result_is_stack_read_MUX_uxn_opcodes_h_l909_c7_7461_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l909_c7_7461_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l909_c7_7461_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l909_c7_7461_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l909_c7_7461]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c7_7461_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c7_7461_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c7_7461_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c7_7461_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l909_c7_7461]
signal result_is_stack_write_MUX_uxn_opcodes_h_l909_c7_7461_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l909_c7_7461_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l909_c7_7461_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l909_c7_7461_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l909_c7_7461]
signal result_is_opc_done_MUX_uxn_opcodes_h_l909_c7_7461_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l909_c7_7461_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l909_c7_7461_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l909_c7_7461_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l909_c7_7461]
signal tmp16_MUX_uxn_opcodes_h_l909_c7_7461_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l909_c7_7461_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l909_c7_7461_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l909_c7_7461_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l910_c3_fdc1]
signal BIN_OP_OR_uxn_opcodes_h_l910_c3_fdc1_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l910_c3_fdc1_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l910_c3_fdc1_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l911_c11_8f85]
signal BIN_OP_AND_uxn_opcodes_h_l911_c11_8f85_left : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l911_c11_8f85_right : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l911_c11_8f85_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l914_c32_c3b6]
signal BIN_OP_AND_uxn_opcodes_h_l914_c32_c3b6_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l914_c32_c3b6_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l914_c32_c3b6_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l914_c32_3137]
signal BIN_OP_GT_uxn_opcodes_h_l914_c32_3137_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l914_c32_3137_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l914_c32_3137_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l914_c32_ea32]
signal MUX_uxn_opcodes_h_l914_c32_ea32_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l914_c32_ea32_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l914_c32_ea32_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l914_c32_ea32_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l916_c11_ff1a]
signal BIN_OP_EQ_uxn_opcodes_h_l916_c11_ff1a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l916_c11_ff1a_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l916_c11_ff1a_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l916_c7_1506]
signal result_stack_value_MUX_uxn_opcodes_h_l916_c7_1506_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l916_c7_1506_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l916_c7_1506_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l916_c7_1506_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l916_c7_1506]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l916_c7_1506_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l916_c7_1506_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l916_c7_1506_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l916_c7_1506_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l916_c7_1506]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l916_c7_1506_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l916_c7_1506_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l916_c7_1506_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l916_c7_1506_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l916_c7_1506]
signal result_is_stack_write_MUX_uxn_opcodes_h_l916_c7_1506_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l916_c7_1506_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l916_c7_1506_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l916_c7_1506_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l916_c7_1506]
signal result_is_opc_done_MUX_uxn_opcodes_h_l916_c7_1506_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l916_c7_1506_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l916_c7_1506_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l916_c7_1506_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l922_c11_f3fc]
signal BIN_OP_EQ_uxn_opcodes_h_l922_c11_f3fc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l922_c11_f3fc_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l922_c11_f3fc_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l922_c7_2368]
signal result_stack_value_MUX_uxn_opcodes_h_l922_c7_2368_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l922_c7_2368_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l922_c7_2368_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l922_c7_2368_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l922_c7_2368]
signal result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_2368_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_2368_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_2368_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_2368_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l922_c7_2368]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_2368_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_2368_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_2368_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_2368_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l922_c7_2368]
signal result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_2368_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_2368_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_2368_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_2368_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l924_c34_598e]
signal CONST_SR_8_uxn_opcodes_h_l924_c34_598e_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l924_c34_598e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l926_c11_ca22]
signal BIN_OP_EQ_uxn_opcodes_h_l926_c11_ca22_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l926_c11_ca22_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l926_c11_ca22_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l926_c7_a362]
signal result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_a362_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_a362_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_a362_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_a362_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l926_c7_a362]
signal result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_a362_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_a362_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_a362_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_a362_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l903_l888_DUPLICATE_11e6
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l903_l888_DUPLICATE_11e6_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l903_l888_DUPLICATE_11e6_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_df93( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : signed;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.stack_value := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.is_sp_shift := ref_toks_3;
      base.is_stack_read := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.is_stack_write := ref_toks_6;
      base.is_opc_done := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l877_c6_a79d
BIN_OP_EQ_uxn_opcodes_h_l877_c6_a79d : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l877_c6_a79d_left,
BIN_OP_EQ_uxn_opcodes_h_l877_c6_a79d_right,
BIN_OP_EQ_uxn_opcodes_h_l877_c6_a79d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l877_c1_6504
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l877_c1_6504 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l877_c1_6504_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l877_c1_6504_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l877_c1_6504_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l877_c1_6504_return_output);

-- n16_MUX_uxn_opcodes_h_l877_c2_f9d9
n16_MUX_uxn_opcodes_h_l877_c2_f9d9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l877_c2_f9d9_cond,
n16_MUX_uxn_opcodes_h_l877_c2_f9d9_iftrue,
n16_MUX_uxn_opcodes_h_l877_c2_f9d9_iffalse,
n16_MUX_uxn_opcodes_h_l877_c2_f9d9_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l877_c2_f9d9
result_stack_value_MUX_uxn_opcodes_h_l877_c2_f9d9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l877_c2_f9d9_cond,
result_stack_value_MUX_uxn_opcodes_h_l877_c2_f9d9_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l877_c2_f9d9_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l877_c2_f9d9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l877_c2_f9d9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l877_c2_f9d9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l877_c2_f9d9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l877_c2_f9d9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l877_c2_f9d9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l877_c2_f9d9_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l877_c2_f9d9
result_is_sp_shift_MUX_uxn_opcodes_h_l877_c2_f9d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l877_c2_f9d9_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l877_c2_f9d9_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l877_c2_f9d9_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l877_c2_f9d9_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l877_c2_f9d9
result_is_stack_read_MUX_uxn_opcodes_h_l877_c2_f9d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l877_c2_f9d9_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l877_c2_f9d9_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l877_c2_f9d9_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l877_c2_f9d9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l877_c2_f9d9
result_sp_relative_shift_MUX_uxn_opcodes_h_l877_c2_f9d9 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l877_c2_f9d9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l877_c2_f9d9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l877_c2_f9d9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l877_c2_f9d9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l877_c2_f9d9
result_is_stack_write_MUX_uxn_opcodes_h_l877_c2_f9d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l877_c2_f9d9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l877_c2_f9d9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l877_c2_f9d9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l877_c2_f9d9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l877_c2_f9d9
result_is_opc_done_MUX_uxn_opcodes_h_l877_c2_f9d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l877_c2_f9d9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l877_c2_f9d9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l877_c2_f9d9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l877_c2_f9d9_return_output);

-- tmp16_MUX_uxn_opcodes_h_l877_c2_f9d9
tmp16_MUX_uxn_opcodes_h_l877_c2_f9d9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l877_c2_f9d9_cond,
tmp16_MUX_uxn_opcodes_h_l877_c2_f9d9_iftrue,
tmp16_MUX_uxn_opcodes_h_l877_c2_f9d9_iffalse,
tmp16_MUX_uxn_opcodes_h_l877_c2_f9d9_return_output);

-- t16_MUX_uxn_opcodes_h_l877_c2_f9d9
t16_MUX_uxn_opcodes_h_l877_c2_f9d9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l877_c2_f9d9_cond,
t16_MUX_uxn_opcodes_h_l877_c2_f9d9_iftrue,
t16_MUX_uxn_opcodes_h_l877_c2_f9d9_iffalse,
t16_MUX_uxn_opcodes_h_l877_c2_f9d9_return_output);

-- printf_uxn_opcodes_h_l878_c3_37eb_uxn_opcodes_h_l878_c3_37eb
printf_uxn_opcodes_h_l878_c3_37eb_uxn_opcodes_h_l878_c3_37eb : entity work.printf_uxn_opcodes_h_l878_c3_37eb_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l878_c3_37eb_uxn_opcodes_h_l878_c3_37eb_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l883_c11_1eef
BIN_OP_EQ_uxn_opcodes_h_l883_c11_1eef : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l883_c11_1eef_left,
BIN_OP_EQ_uxn_opcodes_h_l883_c11_1eef_right,
BIN_OP_EQ_uxn_opcodes_h_l883_c11_1eef_return_output);

-- n16_MUX_uxn_opcodes_h_l883_c7_6aff
n16_MUX_uxn_opcodes_h_l883_c7_6aff : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l883_c7_6aff_cond,
n16_MUX_uxn_opcodes_h_l883_c7_6aff_iftrue,
n16_MUX_uxn_opcodes_h_l883_c7_6aff_iffalse,
n16_MUX_uxn_opcodes_h_l883_c7_6aff_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l883_c7_6aff
result_stack_value_MUX_uxn_opcodes_h_l883_c7_6aff : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l883_c7_6aff_cond,
result_stack_value_MUX_uxn_opcodes_h_l883_c7_6aff_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l883_c7_6aff_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l883_c7_6aff_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_6aff
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_6aff : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_6aff_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_6aff_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_6aff_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_6aff_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l883_c7_6aff
result_is_sp_shift_MUX_uxn_opcodes_h_l883_c7_6aff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l883_c7_6aff_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l883_c7_6aff_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l883_c7_6aff_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l883_c7_6aff_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l883_c7_6aff
result_is_stack_read_MUX_uxn_opcodes_h_l883_c7_6aff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l883_c7_6aff_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l883_c7_6aff_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l883_c7_6aff_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l883_c7_6aff_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_6aff
result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_6aff : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_6aff_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_6aff_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_6aff_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_6aff_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_6aff
result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_6aff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_6aff_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_6aff_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_6aff_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_6aff_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_6aff
result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_6aff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_6aff_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_6aff_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_6aff_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_6aff_return_output);

-- tmp16_MUX_uxn_opcodes_h_l883_c7_6aff
tmp16_MUX_uxn_opcodes_h_l883_c7_6aff : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l883_c7_6aff_cond,
tmp16_MUX_uxn_opcodes_h_l883_c7_6aff_iftrue,
tmp16_MUX_uxn_opcodes_h_l883_c7_6aff_iffalse,
tmp16_MUX_uxn_opcodes_h_l883_c7_6aff_return_output);

-- t16_MUX_uxn_opcodes_h_l883_c7_6aff
t16_MUX_uxn_opcodes_h_l883_c7_6aff : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l883_c7_6aff_cond,
t16_MUX_uxn_opcodes_h_l883_c7_6aff_iftrue,
t16_MUX_uxn_opcodes_h_l883_c7_6aff_iffalse,
t16_MUX_uxn_opcodes_h_l883_c7_6aff_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l886_c11_b1c6
BIN_OP_EQ_uxn_opcodes_h_l886_c11_b1c6 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l886_c11_b1c6_left,
BIN_OP_EQ_uxn_opcodes_h_l886_c11_b1c6_right,
BIN_OP_EQ_uxn_opcodes_h_l886_c11_b1c6_return_output);

-- n16_MUX_uxn_opcodes_h_l886_c7_7686
n16_MUX_uxn_opcodes_h_l886_c7_7686 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l886_c7_7686_cond,
n16_MUX_uxn_opcodes_h_l886_c7_7686_iftrue,
n16_MUX_uxn_opcodes_h_l886_c7_7686_iffalse,
n16_MUX_uxn_opcodes_h_l886_c7_7686_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l886_c7_7686
result_stack_value_MUX_uxn_opcodes_h_l886_c7_7686 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l886_c7_7686_cond,
result_stack_value_MUX_uxn_opcodes_h_l886_c7_7686_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l886_c7_7686_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l886_c7_7686_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l886_c7_7686
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l886_c7_7686 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l886_c7_7686_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l886_c7_7686_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l886_c7_7686_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l886_c7_7686_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l886_c7_7686
result_is_sp_shift_MUX_uxn_opcodes_h_l886_c7_7686 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l886_c7_7686_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l886_c7_7686_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l886_c7_7686_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l886_c7_7686_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l886_c7_7686
result_is_stack_read_MUX_uxn_opcodes_h_l886_c7_7686 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l886_c7_7686_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l886_c7_7686_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l886_c7_7686_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l886_c7_7686_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l886_c7_7686
result_sp_relative_shift_MUX_uxn_opcodes_h_l886_c7_7686 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l886_c7_7686_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l886_c7_7686_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l886_c7_7686_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l886_c7_7686_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l886_c7_7686
result_is_stack_write_MUX_uxn_opcodes_h_l886_c7_7686 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l886_c7_7686_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l886_c7_7686_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l886_c7_7686_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l886_c7_7686_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l886_c7_7686
result_is_opc_done_MUX_uxn_opcodes_h_l886_c7_7686 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l886_c7_7686_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l886_c7_7686_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l886_c7_7686_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l886_c7_7686_return_output);

-- tmp16_MUX_uxn_opcodes_h_l886_c7_7686
tmp16_MUX_uxn_opcodes_h_l886_c7_7686 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l886_c7_7686_cond,
tmp16_MUX_uxn_opcodes_h_l886_c7_7686_iftrue,
tmp16_MUX_uxn_opcodes_h_l886_c7_7686_iffalse,
tmp16_MUX_uxn_opcodes_h_l886_c7_7686_return_output);

-- t16_MUX_uxn_opcodes_h_l886_c7_7686
t16_MUX_uxn_opcodes_h_l886_c7_7686 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l886_c7_7686_cond,
t16_MUX_uxn_opcodes_h_l886_c7_7686_iftrue,
t16_MUX_uxn_opcodes_h_l886_c7_7686_iffalse,
t16_MUX_uxn_opcodes_h_l886_c7_7686_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l891_c11_c596
BIN_OP_EQ_uxn_opcodes_h_l891_c11_c596 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l891_c11_c596_left,
BIN_OP_EQ_uxn_opcodes_h_l891_c11_c596_right,
BIN_OP_EQ_uxn_opcodes_h_l891_c11_c596_return_output);

-- n16_MUX_uxn_opcodes_h_l891_c7_e574
n16_MUX_uxn_opcodes_h_l891_c7_e574 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l891_c7_e574_cond,
n16_MUX_uxn_opcodes_h_l891_c7_e574_iftrue,
n16_MUX_uxn_opcodes_h_l891_c7_e574_iffalse,
n16_MUX_uxn_opcodes_h_l891_c7_e574_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l891_c7_e574
result_stack_value_MUX_uxn_opcodes_h_l891_c7_e574 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l891_c7_e574_cond,
result_stack_value_MUX_uxn_opcodes_h_l891_c7_e574_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l891_c7_e574_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l891_c7_e574_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_e574
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_e574 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_e574_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_e574_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_e574_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_e574_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l891_c7_e574
result_is_sp_shift_MUX_uxn_opcodes_h_l891_c7_e574 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l891_c7_e574_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l891_c7_e574_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l891_c7_e574_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l891_c7_e574_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l891_c7_e574
result_is_stack_read_MUX_uxn_opcodes_h_l891_c7_e574 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l891_c7_e574_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l891_c7_e574_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l891_c7_e574_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l891_c7_e574_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_e574
result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_e574 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_e574_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_e574_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_e574_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_e574_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_e574
result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_e574 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_e574_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_e574_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_e574_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_e574_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_e574
result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_e574 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_e574_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_e574_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_e574_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_e574_return_output);

-- tmp16_MUX_uxn_opcodes_h_l891_c7_e574
tmp16_MUX_uxn_opcodes_h_l891_c7_e574 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l891_c7_e574_cond,
tmp16_MUX_uxn_opcodes_h_l891_c7_e574_iftrue,
tmp16_MUX_uxn_opcodes_h_l891_c7_e574_iffalse,
tmp16_MUX_uxn_opcodes_h_l891_c7_e574_return_output);

-- t16_MUX_uxn_opcodes_h_l891_c7_e574
t16_MUX_uxn_opcodes_h_l891_c7_e574 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l891_c7_e574_cond,
t16_MUX_uxn_opcodes_h_l891_c7_e574_iftrue,
t16_MUX_uxn_opcodes_h_l891_c7_e574_iffalse,
t16_MUX_uxn_opcodes_h_l891_c7_e574_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l894_c11_f6a7
BIN_OP_EQ_uxn_opcodes_h_l894_c11_f6a7 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l894_c11_f6a7_left,
BIN_OP_EQ_uxn_opcodes_h_l894_c11_f6a7_right,
BIN_OP_EQ_uxn_opcodes_h_l894_c11_f6a7_return_output);

-- n16_MUX_uxn_opcodes_h_l894_c7_5816
n16_MUX_uxn_opcodes_h_l894_c7_5816 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l894_c7_5816_cond,
n16_MUX_uxn_opcodes_h_l894_c7_5816_iftrue,
n16_MUX_uxn_opcodes_h_l894_c7_5816_iffalse,
n16_MUX_uxn_opcodes_h_l894_c7_5816_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l894_c7_5816
result_stack_value_MUX_uxn_opcodes_h_l894_c7_5816 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l894_c7_5816_cond,
result_stack_value_MUX_uxn_opcodes_h_l894_c7_5816_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l894_c7_5816_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l894_c7_5816_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l894_c7_5816
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l894_c7_5816 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l894_c7_5816_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l894_c7_5816_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l894_c7_5816_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l894_c7_5816_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l894_c7_5816
result_is_sp_shift_MUX_uxn_opcodes_h_l894_c7_5816 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l894_c7_5816_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l894_c7_5816_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l894_c7_5816_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l894_c7_5816_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l894_c7_5816
result_is_stack_read_MUX_uxn_opcodes_h_l894_c7_5816 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l894_c7_5816_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l894_c7_5816_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l894_c7_5816_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l894_c7_5816_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l894_c7_5816
result_sp_relative_shift_MUX_uxn_opcodes_h_l894_c7_5816 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l894_c7_5816_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l894_c7_5816_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l894_c7_5816_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l894_c7_5816_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l894_c7_5816
result_is_stack_write_MUX_uxn_opcodes_h_l894_c7_5816 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l894_c7_5816_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l894_c7_5816_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l894_c7_5816_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l894_c7_5816_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l894_c7_5816
result_is_opc_done_MUX_uxn_opcodes_h_l894_c7_5816 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l894_c7_5816_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l894_c7_5816_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l894_c7_5816_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l894_c7_5816_return_output);

-- tmp16_MUX_uxn_opcodes_h_l894_c7_5816
tmp16_MUX_uxn_opcodes_h_l894_c7_5816 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l894_c7_5816_cond,
tmp16_MUX_uxn_opcodes_h_l894_c7_5816_iftrue,
tmp16_MUX_uxn_opcodes_h_l894_c7_5816_iffalse,
tmp16_MUX_uxn_opcodes_h_l894_c7_5816_return_output);

-- t16_MUX_uxn_opcodes_h_l894_c7_5816
t16_MUX_uxn_opcodes_h_l894_c7_5816 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l894_c7_5816_cond,
t16_MUX_uxn_opcodes_h_l894_c7_5816_iftrue,
t16_MUX_uxn_opcodes_h_l894_c7_5816_iffalse,
t16_MUX_uxn_opcodes_h_l894_c7_5816_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l895_c3_ce44
BIN_OP_OR_uxn_opcodes_h_l895_c3_ce44 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l895_c3_ce44_left,
BIN_OP_OR_uxn_opcodes_h_l895_c3_ce44_right,
BIN_OP_OR_uxn_opcodes_h_l895_c3_ce44_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l898_c11_1860
BIN_OP_EQ_uxn_opcodes_h_l898_c11_1860 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l898_c11_1860_left,
BIN_OP_EQ_uxn_opcodes_h_l898_c11_1860_right,
BIN_OP_EQ_uxn_opcodes_h_l898_c11_1860_return_output);

-- n16_MUX_uxn_opcodes_h_l898_c7_4e92
n16_MUX_uxn_opcodes_h_l898_c7_4e92 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l898_c7_4e92_cond,
n16_MUX_uxn_opcodes_h_l898_c7_4e92_iftrue,
n16_MUX_uxn_opcodes_h_l898_c7_4e92_iffalse,
n16_MUX_uxn_opcodes_h_l898_c7_4e92_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l898_c7_4e92
result_stack_value_MUX_uxn_opcodes_h_l898_c7_4e92 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l898_c7_4e92_cond,
result_stack_value_MUX_uxn_opcodes_h_l898_c7_4e92_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l898_c7_4e92_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l898_c7_4e92_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l898_c7_4e92
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l898_c7_4e92 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l898_c7_4e92_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l898_c7_4e92_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l898_c7_4e92_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l898_c7_4e92_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l898_c7_4e92
result_is_sp_shift_MUX_uxn_opcodes_h_l898_c7_4e92 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l898_c7_4e92_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l898_c7_4e92_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l898_c7_4e92_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l898_c7_4e92_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l898_c7_4e92
result_is_stack_read_MUX_uxn_opcodes_h_l898_c7_4e92 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l898_c7_4e92_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l898_c7_4e92_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l898_c7_4e92_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l898_c7_4e92_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l898_c7_4e92
result_sp_relative_shift_MUX_uxn_opcodes_h_l898_c7_4e92 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l898_c7_4e92_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l898_c7_4e92_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l898_c7_4e92_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l898_c7_4e92_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l898_c7_4e92
result_is_stack_write_MUX_uxn_opcodes_h_l898_c7_4e92 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l898_c7_4e92_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l898_c7_4e92_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l898_c7_4e92_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l898_c7_4e92_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l898_c7_4e92
result_is_opc_done_MUX_uxn_opcodes_h_l898_c7_4e92 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l898_c7_4e92_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l898_c7_4e92_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l898_c7_4e92_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l898_c7_4e92_return_output);

-- tmp16_MUX_uxn_opcodes_h_l898_c7_4e92
tmp16_MUX_uxn_opcodes_h_l898_c7_4e92 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l898_c7_4e92_cond,
tmp16_MUX_uxn_opcodes_h_l898_c7_4e92_iftrue,
tmp16_MUX_uxn_opcodes_h_l898_c7_4e92_iffalse,
tmp16_MUX_uxn_opcodes_h_l898_c7_4e92_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l901_c11_bb0d
BIN_OP_EQ_uxn_opcodes_h_l901_c11_bb0d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l901_c11_bb0d_left,
BIN_OP_EQ_uxn_opcodes_h_l901_c11_bb0d_right,
BIN_OP_EQ_uxn_opcodes_h_l901_c11_bb0d_return_output);

-- n16_MUX_uxn_opcodes_h_l901_c7_9ea4
n16_MUX_uxn_opcodes_h_l901_c7_9ea4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l901_c7_9ea4_cond,
n16_MUX_uxn_opcodes_h_l901_c7_9ea4_iftrue,
n16_MUX_uxn_opcodes_h_l901_c7_9ea4_iffalse,
n16_MUX_uxn_opcodes_h_l901_c7_9ea4_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l901_c7_9ea4
result_stack_value_MUX_uxn_opcodes_h_l901_c7_9ea4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l901_c7_9ea4_cond,
result_stack_value_MUX_uxn_opcodes_h_l901_c7_9ea4_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l901_c7_9ea4_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l901_c7_9ea4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c7_9ea4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c7_9ea4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c7_9ea4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c7_9ea4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c7_9ea4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c7_9ea4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l901_c7_9ea4
result_is_sp_shift_MUX_uxn_opcodes_h_l901_c7_9ea4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l901_c7_9ea4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l901_c7_9ea4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l901_c7_9ea4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l901_c7_9ea4_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l901_c7_9ea4
result_is_stack_read_MUX_uxn_opcodes_h_l901_c7_9ea4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l901_c7_9ea4_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l901_c7_9ea4_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l901_c7_9ea4_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l901_c7_9ea4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c7_9ea4
result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c7_9ea4 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c7_9ea4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c7_9ea4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c7_9ea4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c7_9ea4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l901_c7_9ea4
result_is_stack_write_MUX_uxn_opcodes_h_l901_c7_9ea4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l901_c7_9ea4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l901_c7_9ea4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l901_c7_9ea4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l901_c7_9ea4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l901_c7_9ea4
result_is_opc_done_MUX_uxn_opcodes_h_l901_c7_9ea4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l901_c7_9ea4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l901_c7_9ea4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l901_c7_9ea4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l901_c7_9ea4_return_output);

-- tmp16_MUX_uxn_opcodes_h_l901_c7_9ea4
tmp16_MUX_uxn_opcodes_h_l901_c7_9ea4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l901_c7_9ea4_cond,
tmp16_MUX_uxn_opcodes_h_l901_c7_9ea4_iftrue,
tmp16_MUX_uxn_opcodes_h_l901_c7_9ea4_iffalse,
tmp16_MUX_uxn_opcodes_h_l901_c7_9ea4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l906_c11_8b5a
BIN_OP_EQ_uxn_opcodes_h_l906_c11_8b5a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l906_c11_8b5a_left,
BIN_OP_EQ_uxn_opcodes_h_l906_c11_8b5a_right,
BIN_OP_EQ_uxn_opcodes_h_l906_c11_8b5a_return_output);

-- n16_MUX_uxn_opcodes_h_l906_c7_f3e4
n16_MUX_uxn_opcodes_h_l906_c7_f3e4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l906_c7_f3e4_cond,
n16_MUX_uxn_opcodes_h_l906_c7_f3e4_iftrue,
n16_MUX_uxn_opcodes_h_l906_c7_f3e4_iffalse,
n16_MUX_uxn_opcodes_h_l906_c7_f3e4_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l906_c7_f3e4
result_stack_value_MUX_uxn_opcodes_h_l906_c7_f3e4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l906_c7_f3e4_cond,
result_stack_value_MUX_uxn_opcodes_h_l906_c7_f3e4_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l906_c7_f3e4_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l906_c7_f3e4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_f3e4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_f3e4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_f3e4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_f3e4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_f3e4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_f3e4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_f3e4
result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_f3e4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_f3e4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_f3e4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_f3e4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_f3e4_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l906_c7_f3e4
result_is_stack_read_MUX_uxn_opcodes_h_l906_c7_f3e4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l906_c7_f3e4_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l906_c7_f3e4_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l906_c7_f3e4_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l906_c7_f3e4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_f3e4
result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_f3e4 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_f3e4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_f3e4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_f3e4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_f3e4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_f3e4
result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_f3e4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_f3e4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_f3e4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_f3e4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_f3e4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_f3e4
result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_f3e4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_f3e4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_f3e4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_f3e4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_f3e4_return_output);

-- tmp16_MUX_uxn_opcodes_h_l906_c7_f3e4
tmp16_MUX_uxn_opcodes_h_l906_c7_f3e4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l906_c7_f3e4_cond,
tmp16_MUX_uxn_opcodes_h_l906_c7_f3e4_iftrue,
tmp16_MUX_uxn_opcodes_h_l906_c7_f3e4_iffalse,
tmp16_MUX_uxn_opcodes_h_l906_c7_f3e4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l909_c11_5d69
BIN_OP_EQ_uxn_opcodes_h_l909_c11_5d69 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l909_c11_5d69_left,
BIN_OP_EQ_uxn_opcodes_h_l909_c11_5d69_right,
BIN_OP_EQ_uxn_opcodes_h_l909_c11_5d69_return_output);

-- n16_MUX_uxn_opcodes_h_l909_c7_7461
n16_MUX_uxn_opcodes_h_l909_c7_7461 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l909_c7_7461_cond,
n16_MUX_uxn_opcodes_h_l909_c7_7461_iftrue,
n16_MUX_uxn_opcodes_h_l909_c7_7461_iffalse,
n16_MUX_uxn_opcodes_h_l909_c7_7461_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l909_c7_7461
result_stack_value_MUX_uxn_opcodes_h_l909_c7_7461 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l909_c7_7461_cond,
result_stack_value_MUX_uxn_opcodes_h_l909_c7_7461_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l909_c7_7461_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l909_c7_7461_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c7_7461
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c7_7461 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c7_7461_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c7_7461_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c7_7461_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c7_7461_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l909_c7_7461
result_is_sp_shift_MUX_uxn_opcodes_h_l909_c7_7461 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l909_c7_7461_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l909_c7_7461_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l909_c7_7461_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l909_c7_7461_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l909_c7_7461
result_is_stack_read_MUX_uxn_opcodes_h_l909_c7_7461 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l909_c7_7461_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l909_c7_7461_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l909_c7_7461_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l909_c7_7461_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c7_7461
result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c7_7461 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c7_7461_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c7_7461_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c7_7461_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c7_7461_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l909_c7_7461
result_is_stack_write_MUX_uxn_opcodes_h_l909_c7_7461 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l909_c7_7461_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l909_c7_7461_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l909_c7_7461_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l909_c7_7461_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l909_c7_7461
result_is_opc_done_MUX_uxn_opcodes_h_l909_c7_7461 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l909_c7_7461_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l909_c7_7461_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l909_c7_7461_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l909_c7_7461_return_output);

-- tmp16_MUX_uxn_opcodes_h_l909_c7_7461
tmp16_MUX_uxn_opcodes_h_l909_c7_7461 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l909_c7_7461_cond,
tmp16_MUX_uxn_opcodes_h_l909_c7_7461_iftrue,
tmp16_MUX_uxn_opcodes_h_l909_c7_7461_iffalse,
tmp16_MUX_uxn_opcodes_h_l909_c7_7461_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l910_c3_fdc1
BIN_OP_OR_uxn_opcodes_h_l910_c3_fdc1 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l910_c3_fdc1_left,
BIN_OP_OR_uxn_opcodes_h_l910_c3_fdc1_right,
BIN_OP_OR_uxn_opcodes_h_l910_c3_fdc1_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l911_c11_8f85
BIN_OP_AND_uxn_opcodes_h_l911_c11_8f85 : entity work.BIN_OP_AND_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l911_c11_8f85_left,
BIN_OP_AND_uxn_opcodes_h_l911_c11_8f85_right,
BIN_OP_AND_uxn_opcodes_h_l911_c11_8f85_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l914_c32_c3b6
BIN_OP_AND_uxn_opcodes_h_l914_c32_c3b6 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l914_c32_c3b6_left,
BIN_OP_AND_uxn_opcodes_h_l914_c32_c3b6_right,
BIN_OP_AND_uxn_opcodes_h_l914_c32_c3b6_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l914_c32_3137
BIN_OP_GT_uxn_opcodes_h_l914_c32_3137 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l914_c32_3137_left,
BIN_OP_GT_uxn_opcodes_h_l914_c32_3137_right,
BIN_OP_GT_uxn_opcodes_h_l914_c32_3137_return_output);

-- MUX_uxn_opcodes_h_l914_c32_ea32
MUX_uxn_opcodes_h_l914_c32_ea32 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l914_c32_ea32_cond,
MUX_uxn_opcodes_h_l914_c32_ea32_iftrue,
MUX_uxn_opcodes_h_l914_c32_ea32_iffalse,
MUX_uxn_opcodes_h_l914_c32_ea32_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l916_c11_ff1a
BIN_OP_EQ_uxn_opcodes_h_l916_c11_ff1a : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l916_c11_ff1a_left,
BIN_OP_EQ_uxn_opcodes_h_l916_c11_ff1a_right,
BIN_OP_EQ_uxn_opcodes_h_l916_c11_ff1a_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l916_c7_1506
result_stack_value_MUX_uxn_opcodes_h_l916_c7_1506 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l916_c7_1506_cond,
result_stack_value_MUX_uxn_opcodes_h_l916_c7_1506_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l916_c7_1506_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l916_c7_1506_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l916_c7_1506
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l916_c7_1506 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l916_c7_1506_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l916_c7_1506_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l916_c7_1506_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l916_c7_1506_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l916_c7_1506
result_is_sp_shift_MUX_uxn_opcodes_h_l916_c7_1506 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l916_c7_1506_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l916_c7_1506_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l916_c7_1506_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l916_c7_1506_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l916_c7_1506
result_is_stack_write_MUX_uxn_opcodes_h_l916_c7_1506 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l916_c7_1506_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l916_c7_1506_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l916_c7_1506_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l916_c7_1506_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l916_c7_1506
result_is_opc_done_MUX_uxn_opcodes_h_l916_c7_1506 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l916_c7_1506_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l916_c7_1506_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l916_c7_1506_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l916_c7_1506_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l922_c11_f3fc
BIN_OP_EQ_uxn_opcodes_h_l922_c11_f3fc : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l922_c11_f3fc_left,
BIN_OP_EQ_uxn_opcodes_h_l922_c11_f3fc_right,
BIN_OP_EQ_uxn_opcodes_h_l922_c11_f3fc_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l922_c7_2368
result_stack_value_MUX_uxn_opcodes_h_l922_c7_2368 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l922_c7_2368_cond,
result_stack_value_MUX_uxn_opcodes_h_l922_c7_2368_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l922_c7_2368_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l922_c7_2368_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_2368
result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_2368 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_2368_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_2368_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_2368_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_2368_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_2368
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_2368 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_2368_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_2368_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_2368_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_2368_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_2368
result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_2368 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_2368_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_2368_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_2368_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_2368_return_output);

-- CONST_SR_8_uxn_opcodes_h_l924_c34_598e
CONST_SR_8_uxn_opcodes_h_l924_c34_598e : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l924_c34_598e_x,
CONST_SR_8_uxn_opcodes_h_l924_c34_598e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l926_c11_ca22
BIN_OP_EQ_uxn_opcodes_h_l926_c11_ca22 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l926_c11_ca22_left,
BIN_OP_EQ_uxn_opcodes_h_l926_c11_ca22_right,
BIN_OP_EQ_uxn_opcodes_h_l926_c11_ca22_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_a362
result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_a362 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_a362_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_a362_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_a362_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_a362_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_a362
result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_a362 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_a362_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_a362_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_a362_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_a362_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l903_l888_DUPLICATE_11e6
CONST_SL_8_uint16_t_uxn_opcodes_h_l903_l888_DUPLICATE_11e6 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l903_l888_DUPLICATE_11e6_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l903_l888_DUPLICATE_11e6_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l877_c6_a79d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l877_c1_6504_return_output,
 n16_MUX_uxn_opcodes_h_l877_c2_f9d9_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l877_c2_f9d9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l877_c2_f9d9_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l877_c2_f9d9_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l877_c2_f9d9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l877_c2_f9d9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l877_c2_f9d9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l877_c2_f9d9_return_output,
 tmp16_MUX_uxn_opcodes_h_l877_c2_f9d9_return_output,
 t16_MUX_uxn_opcodes_h_l877_c2_f9d9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l883_c11_1eef_return_output,
 n16_MUX_uxn_opcodes_h_l883_c7_6aff_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l883_c7_6aff_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_6aff_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l883_c7_6aff_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l883_c7_6aff_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_6aff_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_6aff_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_6aff_return_output,
 tmp16_MUX_uxn_opcodes_h_l883_c7_6aff_return_output,
 t16_MUX_uxn_opcodes_h_l883_c7_6aff_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l886_c11_b1c6_return_output,
 n16_MUX_uxn_opcodes_h_l886_c7_7686_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l886_c7_7686_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l886_c7_7686_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l886_c7_7686_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l886_c7_7686_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l886_c7_7686_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l886_c7_7686_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l886_c7_7686_return_output,
 tmp16_MUX_uxn_opcodes_h_l886_c7_7686_return_output,
 t16_MUX_uxn_opcodes_h_l886_c7_7686_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l891_c11_c596_return_output,
 n16_MUX_uxn_opcodes_h_l891_c7_e574_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l891_c7_e574_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_e574_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l891_c7_e574_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l891_c7_e574_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_e574_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_e574_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_e574_return_output,
 tmp16_MUX_uxn_opcodes_h_l891_c7_e574_return_output,
 t16_MUX_uxn_opcodes_h_l891_c7_e574_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l894_c11_f6a7_return_output,
 n16_MUX_uxn_opcodes_h_l894_c7_5816_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l894_c7_5816_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l894_c7_5816_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l894_c7_5816_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l894_c7_5816_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l894_c7_5816_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l894_c7_5816_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l894_c7_5816_return_output,
 tmp16_MUX_uxn_opcodes_h_l894_c7_5816_return_output,
 t16_MUX_uxn_opcodes_h_l894_c7_5816_return_output,
 BIN_OP_OR_uxn_opcodes_h_l895_c3_ce44_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l898_c11_1860_return_output,
 n16_MUX_uxn_opcodes_h_l898_c7_4e92_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l898_c7_4e92_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l898_c7_4e92_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l898_c7_4e92_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l898_c7_4e92_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l898_c7_4e92_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l898_c7_4e92_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l898_c7_4e92_return_output,
 tmp16_MUX_uxn_opcodes_h_l898_c7_4e92_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l901_c11_bb0d_return_output,
 n16_MUX_uxn_opcodes_h_l901_c7_9ea4_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l901_c7_9ea4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c7_9ea4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l901_c7_9ea4_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l901_c7_9ea4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c7_9ea4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l901_c7_9ea4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l901_c7_9ea4_return_output,
 tmp16_MUX_uxn_opcodes_h_l901_c7_9ea4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l906_c11_8b5a_return_output,
 n16_MUX_uxn_opcodes_h_l906_c7_f3e4_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l906_c7_f3e4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_f3e4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_f3e4_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l906_c7_f3e4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_f3e4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_f3e4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_f3e4_return_output,
 tmp16_MUX_uxn_opcodes_h_l906_c7_f3e4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l909_c11_5d69_return_output,
 n16_MUX_uxn_opcodes_h_l909_c7_7461_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l909_c7_7461_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c7_7461_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l909_c7_7461_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l909_c7_7461_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c7_7461_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l909_c7_7461_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l909_c7_7461_return_output,
 tmp16_MUX_uxn_opcodes_h_l909_c7_7461_return_output,
 BIN_OP_OR_uxn_opcodes_h_l910_c3_fdc1_return_output,
 BIN_OP_AND_uxn_opcodes_h_l911_c11_8f85_return_output,
 BIN_OP_AND_uxn_opcodes_h_l914_c32_c3b6_return_output,
 BIN_OP_GT_uxn_opcodes_h_l914_c32_3137_return_output,
 MUX_uxn_opcodes_h_l914_c32_ea32_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l916_c11_ff1a_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l916_c7_1506_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l916_c7_1506_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l916_c7_1506_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l916_c7_1506_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l916_c7_1506_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l922_c11_f3fc_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l922_c7_2368_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_2368_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_2368_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_2368_return_output,
 CONST_SR_8_uxn_opcodes_h_l924_c34_598e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l926_c11_ca22_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_a362_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_a362_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l903_l888_DUPLICATE_11e6_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l877_c6_a79d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l877_c6_a79d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l877_c6_a79d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l877_c1_6504_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l877_c1_6504_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l877_c1_6504_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l877_c1_6504_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l877_c2_f9d9_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l877_c2_f9d9_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l883_c7_6aff_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l877_c2_f9d9_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l877_c2_f9d9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l877_c2_f9d9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l877_c2_f9d9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l883_c7_6aff_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l877_c2_f9d9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l877_c2_f9d9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l877_c2_f9d9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l880_c3_c6eb : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l877_c2_f9d9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_6aff_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l877_c2_f9d9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l877_c2_f9d9_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l877_c2_f9d9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l877_c2_f9d9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l883_c7_6aff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l877_c2_f9d9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l877_c2_f9d9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l877_c2_f9d9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l877_c2_f9d9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l883_c7_6aff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l877_c2_f9d9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l877_c2_f9d9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l877_c2_f9d9_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l877_c2_f9d9_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_6aff_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l877_c2_f9d9_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l877_c2_f9d9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l877_c2_f9d9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l877_c2_f9d9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_6aff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l877_c2_f9d9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l877_c2_f9d9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l877_c2_f9d9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l877_c2_f9d9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_6aff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l877_c2_f9d9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l877_c2_f9d9_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l877_c2_f9d9_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l877_c2_f9d9_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l883_c7_6aff_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l877_c2_f9d9_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l877_c2_f9d9_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l877_c2_f9d9_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l877_c2_f9d9_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l883_c7_6aff_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l877_c2_f9d9_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l877_c2_f9d9_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l878_c3_37eb_uxn_opcodes_h_l878_c3_37eb_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l883_c11_1eef_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l883_c11_1eef_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l883_c11_1eef_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l883_c7_6aff_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l883_c7_6aff_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l886_c7_7686_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l883_c7_6aff_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l883_c7_6aff_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l883_c7_6aff_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l886_c7_7686_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l883_c7_6aff_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_6aff_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l884_c3_d293 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_6aff_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l886_c7_7686_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_6aff_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l883_c7_6aff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l883_c7_6aff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l886_c7_7686_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l883_c7_6aff_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l883_c7_6aff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l883_c7_6aff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l886_c7_7686_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l883_c7_6aff_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_6aff_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_6aff_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l886_c7_7686_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_6aff_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_6aff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_6aff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l886_c7_7686_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_6aff_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_6aff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_6aff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l886_c7_7686_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_6aff_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l883_c7_6aff_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l883_c7_6aff_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l886_c7_7686_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l883_c7_6aff_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l883_c7_6aff_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l883_c7_6aff_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l886_c7_7686_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l883_c7_6aff_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l886_c11_b1c6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l886_c11_b1c6_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l886_c11_b1c6_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l886_c7_7686_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l886_c7_7686_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l891_c7_e574_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l886_c7_7686_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l886_c7_7686_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l886_c7_7686_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l891_c7_e574_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l886_c7_7686_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l886_c7_7686_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l889_c3_8837 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l886_c7_7686_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_e574_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l886_c7_7686_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l886_c7_7686_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l886_c7_7686_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l891_c7_e574_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l886_c7_7686_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l886_c7_7686_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l886_c7_7686_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l891_c7_e574_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l886_c7_7686_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l886_c7_7686_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l886_c7_7686_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_e574_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l886_c7_7686_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l886_c7_7686_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l886_c7_7686_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_e574_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l886_c7_7686_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l886_c7_7686_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l886_c7_7686_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_e574_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l886_c7_7686_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l886_c7_7686_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l886_c7_7686_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l891_c7_e574_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l886_c7_7686_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l886_c7_7686_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l886_c7_7686_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l891_c7_e574_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l886_c7_7686_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l891_c11_c596_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l891_c11_c596_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l891_c11_c596_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l891_c7_e574_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l891_c7_e574_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l894_c7_5816_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l891_c7_e574_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l891_c7_e574_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l891_c7_e574_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l894_c7_5816_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l891_c7_e574_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_e574_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l892_c3_3b5b : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_e574_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l894_c7_5816_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_e574_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l891_c7_e574_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l891_c7_e574_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l894_c7_5816_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l891_c7_e574_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l891_c7_e574_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l891_c7_e574_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l894_c7_5816_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l891_c7_e574_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_e574_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_e574_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l894_c7_5816_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_e574_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_e574_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_e574_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l894_c7_5816_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_e574_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_e574_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_e574_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l894_c7_5816_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_e574_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l891_c7_e574_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l891_c7_e574_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l894_c7_5816_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l891_c7_e574_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l891_c7_e574_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l891_c7_e574_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l894_c7_5816_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l891_c7_e574_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l894_c11_f6a7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l894_c11_f6a7_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l894_c11_f6a7_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l894_c7_5816_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l894_c7_5816_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l898_c7_4e92_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l894_c7_5816_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l894_c7_5816_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l894_c7_5816_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l898_c7_4e92_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l894_c7_5816_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l894_c7_5816_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l896_c3_68cd : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l894_c7_5816_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l898_c7_4e92_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l894_c7_5816_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l894_c7_5816_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l894_c7_5816_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l898_c7_4e92_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l894_c7_5816_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l894_c7_5816_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l894_c7_5816_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l898_c7_4e92_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l894_c7_5816_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l894_c7_5816_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l894_c7_5816_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l898_c7_4e92_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l894_c7_5816_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l894_c7_5816_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l894_c7_5816_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l898_c7_4e92_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l894_c7_5816_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l894_c7_5816_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l894_c7_5816_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l898_c7_4e92_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l894_c7_5816_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l894_c7_5816_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l894_c7_5816_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l898_c7_4e92_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l894_c7_5816_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l894_c7_5816_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l894_c7_5816_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l894_c7_5816_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l895_c3_ce44_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l895_c3_ce44_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l895_c3_ce44_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l898_c11_1860_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l898_c11_1860_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l898_c11_1860_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l898_c7_4e92_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l898_c7_4e92_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l901_c7_9ea4_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l898_c7_4e92_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l898_c7_4e92_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l898_c7_4e92_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l901_c7_9ea4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l898_c7_4e92_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l898_c7_4e92_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l899_c3_107d : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l898_c7_4e92_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c7_9ea4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l898_c7_4e92_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l898_c7_4e92_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l898_c7_4e92_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l901_c7_9ea4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l898_c7_4e92_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l898_c7_4e92_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l898_c7_4e92_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l901_c7_9ea4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l898_c7_4e92_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l898_c7_4e92_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l898_c7_4e92_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c7_9ea4_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l898_c7_4e92_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l898_c7_4e92_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l898_c7_4e92_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l901_c7_9ea4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l898_c7_4e92_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l898_c7_4e92_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l898_c7_4e92_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l901_c7_9ea4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l898_c7_4e92_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l898_c7_4e92_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l898_c7_4e92_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l901_c7_9ea4_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l898_c7_4e92_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l901_c11_bb0d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l901_c11_bb0d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l901_c11_bb0d_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l901_c7_9ea4_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l901_c7_9ea4_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l906_c7_f3e4_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l901_c7_9ea4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l901_c7_9ea4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l901_c7_9ea4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l906_c7_f3e4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l901_c7_9ea4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c7_9ea4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l904_c3_0bb6 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c7_9ea4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_f3e4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c7_9ea4_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l901_c7_9ea4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l901_c7_9ea4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_f3e4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l901_c7_9ea4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l901_c7_9ea4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l901_c7_9ea4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l906_c7_f3e4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l901_c7_9ea4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c7_9ea4_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c7_9ea4_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_f3e4_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c7_9ea4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l901_c7_9ea4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l901_c7_9ea4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_f3e4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l901_c7_9ea4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l901_c7_9ea4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l901_c7_9ea4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_f3e4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l901_c7_9ea4_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l901_c7_9ea4_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l901_c7_9ea4_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l906_c7_f3e4_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l901_c7_9ea4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l906_c11_8b5a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l906_c11_8b5a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l906_c11_8b5a_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l906_c7_f3e4_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l906_c7_f3e4_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l909_c7_7461_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l906_c7_f3e4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l906_c7_f3e4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l906_c7_f3e4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l909_c7_7461_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l906_c7_f3e4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_f3e4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l907_c3_bd1f : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_f3e4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c7_7461_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_f3e4_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_f3e4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_f3e4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l909_c7_7461_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_f3e4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l906_c7_f3e4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l906_c7_f3e4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l909_c7_7461_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l906_c7_f3e4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_f3e4_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_f3e4_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c7_7461_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_f3e4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_f3e4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_f3e4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l909_c7_7461_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_f3e4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_f3e4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_f3e4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l909_c7_7461_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_f3e4_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l906_c7_f3e4_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l906_c7_f3e4_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l909_c7_7461_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l906_c7_f3e4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l909_c11_5d69_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l909_c11_5d69_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l909_c11_5d69_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l909_c7_7461_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l909_c7_7461_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l909_c7_7461_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l909_c7_7461_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l909_c7_7461_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l916_c7_1506_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l909_c7_7461_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c7_7461_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c7_7461_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l916_c7_1506_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c7_7461_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l909_c7_7461_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l909_c7_7461_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l916_c7_1506_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l909_c7_7461_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l909_c7_7461_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l909_c7_7461_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l909_c7_7461_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c7_7461_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c7_7461_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c7_7461_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l909_c7_7461_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l909_c7_7461_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l916_c7_1506_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l909_c7_7461_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l909_c7_7461_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l909_c7_7461_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l916_c7_1506_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l909_c7_7461_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l909_c7_7461_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l909_c7_7461_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l909_c7_7461_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l910_c3_fdc1_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l910_c3_fdc1_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l910_c3_fdc1_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l911_c11_8f85_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l911_c11_8f85_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l911_c11_8f85_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l914_c32_ea32_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l914_c32_ea32_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l914_c32_ea32_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l914_c32_c3b6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l914_c32_c3b6_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l914_c32_c3b6_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l914_c32_3137_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l914_c32_3137_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l914_c32_3137_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l914_c32_ea32_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l916_c11_ff1a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l916_c11_ff1a_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l916_c11_ff1a_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l916_c7_1506_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l916_c7_1506_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l922_c7_2368_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l916_c7_1506_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l916_c7_1506_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l919_c3_bfb4 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l916_c7_1506_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_2368_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l916_c7_1506_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l916_c7_1506_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l916_c7_1506_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l916_c7_1506_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l916_c7_1506_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l916_c7_1506_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_2368_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l916_c7_1506_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l916_c7_1506_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l916_c7_1506_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_2368_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l916_c7_1506_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l920_c24_290b_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_f3fc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_f3fc_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_f3fc_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l922_c7_2368_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l922_c7_2368_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l922_c7_2368_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_2368_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_2368_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_a362_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_2368_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_2368_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l923_c3_4ab5 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_2368_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_2368_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_2368_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_2368_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_a362_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_2368_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l924_c34_598e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l924_c34_598e_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l924_c24_cdac_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_ca22_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_ca22_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_ca22_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_a362_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_a362_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_a362_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_a362_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_a362_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_a362_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l894_l922_l891_l886_l909_l883_l906_l877_l901_l898_DUPLICATE_87c9_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l894_l891_l916_l886_l883_l906_l877_l901_l898_DUPLICATE_5570_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l894_l891_l886_l909_l883_l906_l877_l901_l898_DUPLICATE_fcf3_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l926_l894_l922_l891_l886_l909_l883_l906_l877_l901_l898_DUPLICATE_13fd_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l894_l891_l886_l909_l883_l906_l901_l898_DUPLICATE_770c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l926_l894_l922_l891_l916_l886_l909_l883_l906_l901_l898_DUPLICATE_f1ab_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l902_l895_l910_l887_DUPLICATE_dd08_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l903_l888_DUPLICATE_11e6_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l903_l888_DUPLICATE_11e6_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l909_l922_DUPLICATE_a6ef_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l931_l873_DUPLICATE_e7db_return_output : opcode_result_t;
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
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l877_c2_f9d9_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l909_c7_7461_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l883_c11_1eef_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l880_c3_c6eb := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l877_c2_f9d9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l880_c3_c6eb;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l916_c7_1506_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_a362_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l894_c11_f6a7_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l896_c3_68cd := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l894_c7_5816_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l896_c3_68cd;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l907_c3_bd1f := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_f3e4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l907_c3_bd1f;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l892_c3_3b5b := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_e574_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l892_c3_3b5b;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l909_c7_7461_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l914_c32_ea32_iffalse := resize(to_signed(-2, 3), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l919_c3_bfb4 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l916_c7_1506_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l919_c3_bfb4;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l889_c3_8837 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l886_c7_7686_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l889_c3_8837;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l904_c3_0bb6 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c7_9ea4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l904_c3_0bb6;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l906_c11_8b5a_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l898_c11_1860_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l877_c6_a79d_right := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_a362_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l891_c11_c596_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_ca22_right := to_unsigned(11, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l884_c3_d293 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_6aff_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l884_c3_d293;
     VAR_BIN_OP_GT_uxn_opcodes_h_l914_c32_3137_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l886_c11_b1c6_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l899_c3_107d := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l898_c7_4e92_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l899_c3_107d;
     VAR_MUX_uxn_opcodes_h_l914_c32_ea32_iftrue := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l909_c11_5d69_right := to_unsigned(8, 4);
     VAR_BIN_OP_AND_uxn_opcodes_h_l914_c32_c3b6_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_f3fc_right := to_unsigned(10, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l923_c3_4ab5 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_2368_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l923_c3_4ab5;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l877_c1_6504_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l901_c11_bb0d_right := to_unsigned(6, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l916_c7_1506_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l877_c2_f9d9_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l916_c11_ff1a_right := to_unsigned(9, 4);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l877_c1_6504_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l914_c32_c3b6_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l910_c3_fdc1_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l877_c2_f9d9_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l883_c7_6aff_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l886_c7_7686_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l891_c7_e574_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l894_c7_5816_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l898_c7_4e92_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l906_c7_f3e4_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l909_c7_7461_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l877_c6_a79d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l883_c11_1eef_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l886_c11_b1c6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l891_c11_c596_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l894_c11_f6a7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l898_c11_1860_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l901_c11_bb0d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l906_c11_8b5a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l909_c11_5d69_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l916_c11_ff1a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_f3fc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_ca22_left := VAR_phase;
     VAR_BIN_OP_AND_uxn_opcodes_h_l911_c11_8f85_left := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l895_c3_ce44_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l877_c2_f9d9_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l883_c7_6aff_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l891_c7_e574_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l894_c7_5816_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l924_c34_598e_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l877_c2_f9d9_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l883_c7_6aff_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l886_c7_7686_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l891_c7_e574_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l894_c7_5816_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l898_c7_4e92_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l901_c7_9ea4_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l906_c7_f3e4_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l909_c7_7461_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l886_c11_b1c6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l886_c11_b1c6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l886_c11_b1c6_left;
     BIN_OP_EQ_uxn_opcodes_h_l886_c11_b1c6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l886_c11_b1c6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l886_c11_b1c6_return_output := BIN_OP_EQ_uxn_opcodes_h_l886_c11_b1c6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l894_c11_f6a7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l894_c11_f6a7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l894_c11_f6a7_left;
     BIN_OP_EQ_uxn_opcodes_h_l894_c11_f6a7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l894_c11_f6a7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l894_c11_f6a7_return_output := BIN_OP_EQ_uxn_opcodes_h_l894_c11_f6a7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l898_c11_1860] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l898_c11_1860_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l898_c11_1860_left;
     BIN_OP_EQ_uxn_opcodes_h_l898_c11_1860_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l898_c11_1860_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l898_c11_1860_return_output := BIN_OP_EQ_uxn_opcodes_h_l898_c11_1860_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l926_c11_ca22] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l926_c11_ca22_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_ca22_left;
     BIN_OP_EQ_uxn_opcodes_h_l926_c11_ca22_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_ca22_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_ca22_return_output := BIN_OP_EQ_uxn_opcodes_h_l926_c11_ca22_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l909_l922_DUPLICATE_a6ef LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l909_l922_DUPLICATE_a6ef_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l894_l891_l886_l909_l883_l906_l877_l901_l898_DUPLICATE_fcf3 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l894_l891_l886_l909_l883_l906_l877_l901_l898_DUPLICATE_fcf3_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l926_l894_l922_l891_l886_l909_l883_l906_l877_l901_l898_DUPLICATE_13fd LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l926_l894_l922_l891_l886_l909_l883_l906_l877_l901_l898_DUPLICATE_13fd_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l883_c11_1eef] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l883_c11_1eef_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l883_c11_1eef_left;
     BIN_OP_EQ_uxn_opcodes_h_l883_c11_1eef_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l883_c11_1eef_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l883_c11_1eef_return_output := BIN_OP_EQ_uxn_opcodes_h_l883_c11_1eef_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l891_c11_c596] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l891_c11_c596_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l891_c11_c596_left;
     BIN_OP_EQ_uxn_opcodes_h_l891_c11_c596_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l891_c11_c596_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l891_c11_c596_return_output := BIN_OP_EQ_uxn_opcodes_h_l891_c11_c596_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l920_c24_290b] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l920_c24_290b_return_output := CAST_TO_uint8_t_uint16_t(
     tmp16);

     -- CONST_SR_8[uxn_opcodes_h_l924_c34_598e] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l924_c34_598e_x <= VAR_CONST_SR_8_uxn_opcodes_h_l924_c34_598e_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l924_c34_598e_return_output := CONST_SR_8_uxn_opcodes_h_l924_c34_598e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l877_c6_a79d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l877_c6_a79d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l877_c6_a79d_left;
     BIN_OP_EQ_uxn_opcodes_h_l877_c6_a79d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l877_c6_a79d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l877_c6_a79d_return_output := BIN_OP_EQ_uxn_opcodes_h_l877_c6_a79d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l922_c11_f3fc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l922_c11_f3fc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_f3fc_left;
     BIN_OP_EQ_uxn_opcodes_h_l922_c11_f3fc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_f3fc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_f3fc_return_output := BIN_OP_EQ_uxn_opcodes_h_l922_c11_f3fc_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l902_l895_l910_l887_DUPLICATE_dd08 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l902_l895_l910_l887_DUPLICATE_dd08_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l894_l891_l916_l886_l883_l906_l877_l901_l898_DUPLICATE_5570 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l894_l891_l916_l886_l883_l906_l877_l901_l898_DUPLICATE_5570_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l894_l891_l886_l909_l883_l906_l901_l898_DUPLICATE_770c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l894_l891_l886_l909_l883_l906_l901_l898_DUPLICATE_770c_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l909_c11_5d69] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l909_c11_5d69_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l909_c11_5d69_left;
     BIN_OP_EQ_uxn_opcodes_h_l909_c11_5d69_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l909_c11_5d69_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l909_c11_5d69_return_output := BIN_OP_EQ_uxn_opcodes_h_l909_c11_5d69_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l894_l922_l891_l886_l909_l883_l906_l877_l901_l898_DUPLICATE_87c9 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l894_l922_l891_l886_l909_l883_l906_l877_l901_l898_DUPLICATE_87c9_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l901_c11_bb0d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l901_c11_bb0d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l901_c11_bb0d_left;
     BIN_OP_EQ_uxn_opcodes_h_l901_c11_bb0d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l901_c11_bb0d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l901_c11_bb0d_return_output := BIN_OP_EQ_uxn_opcodes_h_l901_c11_bb0d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l916_c11_ff1a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l916_c11_ff1a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l916_c11_ff1a_left;
     BIN_OP_EQ_uxn_opcodes_h_l916_c11_ff1a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l916_c11_ff1a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l916_c11_ff1a_return_output := BIN_OP_EQ_uxn_opcodes_h_l916_c11_ff1a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l906_c11_8b5a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l906_c11_8b5a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l906_c11_8b5a_left;
     BIN_OP_EQ_uxn_opcodes_h_l906_c11_8b5a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l906_c11_8b5a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l906_c11_8b5a_return_output := BIN_OP_EQ_uxn_opcodes_h_l906_c11_8b5a_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l926_l894_l922_l891_l916_l886_l909_l883_l906_l901_l898_DUPLICATE_f1ab LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l926_l894_l922_l891_l916_l886_l909_l883_l906_l901_l898_DUPLICATE_f1ab_return_output := result.is_opc_done;

     -- BIN_OP_AND[uxn_opcodes_h_l914_c32_c3b6] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l914_c32_c3b6_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l914_c32_c3b6_left;
     BIN_OP_AND_uxn_opcodes_h_l914_c32_c3b6_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l914_c32_c3b6_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l914_c32_c3b6_return_output := BIN_OP_AND_uxn_opcodes_h_l914_c32_c3b6_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l914_c32_3137_left := VAR_BIN_OP_AND_uxn_opcodes_h_l914_c32_c3b6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l877_c1_6504_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l877_c6_a79d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l877_c2_f9d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l877_c6_a79d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l877_c2_f9d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l877_c6_a79d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l877_c2_f9d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l877_c6_a79d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l877_c2_f9d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l877_c6_a79d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l877_c2_f9d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l877_c6_a79d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l877_c2_f9d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l877_c6_a79d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l877_c2_f9d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l877_c6_a79d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l877_c2_f9d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l877_c6_a79d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l877_c2_f9d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l877_c6_a79d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l877_c2_f9d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l877_c6_a79d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l883_c7_6aff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l883_c11_1eef_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_6aff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l883_c11_1eef_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l883_c7_6aff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l883_c11_1eef_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l883_c7_6aff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l883_c11_1eef_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_6aff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l883_c11_1eef_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_6aff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l883_c11_1eef_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_6aff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l883_c11_1eef_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l883_c7_6aff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l883_c11_1eef_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l883_c7_6aff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l883_c11_1eef_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l883_c7_6aff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l883_c11_1eef_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l886_c7_7686_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l886_c11_b1c6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l886_c7_7686_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l886_c11_b1c6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l886_c7_7686_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l886_c11_b1c6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l886_c7_7686_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l886_c11_b1c6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l886_c7_7686_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l886_c11_b1c6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l886_c7_7686_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l886_c11_b1c6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l886_c7_7686_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l886_c11_b1c6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l886_c7_7686_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l886_c11_b1c6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l886_c7_7686_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l886_c11_b1c6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l886_c7_7686_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l886_c11_b1c6_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l891_c7_e574_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l891_c11_c596_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_e574_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l891_c11_c596_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l891_c7_e574_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l891_c11_c596_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l891_c7_e574_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l891_c11_c596_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_e574_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l891_c11_c596_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_e574_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l891_c11_c596_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_e574_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l891_c11_c596_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l891_c7_e574_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l891_c11_c596_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l891_c7_e574_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l891_c11_c596_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l891_c7_e574_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l891_c11_c596_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l894_c7_5816_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l894_c11_f6a7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l894_c7_5816_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l894_c11_f6a7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l894_c7_5816_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l894_c11_f6a7_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l894_c7_5816_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l894_c11_f6a7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l894_c7_5816_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l894_c11_f6a7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l894_c7_5816_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l894_c11_f6a7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l894_c7_5816_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l894_c11_f6a7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l894_c7_5816_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l894_c11_f6a7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l894_c7_5816_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l894_c11_f6a7_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l894_c7_5816_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l894_c11_f6a7_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l898_c7_4e92_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l898_c11_1860_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l898_c7_4e92_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l898_c11_1860_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l898_c7_4e92_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l898_c11_1860_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l898_c7_4e92_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l898_c11_1860_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l898_c7_4e92_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l898_c11_1860_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l898_c7_4e92_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l898_c11_1860_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l898_c7_4e92_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l898_c11_1860_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l898_c7_4e92_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l898_c11_1860_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l898_c7_4e92_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l898_c11_1860_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l901_c7_9ea4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l901_c11_bb0d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l901_c7_9ea4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l901_c11_bb0d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l901_c7_9ea4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l901_c11_bb0d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l901_c7_9ea4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l901_c11_bb0d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l901_c7_9ea4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l901_c11_bb0d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c7_9ea4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l901_c11_bb0d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c7_9ea4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l901_c11_bb0d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l901_c7_9ea4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l901_c11_bb0d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l901_c7_9ea4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l901_c11_bb0d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l906_c7_f3e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l906_c11_8b5a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_f3e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l906_c11_8b5a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_f3e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l906_c11_8b5a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l906_c7_f3e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l906_c11_8b5a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_f3e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l906_c11_8b5a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_f3e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l906_c11_8b5a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_f3e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l906_c11_8b5a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l906_c7_f3e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l906_c11_8b5a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l906_c7_f3e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l906_c11_8b5a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l909_c7_7461_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l909_c11_5d69_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l909_c7_7461_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l909_c11_5d69_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l909_c7_7461_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l909_c11_5d69_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l909_c7_7461_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l909_c11_5d69_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l909_c7_7461_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l909_c11_5d69_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c7_7461_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l909_c11_5d69_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c7_7461_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l909_c11_5d69_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l909_c7_7461_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l909_c11_5d69_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l909_c7_7461_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l909_c11_5d69_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l916_c7_1506_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l916_c11_ff1a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l916_c7_1506_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l916_c11_ff1a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l916_c7_1506_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l916_c11_ff1a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l916_c7_1506_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l916_c11_ff1a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l916_c7_1506_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l916_c11_ff1a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_2368_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_f3fc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_2368_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_f3fc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_2368_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_f3fc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l922_c7_2368_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_f3fc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_a362_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_ca22_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_a362_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_ca22_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l895_c3_ce44_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l902_l895_l910_l887_DUPLICATE_dd08_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l910_c3_fdc1_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l902_l895_l910_l887_DUPLICATE_dd08_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l903_l888_DUPLICATE_11e6_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l902_l895_l910_l887_DUPLICATE_dd08_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l916_c7_1506_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l920_c24_290b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l877_c2_f9d9_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l894_l891_l886_l909_l883_l906_l877_l901_l898_DUPLICATE_fcf3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_6aff_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l894_l891_l886_l909_l883_l906_l877_l901_l898_DUPLICATE_fcf3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l886_c7_7686_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l894_l891_l886_l909_l883_l906_l877_l901_l898_DUPLICATE_fcf3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_e574_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l894_l891_l886_l909_l883_l906_l877_l901_l898_DUPLICATE_fcf3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l894_c7_5816_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l894_l891_l886_l909_l883_l906_l877_l901_l898_DUPLICATE_fcf3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l898_c7_4e92_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l894_l891_l886_l909_l883_l906_l877_l901_l898_DUPLICATE_fcf3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c7_9ea4_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l894_l891_l886_l909_l883_l906_l877_l901_l898_DUPLICATE_fcf3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_f3e4_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l894_l891_l886_l909_l883_l906_l877_l901_l898_DUPLICATE_fcf3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c7_7461_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l894_l891_l886_l909_l883_l906_l877_l901_l898_DUPLICATE_fcf3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_6aff_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l926_l894_l922_l891_l916_l886_l909_l883_l906_l901_l898_DUPLICATE_f1ab_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l886_c7_7686_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l926_l894_l922_l891_l916_l886_l909_l883_l906_l901_l898_DUPLICATE_f1ab_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_e574_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l926_l894_l922_l891_l916_l886_l909_l883_l906_l901_l898_DUPLICATE_f1ab_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l894_c7_5816_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l926_l894_l922_l891_l916_l886_l909_l883_l906_l901_l898_DUPLICATE_f1ab_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l898_c7_4e92_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l926_l894_l922_l891_l916_l886_l909_l883_l906_l901_l898_DUPLICATE_f1ab_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l901_c7_9ea4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l926_l894_l922_l891_l916_l886_l909_l883_l906_l901_l898_DUPLICATE_f1ab_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_f3e4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l926_l894_l922_l891_l916_l886_l909_l883_l906_l901_l898_DUPLICATE_f1ab_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l909_c7_7461_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l926_l894_l922_l891_l916_l886_l909_l883_l906_l901_l898_DUPLICATE_f1ab_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l916_c7_1506_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l926_l894_l922_l891_l916_l886_l909_l883_l906_l901_l898_DUPLICATE_f1ab_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_2368_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l926_l894_l922_l891_l916_l886_l909_l883_l906_l901_l898_DUPLICATE_f1ab_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_a362_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l926_l894_l922_l891_l916_l886_l909_l883_l906_l901_l898_DUPLICATE_f1ab_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l877_c2_f9d9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l894_l891_l916_l886_l883_l906_l877_l901_l898_DUPLICATE_5570_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l883_c7_6aff_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l894_l891_l916_l886_l883_l906_l877_l901_l898_DUPLICATE_5570_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l886_c7_7686_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l894_l891_l916_l886_l883_l906_l877_l901_l898_DUPLICATE_5570_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l891_c7_e574_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l894_l891_l916_l886_l883_l906_l877_l901_l898_DUPLICATE_5570_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l894_c7_5816_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l894_l891_l916_l886_l883_l906_l877_l901_l898_DUPLICATE_5570_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l898_c7_4e92_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l894_l891_l916_l886_l883_l906_l877_l901_l898_DUPLICATE_5570_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l901_c7_9ea4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l894_l891_l916_l886_l883_l906_l877_l901_l898_DUPLICATE_5570_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_f3e4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l894_l891_l916_l886_l883_l906_l877_l901_l898_DUPLICATE_5570_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l916_c7_1506_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l894_l891_l916_l886_l883_l906_l877_l901_l898_DUPLICATE_5570_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l883_c7_6aff_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l894_l891_l886_l909_l883_l906_l901_l898_DUPLICATE_770c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l886_c7_7686_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l894_l891_l886_l909_l883_l906_l901_l898_DUPLICATE_770c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l891_c7_e574_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l894_l891_l886_l909_l883_l906_l901_l898_DUPLICATE_770c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l894_c7_5816_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l894_l891_l886_l909_l883_l906_l901_l898_DUPLICATE_770c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l898_c7_4e92_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l894_l891_l886_l909_l883_l906_l901_l898_DUPLICATE_770c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l901_c7_9ea4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l894_l891_l886_l909_l883_l906_l901_l898_DUPLICATE_770c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l906_c7_f3e4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l894_l891_l886_l909_l883_l906_l901_l898_DUPLICATE_770c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l909_c7_7461_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l894_l891_l886_l909_l883_l906_l901_l898_DUPLICATE_770c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l877_c2_f9d9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l926_l894_l922_l891_l886_l909_l883_l906_l877_l901_l898_DUPLICATE_13fd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_6aff_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l926_l894_l922_l891_l886_l909_l883_l906_l877_l901_l898_DUPLICATE_13fd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l886_c7_7686_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l926_l894_l922_l891_l886_l909_l883_l906_l877_l901_l898_DUPLICATE_13fd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_e574_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l926_l894_l922_l891_l886_l909_l883_l906_l877_l901_l898_DUPLICATE_13fd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l894_c7_5816_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l926_l894_l922_l891_l886_l909_l883_l906_l877_l901_l898_DUPLICATE_13fd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l898_c7_4e92_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l926_l894_l922_l891_l886_l909_l883_l906_l877_l901_l898_DUPLICATE_13fd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l901_c7_9ea4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l926_l894_l922_l891_l886_l909_l883_l906_l877_l901_l898_DUPLICATE_13fd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_f3e4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l926_l894_l922_l891_l886_l909_l883_l906_l877_l901_l898_DUPLICATE_13fd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l909_c7_7461_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l926_l894_l922_l891_l886_l909_l883_l906_l877_l901_l898_DUPLICATE_13fd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_2368_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l926_l894_l922_l891_l886_l909_l883_l906_l877_l901_l898_DUPLICATE_13fd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_a362_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l926_l894_l922_l891_l886_l909_l883_l906_l877_l901_l898_DUPLICATE_13fd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c7_7461_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l909_l922_DUPLICATE_a6ef_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_2368_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l909_l922_DUPLICATE_a6ef_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l877_c2_f9d9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l894_l922_l891_l886_l909_l883_l906_l877_l901_l898_DUPLICATE_87c9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l883_c7_6aff_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l894_l922_l891_l886_l909_l883_l906_l877_l901_l898_DUPLICATE_87c9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l886_c7_7686_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l894_l922_l891_l886_l909_l883_l906_l877_l901_l898_DUPLICATE_87c9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l891_c7_e574_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l894_l922_l891_l886_l909_l883_l906_l877_l901_l898_DUPLICATE_87c9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l894_c7_5816_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l894_l922_l891_l886_l909_l883_l906_l877_l901_l898_DUPLICATE_87c9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l898_c7_4e92_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l894_l922_l891_l886_l909_l883_l906_l877_l901_l898_DUPLICATE_87c9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l901_c7_9ea4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l894_l922_l891_l886_l909_l883_l906_l877_l901_l898_DUPLICATE_87c9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l906_c7_f3e4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l894_l922_l891_l886_l909_l883_l906_l877_l901_l898_DUPLICATE_87c9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l909_c7_7461_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l894_l922_l891_l886_l909_l883_l906_l877_l901_l898_DUPLICATE_87c9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l922_c7_2368_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l894_l922_l891_l886_l909_l883_l906_l877_l901_l898_DUPLICATE_87c9_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l926_c7_a362] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_a362_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_a362_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_a362_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_a362_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_a362_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_a362_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_a362_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_a362_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l877_c1_6504] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l877_c1_6504_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l877_c1_6504_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l877_c1_6504_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l877_c1_6504_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l877_c1_6504_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l877_c1_6504_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l877_c1_6504_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l877_c1_6504_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l903_l888_DUPLICATE_11e6 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l903_l888_DUPLICATE_11e6_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l903_l888_DUPLICATE_11e6_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l903_l888_DUPLICATE_11e6_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l903_l888_DUPLICATE_11e6_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l909_c7_7461] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l909_c7_7461_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l909_c7_7461_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l909_c7_7461_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l909_c7_7461_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l909_c7_7461_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l909_c7_7461_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l909_c7_7461_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l909_c7_7461_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l895_c3_ce44] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l895_c3_ce44_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l895_c3_ce44_left;
     BIN_OP_OR_uxn_opcodes_h_l895_c3_ce44_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l895_c3_ce44_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l895_c3_ce44_return_output := BIN_OP_OR_uxn_opcodes_h_l895_c3_ce44_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l910_c3_fdc1] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l910_c3_fdc1_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l910_c3_fdc1_left;
     BIN_OP_OR_uxn_opcodes_h_l910_c3_fdc1_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l910_c3_fdc1_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l910_c3_fdc1_return_output := BIN_OP_OR_uxn_opcodes_h_l910_c3_fdc1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l922_c7_2368] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_2368_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_2368_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_2368_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_2368_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_2368_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_2368_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_2368_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_2368_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l914_c32_3137] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l914_c32_3137_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l914_c32_3137_left;
     BIN_OP_GT_uxn_opcodes_h_l914_c32_3137_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l914_c32_3137_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l914_c32_3137_return_output := BIN_OP_GT_uxn_opcodes_h_l914_c32_3137_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l926_c7_a362] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_a362_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_a362_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_a362_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_a362_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_a362_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_a362_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_a362_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_a362_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l916_c7_1506] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l916_c7_1506_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l916_c7_1506_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l916_c7_1506_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l916_c7_1506_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l916_c7_1506_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l916_c7_1506_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l916_c7_1506_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l916_c7_1506_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l924_c24_cdac] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l924_c24_cdac_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l924_c34_598e_return_output);

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l914_c32_ea32_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l914_c32_3137_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l894_c7_5816_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l895_c3_ce44_return_output;
     VAR_BIN_OP_AND_uxn_opcodes_h_l911_c11_8f85_right := VAR_BIN_OP_OR_uxn_opcodes_h_l910_c3_fdc1_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l909_c7_7461_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l910_c3_fdc1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l922_c7_2368_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l924_c24_cdac_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l901_c7_9ea4_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l903_l888_DUPLICATE_11e6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l886_c7_7686_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l903_l888_DUPLICATE_11e6_return_output;
     VAR_printf_uxn_opcodes_h_l878_c3_37eb_uxn_opcodes_h_l878_c3_37eb_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l877_c1_6504_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_2368_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_a362_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l909_c7_7461_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l916_c7_1506_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l906_c7_f3e4_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l909_c7_7461_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_2368_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_a362_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l916_c7_1506_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_2368_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l916_c7_1506] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l916_c7_1506_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l916_c7_1506_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l916_c7_1506_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l916_c7_1506_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l916_c7_1506_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l916_c7_1506_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l916_c7_1506_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l916_c7_1506_return_output;

     -- printf_uxn_opcodes_h_l878_c3_37eb[uxn_opcodes_h_l878_c3_37eb] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l878_c3_37eb_uxn_opcodes_h_l878_c3_37eb_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l878_c3_37eb_uxn_opcodes_h_l878_c3_37eb_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l909_c7_7461] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l909_c7_7461_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l909_c7_7461_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l909_c7_7461_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l909_c7_7461_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l909_c7_7461_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l909_c7_7461_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l909_c7_7461_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l909_c7_7461_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l922_c7_2368] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l922_c7_2368_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l922_c7_2368_cond;
     result_stack_value_MUX_uxn_opcodes_h_l922_c7_2368_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l922_c7_2368_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l922_c7_2368_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l922_c7_2368_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l922_c7_2368_return_output := result_stack_value_MUX_uxn_opcodes_h_l922_c7_2368_return_output;

     -- n16_MUX[uxn_opcodes_h_l909_c7_7461] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l909_c7_7461_cond <= VAR_n16_MUX_uxn_opcodes_h_l909_c7_7461_cond;
     n16_MUX_uxn_opcodes_h_l909_c7_7461_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l909_c7_7461_iftrue;
     n16_MUX_uxn_opcodes_h_l909_c7_7461_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l909_c7_7461_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l909_c7_7461_return_output := n16_MUX_uxn_opcodes_h_l909_c7_7461_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l922_c7_2368] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_2368_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_2368_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_2368_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_2368_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_2368_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_2368_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_2368_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_2368_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l906_c7_f3e4] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l906_c7_f3e4_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l906_c7_f3e4_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l906_c7_f3e4_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l906_c7_f3e4_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l906_c7_f3e4_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l906_c7_f3e4_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l906_c7_f3e4_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l906_c7_f3e4_return_output;

     -- MUX[uxn_opcodes_h_l914_c32_ea32] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l914_c32_ea32_cond <= VAR_MUX_uxn_opcodes_h_l914_c32_ea32_cond;
     MUX_uxn_opcodes_h_l914_c32_ea32_iftrue <= VAR_MUX_uxn_opcodes_h_l914_c32_ea32_iftrue;
     MUX_uxn_opcodes_h_l914_c32_ea32_iffalse <= VAR_MUX_uxn_opcodes_h_l914_c32_ea32_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l914_c32_ea32_return_output := MUX_uxn_opcodes_h_l914_c32_ea32_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l922_c7_2368] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_2368_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_2368_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_2368_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_2368_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_2368_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_2368_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_2368_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_2368_return_output;

     -- t16_MUX[uxn_opcodes_h_l894_c7_5816] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l894_c7_5816_cond <= VAR_t16_MUX_uxn_opcodes_h_l894_c7_5816_cond;
     t16_MUX_uxn_opcodes_h_l894_c7_5816_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l894_c7_5816_iftrue;
     t16_MUX_uxn_opcodes_h_l894_c7_5816_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l894_c7_5816_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l894_c7_5816_return_output := t16_MUX_uxn_opcodes_h_l894_c7_5816_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l911_c11_8f85] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l911_c11_8f85_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l911_c11_8f85_left;
     BIN_OP_AND_uxn_opcodes_h_l911_c11_8f85_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l911_c11_8f85_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l911_c11_8f85_return_output := BIN_OP_AND_uxn_opcodes_h_l911_c11_8f85_return_output;

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l909_c7_7461_iftrue := VAR_BIN_OP_AND_uxn_opcodes_h_l911_c11_8f85_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c7_7461_iftrue := VAR_MUX_uxn_opcodes_h_l914_c32_ea32_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l906_c7_f3e4_iffalse := VAR_n16_MUX_uxn_opcodes_h_l909_c7_7461_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l916_c7_1506_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_2368_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_f3e4_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l909_c7_7461_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l901_c7_9ea4_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l906_c7_f3e4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l916_c7_1506_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_2368_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c7_7461_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l916_c7_1506_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l916_c7_1506_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l922_c7_2368_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l891_c7_e574_iffalse := VAR_t16_MUX_uxn_opcodes_h_l894_c7_5816_return_output;
     -- n16_MUX[uxn_opcodes_h_l906_c7_f3e4] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l906_c7_f3e4_cond <= VAR_n16_MUX_uxn_opcodes_h_l906_c7_f3e4_cond;
     n16_MUX_uxn_opcodes_h_l906_c7_f3e4_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l906_c7_f3e4_iftrue;
     n16_MUX_uxn_opcodes_h_l906_c7_f3e4_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l906_c7_f3e4_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l906_c7_f3e4_return_output := n16_MUX_uxn_opcodes_h_l906_c7_f3e4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l909_c7_7461] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c7_7461_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c7_7461_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c7_7461_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c7_7461_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c7_7461_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c7_7461_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c7_7461_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c7_7461_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l906_c7_f3e4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_f3e4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_f3e4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_f3e4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_f3e4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_f3e4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_f3e4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_f3e4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_f3e4_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l916_c7_1506] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l916_c7_1506_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l916_c7_1506_cond;
     result_stack_value_MUX_uxn_opcodes_h_l916_c7_1506_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l916_c7_1506_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l916_c7_1506_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l916_c7_1506_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l916_c7_1506_return_output := result_stack_value_MUX_uxn_opcodes_h_l916_c7_1506_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l901_c7_9ea4] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l901_c7_9ea4_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l901_c7_9ea4_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l901_c7_9ea4_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l901_c7_9ea4_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l901_c7_9ea4_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l901_c7_9ea4_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l901_c7_9ea4_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l901_c7_9ea4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l916_c7_1506] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l916_c7_1506_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l916_c7_1506_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l916_c7_1506_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l916_c7_1506_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l916_c7_1506_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l916_c7_1506_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l916_c7_1506_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l916_c7_1506_return_output;

     -- t16_MUX[uxn_opcodes_h_l891_c7_e574] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l891_c7_e574_cond <= VAR_t16_MUX_uxn_opcodes_h_l891_c7_e574_cond;
     t16_MUX_uxn_opcodes_h_l891_c7_e574_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l891_c7_e574_iftrue;
     t16_MUX_uxn_opcodes_h_l891_c7_e574_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l891_c7_e574_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l891_c7_e574_return_output := t16_MUX_uxn_opcodes_h_l891_c7_e574_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l916_c7_1506] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l916_c7_1506_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l916_c7_1506_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l916_c7_1506_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l916_c7_1506_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l916_c7_1506_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l916_c7_1506_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l916_c7_1506_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l916_c7_1506_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l909_c7_7461] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l909_c7_7461_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l909_c7_7461_cond;
     tmp16_MUX_uxn_opcodes_h_l909_c7_7461_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l909_c7_7461_iftrue;
     tmp16_MUX_uxn_opcodes_h_l909_c7_7461_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l909_c7_7461_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l909_c7_7461_return_output := tmp16_MUX_uxn_opcodes_h_l909_c7_7461_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l909_c7_7461] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c7_7461_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c7_7461_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c7_7461_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c7_7461_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c7_7461_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c7_7461_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c7_7461_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c7_7461_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l901_c7_9ea4_iffalse := VAR_n16_MUX_uxn_opcodes_h_l906_c7_f3e4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l909_c7_7461_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l916_c7_1506_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l901_c7_9ea4_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_f3e4_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l898_c7_4e92_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l901_c7_9ea4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l909_c7_7461_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l916_c7_1506_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_f3e4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c7_7461_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_f3e4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c7_7461_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l909_c7_7461_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l916_c7_1506_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l886_c7_7686_iffalse := VAR_t16_MUX_uxn_opcodes_h_l891_c7_e574_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l906_c7_f3e4_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l909_c7_7461_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l909_c7_7461] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l909_c7_7461_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l909_c7_7461_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l909_c7_7461_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l909_c7_7461_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l909_c7_7461_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l909_c7_7461_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l909_c7_7461_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l909_c7_7461_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l906_c7_f3e4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_f3e4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_f3e4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_f3e4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_f3e4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_f3e4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_f3e4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_f3e4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_f3e4_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l906_c7_f3e4] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l906_c7_f3e4_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l906_c7_f3e4_cond;
     tmp16_MUX_uxn_opcodes_h_l906_c7_f3e4_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l906_c7_f3e4_iftrue;
     tmp16_MUX_uxn_opcodes_h_l906_c7_f3e4_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l906_c7_f3e4_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l906_c7_f3e4_return_output := tmp16_MUX_uxn_opcodes_h_l906_c7_f3e4_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l909_c7_7461] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l909_c7_7461_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l909_c7_7461_cond;
     result_stack_value_MUX_uxn_opcodes_h_l909_c7_7461_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l909_c7_7461_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l909_c7_7461_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l909_c7_7461_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l909_c7_7461_return_output := result_stack_value_MUX_uxn_opcodes_h_l909_c7_7461_return_output;

     -- n16_MUX[uxn_opcodes_h_l901_c7_9ea4] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l901_c7_9ea4_cond <= VAR_n16_MUX_uxn_opcodes_h_l901_c7_9ea4_cond;
     n16_MUX_uxn_opcodes_h_l901_c7_9ea4_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l901_c7_9ea4_iftrue;
     n16_MUX_uxn_opcodes_h_l901_c7_9ea4_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l901_c7_9ea4_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l901_c7_9ea4_return_output := n16_MUX_uxn_opcodes_h_l901_c7_9ea4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l906_c7_f3e4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_f3e4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_f3e4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_f3e4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_f3e4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_f3e4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_f3e4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_f3e4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_f3e4_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l901_c7_9ea4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l901_c7_9ea4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l901_c7_9ea4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l901_c7_9ea4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l901_c7_9ea4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l901_c7_9ea4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l901_c7_9ea4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l901_c7_9ea4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l901_c7_9ea4_return_output;

     -- t16_MUX[uxn_opcodes_h_l886_c7_7686] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l886_c7_7686_cond <= VAR_t16_MUX_uxn_opcodes_h_l886_c7_7686_cond;
     t16_MUX_uxn_opcodes_h_l886_c7_7686_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l886_c7_7686_iftrue;
     t16_MUX_uxn_opcodes_h_l886_c7_7686_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l886_c7_7686_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l886_c7_7686_return_output := t16_MUX_uxn_opcodes_h_l886_c7_7686_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l909_c7_7461] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l909_c7_7461_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l909_c7_7461_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l909_c7_7461_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l909_c7_7461_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l909_c7_7461_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l909_c7_7461_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l909_c7_7461_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l909_c7_7461_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l898_c7_4e92] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l898_c7_4e92_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l898_c7_4e92_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l898_c7_4e92_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l898_c7_4e92_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l898_c7_4e92_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l898_c7_4e92_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l898_c7_4e92_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l898_c7_4e92_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l898_c7_4e92_iffalse := VAR_n16_MUX_uxn_opcodes_h_l901_c7_9ea4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_f3e4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l909_c7_7461_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l898_c7_4e92_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l901_c7_9ea4_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l894_c7_5816_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l898_c7_4e92_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_f3e4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l909_c7_7461_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c7_9ea4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_f3e4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c7_9ea4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_f3e4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l906_c7_f3e4_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l909_c7_7461_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l883_c7_6aff_iffalse := VAR_t16_MUX_uxn_opcodes_h_l886_c7_7686_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l901_c7_9ea4_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l906_c7_f3e4_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l901_c7_9ea4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c7_9ea4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c7_9ea4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c7_9ea4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c7_9ea4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c7_9ea4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c7_9ea4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c7_9ea4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c7_9ea4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l906_c7_f3e4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_f3e4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_f3e4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_f3e4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_f3e4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_f3e4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_f3e4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_f3e4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_f3e4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l901_c7_9ea4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c7_9ea4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c7_9ea4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c7_9ea4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c7_9ea4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c7_9ea4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c7_9ea4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c7_9ea4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c7_9ea4_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l901_c7_9ea4] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l901_c7_9ea4_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l901_c7_9ea4_cond;
     tmp16_MUX_uxn_opcodes_h_l901_c7_9ea4_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l901_c7_9ea4_iftrue;
     tmp16_MUX_uxn_opcodes_h_l901_c7_9ea4_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l901_c7_9ea4_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l901_c7_9ea4_return_output := tmp16_MUX_uxn_opcodes_h_l901_c7_9ea4_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l898_c7_4e92] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l898_c7_4e92_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l898_c7_4e92_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l898_c7_4e92_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l898_c7_4e92_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l898_c7_4e92_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l898_c7_4e92_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l898_c7_4e92_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l898_c7_4e92_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l906_c7_f3e4] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l906_c7_f3e4_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l906_c7_f3e4_cond;
     result_stack_value_MUX_uxn_opcodes_h_l906_c7_f3e4_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l906_c7_f3e4_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l906_c7_f3e4_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l906_c7_f3e4_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l906_c7_f3e4_return_output := result_stack_value_MUX_uxn_opcodes_h_l906_c7_f3e4_return_output;

     -- t16_MUX[uxn_opcodes_h_l883_c7_6aff] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l883_c7_6aff_cond <= VAR_t16_MUX_uxn_opcodes_h_l883_c7_6aff_cond;
     t16_MUX_uxn_opcodes_h_l883_c7_6aff_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l883_c7_6aff_iftrue;
     t16_MUX_uxn_opcodes_h_l883_c7_6aff_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l883_c7_6aff_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l883_c7_6aff_return_output := t16_MUX_uxn_opcodes_h_l883_c7_6aff_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l894_c7_5816] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l894_c7_5816_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l894_c7_5816_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l894_c7_5816_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l894_c7_5816_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l894_c7_5816_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l894_c7_5816_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l894_c7_5816_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l894_c7_5816_return_output;

     -- n16_MUX[uxn_opcodes_h_l898_c7_4e92] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l898_c7_4e92_cond <= VAR_n16_MUX_uxn_opcodes_h_l898_c7_4e92_cond;
     n16_MUX_uxn_opcodes_h_l898_c7_4e92_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l898_c7_4e92_iftrue;
     n16_MUX_uxn_opcodes_h_l898_c7_4e92_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l898_c7_4e92_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l898_c7_4e92_return_output := n16_MUX_uxn_opcodes_h_l898_c7_4e92_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l906_c7_f3e4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_f3e4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_f3e4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_f3e4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_f3e4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_f3e4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_f3e4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_f3e4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_f3e4_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l894_c7_5816_iffalse := VAR_n16_MUX_uxn_opcodes_h_l898_c7_4e92_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l901_c7_9ea4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_f3e4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l894_c7_5816_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l898_c7_4e92_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l891_c7_e574_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l894_c7_5816_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l901_c7_9ea4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_f3e4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l898_c7_4e92_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c7_9ea4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l898_c7_4e92_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c7_9ea4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l901_c7_9ea4_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l906_c7_f3e4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l877_c2_f9d9_iffalse := VAR_t16_MUX_uxn_opcodes_h_l883_c7_6aff_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l898_c7_4e92_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l901_c7_9ea4_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l901_c7_9ea4] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l901_c7_9ea4_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l901_c7_9ea4_cond;
     result_stack_value_MUX_uxn_opcodes_h_l901_c7_9ea4_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l901_c7_9ea4_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l901_c7_9ea4_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l901_c7_9ea4_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l901_c7_9ea4_return_output := result_stack_value_MUX_uxn_opcodes_h_l901_c7_9ea4_return_output;

     -- n16_MUX[uxn_opcodes_h_l894_c7_5816] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l894_c7_5816_cond <= VAR_n16_MUX_uxn_opcodes_h_l894_c7_5816_cond;
     n16_MUX_uxn_opcodes_h_l894_c7_5816_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l894_c7_5816_iftrue;
     n16_MUX_uxn_opcodes_h_l894_c7_5816_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l894_c7_5816_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l894_c7_5816_return_output := n16_MUX_uxn_opcodes_h_l894_c7_5816_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l894_c7_5816] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l894_c7_5816_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l894_c7_5816_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l894_c7_5816_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l894_c7_5816_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l894_c7_5816_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l894_c7_5816_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l894_c7_5816_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l894_c7_5816_return_output;

     -- t16_MUX[uxn_opcodes_h_l877_c2_f9d9] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l877_c2_f9d9_cond <= VAR_t16_MUX_uxn_opcodes_h_l877_c2_f9d9_cond;
     t16_MUX_uxn_opcodes_h_l877_c2_f9d9_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l877_c2_f9d9_iftrue;
     t16_MUX_uxn_opcodes_h_l877_c2_f9d9_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l877_c2_f9d9_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l877_c2_f9d9_return_output := t16_MUX_uxn_opcodes_h_l877_c2_f9d9_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l891_c7_e574] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l891_c7_e574_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l891_c7_e574_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l891_c7_e574_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l891_c7_e574_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l891_c7_e574_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l891_c7_e574_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l891_c7_e574_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l891_c7_e574_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l901_c7_9ea4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l901_c7_9ea4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l901_c7_9ea4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l901_c7_9ea4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l901_c7_9ea4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l901_c7_9ea4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l901_c7_9ea4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l901_c7_9ea4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l901_c7_9ea4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l901_c7_9ea4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l901_c7_9ea4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l901_c7_9ea4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l901_c7_9ea4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l901_c7_9ea4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l901_c7_9ea4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l901_c7_9ea4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l901_c7_9ea4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l901_c7_9ea4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l898_c7_4e92] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l898_c7_4e92_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l898_c7_4e92_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l898_c7_4e92_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l898_c7_4e92_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l898_c7_4e92_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l898_c7_4e92_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l898_c7_4e92_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l898_c7_4e92_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l898_c7_4e92] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l898_c7_4e92_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l898_c7_4e92_cond;
     tmp16_MUX_uxn_opcodes_h_l898_c7_4e92_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l898_c7_4e92_iftrue;
     tmp16_MUX_uxn_opcodes_h_l898_c7_4e92_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l898_c7_4e92_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l898_c7_4e92_return_output := tmp16_MUX_uxn_opcodes_h_l898_c7_4e92_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l898_c7_4e92] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l898_c7_4e92_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l898_c7_4e92_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l898_c7_4e92_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l898_c7_4e92_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l898_c7_4e92_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l898_c7_4e92_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l898_c7_4e92_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l898_c7_4e92_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l891_c7_e574_iffalse := VAR_n16_MUX_uxn_opcodes_h_l894_c7_5816_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l898_c7_4e92_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l901_c7_9ea4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l891_c7_e574_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l894_c7_5816_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l886_c7_7686_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l891_c7_e574_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l898_c7_4e92_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l901_c7_9ea4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l894_c7_5816_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l898_c7_4e92_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l894_c7_5816_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l898_c7_4e92_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l898_c7_4e92_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l901_c7_9ea4_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l877_c2_f9d9_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l894_c7_5816_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l898_c7_4e92_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l894_c7_5816] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l894_c7_5816_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l894_c7_5816_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l894_c7_5816_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l894_c7_5816_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l894_c7_5816_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l894_c7_5816_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l894_c7_5816_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l894_c7_5816_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l891_c7_e574] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l891_c7_e574_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l891_c7_e574_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l891_c7_e574_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l891_c7_e574_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l891_c7_e574_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l891_c7_e574_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l891_c7_e574_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l891_c7_e574_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l898_c7_4e92] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l898_c7_4e92_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l898_c7_4e92_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l898_c7_4e92_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l898_c7_4e92_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l898_c7_4e92_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l898_c7_4e92_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l898_c7_4e92_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l898_c7_4e92_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l886_c7_7686] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l886_c7_7686_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l886_c7_7686_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l886_c7_7686_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l886_c7_7686_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l886_c7_7686_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l886_c7_7686_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l886_c7_7686_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l886_c7_7686_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l898_c7_4e92] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l898_c7_4e92_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l898_c7_4e92_cond;
     result_stack_value_MUX_uxn_opcodes_h_l898_c7_4e92_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l898_c7_4e92_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l898_c7_4e92_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l898_c7_4e92_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l898_c7_4e92_return_output := result_stack_value_MUX_uxn_opcodes_h_l898_c7_4e92_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l894_c7_5816] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l894_c7_5816_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l894_c7_5816_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l894_c7_5816_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l894_c7_5816_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l894_c7_5816_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l894_c7_5816_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l894_c7_5816_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l894_c7_5816_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l894_c7_5816] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l894_c7_5816_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l894_c7_5816_cond;
     tmp16_MUX_uxn_opcodes_h_l894_c7_5816_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l894_c7_5816_iftrue;
     tmp16_MUX_uxn_opcodes_h_l894_c7_5816_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l894_c7_5816_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l894_c7_5816_return_output := tmp16_MUX_uxn_opcodes_h_l894_c7_5816_return_output;

     -- n16_MUX[uxn_opcodes_h_l891_c7_e574] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l891_c7_e574_cond <= VAR_n16_MUX_uxn_opcodes_h_l891_c7_e574_cond;
     n16_MUX_uxn_opcodes_h_l891_c7_e574_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l891_c7_e574_iftrue;
     n16_MUX_uxn_opcodes_h_l891_c7_e574_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l891_c7_e574_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l891_c7_e574_return_output := n16_MUX_uxn_opcodes_h_l891_c7_e574_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l898_c7_4e92] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l898_c7_4e92_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l898_c7_4e92_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l898_c7_4e92_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l898_c7_4e92_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l898_c7_4e92_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l898_c7_4e92_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l898_c7_4e92_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l898_c7_4e92_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l886_c7_7686_iffalse := VAR_n16_MUX_uxn_opcodes_h_l891_c7_e574_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l894_c7_5816_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l898_c7_4e92_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l886_c7_7686_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l891_c7_e574_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l883_c7_6aff_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l886_c7_7686_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l894_c7_5816_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l898_c7_4e92_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_e574_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l894_c7_5816_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_e574_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l894_c7_5816_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l894_c7_5816_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l898_c7_4e92_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l891_c7_e574_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l894_c7_5816_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l886_c7_7686] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l886_c7_7686_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l886_c7_7686_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l886_c7_7686_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l886_c7_7686_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l886_c7_7686_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l886_c7_7686_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l886_c7_7686_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l886_c7_7686_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l894_c7_5816] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l894_c7_5816_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l894_c7_5816_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l894_c7_5816_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l894_c7_5816_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l894_c7_5816_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l894_c7_5816_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l894_c7_5816_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l894_c7_5816_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l883_c7_6aff] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l883_c7_6aff_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l883_c7_6aff_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l883_c7_6aff_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l883_c7_6aff_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l883_c7_6aff_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l883_c7_6aff_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l883_c7_6aff_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l883_c7_6aff_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l891_c7_e574] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_e574_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_e574_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_e574_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_e574_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_e574_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_e574_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_e574_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_e574_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l894_c7_5816] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l894_c7_5816_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l894_c7_5816_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l894_c7_5816_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l894_c7_5816_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l894_c7_5816_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l894_c7_5816_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l894_c7_5816_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l894_c7_5816_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l894_c7_5816] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l894_c7_5816_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l894_c7_5816_cond;
     result_stack_value_MUX_uxn_opcodes_h_l894_c7_5816_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l894_c7_5816_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l894_c7_5816_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l894_c7_5816_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l894_c7_5816_return_output := result_stack_value_MUX_uxn_opcodes_h_l894_c7_5816_return_output;

     -- n16_MUX[uxn_opcodes_h_l886_c7_7686] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l886_c7_7686_cond <= VAR_n16_MUX_uxn_opcodes_h_l886_c7_7686_cond;
     n16_MUX_uxn_opcodes_h_l886_c7_7686_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l886_c7_7686_iftrue;
     n16_MUX_uxn_opcodes_h_l886_c7_7686_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l886_c7_7686_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l886_c7_7686_return_output := n16_MUX_uxn_opcodes_h_l886_c7_7686_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l891_c7_e574] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_e574_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_e574_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_e574_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_e574_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_e574_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_e574_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_e574_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_e574_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l891_c7_e574] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l891_c7_e574_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l891_c7_e574_cond;
     tmp16_MUX_uxn_opcodes_h_l891_c7_e574_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l891_c7_e574_iftrue;
     tmp16_MUX_uxn_opcodes_h_l891_c7_e574_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l891_c7_e574_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l891_c7_e574_return_output := tmp16_MUX_uxn_opcodes_h_l891_c7_e574_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l883_c7_6aff_iffalse := VAR_n16_MUX_uxn_opcodes_h_l886_c7_7686_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_e574_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l894_c7_5816_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l883_c7_6aff_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l886_c7_7686_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l877_c2_f9d9_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l883_c7_6aff_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_e574_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l894_c7_5816_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l886_c7_7686_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_e574_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l886_c7_7686_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_e574_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l891_c7_e574_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l894_c7_5816_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l886_c7_7686_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l891_c7_e574_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l891_c7_e574] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l891_c7_e574_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l891_c7_e574_cond;
     result_stack_value_MUX_uxn_opcodes_h_l891_c7_e574_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l891_c7_e574_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l891_c7_e574_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l891_c7_e574_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l891_c7_e574_return_output := result_stack_value_MUX_uxn_opcodes_h_l891_c7_e574_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l891_c7_e574] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_e574_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_e574_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_e574_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_e574_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_e574_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_e574_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_e574_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_e574_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l877_c2_f9d9] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l877_c2_f9d9_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l877_c2_f9d9_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l877_c2_f9d9_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l877_c2_f9d9_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l877_c2_f9d9_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l877_c2_f9d9_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l877_c2_f9d9_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l877_c2_f9d9_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l883_c7_6aff] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l883_c7_6aff_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l883_c7_6aff_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l883_c7_6aff_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l883_c7_6aff_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l883_c7_6aff_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l883_c7_6aff_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l883_c7_6aff_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l883_c7_6aff_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l886_c7_7686] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l886_c7_7686_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l886_c7_7686_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l886_c7_7686_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l886_c7_7686_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l886_c7_7686_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l886_c7_7686_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l886_c7_7686_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l886_c7_7686_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l886_c7_7686] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l886_c7_7686_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l886_c7_7686_cond;
     tmp16_MUX_uxn_opcodes_h_l886_c7_7686_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l886_c7_7686_iftrue;
     tmp16_MUX_uxn_opcodes_h_l886_c7_7686_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l886_c7_7686_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l886_c7_7686_return_output := tmp16_MUX_uxn_opcodes_h_l886_c7_7686_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l886_c7_7686] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l886_c7_7686_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l886_c7_7686_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l886_c7_7686_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l886_c7_7686_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l886_c7_7686_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l886_c7_7686_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l886_c7_7686_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l886_c7_7686_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l891_c7_e574] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_e574_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_e574_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_e574_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_e574_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_e574_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_e574_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_e574_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_e574_return_output;

     -- n16_MUX[uxn_opcodes_h_l883_c7_6aff] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l883_c7_6aff_cond <= VAR_n16_MUX_uxn_opcodes_h_l883_c7_6aff_cond;
     n16_MUX_uxn_opcodes_h_l883_c7_6aff_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l883_c7_6aff_iftrue;
     n16_MUX_uxn_opcodes_h_l883_c7_6aff_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l883_c7_6aff_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l883_c7_6aff_return_output := n16_MUX_uxn_opcodes_h_l883_c7_6aff_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l877_c2_f9d9_iffalse := VAR_n16_MUX_uxn_opcodes_h_l883_c7_6aff_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l886_c7_7686_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_e574_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l877_c2_f9d9_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l883_c7_6aff_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l886_c7_7686_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_e574_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_6aff_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l886_c7_7686_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_6aff_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l886_c7_7686_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l886_c7_7686_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l891_c7_e574_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l883_c7_6aff_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l886_c7_7686_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l886_c7_7686] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l886_c7_7686_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l886_c7_7686_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l886_c7_7686_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l886_c7_7686_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l886_c7_7686_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l886_c7_7686_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l886_c7_7686_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l886_c7_7686_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l883_c7_6aff] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l883_c7_6aff_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l883_c7_6aff_cond;
     tmp16_MUX_uxn_opcodes_h_l883_c7_6aff_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l883_c7_6aff_iftrue;
     tmp16_MUX_uxn_opcodes_h_l883_c7_6aff_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l883_c7_6aff_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l883_c7_6aff_return_output := tmp16_MUX_uxn_opcodes_h_l883_c7_6aff_return_output;

     -- n16_MUX[uxn_opcodes_h_l877_c2_f9d9] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l877_c2_f9d9_cond <= VAR_n16_MUX_uxn_opcodes_h_l877_c2_f9d9_cond;
     n16_MUX_uxn_opcodes_h_l877_c2_f9d9_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l877_c2_f9d9_iftrue;
     n16_MUX_uxn_opcodes_h_l877_c2_f9d9_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l877_c2_f9d9_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l877_c2_f9d9_return_output := n16_MUX_uxn_opcodes_h_l877_c2_f9d9_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l886_c7_7686] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l886_c7_7686_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l886_c7_7686_cond;
     result_stack_value_MUX_uxn_opcodes_h_l886_c7_7686_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l886_c7_7686_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l886_c7_7686_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l886_c7_7686_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l886_c7_7686_return_output := result_stack_value_MUX_uxn_opcodes_h_l886_c7_7686_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l886_c7_7686] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l886_c7_7686_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l886_c7_7686_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l886_c7_7686_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l886_c7_7686_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l886_c7_7686_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l886_c7_7686_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l886_c7_7686_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l886_c7_7686_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l877_c2_f9d9] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l877_c2_f9d9_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l877_c2_f9d9_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l877_c2_f9d9_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l877_c2_f9d9_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l877_c2_f9d9_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l877_c2_f9d9_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l877_c2_f9d9_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l877_c2_f9d9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l883_c7_6aff] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_6aff_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_6aff_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_6aff_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_6aff_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_6aff_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_6aff_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_6aff_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_6aff_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l883_c7_6aff] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_6aff_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_6aff_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_6aff_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_6aff_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_6aff_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_6aff_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_6aff_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_6aff_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l877_c2_f9d9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_6aff_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l886_c7_7686_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_6aff_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l886_c7_7686_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l877_c2_f9d9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_6aff_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l877_c2_f9d9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_6aff_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l883_c7_6aff_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l886_c7_7686_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l877_c2_f9d9_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l883_c7_6aff_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l877_c2_f9d9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l877_c2_f9d9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l877_c2_f9d9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l877_c2_f9d9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l877_c2_f9d9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l877_c2_f9d9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l877_c2_f9d9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l877_c2_f9d9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l877_c2_f9d9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l883_c7_6aff] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_6aff_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_6aff_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_6aff_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_6aff_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_6aff_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_6aff_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_6aff_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_6aff_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l883_c7_6aff] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_6aff_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_6aff_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_6aff_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_6aff_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_6aff_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_6aff_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_6aff_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_6aff_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l877_c2_f9d9] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l877_c2_f9d9_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l877_c2_f9d9_cond;
     tmp16_MUX_uxn_opcodes_h_l877_c2_f9d9_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l877_c2_f9d9_iftrue;
     tmp16_MUX_uxn_opcodes_h_l877_c2_f9d9_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l877_c2_f9d9_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l877_c2_f9d9_return_output := tmp16_MUX_uxn_opcodes_h_l877_c2_f9d9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l877_c2_f9d9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l877_c2_f9d9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l877_c2_f9d9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l877_c2_f9d9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l877_c2_f9d9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l877_c2_f9d9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l877_c2_f9d9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l877_c2_f9d9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l877_c2_f9d9_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l883_c7_6aff] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l883_c7_6aff_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l883_c7_6aff_cond;
     result_stack_value_MUX_uxn_opcodes_h_l883_c7_6aff_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l883_c7_6aff_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l883_c7_6aff_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l883_c7_6aff_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l883_c7_6aff_return_output := result_stack_value_MUX_uxn_opcodes_h_l883_c7_6aff_return_output;

     -- Submodule level 12
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l877_c2_f9d9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_6aff_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l877_c2_f9d9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_6aff_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l877_c2_f9d9_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l883_c7_6aff_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l877_c2_f9d9_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l877_c2_f9d9] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l877_c2_f9d9_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l877_c2_f9d9_cond;
     result_stack_value_MUX_uxn_opcodes_h_l877_c2_f9d9_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l877_c2_f9d9_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l877_c2_f9d9_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l877_c2_f9d9_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l877_c2_f9d9_return_output := result_stack_value_MUX_uxn_opcodes_h_l877_c2_f9d9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l877_c2_f9d9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l877_c2_f9d9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l877_c2_f9d9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l877_c2_f9d9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l877_c2_f9d9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l877_c2_f9d9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l877_c2_f9d9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l877_c2_f9d9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l877_c2_f9d9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l877_c2_f9d9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l877_c2_f9d9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l877_c2_f9d9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l877_c2_f9d9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l877_c2_f9d9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l877_c2_f9d9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l877_c2_f9d9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l877_c2_f9d9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l877_c2_f9d9_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l931_l873_DUPLICATE_e7db LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l931_l873_DUPLICATE_e7db_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_df93(
     result,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l877_c2_f9d9_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l877_c2_f9d9_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l877_c2_f9d9_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l877_c2_f9d9_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l877_c2_f9d9_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l877_c2_f9d9_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l877_c2_f9d9_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l931_l873_DUPLICATE_e7db_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l931_l873_DUPLICATE_e7db_return_output;
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
