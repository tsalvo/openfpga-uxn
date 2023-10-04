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
entity nip2_0CLK_50a1b8d0 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end nip2_0CLK_50a1b8d0;
architecture arch of nip2_0CLK_50a1b8d0 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1903_c6_6cbd]
signal BIN_OP_EQ_uxn_opcodes_h_l1903_c6_6cbd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1903_c6_6cbd_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1903_c6_6cbd_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1903_c1_b6d0]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1903_c1_b6d0_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1903_c1_b6d0_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1903_c1_b6d0_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1903_c1_b6d0_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1903_c2_8e9e]
signal t16_MUX_uxn_opcodes_h_l1903_c2_8e9e_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1903_c2_8e9e_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1903_c2_8e9e_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1903_c2_8e9e_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1903_c2_8e9e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1903_c2_8e9e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1903_c2_8e9e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1903_c2_8e9e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1903_c2_8e9e_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1903_c2_8e9e]
signal result_stack_value_MUX_uxn_opcodes_h_l1903_c2_8e9e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1903_c2_8e9e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1903_c2_8e9e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1903_c2_8e9e_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1903_c2_8e9e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1903_c2_8e9e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1903_c2_8e9e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1903_c2_8e9e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1903_c2_8e9e_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1903_c2_8e9e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1903_c2_8e9e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1903_c2_8e9e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1903_c2_8e9e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1903_c2_8e9e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1903_c2_8e9e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1903_c2_8e9e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1903_c2_8e9e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1903_c2_8e9e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1903_c2_8e9e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1903_c2_8e9e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c2_8e9e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c2_8e9e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c2_8e9e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c2_8e9e_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1903_c2_8e9e]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1903_c2_8e9e_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1903_c2_8e9e_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1903_c2_8e9e_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1903_c2_8e9e_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l1904_c3_9339[uxn_opcodes_h_l1904_c3_9339]
signal printf_uxn_opcodes_h_l1904_c3_9339_uxn_opcodes_h_l1904_c3_9339_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1909_c11_7d84]
signal BIN_OP_EQ_uxn_opcodes_h_l1909_c11_7d84_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1909_c11_7d84_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1909_c11_7d84_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1909_c7_1e6c]
signal t16_MUX_uxn_opcodes_h_l1909_c7_1e6c_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1909_c7_1e6c_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1909_c7_1e6c_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1909_c7_1e6c_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1909_c7_1e6c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1909_c7_1e6c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1909_c7_1e6c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1909_c7_1e6c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1909_c7_1e6c_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1909_c7_1e6c]
signal result_stack_value_MUX_uxn_opcodes_h_l1909_c7_1e6c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1909_c7_1e6c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1909_c7_1e6c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1909_c7_1e6c_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1909_c7_1e6c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1909_c7_1e6c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1909_c7_1e6c_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1909_c7_1e6c_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1909_c7_1e6c_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1909_c7_1e6c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1909_c7_1e6c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1909_c7_1e6c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1909_c7_1e6c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1909_c7_1e6c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1909_c7_1e6c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1909_c7_1e6c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1909_c7_1e6c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1909_c7_1e6c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1909_c7_1e6c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1909_c7_1e6c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1909_c7_1e6c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1909_c7_1e6c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1909_c7_1e6c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1909_c7_1e6c_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1909_c7_1e6c]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1909_c7_1e6c_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1909_c7_1e6c_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1909_c7_1e6c_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1909_c7_1e6c_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1912_c11_946f]
signal BIN_OP_EQ_uxn_opcodes_h_l1912_c11_946f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1912_c11_946f_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1912_c11_946f_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1912_c7_4837]
signal t16_MUX_uxn_opcodes_h_l1912_c7_4837_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1912_c7_4837_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1912_c7_4837_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1912_c7_4837_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1912_c7_4837]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1912_c7_4837_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1912_c7_4837_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1912_c7_4837_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1912_c7_4837_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1912_c7_4837]
signal result_stack_value_MUX_uxn_opcodes_h_l1912_c7_4837_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1912_c7_4837_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1912_c7_4837_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1912_c7_4837_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1912_c7_4837]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1912_c7_4837_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1912_c7_4837_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1912_c7_4837_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1912_c7_4837_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1912_c7_4837]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1912_c7_4837_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1912_c7_4837_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1912_c7_4837_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1912_c7_4837_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1912_c7_4837]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1912_c7_4837_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1912_c7_4837_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1912_c7_4837_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1912_c7_4837_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1912_c7_4837]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1912_c7_4837_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1912_c7_4837_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1912_c7_4837_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1912_c7_4837_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1912_c7_4837]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1912_c7_4837_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1912_c7_4837_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1912_c7_4837_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1912_c7_4837_return_output : unsigned(0 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1914_c3_dc2d]
signal CONST_SL_8_uxn_opcodes_h_l1914_c3_dc2d_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1914_c3_dc2d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1917_c11_05b7]
signal BIN_OP_EQ_uxn_opcodes_h_l1917_c11_05b7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1917_c11_05b7_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1917_c11_05b7_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1917_c7_e581]
signal t16_MUX_uxn_opcodes_h_l1917_c7_e581_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1917_c7_e581_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1917_c7_e581_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1917_c7_e581_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1917_c7_e581]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1917_c7_e581_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1917_c7_e581_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1917_c7_e581_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1917_c7_e581_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1917_c7_e581]
signal result_stack_value_MUX_uxn_opcodes_h_l1917_c7_e581_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1917_c7_e581_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1917_c7_e581_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1917_c7_e581_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1917_c7_e581]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1917_c7_e581_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1917_c7_e581_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1917_c7_e581_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1917_c7_e581_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1917_c7_e581]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1917_c7_e581_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1917_c7_e581_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1917_c7_e581_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1917_c7_e581_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1917_c7_e581]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1917_c7_e581_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1917_c7_e581_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1917_c7_e581_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1917_c7_e581_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1917_c7_e581]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1917_c7_e581_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1917_c7_e581_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1917_c7_e581_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1917_c7_e581_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1917_c7_e581]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1917_c7_e581_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1917_c7_e581_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1917_c7_e581_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1917_c7_e581_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1920_c11_e4b6]
signal BIN_OP_EQ_uxn_opcodes_h_l1920_c11_e4b6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1920_c11_e4b6_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1920_c11_e4b6_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1920_c7_c4de]
signal t16_MUX_uxn_opcodes_h_l1920_c7_c4de_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1920_c7_c4de_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1920_c7_c4de_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1920_c7_c4de_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1920_c7_c4de]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1920_c7_c4de_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1920_c7_c4de_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1920_c7_c4de_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1920_c7_c4de_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1920_c7_c4de]
signal result_stack_value_MUX_uxn_opcodes_h_l1920_c7_c4de_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1920_c7_c4de_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1920_c7_c4de_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1920_c7_c4de_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1920_c7_c4de]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1920_c7_c4de_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1920_c7_c4de_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1920_c7_c4de_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1920_c7_c4de_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1920_c7_c4de]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1920_c7_c4de_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1920_c7_c4de_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1920_c7_c4de_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1920_c7_c4de_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1920_c7_c4de]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1920_c7_c4de_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1920_c7_c4de_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1920_c7_c4de_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1920_c7_c4de_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1920_c7_c4de]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1920_c7_c4de_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1920_c7_c4de_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1920_c7_c4de_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1920_c7_c4de_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1920_c7_c4de]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1920_c7_c4de_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1920_c7_c4de_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1920_c7_c4de_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1920_c7_c4de_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1921_c3_30a0]
signal BIN_OP_OR_uxn_opcodes_h_l1921_c3_30a0_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1921_c3_30a0_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1921_c3_30a0_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1924_c32_96a5]
signal BIN_OP_AND_uxn_opcodes_h_l1924_c32_96a5_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1924_c32_96a5_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1924_c32_96a5_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1924_c32_3b33]
signal BIN_OP_GT_uxn_opcodes_h_l1924_c32_3b33_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1924_c32_3b33_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1924_c32_3b33_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1924_c32_4358]
signal MUX_uxn_opcodes_h_l1924_c32_4358_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1924_c32_4358_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1924_c32_4358_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1924_c32_4358_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1926_c11_1389]
signal BIN_OP_EQ_uxn_opcodes_h_l1926_c11_1389_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1926_c11_1389_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1926_c11_1389_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1926_c7_bb61]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1926_c7_bb61_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1926_c7_bb61_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1926_c7_bb61_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1926_c7_bb61_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1926_c7_bb61]
signal result_stack_value_MUX_uxn_opcodes_h_l1926_c7_bb61_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1926_c7_bb61_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1926_c7_bb61_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1926_c7_bb61_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1926_c7_bb61]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1926_c7_bb61_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1926_c7_bb61_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1926_c7_bb61_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1926_c7_bb61_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1926_c7_bb61]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1926_c7_bb61_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1926_c7_bb61_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1926_c7_bb61_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1926_c7_bb61_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1926_c7_bb61]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1926_c7_bb61_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1926_c7_bb61_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1926_c7_bb61_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1926_c7_bb61_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1932_c11_9643]
signal BIN_OP_EQ_uxn_opcodes_h_l1932_c11_9643_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1932_c11_9643_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1932_c11_9643_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1932_c7_8b64]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1932_c7_8b64_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1932_c7_8b64_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1932_c7_8b64_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1932_c7_8b64_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1932_c7_8b64]
signal result_stack_value_MUX_uxn_opcodes_h_l1932_c7_8b64_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1932_c7_8b64_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1932_c7_8b64_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1932_c7_8b64_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1932_c7_8b64]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1932_c7_8b64_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1932_c7_8b64_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1932_c7_8b64_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1932_c7_8b64_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1932_c7_8b64]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1932_c7_8b64_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1932_c7_8b64_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1932_c7_8b64_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1932_c7_8b64_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1934_c34_689b]
signal CONST_SR_8_uxn_opcodes_h_l1934_c34_689b_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1934_c34_689b_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1936_c11_8627]
signal BIN_OP_EQ_uxn_opcodes_h_l1936_c11_8627_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1936_c11_8627_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1936_c11_8627_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1936_c7_e3ef]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_e3ef_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_e3ef_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_e3ef_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_e3ef_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1936_c7_e3ef]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_e3ef_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_e3ef_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_e3ef_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_e3ef_return_output : unsigned(0 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l1903_c6_6cbd
BIN_OP_EQ_uxn_opcodes_h_l1903_c6_6cbd : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1903_c6_6cbd_left,
BIN_OP_EQ_uxn_opcodes_h_l1903_c6_6cbd_right,
BIN_OP_EQ_uxn_opcodes_h_l1903_c6_6cbd_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1903_c1_b6d0
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1903_c1_b6d0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1903_c1_b6d0_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1903_c1_b6d0_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1903_c1_b6d0_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1903_c1_b6d0_return_output);

-- t16_MUX_uxn_opcodes_h_l1903_c2_8e9e
t16_MUX_uxn_opcodes_h_l1903_c2_8e9e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1903_c2_8e9e_cond,
t16_MUX_uxn_opcodes_h_l1903_c2_8e9e_iftrue,
t16_MUX_uxn_opcodes_h_l1903_c2_8e9e_iffalse,
t16_MUX_uxn_opcodes_h_l1903_c2_8e9e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1903_c2_8e9e
result_is_sp_shift_MUX_uxn_opcodes_h_l1903_c2_8e9e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1903_c2_8e9e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1903_c2_8e9e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1903_c2_8e9e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1903_c2_8e9e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1903_c2_8e9e
result_stack_value_MUX_uxn_opcodes_h_l1903_c2_8e9e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1903_c2_8e9e_cond,
result_stack_value_MUX_uxn_opcodes_h_l1903_c2_8e9e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1903_c2_8e9e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1903_c2_8e9e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1903_c2_8e9e
result_sp_relative_shift_MUX_uxn_opcodes_h_l1903_c2_8e9e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1903_c2_8e9e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1903_c2_8e9e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1903_c2_8e9e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1903_c2_8e9e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1903_c2_8e9e
result_is_stack_write_MUX_uxn_opcodes_h_l1903_c2_8e9e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1903_c2_8e9e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1903_c2_8e9e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1903_c2_8e9e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1903_c2_8e9e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1903_c2_8e9e
result_is_opc_done_MUX_uxn_opcodes_h_l1903_c2_8e9e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1903_c2_8e9e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1903_c2_8e9e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1903_c2_8e9e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1903_c2_8e9e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c2_8e9e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c2_8e9e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c2_8e9e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c2_8e9e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c2_8e9e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c2_8e9e_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1903_c2_8e9e
result_is_stack_read_MUX_uxn_opcodes_h_l1903_c2_8e9e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1903_c2_8e9e_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1903_c2_8e9e_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1903_c2_8e9e_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1903_c2_8e9e_return_output);

-- printf_uxn_opcodes_h_l1904_c3_9339_uxn_opcodes_h_l1904_c3_9339
printf_uxn_opcodes_h_l1904_c3_9339_uxn_opcodes_h_l1904_c3_9339 : entity work.printf_uxn_opcodes_h_l1904_c3_9339_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1904_c3_9339_uxn_opcodes_h_l1904_c3_9339_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1909_c11_7d84
BIN_OP_EQ_uxn_opcodes_h_l1909_c11_7d84 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1909_c11_7d84_left,
BIN_OP_EQ_uxn_opcodes_h_l1909_c11_7d84_right,
BIN_OP_EQ_uxn_opcodes_h_l1909_c11_7d84_return_output);

-- t16_MUX_uxn_opcodes_h_l1909_c7_1e6c
t16_MUX_uxn_opcodes_h_l1909_c7_1e6c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1909_c7_1e6c_cond,
t16_MUX_uxn_opcodes_h_l1909_c7_1e6c_iftrue,
t16_MUX_uxn_opcodes_h_l1909_c7_1e6c_iffalse,
t16_MUX_uxn_opcodes_h_l1909_c7_1e6c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1909_c7_1e6c
result_is_sp_shift_MUX_uxn_opcodes_h_l1909_c7_1e6c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1909_c7_1e6c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1909_c7_1e6c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1909_c7_1e6c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1909_c7_1e6c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1909_c7_1e6c
result_stack_value_MUX_uxn_opcodes_h_l1909_c7_1e6c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1909_c7_1e6c_cond,
result_stack_value_MUX_uxn_opcodes_h_l1909_c7_1e6c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1909_c7_1e6c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1909_c7_1e6c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1909_c7_1e6c
result_sp_relative_shift_MUX_uxn_opcodes_h_l1909_c7_1e6c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1909_c7_1e6c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1909_c7_1e6c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1909_c7_1e6c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1909_c7_1e6c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1909_c7_1e6c
result_is_stack_write_MUX_uxn_opcodes_h_l1909_c7_1e6c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1909_c7_1e6c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1909_c7_1e6c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1909_c7_1e6c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1909_c7_1e6c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1909_c7_1e6c
result_is_opc_done_MUX_uxn_opcodes_h_l1909_c7_1e6c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1909_c7_1e6c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1909_c7_1e6c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1909_c7_1e6c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1909_c7_1e6c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1909_c7_1e6c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1909_c7_1e6c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1909_c7_1e6c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1909_c7_1e6c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1909_c7_1e6c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1909_c7_1e6c_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1909_c7_1e6c
result_is_stack_read_MUX_uxn_opcodes_h_l1909_c7_1e6c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1909_c7_1e6c_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1909_c7_1e6c_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1909_c7_1e6c_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1909_c7_1e6c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1912_c11_946f
BIN_OP_EQ_uxn_opcodes_h_l1912_c11_946f : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1912_c11_946f_left,
BIN_OP_EQ_uxn_opcodes_h_l1912_c11_946f_right,
BIN_OP_EQ_uxn_opcodes_h_l1912_c11_946f_return_output);

-- t16_MUX_uxn_opcodes_h_l1912_c7_4837
t16_MUX_uxn_opcodes_h_l1912_c7_4837 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1912_c7_4837_cond,
t16_MUX_uxn_opcodes_h_l1912_c7_4837_iftrue,
t16_MUX_uxn_opcodes_h_l1912_c7_4837_iffalse,
t16_MUX_uxn_opcodes_h_l1912_c7_4837_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1912_c7_4837
result_is_sp_shift_MUX_uxn_opcodes_h_l1912_c7_4837 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1912_c7_4837_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1912_c7_4837_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1912_c7_4837_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1912_c7_4837_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1912_c7_4837
result_stack_value_MUX_uxn_opcodes_h_l1912_c7_4837 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1912_c7_4837_cond,
result_stack_value_MUX_uxn_opcodes_h_l1912_c7_4837_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1912_c7_4837_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1912_c7_4837_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1912_c7_4837
result_sp_relative_shift_MUX_uxn_opcodes_h_l1912_c7_4837 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1912_c7_4837_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1912_c7_4837_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1912_c7_4837_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1912_c7_4837_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1912_c7_4837
result_is_stack_write_MUX_uxn_opcodes_h_l1912_c7_4837 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1912_c7_4837_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1912_c7_4837_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1912_c7_4837_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1912_c7_4837_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1912_c7_4837
result_is_opc_done_MUX_uxn_opcodes_h_l1912_c7_4837 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1912_c7_4837_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1912_c7_4837_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1912_c7_4837_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1912_c7_4837_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1912_c7_4837
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1912_c7_4837 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1912_c7_4837_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1912_c7_4837_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1912_c7_4837_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1912_c7_4837_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1912_c7_4837
result_is_stack_read_MUX_uxn_opcodes_h_l1912_c7_4837 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1912_c7_4837_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1912_c7_4837_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1912_c7_4837_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1912_c7_4837_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1914_c3_dc2d
CONST_SL_8_uxn_opcodes_h_l1914_c3_dc2d : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1914_c3_dc2d_x,
CONST_SL_8_uxn_opcodes_h_l1914_c3_dc2d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1917_c11_05b7
BIN_OP_EQ_uxn_opcodes_h_l1917_c11_05b7 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1917_c11_05b7_left,
BIN_OP_EQ_uxn_opcodes_h_l1917_c11_05b7_right,
BIN_OP_EQ_uxn_opcodes_h_l1917_c11_05b7_return_output);

-- t16_MUX_uxn_opcodes_h_l1917_c7_e581
t16_MUX_uxn_opcodes_h_l1917_c7_e581 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1917_c7_e581_cond,
t16_MUX_uxn_opcodes_h_l1917_c7_e581_iftrue,
t16_MUX_uxn_opcodes_h_l1917_c7_e581_iffalse,
t16_MUX_uxn_opcodes_h_l1917_c7_e581_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1917_c7_e581
result_is_sp_shift_MUX_uxn_opcodes_h_l1917_c7_e581 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1917_c7_e581_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1917_c7_e581_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1917_c7_e581_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1917_c7_e581_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1917_c7_e581
result_stack_value_MUX_uxn_opcodes_h_l1917_c7_e581 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1917_c7_e581_cond,
result_stack_value_MUX_uxn_opcodes_h_l1917_c7_e581_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1917_c7_e581_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1917_c7_e581_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1917_c7_e581
result_sp_relative_shift_MUX_uxn_opcodes_h_l1917_c7_e581 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1917_c7_e581_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1917_c7_e581_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1917_c7_e581_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1917_c7_e581_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1917_c7_e581
result_is_stack_write_MUX_uxn_opcodes_h_l1917_c7_e581 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1917_c7_e581_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1917_c7_e581_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1917_c7_e581_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1917_c7_e581_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1917_c7_e581
result_is_opc_done_MUX_uxn_opcodes_h_l1917_c7_e581 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1917_c7_e581_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1917_c7_e581_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1917_c7_e581_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1917_c7_e581_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1917_c7_e581
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1917_c7_e581 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1917_c7_e581_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1917_c7_e581_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1917_c7_e581_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1917_c7_e581_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1917_c7_e581
result_is_stack_read_MUX_uxn_opcodes_h_l1917_c7_e581 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1917_c7_e581_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1917_c7_e581_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1917_c7_e581_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1917_c7_e581_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1920_c11_e4b6
BIN_OP_EQ_uxn_opcodes_h_l1920_c11_e4b6 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1920_c11_e4b6_left,
BIN_OP_EQ_uxn_opcodes_h_l1920_c11_e4b6_right,
BIN_OP_EQ_uxn_opcodes_h_l1920_c11_e4b6_return_output);

-- t16_MUX_uxn_opcodes_h_l1920_c7_c4de
t16_MUX_uxn_opcodes_h_l1920_c7_c4de : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1920_c7_c4de_cond,
t16_MUX_uxn_opcodes_h_l1920_c7_c4de_iftrue,
t16_MUX_uxn_opcodes_h_l1920_c7_c4de_iffalse,
t16_MUX_uxn_opcodes_h_l1920_c7_c4de_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1920_c7_c4de
result_is_sp_shift_MUX_uxn_opcodes_h_l1920_c7_c4de : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1920_c7_c4de_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1920_c7_c4de_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1920_c7_c4de_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1920_c7_c4de_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1920_c7_c4de
result_stack_value_MUX_uxn_opcodes_h_l1920_c7_c4de : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1920_c7_c4de_cond,
result_stack_value_MUX_uxn_opcodes_h_l1920_c7_c4de_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1920_c7_c4de_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1920_c7_c4de_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1920_c7_c4de
result_sp_relative_shift_MUX_uxn_opcodes_h_l1920_c7_c4de : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1920_c7_c4de_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1920_c7_c4de_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1920_c7_c4de_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1920_c7_c4de_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1920_c7_c4de
result_is_stack_write_MUX_uxn_opcodes_h_l1920_c7_c4de : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1920_c7_c4de_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1920_c7_c4de_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1920_c7_c4de_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1920_c7_c4de_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1920_c7_c4de
result_is_opc_done_MUX_uxn_opcodes_h_l1920_c7_c4de : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1920_c7_c4de_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1920_c7_c4de_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1920_c7_c4de_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1920_c7_c4de_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1920_c7_c4de
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1920_c7_c4de : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1920_c7_c4de_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1920_c7_c4de_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1920_c7_c4de_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1920_c7_c4de_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1920_c7_c4de
result_is_stack_read_MUX_uxn_opcodes_h_l1920_c7_c4de : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1920_c7_c4de_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1920_c7_c4de_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1920_c7_c4de_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1920_c7_c4de_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1921_c3_30a0
BIN_OP_OR_uxn_opcodes_h_l1921_c3_30a0 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1921_c3_30a0_left,
BIN_OP_OR_uxn_opcodes_h_l1921_c3_30a0_right,
BIN_OP_OR_uxn_opcodes_h_l1921_c3_30a0_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1924_c32_96a5
BIN_OP_AND_uxn_opcodes_h_l1924_c32_96a5 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1924_c32_96a5_left,
BIN_OP_AND_uxn_opcodes_h_l1924_c32_96a5_right,
BIN_OP_AND_uxn_opcodes_h_l1924_c32_96a5_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1924_c32_3b33
BIN_OP_GT_uxn_opcodes_h_l1924_c32_3b33 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1924_c32_3b33_left,
BIN_OP_GT_uxn_opcodes_h_l1924_c32_3b33_right,
BIN_OP_GT_uxn_opcodes_h_l1924_c32_3b33_return_output);

-- MUX_uxn_opcodes_h_l1924_c32_4358
MUX_uxn_opcodes_h_l1924_c32_4358 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1924_c32_4358_cond,
MUX_uxn_opcodes_h_l1924_c32_4358_iftrue,
MUX_uxn_opcodes_h_l1924_c32_4358_iffalse,
MUX_uxn_opcodes_h_l1924_c32_4358_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1926_c11_1389
BIN_OP_EQ_uxn_opcodes_h_l1926_c11_1389 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1926_c11_1389_left,
BIN_OP_EQ_uxn_opcodes_h_l1926_c11_1389_right,
BIN_OP_EQ_uxn_opcodes_h_l1926_c11_1389_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1926_c7_bb61
result_is_sp_shift_MUX_uxn_opcodes_h_l1926_c7_bb61 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1926_c7_bb61_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1926_c7_bb61_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1926_c7_bb61_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1926_c7_bb61_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1926_c7_bb61
result_stack_value_MUX_uxn_opcodes_h_l1926_c7_bb61 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1926_c7_bb61_cond,
result_stack_value_MUX_uxn_opcodes_h_l1926_c7_bb61_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1926_c7_bb61_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1926_c7_bb61_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1926_c7_bb61
result_is_opc_done_MUX_uxn_opcodes_h_l1926_c7_bb61 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1926_c7_bb61_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1926_c7_bb61_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1926_c7_bb61_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1926_c7_bb61_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1926_c7_bb61
result_is_stack_write_MUX_uxn_opcodes_h_l1926_c7_bb61 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1926_c7_bb61_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1926_c7_bb61_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1926_c7_bb61_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1926_c7_bb61_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1926_c7_bb61
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1926_c7_bb61 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1926_c7_bb61_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1926_c7_bb61_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1926_c7_bb61_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1926_c7_bb61_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1932_c11_9643
BIN_OP_EQ_uxn_opcodes_h_l1932_c11_9643 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1932_c11_9643_left,
BIN_OP_EQ_uxn_opcodes_h_l1932_c11_9643_right,
BIN_OP_EQ_uxn_opcodes_h_l1932_c11_9643_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1932_c7_8b64
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1932_c7_8b64 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1932_c7_8b64_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1932_c7_8b64_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1932_c7_8b64_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1932_c7_8b64_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1932_c7_8b64
result_stack_value_MUX_uxn_opcodes_h_l1932_c7_8b64 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1932_c7_8b64_cond,
result_stack_value_MUX_uxn_opcodes_h_l1932_c7_8b64_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1932_c7_8b64_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1932_c7_8b64_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1932_c7_8b64
result_is_opc_done_MUX_uxn_opcodes_h_l1932_c7_8b64 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1932_c7_8b64_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1932_c7_8b64_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1932_c7_8b64_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1932_c7_8b64_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1932_c7_8b64
result_is_stack_write_MUX_uxn_opcodes_h_l1932_c7_8b64 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1932_c7_8b64_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1932_c7_8b64_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1932_c7_8b64_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1932_c7_8b64_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1934_c34_689b
CONST_SR_8_uxn_opcodes_h_l1934_c34_689b : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1934_c34_689b_x,
CONST_SR_8_uxn_opcodes_h_l1934_c34_689b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1936_c11_8627
BIN_OP_EQ_uxn_opcodes_h_l1936_c11_8627 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1936_c11_8627_left,
BIN_OP_EQ_uxn_opcodes_h_l1936_c11_8627_right,
BIN_OP_EQ_uxn_opcodes_h_l1936_c11_8627_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_e3ef
result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_e3ef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_e3ef_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_e3ef_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_e3ef_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_e3ef_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_e3ef
result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_e3ef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_e3ef_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_e3ef_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_e3ef_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_e3ef_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1903_c6_6cbd_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1903_c1_b6d0_return_output,
 t16_MUX_uxn_opcodes_h_l1903_c2_8e9e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1903_c2_8e9e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1903_c2_8e9e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1903_c2_8e9e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1903_c2_8e9e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1903_c2_8e9e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c2_8e9e_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1903_c2_8e9e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1909_c11_7d84_return_output,
 t16_MUX_uxn_opcodes_h_l1909_c7_1e6c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1909_c7_1e6c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1909_c7_1e6c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1909_c7_1e6c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1909_c7_1e6c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1909_c7_1e6c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1909_c7_1e6c_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1909_c7_1e6c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1912_c11_946f_return_output,
 t16_MUX_uxn_opcodes_h_l1912_c7_4837_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1912_c7_4837_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1912_c7_4837_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1912_c7_4837_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1912_c7_4837_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1912_c7_4837_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1912_c7_4837_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1912_c7_4837_return_output,
 CONST_SL_8_uxn_opcodes_h_l1914_c3_dc2d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1917_c11_05b7_return_output,
 t16_MUX_uxn_opcodes_h_l1917_c7_e581_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1917_c7_e581_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1917_c7_e581_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1917_c7_e581_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1917_c7_e581_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1917_c7_e581_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1917_c7_e581_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1917_c7_e581_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1920_c11_e4b6_return_output,
 t16_MUX_uxn_opcodes_h_l1920_c7_c4de_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1920_c7_c4de_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1920_c7_c4de_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1920_c7_c4de_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1920_c7_c4de_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1920_c7_c4de_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1920_c7_c4de_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1920_c7_c4de_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1921_c3_30a0_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1924_c32_96a5_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1924_c32_3b33_return_output,
 MUX_uxn_opcodes_h_l1924_c32_4358_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1926_c11_1389_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1926_c7_bb61_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1926_c7_bb61_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1926_c7_bb61_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1926_c7_bb61_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1926_c7_bb61_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1932_c11_9643_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1932_c7_8b64_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1932_c7_8b64_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1932_c7_8b64_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1932_c7_8b64_return_output,
 CONST_SR_8_uxn_opcodes_h_l1934_c34_689b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1936_c11_8627_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_e3ef_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_e3ef_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1903_c6_6cbd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1903_c6_6cbd_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1903_c6_6cbd_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1903_c1_b6d0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1903_c1_b6d0_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1903_c1_b6d0_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1903_c1_b6d0_iffalse : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1903_c2_8e9e_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1903_c2_8e9e_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1909_c7_1e6c_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1903_c2_8e9e_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1903_c2_8e9e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1903_c2_8e9e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1903_c2_8e9e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1909_c7_1e6c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1903_c2_8e9e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1903_c2_8e9e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1903_c2_8e9e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1903_c2_8e9e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1909_c7_1e6c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1903_c2_8e9e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1903_c2_8e9e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1903_c2_8e9e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1903_c2_8e9e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1909_c7_1e6c_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1903_c2_8e9e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1903_c2_8e9e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1903_c2_8e9e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1903_c2_8e9e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1909_c7_1e6c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1903_c2_8e9e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1903_c2_8e9e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1903_c2_8e9e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1903_c2_8e9e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1909_c7_1e6c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1903_c2_8e9e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1903_c2_8e9e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c2_8e9e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1906_c3_0bc5 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c2_8e9e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1909_c7_1e6c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c2_8e9e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c2_8e9e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1903_c2_8e9e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1903_c2_8e9e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1909_c7_1e6c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1903_c2_8e9e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1903_c2_8e9e_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1904_c3_9339_uxn_opcodes_h_l1904_c3_9339_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1909_c11_7d84_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1909_c11_7d84_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1909_c11_7d84_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1909_c7_1e6c_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1909_c7_1e6c_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1912_c7_4837_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1909_c7_1e6c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1909_c7_1e6c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1909_c7_1e6c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1912_c7_4837_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1909_c7_1e6c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1909_c7_1e6c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1909_c7_1e6c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1912_c7_4837_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1909_c7_1e6c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1909_c7_1e6c_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1909_c7_1e6c_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1912_c7_4837_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1909_c7_1e6c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1909_c7_1e6c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1909_c7_1e6c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1912_c7_4837_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1909_c7_1e6c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1909_c7_1e6c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1909_c7_1e6c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1912_c7_4837_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1909_c7_1e6c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1909_c7_1e6c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1910_c3_ba57 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1909_c7_1e6c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1912_c7_4837_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1909_c7_1e6c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1909_c7_1e6c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1909_c7_1e6c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1912_c7_4837_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1909_c7_1e6c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1912_c11_946f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1912_c11_946f_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1912_c11_946f_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1912_c7_4837_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1912_c7_4837_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1917_c7_e581_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1912_c7_4837_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1912_c7_4837_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1912_c7_4837_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1917_c7_e581_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1912_c7_4837_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1912_c7_4837_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1912_c7_4837_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1917_c7_e581_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1912_c7_4837_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1912_c7_4837_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1912_c7_4837_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1917_c7_e581_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1912_c7_4837_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1912_c7_4837_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1912_c7_4837_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1917_c7_e581_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1912_c7_4837_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1912_c7_4837_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1912_c7_4837_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1917_c7_e581_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1912_c7_4837_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1912_c7_4837_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1915_c3_b7ea : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1912_c7_4837_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1917_c7_e581_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1912_c7_4837_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1912_c7_4837_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1912_c7_4837_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1917_c7_e581_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1912_c7_4837_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1914_c3_dc2d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1914_c3_dc2d_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1917_c11_05b7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1917_c11_05b7_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1917_c11_05b7_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1917_c7_e581_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1917_c7_e581_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1920_c7_c4de_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1917_c7_e581_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1917_c7_e581_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1917_c7_e581_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1920_c7_c4de_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1917_c7_e581_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1917_c7_e581_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1917_c7_e581_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1920_c7_c4de_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1917_c7_e581_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1917_c7_e581_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1917_c7_e581_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1920_c7_c4de_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1917_c7_e581_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1917_c7_e581_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1917_c7_e581_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1920_c7_c4de_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1917_c7_e581_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1917_c7_e581_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1917_c7_e581_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1920_c7_c4de_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1917_c7_e581_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1917_c7_e581_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1918_c3_e4b0 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1917_c7_e581_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1920_c7_c4de_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1917_c7_e581_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1917_c7_e581_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1917_c7_e581_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1920_c7_c4de_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1917_c7_e581_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1920_c11_e4b6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1920_c11_e4b6_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1920_c11_e4b6_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1920_c7_c4de_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1920_c7_c4de_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1920_c7_c4de_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1920_c7_c4de_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1920_c7_c4de_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1926_c7_bb61_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1920_c7_c4de_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1920_c7_c4de_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1920_c7_c4de_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1926_c7_bb61_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1920_c7_c4de_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1920_c7_c4de_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1920_c7_c4de_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1920_c7_c4de_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1920_c7_c4de_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1920_c7_c4de_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1926_c7_bb61_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1920_c7_c4de_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1920_c7_c4de_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1920_c7_c4de_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1926_c7_bb61_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1920_c7_c4de_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1920_c7_c4de_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1920_c7_c4de_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1926_c7_bb61_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1920_c7_c4de_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1920_c7_c4de_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1920_c7_c4de_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1920_c7_c4de_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1921_c3_30a0_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1921_c3_30a0_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1921_c3_30a0_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1924_c32_4358_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1924_c32_4358_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1924_c32_4358_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1924_c32_96a5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1924_c32_96a5_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1924_c32_96a5_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1924_c32_3b33_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1924_c32_3b33_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1924_c32_3b33_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1924_c32_4358_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1926_c11_1389_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1926_c11_1389_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1926_c11_1389_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1926_c7_bb61_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1926_c7_bb61_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1926_c7_bb61_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1926_c7_bb61_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1926_c7_bb61_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1932_c7_8b64_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1926_c7_bb61_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1926_c7_bb61_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1926_c7_bb61_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1932_c7_8b64_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1926_c7_bb61_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1926_c7_bb61_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1926_c7_bb61_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1932_c7_8b64_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1926_c7_bb61_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1926_c7_bb61_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1929_c3_e039 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1926_c7_bb61_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1932_c7_8b64_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1926_c7_bb61_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1930_c24_8ba9_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1932_c11_9643_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1932_c11_9643_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1932_c11_9643_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1932_c7_8b64_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1933_c3_737e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1932_c7_8b64_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1932_c7_8b64_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1932_c7_8b64_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1932_c7_8b64_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1932_c7_8b64_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1932_c7_8b64_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1932_c7_8b64_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_e3ef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1932_c7_8b64_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1932_c7_8b64_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1932_c7_8b64_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_e3ef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1932_c7_8b64_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1934_c34_689b_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1934_c34_689b_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1934_c24_53dd_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1936_c11_8627_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1936_c11_8627_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1936_c11_8627_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_e3ef_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_e3ef_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_e3ef_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_e3ef_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_e3ef_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_e3ef_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1912_l1909_l1903_l1926_l1917_DUPLICATE_e820_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1912_l1909_l1903_l1932_l1920_l1917_DUPLICATE_d15b_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1912_l1909_l1903_l1920_l1917_DUPLICATE_e4a7_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1912_l1909_l1936_l1903_l1932_l1920_l1917_DUPLICATE_25cc_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1912_l1909_l1936_l1932_l1926_l1920_l1917_DUPLICATE_191b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1920_l1912_l1917_l1909_DUPLICATE_dfa8_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1913_l1921_DUPLICATE_19c3_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1920_l1932_DUPLICATE_9f32_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l1941_l1899_DUPLICATE_860e_return_output : opcode_result_t;
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
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1926_c7_bb61_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1915_c3_b7ea := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1912_c7_4837_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1915_c3_b7ea;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1903_c2_8e9e_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1918_c3_e4b0 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1917_c7_e581_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1918_c3_e4b0;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1920_c11_e4b6_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1933_c3_737e := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1932_c7_8b64_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1933_c3_737e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1912_c11_946f_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1910_c3_ba57 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1909_c7_1e6c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1910_c3_ba57;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1906_c3_0bc5 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c2_8e9e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1906_c3_0bc5;
     VAR_MUX_uxn_opcodes_h_l1924_c32_4358_iffalse := resize(to_signed(-2, 3), 8);
     VAR_MUX_uxn_opcodes_h_l1924_c32_4358_iftrue := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_e3ef_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1926_c7_bb61_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1920_c7_c4de_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1936_c11_8627_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1926_c11_1389_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1909_c11_7d84_right := to_unsigned(1, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l1924_c32_3b33_right := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1903_c1_b6d0_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1924_c32_96a5_right := to_unsigned(128, 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1929_c3_e039 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1926_c7_bb61_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1929_c3_e039;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1917_c11_05b7_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1932_c11_9643_right := to_unsigned(6, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1920_c7_c4de_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1903_c2_8e9e_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_e3ef_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1903_c6_6cbd_right := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1903_c1_b6d0_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1924_c32_96a5_left := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1903_c6_6cbd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1909_c11_7d84_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1912_c11_946f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1917_c11_05b7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1920_c11_e4b6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1926_c11_1389_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1932_c11_9643_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1936_c11_8627_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1921_c3_30a0_left := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1934_c34_689b_x := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1903_c2_8e9e_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1909_c7_1e6c_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1917_c7_e581_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1920_c7_c4de_iffalse := t16;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1920_l1912_l1917_l1909_DUPLICATE_dfa8 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1920_l1912_l1917_l1909_DUPLICATE_dfa8_return_output := result.is_stack_read;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1912_l1909_l1936_l1903_l1932_l1920_l1917_DUPLICATE_25cc LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1912_l1909_l1936_l1903_l1932_l1920_l1917_DUPLICATE_25cc_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1936_c11_8627] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1936_c11_8627_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1936_c11_8627_left;
     BIN_OP_EQ_uxn_opcodes_h_l1936_c11_8627_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1936_c11_8627_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1936_c11_8627_return_output := BIN_OP_EQ_uxn_opcodes_h_l1936_c11_8627_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1920_c11_e4b6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1920_c11_e4b6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1920_c11_e4b6_left;
     BIN_OP_EQ_uxn_opcodes_h_l1920_c11_e4b6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1920_c11_e4b6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1920_c11_e4b6_return_output := BIN_OP_EQ_uxn_opcodes_h_l1920_c11_e4b6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1917_c11_05b7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1917_c11_05b7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1917_c11_05b7_left;
     BIN_OP_EQ_uxn_opcodes_h_l1917_c11_05b7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1917_c11_05b7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1917_c11_05b7_return_output := BIN_OP_EQ_uxn_opcodes_h_l1917_c11_05b7_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1930_c24_8ba9] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1930_c24_8ba9_return_output := CAST_TO_uint8_t_uint16_t(
     t16);

     -- BIN_OP_EQ[uxn_opcodes_h_l1909_c11_7d84] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1909_c11_7d84_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1909_c11_7d84_left;
     BIN_OP_EQ_uxn_opcodes_h_l1909_c11_7d84_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1909_c11_7d84_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1909_c11_7d84_return_output := BIN_OP_EQ_uxn_opcodes_h_l1909_c11_7d84_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1912_l1909_l1903_l1920_l1917_DUPLICATE_e4a7 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1912_l1909_l1903_l1920_l1917_DUPLICATE_e4a7_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1932_c11_9643] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1932_c11_9643_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1932_c11_9643_left;
     BIN_OP_EQ_uxn_opcodes_h_l1932_c11_9643_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1932_c11_9643_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1932_c11_9643_return_output := BIN_OP_EQ_uxn_opcodes_h_l1932_c11_9643_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1920_l1932_DUPLICATE_9f32 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1920_l1932_DUPLICATE_9f32_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1912_c11_946f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1912_c11_946f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1912_c11_946f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1912_c11_946f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1912_c11_946f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1912_c11_946f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1912_c11_946f_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1912_l1909_l1903_l1926_l1917_DUPLICATE_e820 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1912_l1909_l1903_l1926_l1917_DUPLICATE_e820_return_output := result.is_sp_shift;

     -- BIN_OP_AND[uxn_opcodes_h_l1924_c32_96a5] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1924_c32_96a5_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1924_c32_96a5_left;
     BIN_OP_AND_uxn_opcodes_h_l1924_c32_96a5_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1924_c32_96a5_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1924_c32_96a5_return_output := BIN_OP_AND_uxn_opcodes_h_l1924_c32_96a5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1903_c6_6cbd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1903_c6_6cbd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1903_c6_6cbd_left;
     BIN_OP_EQ_uxn_opcodes_h_l1903_c6_6cbd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1903_c6_6cbd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1903_c6_6cbd_return_output := BIN_OP_EQ_uxn_opcodes_h_l1903_c6_6cbd_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1912_l1909_l1936_l1932_l1926_l1920_l1917_DUPLICATE_191b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1912_l1909_l1936_l1932_l1926_l1920_l1917_DUPLICATE_191b_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1926_c11_1389] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1926_c11_1389_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1926_c11_1389_left;
     BIN_OP_EQ_uxn_opcodes_h_l1926_c11_1389_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1926_c11_1389_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1926_c11_1389_return_output := BIN_OP_EQ_uxn_opcodes_h_l1926_c11_1389_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1913_l1921_DUPLICATE_19c3 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1913_l1921_DUPLICATE_19c3_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1912_l1909_l1903_l1932_l1920_l1917_DUPLICATE_d15b LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1912_l1909_l1903_l1932_l1920_l1917_DUPLICATE_d15b_return_output := result.stack_value;

     -- CONST_SR_8[uxn_opcodes_h_l1934_c34_689b] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1934_c34_689b_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1934_c34_689b_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1934_c34_689b_return_output := CONST_SR_8_uxn_opcodes_h_l1934_c34_689b_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1924_c32_3b33_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1924_c32_96a5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1903_c1_b6d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1903_c6_6cbd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1903_c2_8e9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1903_c6_6cbd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1903_c2_8e9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1903_c6_6cbd_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1903_c2_8e9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1903_c6_6cbd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1903_c2_8e9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1903_c6_6cbd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1903_c2_8e9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1903_c6_6cbd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c2_8e9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1903_c6_6cbd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1903_c2_8e9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1903_c6_6cbd_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1903_c2_8e9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1903_c6_6cbd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1909_c7_1e6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1909_c11_7d84_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1909_c7_1e6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1909_c11_7d84_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1909_c7_1e6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1909_c11_7d84_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1909_c7_1e6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1909_c11_7d84_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1909_c7_1e6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1909_c11_7d84_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1909_c7_1e6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1909_c11_7d84_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1909_c7_1e6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1909_c11_7d84_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1909_c7_1e6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1909_c11_7d84_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1912_c7_4837_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1912_c11_946f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1912_c7_4837_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1912_c11_946f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1912_c7_4837_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1912_c11_946f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1912_c7_4837_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1912_c11_946f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1912_c7_4837_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1912_c11_946f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1912_c7_4837_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1912_c11_946f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1912_c7_4837_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1912_c11_946f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1912_c7_4837_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1912_c11_946f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1917_c7_e581_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1917_c11_05b7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1917_c7_e581_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1917_c11_05b7_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1917_c7_e581_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1917_c11_05b7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1917_c7_e581_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1917_c11_05b7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1917_c7_e581_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1917_c11_05b7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1917_c7_e581_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1917_c11_05b7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1917_c7_e581_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1917_c11_05b7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1917_c7_e581_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1917_c11_05b7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1920_c7_c4de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1920_c11_e4b6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1920_c7_c4de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1920_c11_e4b6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1920_c7_c4de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1920_c11_e4b6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1920_c7_c4de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1920_c11_e4b6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1920_c7_c4de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1920_c11_e4b6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1920_c7_c4de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1920_c11_e4b6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1920_c7_c4de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1920_c11_e4b6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1920_c7_c4de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1920_c11_e4b6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1926_c7_bb61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1926_c11_1389_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1926_c7_bb61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1926_c11_1389_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1926_c7_bb61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1926_c11_1389_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1926_c7_bb61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1926_c11_1389_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1926_c7_bb61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1926_c11_1389_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1932_c7_8b64_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1932_c11_9643_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1932_c7_8b64_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1932_c11_9643_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1932_c7_8b64_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1932_c11_9643_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1932_c7_8b64_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1932_c11_9643_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_e3ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1936_c11_8627_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_e3ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1936_c11_8627_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1921_c3_30a0_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1913_l1921_DUPLICATE_19c3_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1914_c3_dc2d_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1913_l1921_DUPLICATE_19c3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1926_c7_bb61_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1930_c24_8ba9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1903_c2_8e9e_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1912_l1909_l1903_l1920_l1917_DUPLICATE_e4a7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1909_c7_1e6c_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1912_l1909_l1903_l1920_l1917_DUPLICATE_e4a7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1912_c7_4837_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1912_l1909_l1903_l1920_l1917_DUPLICATE_e4a7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1917_c7_e581_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1912_l1909_l1903_l1920_l1917_DUPLICATE_e4a7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1920_c7_c4de_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1912_l1909_l1903_l1920_l1917_DUPLICATE_e4a7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1909_c7_1e6c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1912_l1909_l1936_l1932_l1926_l1920_l1917_DUPLICATE_191b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1912_c7_4837_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1912_l1909_l1936_l1932_l1926_l1920_l1917_DUPLICATE_191b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1917_c7_e581_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1912_l1909_l1936_l1932_l1926_l1920_l1917_DUPLICATE_191b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1920_c7_c4de_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1912_l1909_l1936_l1932_l1926_l1920_l1917_DUPLICATE_191b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1926_c7_bb61_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1912_l1909_l1936_l1932_l1926_l1920_l1917_DUPLICATE_191b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1932_c7_8b64_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1912_l1909_l1936_l1932_l1926_l1920_l1917_DUPLICATE_191b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_e3ef_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1912_l1909_l1936_l1932_l1926_l1920_l1917_DUPLICATE_191b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1903_c2_8e9e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1912_l1909_l1903_l1926_l1917_DUPLICATE_e820_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1909_c7_1e6c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1912_l1909_l1903_l1926_l1917_DUPLICATE_e820_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1912_c7_4837_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1912_l1909_l1903_l1926_l1917_DUPLICATE_e820_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1917_c7_e581_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1912_l1909_l1903_l1926_l1917_DUPLICATE_e820_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1926_c7_bb61_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1912_l1909_l1903_l1926_l1917_DUPLICATE_e820_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1909_c7_1e6c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1920_l1912_l1917_l1909_DUPLICATE_dfa8_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1912_c7_4837_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1920_l1912_l1917_l1909_DUPLICATE_dfa8_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1917_c7_e581_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1920_l1912_l1917_l1909_DUPLICATE_dfa8_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1920_c7_c4de_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1920_l1912_l1917_l1909_DUPLICATE_dfa8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1903_c2_8e9e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1912_l1909_l1936_l1903_l1932_l1920_l1917_DUPLICATE_25cc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1909_c7_1e6c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1912_l1909_l1936_l1903_l1932_l1920_l1917_DUPLICATE_25cc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1912_c7_4837_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1912_l1909_l1936_l1903_l1932_l1920_l1917_DUPLICATE_25cc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1917_c7_e581_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1912_l1909_l1936_l1903_l1932_l1920_l1917_DUPLICATE_25cc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1920_c7_c4de_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1912_l1909_l1936_l1903_l1932_l1920_l1917_DUPLICATE_25cc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1932_c7_8b64_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1912_l1909_l1936_l1903_l1932_l1920_l1917_DUPLICATE_25cc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_e3ef_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1912_l1909_l1936_l1903_l1932_l1920_l1917_DUPLICATE_25cc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1920_c7_c4de_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1920_l1932_DUPLICATE_9f32_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1932_c7_8b64_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1920_l1932_DUPLICATE_9f32_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1903_c2_8e9e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1912_l1909_l1903_l1932_l1920_l1917_DUPLICATE_d15b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1909_c7_1e6c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1912_l1909_l1903_l1932_l1920_l1917_DUPLICATE_d15b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1912_c7_4837_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1912_l1909_l1903_l1932_l1920_l1917_DUPLICATE_d15b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1917_c7_e581_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1912_l1909_l1903_l1932_l1920_l1917_DUPLICATE_d15b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1920_c7_c4de_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1912_l1909_l1903_l1932_l1920_l1917_DUPLICATE_d15b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1932_c7_8b64_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1912_l1909_l1903_l1932_l1920_l1917_DUPLICATE_d15b_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1903_c1_b6d0] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1903_c1_b6d0_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1903_c1_b6d0_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1903_c1_b6d0_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1903_c1_b6d0_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1903_c1_b6d0_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1903_c1_b6d0_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1903_c1_b6d0_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1903_c1_b6d0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1932_c7_8b64] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1932_c7_8b64_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1932_c7_8b64_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1932_c7_8b64_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1932_c7_8b64_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1932_c7_8b64_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1932_c7_8b64_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1932_c7_8b64_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1932_c7_8b64_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1914_c3_dc2d] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1914_c3_dc2d_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1914_c3_dc2d_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1914_c3_dc2d_return_output := CONST_SL_8_uxn_opcodes_h_l1914_c3_dc2d_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1924_c32_3b33] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1924_c32_3b33_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1924_c32_3b33_left;
     BIN_OP_GT_uxn_opcodes_h_l1924_c32_3b33_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1924_c32_3b33_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1924_c32_3b33_return_output := BIN_OP_GT_uxn_opcodes_h_l1924_c32_3b33_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1920_c7_c4de] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1920_c7_c4de_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1920_c7_c4de_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1920_c7_c4de_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1920_c7_c4de_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1920_c7_c4de_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1920_c7_c4de_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1920_c7_c4de_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1920_c7_c4de_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1934_c24_53dd] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1934_c24_53dd_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1934_c34_689b_return_output);

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1926_c7_bb61] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1926_c7_bb61_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1926_c7_bb61_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1926_c7_bb61_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1926_c7_bb61_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1926_c7_bb61_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1926_c7_bb61_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1926_c7_bb61_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1926_c7_bb61_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1936_c7_e3ef] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_e3ef_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_e3ef_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_e3ef_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_e3ef_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_e3ef_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_e3ef_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_e3ef_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_e3ef_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1936_c7_e3ef] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_e3ef_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_e3ef_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_e3ef_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_e3ef_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_e3ef_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_e3ef_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_e3ef_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_e3ef_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1921_c3_30a0] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1921_c3_30a0_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1921_c3_30a0_left;
     BIN_OP_OR_uxn_opcodes_h_l1921_c3_30a0_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1921_c3_30a0_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1921_c3_30a0_return_output := BIN_OP_OR_uxn_opcodes_h_l1921_c3_30a0_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1924_c32_4358_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1924_c32_3b33_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1920_c7_c4de_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1921_c3_30a0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1932_c7_8b64_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1934_c24_53dd_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1912_c7_4837_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1914_c3_dc2d_return_output;
     VAR_printf_uxn_opcodes_h_l1904_c3_9339_uxn_opcodes_h_l1904_c3_9339_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1903_c1_b6d0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1932_c7_8b64_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_e3ef_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1920_c7_c4de_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1926_c7_bb61_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1917_c7_e581_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1920_c7_c4de_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1932_c7_8b64_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_e3ef_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1926_c7_bb61_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1932_c7_8b64_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1932_c7_8b64] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1932_c7_8b64_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1932_c7_8b64_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1932_c7_8b64_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1932_c7_8b64_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1932_c7_8b64_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1932_c7_8b64_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1932_c7_8b64_return_output := result_stack_value_MUX_uxn_opcodes_h_l1932_c7_8b64_return_output;

     -- printf_uxn_opcodes_h_l1904_c3_9339[uxn_opcodes_h_l1904_c3_9339] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1904_c3_9339_uxn_opcodes_h_l1904_c3_9339_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1904_c3_9339_uxn_opcodes_h_l1904_c3_9339_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1917_c7_e581] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1917_c7_e581_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1917_c7_e581_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1917_c7_e581_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1917_c7_e581_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1917_c7_e581_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1917_c7_e581_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1917_c7_e581_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1917_c7_e581_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1920_c7_c4de] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1920_c7_c4de_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1920_c7_c4de_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1920_c7_c4de_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1920_c7_c4de_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1920_c7_c4de_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1920_c7_c4de_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1920_c7_c4de_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1920_c7_c4de_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1932_c7_8b64] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1932_c7_8b64_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1932_c7_8b64_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1932_c7_8b64_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1932_c7_8b64_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1932_c7_8b64_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1932_c7_8b64_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1932_c7_8b64_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1932_c7_8b64_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1932_c7_8b64] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1932_c7_8b64_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1932_c7_8b64_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1932_c7_8b64_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1932_c7_8b64_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1932_c7_8b64_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1932_c7_8b64_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1932_c7_8b64_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1932_c7_8b64_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1926_c7_bb61] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1926_c7_bb61_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1926_c7_bb61_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1926_c7_bb61_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1926_c7_bb61_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1926_c7_bb61_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1926_c7_bb61_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1926_c7_bb61_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1926_c7_bb61_return_output;

     -- t16_MUX[uxn_opcodes_h_l1920_c7_c4de] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1920_c7_c4de_cond <= VAR_t16_MUX_uxn_opcodes_h_l1920_c7_c4de_cond;
     t16_MUX_uxn_opcodes_h_l1920_c7_c4de_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1920_c7_c4de_iftrue;
     t16_MUX_uxn_opcodes_h_l1920_c7_c4de_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1920_c7_c4de_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1920_c7_c4de_return_output := t16_MUX_uxn_opcodes_h_l1920_c7_c4de_return_output;

     -- MUX[uxn_opcodes_h_l1924_c32_4358] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1924_c32_4358_cond <= VAR_MUX_uxn_opcodes_h_l1924_c32_4358_cond;
     MUX_uxn_opcodes_h_l1924_c32_4358_iftrue <= VAR_MUX_uxn_opcodes_h_l1924_c32_4358_iftrue;
     MUX_uxn_opcodes_h_l1924_c32_4358_iffalse <= VAR_MUX_uxn_opcodes_h_l1924_c32_4358_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1924_c32_4358_return_output := MUX_uxn_opcodes_h_l1924_c32_4358_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1920_c7_c4de_iftrue := VAR_MUX_uxn_opcodes_h_l1924_c32_4358_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1926_c7_bb61_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1932_c7_8b64_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1917_c7_e581_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1920_c7_c4de_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1912_c7_4837_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1917_c7_e581_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1926_c7_bb61_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1932_c7_8b64_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1920_c7_c4de_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1926_c7_bb61_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1926_c7_bb61_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1932_c7_8b64_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1917_c7_e581_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1920_c7_c4de_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1920_c7_c4de] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1920_c7_c4de_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1920_c7_c4de_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1920_c7_c4de_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1920_c7_c4de_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1920_c7_c4de_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1920_c7_c4de_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1920_c7_c4de_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1920_c7_c4de_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1917_c7_e581] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1917_c7_e581_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1917_c7_e581_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1917_c7_e581_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1917_c7_e581_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1917_c7_e581_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1917_c7_e581_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1917_c7_e581_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1917_c7_e581_return_output;

     -- t16_MUX[uxn_opcodes_h_l1917_c7_e581] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1917_c7_e581_cond <= VAR_t16_MUX_uxn_opcodes_h_l1917_c7_e581_cond;
     t16_MUX_uxn_opcodes_h_l1917_c7_e581_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1917_c7_e581_iftrue;
     t16_MUX_uxn_opcodes_h_l1917_c7_e581_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1917_c7_e581_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1917_c7_e581_return_output := t16_MUX_uxn_opcodes_h_l1917_c7_e581_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1926_c7_bb61] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1926_c7_bb61_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1926_c7_bb61_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1926_c7_bb61_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1926_c7_bb61_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1926_c7_bb61_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1926_c7_bb61_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1926_c7_bb61_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1926_c7_bb61_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1926_c7_bb61] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1926_c7_bb61_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1926_c7_bb61_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1926_c7_bb61_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1926_c7_bb61_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1926_c7_bb61_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1926_c7_bb61_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1926_c7_bb61_return_output := result_stack_value_MUX_uxn_opcodes_h_l1926_c7_bb61_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1926_c7_bb61] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1926_c7_bb61_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1926_c7_bb61_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1926_c7_bb61_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1926_c7_bb61_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1926_c7_bb61_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1926_c7_bb61_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1926_c7_bb61_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1926_c7_bb61_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1912_c7_4837] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1912_c7_4837_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1912_c7_4837_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1912_c7_4837_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1912_c7_4837_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1912_c7_4837_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1912_c7_4837_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1912_c7_4837_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1912_c7_4837_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1920_c7_c4de] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1920_c7_c4de_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1920_c7_c4de_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1920_c7_c4de_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1920_c7_c4de_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1920_c7_c4de_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1920_c7_c4de_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1920_c7_c4de_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1920_c7_c4de_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1920_c7_c4de_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1926_c7_bb61_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1912_c7_4837_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1917_c7_e581_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1909_c7_1e6c_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1912_c7_4837_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1920_c7_c4de_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1926_c7_bb61_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1917_c7_e581_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1920_c7_c4de_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1917_c7_e581_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1920_c7_c4de_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1920_c7_c4de_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1926_c7_bb61_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1912_c7_4837_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1917_c7_e581_return_output;
     -- t16_MUX[uxn_opcodes_h_l1912_c7_4837] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1912_c7_4837_cond <= VAR_t16_MUX_uxn_opcodes_h_l1912_c7_4837_cond;
     t16_MUX_uxn_opcodes_h_l1912_c7_4837_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1912_c7_4837_iftrue;
     t16_MUX_uxn_opcodes_h_l1912_c7_4837_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1912_c7_4837_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1912_c7_4837_return_output := t16_MUX_uxn_opcodes_h_l1912_c7_4837_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1909_c7_1e6c] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1909_c7_1e6c_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1909_c7_1e6c_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1909_c7_1e6c_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1909_c7_1e6c_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1909_c7_1e6c_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1909_c7_1e6c_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1909_c7_1e6c_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1909_c7_1e6c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1917_c7_e581] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1917_c7_e581_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1917_c7_e581_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1917_c7_e581_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1917_c7_e581_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1917_c7_e581_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1917_c7_e581_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1917_c7_e581_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1917_c7_e581_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1920_c7_c4de] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1920_c7_c4de_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1920_c7_c4de_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1920_c7_c4de_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1920_c7_c4de_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1920_c7_c4de_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1920_c7_c4de_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1920_c7_c4de_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1920_c7_c4de_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1920_c7_c4de] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1920_c7_c4de_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1920_c7_c4de_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1920_c7_c4de_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1920_c7_c4de_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1920_c7_c4de_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1920_c7_c4de_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1920_c7_c4de_return_output := result_stack_value_MUX_uxn_opcodes_h_l1920_c7_c4de_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1917_c7_e581] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1917_c7_e581_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1917_c7_e581_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1917_c7_e581_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1917_c7_e581_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1917_c7_e581_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1917_c7_e581_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1917_c7_e581_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1917_c7_e581_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1920_c7_c4de] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1920_c7_c4de_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1920_c7_c4de_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1920_c7_c4de_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1920_c7_c4de_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1920_c7_c4de_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1920_c7_c4de_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1920_c7_c4de_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1920_c7_c4de_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1912_c7_4837] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1912_c7_4837_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1912_c7_4837_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1912_c7_4837_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1912_c7_4837_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1912_c7_4837_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1912_c7_4837_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1912_c7_4837_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1912_c7_4837_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1917_c7_e581_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1920_c7_c4de_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1909_c7_1e6c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1912_c7_4837_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1903_c2_8e9e_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1909_c7_1e6c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1917_c7_e581_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1920_c7_c4de_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1912_c7_4837_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1917_c7_e581_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1912_c7_4837_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1917_c7_e581_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1917_c7_e581_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1920_c7_c4de_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1909_c7_1e6c_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1912_c7_4837_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1917_c7_e581] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1917_c7_e581_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1917_c7_e581_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1917_c7_e581_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1917_c7_e581_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1917_c7_e581_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1917_c7_e581_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1917_c7_e581_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1917_c7_e581_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1912_c7_4837] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1912_c7_4837_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1912_c7_4837_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1912_c7_4837_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1912_c7_4837_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1912_c7_4837_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1912_c7_4837_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1912_c7_4837_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1912_c7_4837_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1909_c7_1e6c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1909_c7_1e6c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1909_c7_1e6c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1909_c7_1e6c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1909_c7_1e6c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1909_c7_1e6c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1909_c7_1e6c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1909_c7_1e6c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1909_c7_1e6c_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1917_c7_e581] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1917_c7_e581_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1917_c7_e581_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1917_c7_e581_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1917_c7_e581_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1917_c7_e581_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1917_c7_e581_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1917_c7_e581_return_output := result_stack_value_MUX_uxn_opcodes_h_l1917_c7_e581_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1917_c7_e581] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1917_c7_e581_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1917_c7_e581_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1917_c7_e581_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1917_c7_e581_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1917_c7_e581_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1917_c7_e581_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1917_c7_e581_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1917_c7_e581_return_output;

     -- t16_MUX[uxn_opcodes_h_l1909_c7_1e6c] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1909_c7_1e6c_cond <= VAR_t16_MUX_uxn_opcodes_h_l1909_c7_1e6c_cond;
     t16_MUX_uxn_opcodes_h_l1909_c7_1e6c_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1909_c7_1e6c_iftrue;
     t16_MUX_uxn_opcodes_h_l1909_c7_1e6c_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1909_c7_1e6c_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1909_c7_1e6c_return_output := t16_MUX_uxn_opcodes_h_l1909_c7_1e6c_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1903_c2_8e9e] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1903_c2_8e9e_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1903_c2_8e9e_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1903_c2_8e9e_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1903_c2_8e9e_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1903_c2_8e9e_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1903_c2_8e9e_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1903_c2_8e9e_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1903_c2_8e9e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1912_c7_4837] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1912_c7_4837_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1912_c7_4837_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1912_c7_4837_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1912_c7_4837_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1912_c7_4837_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1912_c7_4837_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1912_c7_4837_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1912_c7_4837_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1912_c7_4837_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1917_c7_e581_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1903_c2_8e9e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1909_c7_1e6c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1912_c7_4837_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1917_c7_e581_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1909_c7_1e6c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1912_c7_4837_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1909_c7_1e6c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1912_c7_4837_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1912_c7_4837_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1917_c7_e581_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1903_c2_8e9e_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1909_c7_1e6c_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1912_c7_4837] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1912_c7_4837_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1912_c7_4837_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1912_c7_4837_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1912_c7_4837_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1912_c7_4837_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1912_c7_4837_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1912_c7_4837_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1912_c7_4837_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1912_c7_4837] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1912_c7_4837_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1912_c7_4837_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1912_c7_4837_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1912_c7_4837_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1912_c7_4837_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1912_c7_4837_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1912_c7_4837_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1912_c7_4837_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1903_c2_8e9e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1903_c2_8e9e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1903_c2_8e9e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1903_c2_8e9e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1903_c2_8e9e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1903_c2_8e9e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1903_c2_8e9e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1903_c2_8e9e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1903_c2_8e9e_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1912_c7_4837] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1912_c7_4837_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1912_c7_4837_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1912_c7_4837_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1912_c7_4837_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1912_c7_4837_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1912_c7_4837_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1912_c7_4837_return_output := result_stack_value_MUX_uxn_opcodes_h_l1912_c7_4837_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1909_c7_1e6c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1909_c7_1e6c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1909_c7_1e6c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1909_c7_1e6c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1909_c7_1e6c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1909_c7_1e6c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1909_c7_1e6c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1909_c7_1e6c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1909_c7_1e6c_return_output;

     -- t16_MUX[uxn_opcodes_h_l1903_c2_8e9e] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1903_c2_8e9e_cond <= VAR_t16_MUX_uxn_opcodes_h_l1903_c2_8e9e_cond;
     t16_MUX_uxn_opcodes_h_l1903_c2_8e9e_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1903_c2_8e9e_iftrue;
     t16_MUX_uxn_opcodes_h_l1903_c2_8e9e_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1903_c2_8e9e_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1903_c2_8e9e_return_output := t16_MUX_uxn_opcodes_h_l1903_c2_8e9e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1909_c7_1e6c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1909_c7_1e6c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1909_c7_1e6c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1909_c7_1e6c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1909_c7_1e6c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1909_c7_1e6c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1909_c7_1e6c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1909_c7_1e6c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1909_c7_1e6c_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1909_c7_1e6c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1912_c7_4837_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1909_c7_1e6c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1912_c7_4837_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1903_c2_8e9e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1909_c7_1e6c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c2_8e9e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1909_c7_1e6c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1909_c7_1e6c_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1912_c7_4837_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1903_c2_8e9e_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1909_c7_1e6c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1909_c7_1e6c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1909_c7_1e6c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1909_c7_1e6c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1909_c7_1e6c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1909_c7_1e6c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1909_c7_1e6c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1909_c7_1e6c_return_output := result_stack_value_MUX_uxn_opcodes_h_l1909_c7_1e6c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1909_c7_1e6c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1909_c7_1e6c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1909_c7_1e6c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1909_c7_1e6c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1909_c7_1e6c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1909_c7_1e6c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1909_c7_1e6c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1909_c7_1e6c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1909_c7_1e6c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1903_c2_8e9e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1903_c2_8e9e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1903_c2_8e9e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1903_c2_8e9e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1903_c2_8e9e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1903_c2_8e9e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1903_c2_8e9e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1903_c2_8e9e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1903_c2_8e9e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1909_c7_1e6c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1909_c7_1e6c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1909_c7_1e6c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1909_c7_1e6c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1909_c7_1e6c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1909_c7_1e6c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1909_c7_1e6c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1909_c7_1e6c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1909_c7_1e6c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1903_c2_8e9e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c2_8e9e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c2_8e9e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c2_8e9e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c2_8e9e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c2_8e9e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c2_8e9e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c2_8e9e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c2_8e9e_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1903_c2_8e9e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1909_c7_1e6c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1903_c2_8e9e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1909_c7_1e6c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1903_c2_8e9e_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1909_c7_1e6c_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1903_c2_8e9e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1903_c2_8e9e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1903_c2_8e9e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1903_c2_8e9e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1903_c2_8e9e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1903_c2_8e9e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1903_c2_8e9e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1903_c2_8e9e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1903_c2_8e9e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1903_c2_8e9e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1903_c2_8e9e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1903_c2_8e9e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1903_c2_8e9e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1903_c2_8e9e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1903_c2_8e9e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1903_c2_8e9e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1903_c2_8e9e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1903_c2_8e9e_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1903_c2_8e9e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1903_c2_8e9e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1903_c2_8e9e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1903_c2_8e9e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1903_c2_8e9e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1903_c2_8e9e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1903_c2_8e9e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1903_c2_8e9e_return_output := result_stack_value_MUX_uxn_opcodes_h_l1903_c2_8e9e_return_output;

     -- Submodule level 9
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l1941_l1899_DUPLICATE_860e LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l1941_l1899_DUPLICATE_860e_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_e56b(
     result,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1903_c2_8e9e_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1903_c2_8e9e_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1903_c2_8e9e_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1903_c2_8e9e_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1903_c2_8e9e_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c2_8e9e_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1903_c2_8e9e_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l1941_l1899_DUPLICATE_860e_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l1941_l1899_DUPLICATE_860e_return_output;
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
