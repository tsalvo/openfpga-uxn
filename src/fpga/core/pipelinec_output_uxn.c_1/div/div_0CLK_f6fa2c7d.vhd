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
-- Submodules: 66
entity div_0CLK_f6fa2c7d is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end div_0CLK_f6fa2c7d;
architecture arch of div_0CLK_f6fa2c7d is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1769_c6_1d7e]
signal BIN_OP_EQ_uxn_opcodes_h_l1769_c6_1d7e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1769_c6_1d7e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1769_c6_1d7e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1769_c1_4770]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1769_c1_4770_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1769_c1_4770_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1769_c1_4770_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1769_c1_4770_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1769_c2_5427]
signal t8_MUX_uxn_opcodes_h_l1769_c2_5427_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1769_c2_5427_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1769_c2_5427_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1769_c2_5427_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1769_c2_5427]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1769_c2_5427_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1769_c2_5427_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1769_c2_5427_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1769_c2_5427_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1769_c2_5427]
signal result_stack_value_MUX_uxn_opcodes_h_l1769_c2_5427_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1769_c2_5427_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1769_c2_5427_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1769_c2_5427_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1769_c2_5427]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1769_c2_5427_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1769_c2_5427_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1769_c2_5427_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1769_c2_5427_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1769_c2_5427]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1769_c2_5427_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1769_c2_5427_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1769_c2_5427_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1769_c2_5427_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1769_c2_5427]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1769_c2_5427_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1769_c2_5427_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1769_c2_5427_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1769_c2_5427_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1769_c2_5427]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1769_c2_5427_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1769_c2_5427_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1769_c2_5427_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1769_c2_5427_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1769_c2_5427]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1769_c2_5427_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1769_c2_5427_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1769_c2_5427_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1769_c2_5427_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1769_c2_5427]
signal n8_MUX_uxn_opcodes_h_l1769_c2_5427_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1769_c2_5427_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1769_c2_5427_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1769_c2_5427_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l1770_c3_f161[uxn_opcodes_h_l1770_c3_f161]
signal printf_uxn_opcodes_h_l1770_c3_f161_uxn_opcodes_h_l1770_c3_f161_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1775_c11_63b0]
signal BIN_OP_EQ_uxn_opcodes_h_l1775_c11_63b0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1775_c11_63b0_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1775_c11_63b0_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1775_c7_c91e]
signal t8_MUX_uxn_opcodes_h_l1775_c7_c91e_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1775_c7_c91e_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1775_c7_c91e_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1775_c7_c91e_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1775_c7_c91e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_c91e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_c91e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_c91e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_c91e_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1775_c7_c91e]
signal result_stack_value_MUX_uxn_opcodes_h_l1775_c7_c91e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1775_c7_c91e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1775_c7_c91e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1775_c7_c91e_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1775_c7_c91e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_c91e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_c91e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_c91e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_c91e_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1775_c7_c91e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_c91e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_c91e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_c91e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_c91e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1775_c7_c91e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_c91e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_c91e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_c91e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_c91e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1775_c7_c91e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_c91e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_c91e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_c91e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_c91e_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1775_c7_c91e]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1775_c7_c91e_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1775_c7_c91e_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1775_c7_c91e_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1775_c7_c91e_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1775_c7_c91e]
signal n8_MUX_uxn_opcodes_h_l1775_c7_c91e_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1775_c7_c91e_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1775_c7_c91e_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1775_c7_c91e_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1778_c11_6322]
signal BIN_OP_EQ_uxn_opcodes_h_l1778_c11_6322_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1778_c11_6322_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1778_c11_6322_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1778_c7_4310]
signal t8_MUX_uxn_opcodes_h_l1778_c7_4310_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1778_c7_4310_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1778_c7_4310_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1778_c7_4310_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1778_c7_4310]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1778_c7_4310_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1778_c7_4310_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1778_c7_4310_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1778_c7_4310_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1778_c7_4310]
signal result_stack_value_MUX_uxn_opcodes_h_l1778_c7_4310_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1778_c7_4310_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1778_c7_4310_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1778_c7_4310_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1778_c7_4310]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1778_c7_4310_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1778_c7_4310_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1778_c7_4310_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1778_c7_4310_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1778_c7_4310]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1778_c7_4310_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1778_c7_4310_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1778_c7_4310_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1778_c7_4310_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1778_c7_4310]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1778_c7_4310_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1778_c7_4310_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1778_c7_4310_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1778_c7_4310_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1778_c7_4310]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1778_c7_4310_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1778_c7_4310_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1778_c7_4310_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1778_c7_4310_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1778_c7_4310]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1778_c7_4310_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1778_c7_4310_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1778_c7_4310_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1778_c7_4310_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1778_c7_4310]
signal n8_MUX_uxn_opcodes_h_l1778_c7_4310_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1778_c7_4310_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1778_c7_4310_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1778_c7_4310_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1782_c11_844e]
signal BIN_OP_EQ_uxn_opcodes_h_l1782_c11_844e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1782_c11_844e_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1782_c11_844e_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1782_c7_f895]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1782_c7_f895_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1782_c7_f895_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1782_c7_f895_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1782_c7_f895_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1782_c7_f895]
signal result_stack_value_MUX_uxn_opcodes_h_l1782_c7_f895_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1782_c7_f895_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1782_c7_f895_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1782_c7_f895_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1782_c7_f895]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1782_c7_f895_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1782_c7_f895_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1782_c7_f895_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1782_c7_f895_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1782_c7_f895]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1782_c7_f895_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1782_c7_f895_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1782_c7_f895_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1782_c7_f895_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1782_c7_f895]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_f895_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_f895_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_f895_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_f895_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1782_c7_f895]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1782_c7_f895_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1782_c7_f895_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1782_c7_f895_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1782_c7_f895_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1782_c7_f895]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1782_c7_f895_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1782_c7_f895_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1782_c7_f895_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1782_c7_f895_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1782_c7_f895]
signal n8_MUX_uxn_opcodes_h_l1782_c7_f895_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1782_c7_f895_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1782_c7_f895_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1782_c7_f895_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1785_c11_1db8]
signal BIN_OP_EQ_uxn_opcodes_h_l1785_c11_1db8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1785_c11_1db8_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1785_c11_1db8_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1785_c7_4760]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1785_c7_4760_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1785_c7_4760_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1785_c7_4760_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1785_c7_4760_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1785_c7_4760]
signal result_stack_value_MUX_uxn_opcodes_h_l1785_c7_4760_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1785_c7_4760_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1785_c7_4760_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1785_c7_4760_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1785_c7_4760]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_4760_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_4760_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_4760_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_4760_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1785_c7_4760]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_4760_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_4760_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_4760_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_4760_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1785_c7_4760]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_4760_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_4760_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_4760_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_4760_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1785_c7_4760]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_4760_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_4760_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_4760_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_4760_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1785_c7_4760]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1785_c7_4760_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1785_c7_4760_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1785_c7_4760_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1785_c7_4760_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1785_c7_4760]
signal n8_MUX_uxn_opcodes_h_l1785_c7_4760_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1785_c7_4760_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1785_c7_4760_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1785_c7_4760_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1789_c32_cdaa]
signal BIN_OP_AND_uxn_opcodes_h_l1789_c32_cdaa_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1789_c32_cdaa_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1789_c32_cdaa_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1789_c32_e368]
signal BIN_OP_GT_uxn_opcodes_h_l1789_c32_e368_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1789_c32_e368_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1789_c32_e368_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1789_c32_c364]
signal MUX_uxn_opcodes_h_l1789_c32_c364_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1789_c32_c364_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1789_c32_c364_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1789_c32_c364_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1791_c11_a39e]
signal BIN_OP_EQ_uxn_opcodes_h_l1791_c11_a39e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1791_c11_a39e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1791_c11_a39e_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1791_c7_4bac]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1791_c7_4bac_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1791_c7_4bac_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1791_c7_4bac_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1791_c7_4bac_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1791_c7_4bac]
signal result_stack_value_MUX_uxn_opcodes_h_l1791_c7_4bac_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1791_c7_4bac_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1791_c7_4bac_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1791_c7_4bac_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1791_c7_4bac]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1791_c7_4bac_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1791_c7_4bac_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1791_c7_4bac_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1791_c7_4bac_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1791_c7_4bac]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1791_c7_4bac_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1791_c7_4bac_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1791_c7_4bac_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1791_c7_4bac_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1791_c7_4bac]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1791_c7_4bac_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1791_c7_4bac_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1791_c7_4bac_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1791_c7_4bac_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1795_c24_1e37]
signal BIN_OP_EQ_uxn_opcodes_h_l1795_c24_1e37_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1795_c24_1e37_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1795_c24_1e37_return_output : unsigned(0 downto 0);

-- BIN_OP_DIV[uxn_opcodes_h_l1795_c38_25df]
signal BIN_OP_DIV_uxn_opcodes_h_l1795_c38_25df_left : unsigned(7 downto 0);
signal BIN_OP_DIV_uxn_opcodes_h_l1795_c38_25df_right : unsigned(7 downto 0);
signal BIN_OP_DIV_uxn_opcodes_h_l1795_c38_25df_return_output : unsigned(7 downto 0);

-- MUX[uxn_opcodes_h_l1795_c24_8b22]
signal MUX_uxn_opcodes_h_l1795_c24_8b22_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1795_c24_8b22_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1795_c24_8b22_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1795_c24_8b22_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1797_c11_ed46]
signal BIN_OP_EQ_uxn_opcodes_h_l1797_c11_ed46_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1797_c11_ed46_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1797_c11_ed46_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1797_c7_d3ba]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_d3ba_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_d3ba_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_d3ba_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_d3ba_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1797_c7_d3ba]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_d3ba_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_d3ba_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_d3ba_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_d3ba_return_output : unsigned(0 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_e56b( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : signed;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_sp_shift := ref_toks_1;
      base.stack_value := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.stack_address_sp_offset := ref_toks_6;
      base.is_stack_read := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1769_c6_1d7e
BIN_OP_EQ_uxn_opcodes_h_l1769_c6_1d7e : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1769_c6_1d7e_left,
BIN_OP_EQ_uxn_opcodes_h_l1769_c6_1d7e_right,
BIN_OP_EQ_uxn_opcodes_h_l1769_c6_1d7e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1769_c1_4770
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1769_c1_4770 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1769_c1_4770_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1769_c1_4770_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1769_c1_4770_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1769_c1_4770_return_output);

-- t8_MUX_uxn_opcodes_h_l1769_c2_5427
t8_MUX_uxn_opcodes_h_l1769_c2_5427 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1769_c2_5427_cond,
t8_MUX_uxn_opcodes_h_l1769_c2_5427_iftrue,
t8_MUX_uxn_opcodes_h_l1769_c2_5427_iffalse,
t8_MUX_uxn_opcodes_h_l1769_c2_5427_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1769_c2_5427
result_is_sp_shift_MUX_uxn_opcodes_h_l1769_c2_5427 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1769_c2_5427_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1769_c2_5427_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1769_c2_5427_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1769_c2_5427_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1769_c2_5427
result_stack_value_MUX_uxn_opcodes_h_l1769_c2_5427 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1769_c2_5427_cond,
result_stack_value_MUX_uxn_opcodes_h_l1769_c2_5427_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1769_c2_5427_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1769_c2_5427_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1769_c2_5427
result_sp_relative_shift_MUX_uxn_opcodes_h_l1769_c2_5427 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1769_c2_5427_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1769_c2_5427_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1769_c2_5427_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1769_c2_5427_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1769_c2_5427
result_is_stack_write_MUX_uxn_opcodes_h_l1769_c2_5427 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1769_c2_5427_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1769_c2_5427_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1769_c2_5427_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1769_c2_5427_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1769_c2_5427
result_is_opc_done_MUX_uxn_opcodes_h_l1769_c2_5427 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1769_c2_5427_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1769_c2_5427_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1769_c2_5427_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1769_c2_5427_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1769_c2_5427
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1769_c2_5427 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1769_c2_5427_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1769_c2_5427_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1769_c2_5427_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1769_c2_5427_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1769_c2_5427
result_is_stack_read_MUX_uxn_opcodes_h_l1769_c2_5427 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1769_c2_5427_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1769_c2_5427_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1769_c2_5427_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1769_c2_5427_return_output);

-- n8_MUX_uxn_opcodes_h_l1769_c2_5427
n8_MUX_uxn_opcodes_h_l1769_c2_5427 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1769_c2_5427_cond,
n8_MUX_uxn_opcodes_h_l1769_c2_5427_iftrue,
n8_MUX_uxn_opcodes_h_l1769_c2_5427_iffalse,
n8_MUX_uxn_opcodes_h_l1769_c2_5427_return_output);

-- printf_uxn_opcodes_h_l1770_c3_f161_uxn_opcodes_h_l1770_c3_f161
printf_uxn_opcodes_h_l1770_c3_f161_uxn_opcodes_h_l1770_c3_f161 : entity work.printf_uxn_opcodes_h_l1770_c3_f161_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1770_c3_f161_uxn_opcodes_h_l1770_c3_f161_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1775_c11_63b0
BIN_OP_EQ_uxn_opcodes_h_l1775_c11_63b0 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1775_c11_63b0_left,
BIN_OP_EQ_uxn_opcodes_h_l1775_c11_63b0_right,
BIN_OP_EQ_uxn_opcodes_h_l1775_c11_63b0_return_output);

-- t8_MUX_uxn_opcodes_h_l1775_c7_c91e
t8_MUX_uxn_opcodes_h_l1775_c7_c91e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1775_c7_c91e_cond,
t8_MUX_uxn_opcodes_h_l1775_c7_c91e_iftrue,
t8_MUX_uxn_opcodes_h_l1775_c7_c91e_iffalse,
t8_MUX_uxn_opcodes_h_l1775_c7_c91e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_c91e
result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_c91e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_c91e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_c91e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_c91e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_c91e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1775_c7_c91e
result_stack_value_MUX_uxn_opcodes_h_l1775_c7_c91e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1775_c7_c91e_cond,
result_stack_value_MUX_uxn_opcodes_h_l1775_c7_c91e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1775_c7_c91e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1775_c7_c91e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_c91e
result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_c91e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_c91e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_c91e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_c91e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_c91e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_c91e
result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_c91e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_c91e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_c91e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_c91e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_c91e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_c91e
result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_c91e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_c91e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_c91e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_c91e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_c91e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_c91e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_c91e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_c91e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_c91e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_c91e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_c91e_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1775_c7_c91e
result_is_stack_read_MUX_uxn_opcodes_h_l1775_c7_c91e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1775_c7_c91e_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1775_c7_c91e_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1775_c7_c91e_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1775_c7_c91e_return_output);

-- n8_MUX_uxn_opcodes_h_l1775_c7_c91e
n8_MUX_uxn_opcodes_h_l1775_c7_c91e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1775_c7_c91e_cond,
n8_MUX_uxn_opcodes_h_l1775_c7_c91e_iftrue,
n8_MUX_uxn_opcodes_h_l1775_c7_c91e_iffalse,
n8_MUX_uxn_opcodes_h_l1775_c7_c91e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1778_c11_6322
BIN_OP_EQ_uxn_opcodes_h_l1778_c11_6322 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1778_c11_6322_left,
BIN_OP_EQ_uxn_opcodes_h_l1778_c11_6322_right,
BIN_OP_EQ_uxn_opcodes_h_l1778_c11_6322_return_output);

-- t8_MUX_uxn_opcodes_h_l1778_c7_4310
t8_MUX_uxn_opcodes_h_l1778_c7_4310 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1778_c7_4310_cond,
t8_MUX_uxn_opcodes_h_l1778_c7_4310_iftrue,
t8_MUX_uxn_opcodes_h_l1778_c7_4310_iffalse,
t8_MUX_uxn_opcodes_h_l1778_c7_4310_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1778_c7_4310
result_is_sp_shift_MUX_uxn_opcodes_h_l1778_c7_4310 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1778_c7_4310_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1778_c7_4310_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1778_c7_4310_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1778_c7_4310_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1778_c7_4310
result_stack_value_MUX_uxn_opcodes_h_l1778_c7_4310 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1778_c7_4310_cond,
result_stack_value_MUX_uxn_opcodes_h_l1778_c7_4310_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1778_c7_4310_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1778_c7_4310_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1778_c7_4310
result_sp_relative_shift_MUX_uxn_opcodes_h_l1778_c7_4310 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1778_c7_4310_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1778_c7_4310_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1778_c7_4310_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1778_c7_4310_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1778_c7_4310
result_is_stack_write_MUX_uxn_opcodes_h_l1778_c7_4310 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1778_c7_4310_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1778_c7_4310_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1778_c7_4310_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1778_c7_4310_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1778_c7_4310
result_is_opc_done_MUX_uxn_opcodes_h_l1778_c7_4310 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1778_c7_4310_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1778_c7_4310_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1778_c7_4310_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1778_c7_4310_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1778_c7_4310
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1778_c7_4310 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1778_c7_4310_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1778_c7_4310_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1778_c7_4310_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1778_c7_4310_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1778_c7_4310
result_is_stack_read_MUX_uxn_opcodes_h_l1778_c7_4310 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1778_c7_4310_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1778_c7_4310_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1778_c7_4310_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1778_c7_4310_return_output);

-- n8_MUX_uxn_opcodes_h_l1778_c7_4310
n8_MUX_uxn_opcodes_h_l1778_c7_4310 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1778_c7_4310_cond,
n8_MUX_uxn_opcodes_h_l1778_c7_4310_iftrue,
n8_MUX_uxn_opcodes_h_l1778_c7_4310_iffalse,
n8_MUX_uxn_opcodes_h_l1778_c7_4310_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1782_c11_844e
BIN_OP_EQ_uxn_opcodes_h_l1782_c11_844e : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1782_c11_844e_left,
BIN_OP_EQ_uxn_opcodes_h_l1782_c11_844e_right,
BIN_OP_EQ_uxn_opcodes_h_l1782_c11_844e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1782_c7_f895
result_is_sp_shift_MUX_uxn_opcodes_h_l1782_c7_f895 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1782_c7_f895_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1782_c7_f895_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1782_c7_f895_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1782_c7_f895_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1782_c7_f895
result_stack_value_MUX_uxn_opcodes_h_l1782_c7_f895 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1782_c7_f895_cond,
result_stack_value_MUX_uxn_opcodes_h_l1782_c7_f895_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1782_c7_f895_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1782_c7_f895_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1782_c7_f895
result_sp_relative_shift_MUX_uxn_opcodes_h_l1782_c7_f895 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1782_c7_f895_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1782_c7_f895_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1782_c7_f895_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1782_c7_f895_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1782_c7_f895
result_is_stack_write_MUX_uxn_opcodes_h_l1782_c7_f895 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1782_c7_f895_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1782_c7_f895_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1782_c7_f895_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1782_c7_f895_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_f895
result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_f895 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_f895_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_f895_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_f895_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_f895_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1782_c7_f895
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1782_c7_f895 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1782_c7_f895_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1782_c7_f895_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1782_c7_f895_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1782_c7_f895_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1782_c7_f895
result_is_stack_read_MUX_uxn_opcodes_h_l1782_c7_f895 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1782_c7_f895_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1782_c7_f895_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1782_c7_f895_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1782_c7_f895_return_output);

-- n8_MUX_uxn_opcodes_h_l1782_c7_f895
n8_MUX_uxn_opcodes_h_l1782_c7_f895 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1782_c7_f895_cond,
n8_MUX_uxn_opcodes_h_l1782_c7_f895_iftrue,
n8_MUX_uxn_opcodes_h_l1782_c7_f895_iffalse,
n8_MUX_uxn_opcodes_h_l1782_c7_f895_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1785_c11_1db8
BIN_OP_EQ_uxn_opcodes_h_l1785_c11_1db8 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1785_c11_1db8_left,
BIN_OP_EQ_uxn_opcodes_h_l1785_c11_1db8_right,
BIN_OP_EQ_uxn_opcodes_h_l1785_c11_1db8_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1785_c7_4760
result_is_sp_shift_MUX_uxn_opcodes_h_l1785_c7_4760 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1785_c7_4760_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1785_c7_4760_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1785_c7_4760_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1785_c7_4760_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1785_c7_4760
result_stack_value_MUX_uxn_opcodes_h_l1785_c7_4760 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1785_c7_4760_cond,
result_stack_value_MUX_uxn_opcodes_h_l1785_c7_4760_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1785_c7_4760_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1785_c7_4760_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_4760
result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_4760 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_4760_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_4760_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_4760_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_4760_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_4760
result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_4760 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_4760_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_4760_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_4760_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_4760_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_4760
result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_4760 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_4760_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_4760_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_4760_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_4760_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_4760
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_4760 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_4760_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_4760_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_4760_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_4760_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1785_c7_4760
result_is_stack_read_MUX_uxn_opcodes_h_l1785_c7_4760 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1785_c7_4760_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1785_c7_4760_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1785_c7_4760_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1785_c7_4760_return_output);

-- n8_MUX_uxn_opcodes_h_l1785_c7_4760
n8_MUX_uxn_opcodes_h_l1785_c7_4760 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1785_c7_4760_cond,
n8_MUX_uxn_opcodes_h_l1785_c7_4760_iftrue,
n8_MUX_uxn_opcodes_h_l1785_c7_4760_iffalse,
n8_MUX_uxn_opcodes_h_l1785_c7_4760_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1789_c32_cdaa
BIN_OP_AND_uxn_opcodes_h_l1789_c32_cdaa : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1789_c32_cdaa_left,
BIN_OP_AND_uxn_opcodes_h_l1789_c32_cdaa_right,
BIN_OP_AND_uxn_opcodes_h_l1789_c32_cdaa_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1789_c32_e368
BIN_OP_GT_uxn_opcodes_h_l1789_c32_e368 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1789_c32_e368_left,
BIN_OP_GT_uxn_opcodes_h_l1789_c32_e368_right,
BIN_OP_GT_uxn_opcodes_h_l1789_c32_e368_return_output);

-- MUX_uxn_opcodes_h_l1789_c32_c364
MUX_uxn_opcodes_h_l1789_c32_c364 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1789_c32_c364_cond,
MUX_uxn_opcodes_h_l1789_c32_c364_iftrue,
MUX_uxn_opcodes_h_l1789_c32_c364_iffalse,
MUX_uxn_opcodes_h_l1789_c32_c364_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1791_c11_a39e
BIN_OP_EQ_uxn_opcodes_h_l1791_c11_a39e : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1791_c11_a39e_left,
BIN_OP_EQ_uxn_opcodes_h_l1791_c11_a39e_right,
BIN_OP_EQ_uxn_opcodes_h_l1791_c11_a39e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1791_c7_4bac
result_is_sp_shift_MUX_uxn_opcodes_h_l1791_c7_4bac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1791_c7_4bac_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1791_c7_4bac_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1791_c7_4bac_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1791_c7_4bac_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1791_c7_4bac
result_stack_value_MUX_uxn_opcodes_h_l1791_c7_4bac : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1791_c7_4bac_cond,
result_stack_value_MUX_uxn_opcodes_h_l1791_c7_4bac_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1791_c7_4bac_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1791_c7_4bac_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1791_c7_4bac
result_is_opc_done_MUX_uxn_opcodes_h_l1791_c7_4bac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1791_c7_4bac_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1791_c7_4bac_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1791_c7_4bac_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1791_c7_4bac_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1791_c7_4bac
result_is_stack_write_MUX_uxn_opcodes_h_l1791_c7_4bac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1791_c7_4bac_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1791_c7_4bac_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1791_c7_4bac_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1791_c7_4bac_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1791_c7_4bac
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1791_c7_4bac : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1791_c7_4bac_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1791_c7_4bac_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1791_c7_4bac_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1791_c7_4bac_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1795_c24_1e37
BIN_OP_EQ_uxn_opcodes_h_l1795_c24_1e37 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1795_c24_1e37_left,
BIN_OP_EQ_uxn_opcodes_h_l1795_c24_1e37_right,
BIN_OP_EQ_uxn_opcodes_h_l1795_c24_1e37_return_output);

-- BIN_OP_DIV_uxn_opcodes_h_l1795_c38_25df
BIN_OP_DIV_uxn_opcodes_h_l1795_c38_25df : entity work.BIN_OP_DIV_uint8_t_uint8_t_0CLK_a148083c port map (
BIN_OP_DIV_uxn_opcodes_h_l1795_c38_25df_left,
BIN_OP_DIV_uxn_opcodes_h_l1795_c38_25df_right,
BIN_OP_DIV_uxn_opcodes_h_l1795_c38_25df_return_output);

-- MUX_uxn_opcodes_h_l1795_c24_8b22
MUX_uxn_opcodes_h_l1795_c24_8b22 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1795_c24_8b22_cond,
MUX_uxn_opcodes_h_l1795_c24_8b22_iftrue,
MUX_uxn_opcodes_h_l1795_c24_8b22_iffalse,
MUX_uxn_opcodes_h_l1795_c24_8b22_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1797_c11_ed46
BIN_OP_EQ_uxn_opcodes_h_l1797_c11_ed46 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1797_c11_ed46_left,
BIN_OP_EQ_uxn_opcodes_h_l1797_c11_ed46_right,
BIN_OP_EQ_uxn_opcodes_h_l1797_c11_ed46_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_d3ba
result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_d3ba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_d3ba_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_d3ba_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_d3ba_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_d3ba_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_d3ba
result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_d3ba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_d3ba_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_d3ba_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_d3ba_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_d3ba_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1769_c6_1d7e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1769_c1_4770_return_output,
 t8_MUX_uxn_opcodes_h_l1769_c2_5427_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1769_c2_5427_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1769_c2_5427_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1769_c2_5427_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1769_c2_5427_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1769_c2_5427_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1769_c2_5427_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1769_c2_5427_return_output,
 n8_MUX_uxn_opcodes_h_l1769_c2_5427_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1775_c11_63b0_return_output,
 t8_MUX_uxn_opcodes_h_l1775_c7_c91e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_c91e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1775_c7_c91e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_c91e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_c91e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_c91e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_c91e_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1775_c7_c91e_return_output,
 n8_MUX_uxn_opcodes_h_l1775_c7_c91e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1778_c11_6322_return_output,
 t8_MUX_uxn_opcodes_h_l1778_c7_4310_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1778_c7_4310_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1778_c7_4310_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1778_c7_4310_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1778_c7_4310_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1778_c7_4310_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1778_c7_4310_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1778_c7_4310_return_output,
 n8_MUX_uxn_opcodes_h_l1778_c7_4310_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1782_c11_844e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1782_c7_f895_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1782_c7_f895_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1782_c7_f895_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1782_c7_f895_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_f895_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1782_c7_f895_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1782_c7_f895_return_output,
 n8_MUX_uxn_opcodes_h_l1782_c7_f895_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1785_c11_1db8_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1785_c7_4760_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1785_c7_4760_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_4760_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_4760_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_4760_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_4760_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1785_c7_4760_return_output,
 n8_MUX_uxn_opcodes_h_l1785_c7_4760_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1789_c32_cdaa_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1789_c32_e368_return_output,
 MUX_uxn_opcodes_h_l1789_c32_c364_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1791_c11_a39e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1791_c7_4bac_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1791_c7_4bac_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1791_c7_4bac_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1791_c7_4bac_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1791_c7_4bac_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1795_c24_1e37_return_output,
 BIN_OP_DIV_uxn_opcodes_h_l1795_c38_25df_return_output,
 MUX_uxn_opcodes_h_l1795_c24_8b22_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1797_c11_ed46_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_d3ba_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_d3ba_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1769_c6_1d7e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1769_c6_1d7e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1769_c6_1d7e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1769_c1_4770_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1769_c1_4770_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1769_c1_4770_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1769_c1_4770_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1769_c2_5427_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1769_c2_5427_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1775_c7_c91e_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1769_c2_5427_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1769_c2_5427_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1769_c2_5427_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1769_c2_5427_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_c91e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1769_c2_5427_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1769_c2_5427_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1769_c2_5427_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1769_c2_5427_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1775_c7_c91e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1769_c2_5427_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1769_c2_5427_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1769_c2_5427_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1769_c2_5427_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_c91e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1769_c2_5427_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1769_c2_5427_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1769_c2_5427_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1769_c2_5427_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_c91e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1769_c2_5427_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1769_c2_5427_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1769_c2_5427_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1769_c2_5427_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_c91e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1769_c2_5427_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1769_c2_5427_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1769_c2_5427_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1772_c3_3437 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1769_c2_5427_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_c91e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1769_c2_5427_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1769_c2_5427_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1769_c2_5427_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1769_c2_5427_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1775_c7_c91e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1769_c2_5427_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1769_c2_5427_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1769_c2_5427_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1769_c2_5427_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1775_c7_c91e_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1769_c2_5427_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1769_c2_5427_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1770_c3_f161_uxn_opcodes_h_l1770_c3_f161_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1775_c11_63b0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1775_c11_63b0_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1775_c11_63b0_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1775_c7_c91e_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1775_c7_c91e_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1778_c7_4310_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1775_c7_c91e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_c91e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_c91e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1778_c7_4310_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_c91e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1775_c7_c91e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1775_c7_c91e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1778_c7_4310_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1775_c7_c91e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_c91e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_c91e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1778_c7_4310_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_c91e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_c91e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_c91e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1778_c7_4310_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_c91e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_c91e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_c91e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1778_c7_4310_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_c91e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_c91e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1776_c3_b4b6 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_c91e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1778_c7_4310_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_c91e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1775_c7_c91e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1775_c7_c91e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1778_c7_4310_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1775_c7_c91e_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1775_c7_c91e_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1775_c7_c91e_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1778_c7_4310_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1775_c7_c91e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1778_c11_6322_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1778_c11_6322_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1778_c11_6322_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1778_c7_4310_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1778_c7_4310_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1778_c7_4310_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1778_c7_4310_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1778_c7_4310_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1782_c7_f895_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1778_c7_4310_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1778_c7_4310_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1778_c7_4310_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1782_c7_f895_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1778_c7_4310_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1778_c7_4310_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1778_c7_4310_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1782_c7_f895_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1778_c7_4310_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1778_c7_4310_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1778_c7_4310_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1782_c7_f895_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1778_c7_4310_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1778_c7_4310_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1778_c7_4310_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_f895_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1778_c7_4310_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1778_c7_4310_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1780_c3_9460 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1778_c7_4310_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1782_c7_f895_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1778_c7_4310_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1778_c7_4310_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1778_c7_4310_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1782_c7_f895_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1778_c7_4310_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1778_c7_4310_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1778_c7_4310_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1782_c7_f895_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1778_c7_4310_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1782_c11_844e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1782_c11_844e_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1782_c11_844e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1782_c7_f895_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1782_c7_f895_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1785_c7_4760_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1782_c7_f895_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1782_c7_f895_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1782_c7_f895_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1785_c7_4760_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1782_c7_f895_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1782_c7_f895_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1782_c7_f895_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_4760_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1782_c7_f895_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1782_c7_f895_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1782_c7_f895_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_4760_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1782_c7_f895_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_f895_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_f895_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_4760_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_f895_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1782_c7_f895_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1783_c3_1e86 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1782_c7_f895_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_4760_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1782_c7_f895_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1782_c7_f895_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1782_c7_f895_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1785_c7_4760_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1782_c7_f895_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1782_c7_f895_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1782_c7_f895_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1785_c7_4760_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1782_c7_f895_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1785_c11_1db8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1785_c11_1db8_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1785_c11_1db8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1785_c7_4760_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1785_c7_4760_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1791_c7_4bac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1785_c7_4760_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1785_c7_4760_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1785_c7_4760_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1791_c7_4bac_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1785_c7_4760_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_4760_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_4760_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_4760_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_4760_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_4760_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1791_c7_4bac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_4760_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_4760_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_4760_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1791_c7_4bac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_4760_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_4760_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_4760_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1791_c7_4bac_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_4760_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1785_c7_4760_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1785_c7_4760_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1785_c7_4760_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1785_c7_4760_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1785_c7_4760_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1785_c7_4760_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1789_c32_c364_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1789_c32_c364_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1789_c32_c364_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1789_c32_cdaa_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1789_c32_cdaa_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1789_c32_cdaa_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1789_c32_e368_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1789_c32_e368_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1789_c32_e368_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1789_c32_c364_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1791_c11_a39e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1791_c11_a39e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1791_c11_a39e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1791_c7_4bac_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1791_c7_4bac_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1791_c7_4bac_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1791_c7_4bac_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1791_c7_4bac_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1791_c7_4bac_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1791_c7_4bac_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1791_c7_4bac_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_d3ba_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1791_c7_4bac_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1791_c7_4bac_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1791_c7_4bac_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_d3ba_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1791_c7_4bac_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1791_c7_4bac_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1794_c3_3436 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1791_c7_4bac_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1791_c7_4bac_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1795_c24_8b22_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1795_c24_8b22_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1795_c24_8b22_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1795_c24_1e37_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1795_c24_1e37_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1795_c24_1e37_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l1795_c38_25df_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l1795_c38_25df_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l1795_c38_25df_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1795_c24_8b22_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1797_c11_ed46_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1797_c11_ed46_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1797_c11_ed46_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_d3ba_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_d3ba_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_d3ba_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_d3ba_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_d3ba_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_d3ba_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1791_l1782_l1778_l1775_l1769_DUPLICATE_1155_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1791_l1785_l1782_l1778_l1775_l1769_DUPLICATE_d419_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1785_l1782_l1778_l1775_l1769_DUPLICATE_8ece_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1785_l1782_l1778_l1775_l1769_l1797_DUPLICATE_b443_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1791_l1785_l1782_l1778_l1775_l1797_DUPLICATE_f011_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1785_l1778_l1782_l1775_DUPLICATE_ea48_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1785_l1791_DUPLICATE_b4ae_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l1765_l1802_DUPLICATE_e8a3_return_output : opcode_result_t;
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
     VAR_BIN_OP_GT_uxn_opcodes_h_l1789_c32_e368_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1782_c11_844e_right := to_unsigned(3, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1769_c2_5427_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1772_c3_3437 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1769_c2_5427_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1772_c3_3437;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1769_c6_1d7e_right := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1785_c7_4760_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1769_c2_5427_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l1789_c32_c364_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1785_c7_4760_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1783_c3_1e86 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1782_c7_f895_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1783_c3_1e86;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1791_c11_a39e_right := to_unsigned(5, 3);
     VAR_MUX_uxn_opcodes_h_l1789_c32_c364_iffalse := resize(to_signed(-1, 2), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1776_c3_b4b6 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_c91e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1776_c3_b4b6;
     VAR_MUX_uxn_opcodes_h_l1795_c24_8b22_iftrue := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1789_c32_cdaa_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1797_c11_ed46_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1795_c24_1e37_right := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1769_c1_4770_iffalse := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_d3ba_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1791_c7_4bac_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1780_c3_9460 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1778_c7_4310_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1780_c3_9460;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1794_c3_3436 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1791_c7_4bac_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1794_c3_3436;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1775_c11_63b0_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1778_c11_6322_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1785_c11_1db8_right := to_unsigned(4, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1791_c7_4bac_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_d3ba_iftrue := to_unsigned(1, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1769_c1_4770_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1789_c32_cdaa_left := VAR_ins;
     VAR_BIN_OP_DIV_uxn_opcodes_h_l1795_c38_25df_left := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1769_c2_5427_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1775_c7_c91e_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1778_c7_4310_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1782_c7_f895_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1785_c7_4760_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1769_c6_1d7e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1775_c11_63b0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1778_c11_6322_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1782_c11_844e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1785_c11_1db8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1791_c11_a39e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1797_c11_ed46_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l1785_c7_4760_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1778_c7_4310_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_DIV_uxn_opcodes_h_l1795_c38_25df_right := t8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1795_c24_1e37_left := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1769_c2_5427_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1775_c7_c91e_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1778_c7_4310_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l1775_c11_63b0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1775_c11_63b0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1775_c11_63b0_left;
     BIN_OP_EQ_uxn_opcodes_h_l1775_c11_63b0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1775_c11_63b0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1775_c11_63b0_return_output := BIN_OP_EQ_uxn_opcodes_h_l1775_c11_63b0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1795_c24_1e37] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1795_c24_1e37_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1795_c24_1e37_left;
     BIN_OP_EQ_uxn_opcodes_h_l1795_c24_1e37_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1795_c24_1e37_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1795_c24_1e37_return_output := BIN_OP_EQ_uxn_opcodes_h_l1795_c24_1e37_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1785_c11_1db8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1785_c11_1db8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1785_c11_1db8_left;
     BIN_OP_EQ_uxn_opcodes_h_l1785_c11_1db8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1785_c11_1db8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1785_c11_1db8_return_output := BIN_OP_EQ_uxn_opcodes_h_l1785_c11_1db8_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1791_l1782_l1778_l1775_l1769_DUPLICATE_1155 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1791_l1782_l1778_l1775_l1769_DUPLICATE_1155_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1778_c11_6322] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1778_c11_6322_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1778_c11_6322_left;
     BIN_OP_EQ_uxn_opcodes_h_l1778_c11_6322_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1778_c11_6322_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1778_c11_6322_return_output := BIN_OP_EQ_uxn_opcodes_h_l1778_c11_6322_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1785_l1782_l1778_l1775_l1769_DUPLICATE_8ece LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1785_l1782_l1778_l1775_l1769_DUPLICATE_8ece_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1791_l1785_l1782_l1778_l1775_l1797_DUPLICATE_f011 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1791_l1785_l1782_l1778_l1775_l1797_DUPLICATE_f011_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1785_l1791_DUPLICATE_b4ae LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1785_l1791_DUPLICATE_b4ae_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1785_l1782_l1778_l1775_l1769_l1797_DUPLICATE_b443 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1785_l1782_l1778_l1775_l1769_l1797_DUPLICATE_b443_return_output := result.is_stack_write;

     -- BIN_OP_DIV[uxn_opcodes_h_l1795_c38_25df] LATENCY=0
     -- Inputs
     BIN_OP_DIV_uxn_opcodes_h_l1795_c38_25df_left <= VAR_BIN_OP_DIV_uxn_opcodes_h_l1795_c38_25df_left;
     BIN_OP_DIV_uxn_opcodes_h_l1795_c38_25df_right <= VAR_BIN_OP_DIV_uxn_opcodes_h_l1795_c38_25df_right;
     -- Outputs
     VAR_BIN_OP_DIV_uxn_opcodes_h_l1795_c38_25df_return_output := BIN_OP_DIV_uxn_opcodes_h_l1795_c38_25df_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1797_c11_ed46] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1797_c11_ed46_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1797_c11_ed46_left;
     BIN_OP_EQ_uxn_opcodes_h_l1797_c11_ed46_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1797_c11_ed46_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1797_c11_ed46_return_output := BIN_OP_EQ_uxn_opcodes_h_l1797_c11_ed46_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l1789_c32_cdaa] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1789_c32_cdaa_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1789_c32_cdaa_left;
     BIN_OP_AND_uxn_opcodes_h_l1789_c32_cdaa_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1789_c32_cdaa_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1789_c32_cdaa_return_output := BIN_OP_AND_uxn_opcodes_h_l1789_c32_cdaa_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1782_c11_844e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1782_c11_844e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1782_c11_844e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1782_c11_844e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1782_c11_844e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1782_c11_844e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1782_c11_844e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1769_c6_1d7e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1769_c6_1d7e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1769_c6_1d7e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1769_c6_1d7e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1769_c6_1d7e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1769_c6_1d7e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1769_c6_1d7e_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1791_l1785_l1782_l1778_l1775_l1769_DUPLICATE_d419 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1791_l1785_l1782_l1778_l1775_l1769_DUPLICATE_d419_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1791_c11_a39e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1791_c11_a39e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1791_c11_a39e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1791_c11_a39e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1791_c11_a39e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1791_c11_a39e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1791_c11_a39e_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1785_l1778_l1782_l1775_DUPLICATE_ea48 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1785_l1778_l1782_l1775_DUPLICATE_ea48_return_output := result.is_stack_read;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1789_c32_e368_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1789_c32_cdaa_return_output;
     VAR_MUX_uxn_opcodes_h_l1795_c24_8b22_iffalse := VAR_BIN_OP_DIV_uxn_opcodes_h_l1795_c38_25df_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1769_c1_4770_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1769_c6_1d7e_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1769_c2_5427_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1769_c6_1d7e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1769_c2_5427_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1769_c6_1d7e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1769_c2_5427_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1769_c6_1d7e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1769_c2_5427_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1769_c6_1d7e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1769_c2_5427_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1769_c6_1d7e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1769_c2_5427_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1769_c6_1d7e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1769_c2_5427_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1769_c6_1d7e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1769_c2_5427_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1769_c6_1d7e_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1769_c2_5427_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1769_c6_1d7e_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1775_c7_c91e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1775_c11_63b0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_c91e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1775_c11_63b0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_c91e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1775_c11_63b0_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1775_c7_c91e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1775_c11_63b0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_c91e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1775_c11_63b0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_c91e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1775_c11_63b0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_c91e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1775_c11_63b0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1775_c7_c91e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1775_c11_63b0_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1775_c7_c91e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1775_c11_63b0_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1778_c7_4310_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1778_c11_6322_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1778_c7_4310_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1778_c11_6322_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1778_c7_4310_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1778_c11_6322_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1778_c7_4310_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1778_c11_6322_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1778_c7_4310_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1778_c11_6322_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1778_c7_4310_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1778_c11_6322_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1778_c7_4310_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1778_c11_6322_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1778_c7_4310_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1778_c11_6322_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1778_c7_4310_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1778_c11_6322_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1782_c7_f895_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1782_c11_844e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_f895_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1782_c11_844e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1782_c7_f895_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1782_c11_844e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1782_c7_f895_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1782_c11_844e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1782_c7_f895_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1782_c11_844e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1782_c7_f895_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1782_c11_844e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1782_c7_f895_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1782_c11_844e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1782_c7_f895_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1782_c11_844e_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1785_c7_4760_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1785_c11_1db8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_4760_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1785_c11_1db8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1785_c7_4760_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1785_c11_1db8_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1785_c7_4760_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1785_c11_1db8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_4760_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1785_c11_1db8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_4760_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1785_c11_1db8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_4760_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1785_c11_1db8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1785_c7_4760_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1785_c11_1db8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1791_c7_4bac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1791_c11_a39e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1791_c7_4bac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1791_c11_a39e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1791_c7_4bac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1791_c11_a39e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1791_c7_4bac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1791_c11_a39e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1791_c7_4bac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1791_c11_a39e_return_output;
     VAR_MUX_uxn_opcodes_h_l1795_c24_8b22_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1795_c24_1e37_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_d3ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1797_c11_ed46_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_d3ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1797_c11_ed46_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1769_c2_5427_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1785_l1782_l1778_l1775_l1769_DUPLICATE_8ece_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_c91e_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1785_l1782_l1778_l1775_l1769_DUPLICATE_8ece_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1778_c7_4310_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1785_l1782_l1778_l1775_l1769_DUPLICATE_8ece_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1782_c7_f895_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1785_l1782_l1778_l1775_l1769_DUPLICATE_8ece_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_4760_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1785_l1782_l1778_l1775_l1769_DUPLICATE_8ece_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_c91e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1791_l1785_l1782_l1778_l1775_l1797_DUPLICATE_f011_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1778_c7_4310_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1791_l1785_l1782_l1778_l1775_l1797_DUPLICATE_f011_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_f895_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1791_l1785_l1782_l1778_l1775_l1797_DUPLICATE_f011_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_4760_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1791_l1785_l1782_l1778_l1775_l1797_DUPLICATE_f011_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1791_c7_4bac_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1791_l1785_l1782_l1778_l1775_l1797_DUPLICATE_f011_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_d3ba_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1791_l1785_l1782_l1778_l1775_l1797_DUPLICATE_f011_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1769_c2_5427_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1791_l1782_l1778_l1775_l1769_DUPLICATE_1155_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_c91e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1791_l1782_l1778_l1775_l1769_DUPLICATE_1155_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1778_c7_4310_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1791_l1782_l1778_l1775_l1769_DUPLICATE_1155_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1782_c7_f895_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1791_l1782_l1778_l1775_l1769_DUPLICATE_1155_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1791_c7_4bac_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1791_l1782_l1778_l1775_l1769_DUPLICATE_1155_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1775_c7_c91e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1785_l1778_l1782_l1775_DUPLICATE_ea48_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1778_c7_4310_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1785_l1778_l1782_l1775_DUPLICATE_ea48_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1782_c7_f895_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1785_l1778_l1782_l1775_DUPLICATE_ea48_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1785_c7_4760_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1785_l1778_l1782_l1775_DUPLICATE_ea48_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1769_c2_5427_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1785_l1782_l1778_l1775_l1769_l1797_DUPLICATE_b443_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_c91e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1785_l1782_l1778_l1775_l1769_l1797_DUPLICATE_b443_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1778_c7_4310_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1785_l1782_l1778_l1775_l1769_l1797_DUPLICATE_b443_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1782_c7_f895_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1785_l1782_l1778_l1775_l1769_l1797_DUPLICATE_b443_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_4760_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1785_l1782_l1778_l1775_l1769_l1797_DUPLICATE_b443_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_d3ba_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1785_l1782_l1778_l1775_l1769_l1797_DUPLICATE_b443_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_4760_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1785_l1791_DUPLICATE_b4ae_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1791_c7_4bac_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1785_l1791_DUPLICATE_b4ae_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1769_c2_5427_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1791_l1785_l1782_l1778_l1775_l1769_DUPLICATE_d419_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1775_c7_c91e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1791_l1785_l1782_l1778_l1775_l1769_DUPLICATE_d419_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1778_c7_4310_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1791_l1785_l1782_l1778_l1775_l1769_DUPLICATE_d419_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1782_c7_f895_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1791_l1785_l1782_l1778_l1775_l1769_DUPLICATE_d419_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1785_c7_4760_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1791_l1785_l1782_l1778_l1775_l1769_DUPLICATE_d419_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1791_c7_4bac_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1791_l1785_l1782_l1778_l1775_l1769_DUPLICATE_d419_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1797_c7_d3ba] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_d3ba_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_d3ba_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_d3ba_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_d3ba_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_d3ba_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_d3ba_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_d3ba_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_d3ba_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1789_c32_e368] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1789_c32_e368_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1789_c32_e368_left;
     BIN_OP_GT_uxn_opcodes_h_l1789_c32_e368_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1789_c32_e368_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1789_c32_e368_return_output := BIN_OP_GT_uxn_opcodes_h_l1789_c32_e368_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1769_c1_4770] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1769_c1_4770_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1769_c1_4770_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1769_c1_4770_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1769_c1_4770_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1769_c1_4770_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1769_c1_4770_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1769_c1_4770_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1769_c1_4770_return_output;

     -- t8_MUX[uxn_opcodes_h_l1778_c7_4310] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1778_c7_4310_cond <= VAR_t8_MUX_uxn_opcodes_h_l1778_c7_4310_cond;
     t8_MUX_uxn_opcodes_h_l1778_c7_4310_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1778_c7_4310_iftrue;
     t8_MUX_uxn_opcodes_h_l1778_c7_4310_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1778_c7_4310_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1778_c7_4310_return_output := t8_MUX_uxn_opcodes_h_l1778_c7_4310_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1791_c7_4bac] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1791_c7_4bac_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1791_c7_4bac_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1791_c7_4bac_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1791_c7_4bac_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1791_c7_4bac_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1791_c7_4bac_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1791_c7_4bac_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1791_c7_4bac_return_output;

     -- MUX[uxn_opcodes_h_l1795_c24_8b22] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1795_c24_8b22_cond <= VAR_MUX_uxn_opcodes_h_l1795_c24_8b22_cond;
     MUX_uxn_opcodes_h_l1795_c24_8b22_iftrue <= VAR_MUX_uxn_opcodes_h_l1795_c24_8b22_iftrue;
     MUX_uxn_opcodes_h_l1795_c24_8b22_iffalse <= VAR_MUX_uxn_opcodes_h_l1795_c24_8b22_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1795_c24_8b22_return_output := MUX_uxn_opcodes_h_l1795_c24_8b22_return_output;

     -- n8_MUX[uxn_opcodes_h_l1785_c7_4760] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1785_c7_4760_cond <= VAR_n8_MUX_uxn_opcodes_h_l1785_c7_4760_cond;
     n8_MUX_uxn_opcodes_h_l1785_c7_4760_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1785_c7_4760_iftrue;
     n8_MUX_uxn_opcodes_h_l1785_c7_4760_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1785_c7_4760_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1785_c7_4760_return_output := n8_MUX_uxn_opcodes_h_l1785_c7_4760_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1791_c7_4bac] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1791_c7_4bac_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1791_c7_4bac_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1791_c7_4bac_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1791_c7_4bac_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1791_c7_4bac_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1791_c7_4bac_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1791_c7_4bac_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1791_c7_4bac_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1797_c7_d3ba] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_d3ba_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_d3ba_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_d3ba_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_d3ba_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_d3ba_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_d3ba_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_d3ba_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_d3ba_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1785_c7_4760] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1785_c7_4760_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1785_c7_4760_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1785_c7_4760_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1785_c7_4760_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1785_c7_4760_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1785_c7_4760_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1785_c7_4760_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1785_c7_4760_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1789_c32_c364_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1789_c32_e368_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1791_c7_4bac_iftrue := VAR_MUX_uxn_opcodes_h_l1795_c24_8b22_return_output;
     VAR_printf_uxn_opcodes_h_l1770_c3_f161_uxn_opcodes_h_l1770_c3_f161_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1769_c1_4770_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1782_c7_f895_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1785_c7_4760_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1791_c7_4bac_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_d3ba_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1785_c7_4760_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1791_c7_4bac_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1782_c7_f895_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1785_c7_4760_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1791_c7_4bac_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_d3ba_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_4760_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1791_c7_4bac_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1775_c7_c91e_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1778_c7_4310_return_output;
     -- t8_MUX[uxn_opcodes_h_l1775_c7_c91e] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1775_c7_c91e_cond <= VAR_t8_MUX_uxn_opcodes_h_l1775_c7_c91e_cond;
     t8_MUX_uxn_opcodes_h_l1775_c7_c91e_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1775_c7_c91e_iftrue;
     t8_MUX_uxn_opcodes_h_l1775_c7_c91e_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1775_c7_c91e_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1775_c7_c91e_return_output := t8_MUX_uxn_opcodes_h_l1775_c7_c91e_return_output;

     -- printf_uxn_opcodes_h_l1770_c3_f161[uxn_opcodes_h_l1770_c3_f161] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1770_c3_f161_uxn_opcodes_h_l1770_c3_f161_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1770_c3_f161_uxn_opcodes_h_l1770_c3_f161_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- n8_MUX[uxn_opcodes_h_l1782_c7_f895] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1782_c7_f895_cond <= VAR_n8_MUX_uxn_opcodes_h_l1782_c7_f895_cond;
     n8_MUX_uxn_opcodes_h_l1782_c7_f895_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1782_c7_f895_iftrue;
     n8_MUX_uxn_opcodes_h_l1782_c7_f895_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1782_c7_f895_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1782_c7_f895_return_output := n8_MUX_uxn_opcodes_h_l1782_c7_f895_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1785_c7_4760] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_4760_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_4760_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_4760_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_4760_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_4760_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_4760_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_4760_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_4760_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1782_c7_f895] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1782_c7_f895_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1782_c7_f895_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1782_c7_f895_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1782_c7_f895_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1782_c7_f895_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1782_c7_f895_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1782_c7_f895_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1782_c7_f895_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1791_c7_4bac] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1791_c7_4bac_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1791_c7_4bac_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1791_c7_4bac_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1791_c7_4bac_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1791_c7_4bac_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1791_c7_4bac_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1791_c7_4bac_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1791_c7_4bac_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1791_c7_4bac] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1791_c7_4bac_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1791_c7_4bac_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1791_c7_4bac_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1791_c7_4bac_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1791_c7_4bac_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1791_c7_4bac_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1791_c7_4bac_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1791_c7_4bac_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1791_c7_4bac] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1791_c7_4bac_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1791_c7_4bac_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1791_c7_4bac_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1791_c7_4bac_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1791_c7_4bac_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1791_c7_4bac_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1791_c7_4bac_return_output := result_stack_value_MUX_uxn_opcodes_h_l1791_c7_4bac_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1785_c7_4760] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1785_c7_4760_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1785_c7_4760_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1785_c7_4760_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1785_c7_4760_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1785_c7_4760_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1785_c7_4760_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1785_c7_4760_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1785_c7_4760_return_output;

     -- MUX[uxn_opcodes_h_l1789_c32_c364] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1789_c32_c364_cond <= VAR_MUX_uxn_opcodes_h_l1789_c32_c364_cond;
     MUX_uxn_opcodes_h_l1789_c32_c364_iftrue <= VAR_MUX_uxn_opcodes_h_l1789_c32_c364_iftrue;
     MUX_uxn_opcodes_h_l1789_c32_c364_iffalse <= VAR_MUX_uxn_opcodes_h_l1789_c32_c364_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1789_c32_c364_return_output := MUX_uxn_opcodes_h_l1789_c32_c364_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_4760_iftrue := VAR_MUX_uxn_opcodes_h_l1789_c32_c364_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1778_c7_4310_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1782_c7_f895_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_4760_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1791_c7_4bac_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1782_c7_f895_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1785_c7_4760_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1778_c7_4310_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1782_c7_f895_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_4760_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1791_c7_4bac_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1782_c7_f895_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_4760_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1785_c7_4760_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1791_c7_4bac_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1769_c2_5427_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1775_c7_c91e_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1785_c7_4760] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_4760_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_4760_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_4760_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_4760_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_4760_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_4760_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_4760_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_4760_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1785_c7_4760] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1785_c7_4760_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1785_c7_4760_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1785_c7_4760_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1785_c7_4760_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1785_c7_4760_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1785_c7_4760_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1785_c7_4760_return_output := result_stack_value_MUX_uxn_opcodes_h_l1785_c7_4760_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1782_c7_f895] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1782_c7_f895_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1782_c7_f895_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1782_c7_f895_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1782_c7_f895_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1782_c7_f895_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1782_c7_f895_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1782_c7_f895_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1782_c7_f895_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1785_c7_4760] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_4760_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_4760_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_4760_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_4760_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_4760_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_4760_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_4760_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_4760_return_output;

     -- n8_MUX[uxn_opcodes_h_l1778_c7_4310] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1778_c7_4310_cond <= VAR_n8_MUX_uxn_opcodes_h_l1778_c7_4310_cond;
     n8_MUX_uxn_opcodes_h_l1778_c7_4310_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1778_c7_4310_iftrue;
     n8_MUX_uxn_opcodes_h_l1778_c7_4310_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1778_c7_4310_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1778_c7_4310_return_output := n8_MUX_uxn_opcodes_h_l1778_c7_4310_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1785_c7_4760] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_4760_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_4760_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_4760_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_4760_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_4760_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_4760_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_4760_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_4760_return_output;

     -- t8_MUX[uxn_opcodes_h_l1769_c2_5427] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1769_c2_5427_cond <= VAR_t8_MUX_uxn_opcodes_h_l1769_c2_5427_cond;
     t8_MUX_uxn_opcodes_h_l1769_c2_5427_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1769_c2_5427_iftrue;
     t8_MUX_uxn_opcodes_h_l1769_c2_5427_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1769_c2_5427_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1769_c2_5427_return_output := t8_MUX_uxn_opcodes_h_l1769_c2_5427_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1782_c7_f895] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1782_c7_f895_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1782_c7_f895_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1782_c7_f895_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1782_c7_f895_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1782_c7_f895_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1782_c7_f895_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1782_c7_f895_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1782_c7_f895_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1778_c7_4310] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1778_c7_4310_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1778_c7_4310_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1778_c7_4310_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1778_c7_4310_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1778_c7_4310_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1778_c7_4310_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1778_c7_4310_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1778_c7_4310_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l1775_c7_c91e_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1778_c7_4310_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_f895_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_4760_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1778_c7_4310_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1782_c7_f895_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1775_c7_c91e_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1778_c7_4310_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1782_c7_f895_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_4760_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1782_c7_f895_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_4760_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1778_c7_4310_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1782_c7_f895_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1782_c7_f895_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1785_c7_4760_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1769_c2_5427_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l1775_c7_c91e] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1775_c7_c91e_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1775_c7_c91e_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1775_c7_c91e_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1775_c7_c91e_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1775_c7_c91e_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1775_c7_c91e_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1775_c7_c91e_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1775_c7_c91e_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1782_c7_f895] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1782_c7_f895_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1782_c7_f895_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1782_c7_f895_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1782_c7_f895_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1782_c7_f895_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1782_c7_f895_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1782_c7_f895_return_output := result_stack_value_MUX_uxn_opcodes_h_l1782_c7_f895_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1782_c7_f895] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1782_c7_f895_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1782_c7_f895_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1782_c7_f895_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1782_c7_f895_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1782_c7_f895_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1782_c7_f895_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1782_c7_f895_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1782_c7_f895_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1782_c7_f895] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_f895_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_f895_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_f895_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_f895_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_f895_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_f895_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_f895_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_f895_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1782_c7_f895] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1782_c7_f895_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1782_c7_f895_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1782_c7_f895_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1782_c7_f895_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1782_c7_f895_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1782_c7_f895_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1782_c7_f895_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1782_c7_f895_return_output;

     -- n8_MUX[uxn_opcodes_h_l1775_c7_c91e] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1775_c7_c91e_cond <= VAR_n8_MUX_uxn_opcodes_h_l1775_c7_c91e_cond;
     n8_MUX_uxn_opcodes_h_l1775_c7_c91e_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1775_c7_c91e_iftrue;
     n8_MUX_uxn_opcodes_h_l1775_c7_c91e_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1775_c7_c91e_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1775_c7_c91e_return_output := n8_MUX_uxn_opcodes_h_l1775_c7_c91e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1778_c7_4310] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1778_c7_4310_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1778_c7_4310_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1778_c7_4310_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1778_c7_4310_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1778_c7_4310_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1778_c7_4310_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1778_c7_4310_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1778_c7_4310_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1778_c7_4310] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1778_c7_4310_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1778_c7_4310_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1778_c7_4310_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1778_c7_4310_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1778_c7_4310_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1778_c7_4310_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1778_c7_4310_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1778_c7_4310_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l1769_c2_5427_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1775_c7_c91e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1778_c7_4310_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_f895_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_c91e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1778_c7_4310_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1769_c2_5427_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1775_c7_c91e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1778_c7_4310_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1782_c7_f895_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1778_c7_4310_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1782_c7_f895_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_c91e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1778_c7_4310_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1778_c7_4310_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1782_c7_f895_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1778_c7_4310] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1778_c7_4310_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1778_c7_4310_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1778_c7_4310_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1778_c7_4310_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1778_c7_4310_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1778_c7_4310_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1778_c7_4310_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1778_c7_4310_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1778_c7_4310] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1778_c7_4310_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1778_c7_4310_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1778_c7_4310_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1778_c7_4310_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1778_c7_4310_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1778_c7_4310_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1778_c7_4310_return_output := result_stack_value_MUX_uxn_opcodes_h_l1778_c7_4310_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1769_c2_5427] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1769_c2_5427_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1769_c2_5427_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1769_c2_5427_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1769_c2_5427_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1769_c2_5427_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1769_c2_5427_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1769_c2_5427_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1769_c2_5427_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1775_c7_c91e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_c91e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_c91e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_c91e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_c91e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_c91e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_c91e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_c91e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_c91e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1778_c7_4310] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1778_c7_4310_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1778_c7_4310_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1778_c7_4310_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1778_c7_4310_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1778_c7_4310_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1778_c7_4310_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1778_c7_4310_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1778_c7_4310_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1778_c7_4310] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1778_c7_4310_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1778_c7_4310_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1778_c7_4310_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1778_c7_4310_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1778_c7_4310_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1778_c7_4310_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1778_c7_4310_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1778_c7_4310_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1775_c7_c91e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_c91e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_c91e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_c91e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_c91e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_c91e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_c91e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_c91e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_c91e_return_output;

     -- n8_MUX[uxn_opcodes_h_l1769_c2_5427] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1769_c2_5427_cond <= VAR_n8_MUX_uxn_opcodes_h_l1769_c2_5427_cond;
     n8_MUX_uxn_opcodes_h_l1769_c2_5427_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1769_c2_5427_iftrue;
     n8_MUX_uxn_opcodes_h_l1769_c2_5427_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1769_c2_5427_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1769_c2_5427_return_output := n8_MUX_uxn_opcodes_h_l1769_c2_5427_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l1769_c2_5427_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_c91e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1778_c7_4310_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1769_c2_5427_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_c91e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_c91e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1778_c7_4310_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_c91e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1778_c7_4310_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1769_c2_5427_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_c91e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1775_c7_c91e_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1778_c7_4310_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1775_c7_c91e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_c91e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_c91e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_c91e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_c91e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_c91e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_c91e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_c91e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_c91e_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1775_c7_c91e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1775_c7_c91e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1775_c7_c91e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1775_c7_c91e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1775_c7_c91e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1775_c7_c91e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1775_c7_c91e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1775_c7_c91e_return_output := result_stack_value_MUX_uxn_opcodes_h_l1775_c7_c91e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1775_c7_c91e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_c91e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_c91e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_c91e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_c91e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_c91e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_c91e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_c91e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_c91e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1769_c2_5427] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1769_c2_5427_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1769_c2_5427_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1769_c2_5427_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1769_c2_5427_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1769_c2_5427_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1769_c2_5427_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1769_c2_5427_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1769_c2_5427_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1769_c2_5427] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1769_c2_5427_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1769_c2_5427_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1769_c2_5427_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1769_c2_5427_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1769_c2_5427_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1769_c2_5427_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1769_c2_5427_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1769_c2_5427_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1775_c7_c91e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_c91e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_c91e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_c91e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_c91e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_c91e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_c91e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_c91e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_c91e_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1769_c2_5427_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_c91e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1769_c2_5427_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_c91e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1769_c2_5427_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_c91e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1769_c2_5427_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1775_c7_c91e_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1769_c2_5427] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1769_c2_5427_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1769_c2_5427_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1769_c2_5427_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1769_c2_5427_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1769_c2_5427_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1769_c2_5427_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1769_c2_5427_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1769_c2_5427_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1769_c2_5427] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1769_c2_5427_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1769_c2_5427_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1769_c2_5427_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1769_c2_5427_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1769_c2_5427_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1769_c2_5427_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1769_c2_5427_return_output := result_stack_value_MUX_uxn_opcodes_h_l1769_c2_5427_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1769_c2_5427] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1769_c2_5427_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1769_c2_5427_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1769_c2_5427_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1769_c2_5427_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1769_c2_5427_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1769_c2_5427_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1769_c2_5427_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1769_c2_5427_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1769_c2_5427] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1769_c2_5427_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1769_c2_5427_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1769_c2_5427_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1769_c2_5427_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1769_c2_5427_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1769_c2_5427_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1769_c2_5427_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1769_c2_5427_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l1765_l1802_DUPLICATE_e8a3 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l1765_l1802_DUPLICATE_e8a3_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_e56b(
     result,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1769_c2_5427_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1769_c2_5427_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1769_c2_5427_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1769_c2_5427_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1769_c2_5427_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1769_c2_5427_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1769_c2_5427_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l1765_l1802_DUPLICATE_e8a3_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l1765_l1802_DUPLICATE_e8a3_return_output;
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
