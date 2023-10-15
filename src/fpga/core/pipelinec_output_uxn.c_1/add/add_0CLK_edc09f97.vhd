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
-- Submodules: 57
entity add_0CLK_edc09f97 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end add_0CLK_edc09f97;
architecture arch of add_0CLK_edc09f97 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l865_c6_7c38]
signal BIN_OP_EQ_uxn_opcodes_h_l865_c6_7c38_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l865_c6_7c38_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l865_c6_7c38_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l865_c2_ea72]
signal n8_MUX_uxn_opcodes_h_l865_c2_ea72_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l865_c2_ea72_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l865_c2_ea72_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l865_c2_ea72_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l865_c2_ea72]
signal t8_MUX_uxn_opcodes_h_l865_c2_ea72_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l865_c2_ea72_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l865_c2_ea72_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l865_c2_ea72_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l865_c2_ea72]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c2_ea72_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c2_ea72_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c2_ea72_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c2_ea72_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l865_c2_ea72]
signal result_stack_value_MUX_uxn_opcodes_h_l865_c2_ea72_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l865_c2_ea72_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l865_c2_ea72_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l865_c2_ea72_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l865_c2_ea72]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c2_ea72_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c2_ea72_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c2_ea72_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c2_ea72_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l865_c2_ea72]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l865_c2_ea72_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l865_c2_ea72_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l865_c2_ea72_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l865_c2_ea72_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l865_c2_ea72]
signal result_is_stack_write_MUX_uxn_opcodes_h_l865_c2_ea72_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l865_c2_ea72_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l865_c2_ea72_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l865_c2_ea72_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l865_c2_ea72]
signal result_is_opc_done_MUX_uxn_opcodes_h_l865_c2_ea72_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l865_c2_ea72_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l865_c2_ea72_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l865_c2_ea72_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l870_c11_56a7]
signal BIN_OP_EQ_uxn_opcodes_h_l870_c11_56a7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l870_c11_56a7_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l870_c11_56a7_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l870_c7_903b]
signal n8_MUX_uxn_opcodes_h_l870_c7_903b_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l870_c7_903b_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l870_c7_903b_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l870_c7_903b_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l870_c7_903b]
signal t8_MUX_uxn_opcodes_h_l870_c7_903b_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l870_c7_903b_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l870_c7_903b_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l870_c7_903b_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l870_c7_903b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_903b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_903b_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_903b_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_903b_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l870_c7_903b]
signal result_stack_value_MUX_uxn_opcodes_h_l870_c7_903b_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l870_c7_903b_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l870_c7_903b_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l870_c7_903b_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l870_c7_903b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_903b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_903b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_903b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_903b_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l870_c7_903b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l870_c7_903b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l870_c7_903b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l870_c7_903b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l870_c7_903b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l870_c7_903b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_903b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_903b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_903b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_903b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l870_c7_903b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_903b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_903b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_903b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_903b_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l873_c11_7d12]
signal BIN_OP_EQ_uxn_opcodes_h_l873_c11_7d12_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l873_c11_7d12_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l873_c11_7d12_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l873_c7_9d31]
signal n8_MUX_uxn_opcodes_h_l873_c7_9d31_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l873_c7_9d31_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l873_c7_9d31_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l873_c7_9d31_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l873_c7_9d31]
signal t8_MUX_uxn_opcodes_h_l873_c7_9d31_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l873_c7_9d31_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l873_c7_9d31_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l873_c7_9d31_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l873_c7_9d31]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l873_c7_9d31_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l873_c7_9d31_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l873_c7_9d31_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l873_c7_9d31_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l873_c7_9d31]
signal result_stack_value_MUX_uxn_opcodes_h_l873_c7_9d31_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l873_c7_9d31_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l873_c7_9d31_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l873_c7_9d31_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l873_c7_9d31]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l873_c7_9d31_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l873_c7_9d31_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l873_c7_9d31_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l873_c7_9d31_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l873_c7_9d31]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l873_c7_9d31_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l873_c7_9d31_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l873_c7_9d31_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l873_c7_9d31_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l873_c7_9d31]
signal result_is_stack_write_MUX_uxn_opcodes_h_l873_c7_9d31_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l873_c7_9d31_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l873_c7_9d31_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l873_c7_9d31_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l873_c7_9d31]
signal result_is_opc_done_MUX_uxn_opcodes_h_l873_c7_9d31_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l873_c7_9d31_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l873_c7_9d31_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l873_c7_9d31_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l877_c11_4f10]
signal BIN_OP_EQ_uxn_opcodes_h_l877_c11_4f10_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l877_c11_4f10_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l877_c11_4f10_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l877_c7_2126]
signal n8_MUX_uxn_opcodes_h_l877_c7_2126_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l877_c7_2126_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l877_c7_2126_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l877_c7_2126_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l877_c7_2126]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l877_c7_2126_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l877_c7_2126_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l877_c7_2126_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l877_c7_2126_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l877_c7_2126]
signal result_stack_value_MUX_uxn_opcodes_h_l877_c7_2126_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l877_c7_2126_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l877_c7_2126_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l877_c7_2126_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l877_c7_2126]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l877_c7_2126_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l877_c7_2126_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l877_c7_2126_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l877_c7_2126_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l877_c7_2126]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l877_c7_2126_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l877_c7_2126_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l877_c7_2126_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l877_c7_2126_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l877_c7_2126]
signal result_is_stack_write_MUX_uxn_opcodes_h_l877_c7_2126_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l877_c7_2126_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l877_c7_2126_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l877_c7_2126_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l877_c7_2126]
signal result_is_opc_done_MUX_uxn_opcodes_h_l877_c7_2126_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l877_c7_2126_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l877_c7_2126_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l877_c7_2126_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l880_c11_d05b]
signal BIN_OP_EQ_uxn_opcodes_h_l880_c11_d05b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l880_c11_d05b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l880_c11_d05b_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l880_c7_8a1a]
signal n8_MUX_uxn_opcodes_h_l880_c7_8a1a_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l880_c7_8a1a_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l880_c7_8a1a_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l880_c7_8a1a_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l880_c7_8a1a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l880_c7_8a1a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l880_c7_8a1a_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l880_c7_8a1a_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l880_c7_8a1a_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l880_c7_8a1a]
signal result_stack_value_MUX_uxn_opcodes_h_l880_c7_8a1a_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l880_c7_8a1a_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l880_c7_8a1a_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l880_c7_8a1a_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l880_c7_8a1a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l880_c7_8a1a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l880_c7_8a1a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l880_c7_8a1a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l880_c7_8a1a_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l880_c7_8a1a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l880_c7_8a1a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l880_c7_8a1a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l880_c7_8a1a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l880_c7_8a1a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l880_c7_8a1a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l880_c7_8a1a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l880_c7_8a1a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l880_c7_8a1a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l880_c7_8a1a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l880_c7_8a1a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l880_c7_8a1a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l880_c7_8a1a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l880_c7_8a1a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l880_c7_8a1a_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l883_c32_f842]
signal BIN_OP_AND_uxn_opcodes_h_l883_c32_f842_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l883_c32_f842_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l883_c32_f842_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l883_c32_49df]
signal BIN_OP_GT_uxn_opcodes_h_l883_c32_49df_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l883_c32_49df_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l883_c32_49df_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l883_c32_c5c3]
signal MUX_uxn_opcodes_h_l883_c32_c5c3_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l883_c32_c5c3_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l883_c32_c5c3_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l883_c32_c5c3_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l885_c11_3cca]
signal BIN_OP_EQ_uxn_opcodes_h_l885_c11_3cca_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l885_c11_3cca_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l885_c11_3cca_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l885_c7_f616]
signal result_stack_value_MUX_uxn_opcodes_h_l885_c7_f616_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l885_c7_f616_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l885_c7_f616_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l885_c7_f616_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l885_c7_f616]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l885_c7_f616_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l885_c7_f616_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l885_c7_f616_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l885_c7_f616_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l885_c7_f616]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l885_c7_f616_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l885_c7_f616_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l885_c7_f616_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l885_c7_f616_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l885_c7_f616]
signal result_is_stack_write_MUX_uxn_opcodes_h_l885_c7_f616_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l885_c7_f616_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l885_c7_f616_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l885_c7_f616_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l885_c7_f616]
signal result_is_opc_done_MUX_uxn_opcodes_h_l885_c7_f616_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l885_c7_f616_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l885_c7_f616_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l885_c7_f616_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l889_c24_8e20]
signal BIN_OP_PLUS_uxn_opcodes_h_l889_c24_8e20_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l889_c24_8e20_right : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l889_c24_8e20_return_output : unsigned(8 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l891_c11_33f6]
signal BIN_OP_EQ_uxn_opcodes_h_l891_c11_33f6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l891_c11_33f6_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l891_c11_33f6_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l891_c7_b3c3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_b3c3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_b3c3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_b3c3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_b3c3_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l891_c7_b3c3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_b3c3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_b3c3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_b3c3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_b3c3_return_output : unsigned(0 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5( ref_toks_0 : opcode_result_t;
 ref_toks_1 : signed;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.sp_relative_shift := ref_toks_1;
      base.stack_value := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.is_sp_shift := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.is_opc_done := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l865_c6_7c38
BIN_OP_EQ_uxn_opcodes_h_l865_c6_7c38 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l865_c6_7c38_left,
BIN_OP_EQ_uxn_opcodes_h_l865_c6_7c38_right,
BIN_OP_EQ_uxn_opcodes_h_l865_c6_7c38_return_output);

-- n8_MUX_uxn_opcodes_h_l865_c2_ea72
n8_MUX_uxn_opcodes_h_l865_c2_ea72 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l865_c2_ea72_cond,
n8_MUX_uxn_opcodes_h_l865_c2_ea72_iftrue,
n8_MUX_uxn_opcodes_h_l865_c2_ea72_iffalse,
n8_MUX_uxn_opcodes_h_l865_c2_ea72_return_output);

-- t8_MUX_uxn_opcodes_h_l865_c2_ea72
t8_MUX_uxn_opcodes_h_l865_c2_ea72 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l865_c2_ea72_cond,
t8_MUX_uxn_opcodes_h_l865_c2_ea72_iftrue,
t8_MUX_uxn_opcodes_h_l865_c2_ea72_iffalse,
t8_MUX_uxn_opcodes_h_l865_c2_ea72_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c2_ea72
result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c2_ea72 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c2_ea72_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c2_ea72_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c2_ea72_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c2_ea72_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l865_c2_ea72
result_stack_value_MUX_uxn_opcodes_h_l865_c2_ea72 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l865_c2_ea72_cond,
result_stack_value_MUX_uxn_opcodes_h_l865_c2_ea72_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l865_c2_ea72_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l865_c2_ea72_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c2_ea72
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c2_ea72 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c2_ea72_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c2_ea72_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c2_ea72_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c2_ea72_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l865_c2_ea72
result_is_sp_shift_MUX_uxn_opcodes_h_l865_c2_ea72 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l865_c2_ea72_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l865_c2_ea72_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l865_c2_ea72_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l865_c2_ea72_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l865_c2_ea72
result_is_stack_write_MUX_uxn_opcodes_h_l865_c2_ea72 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l865_c2_ea72_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l865_c2_ea72_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l865_c2_ea72_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l865_c2_ea72_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l865_c2_ea72
result_is_opc_done_MUX_uxn_opcodes_h_l865_c2_ea72 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l865_c2_ea72_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l865_c2_ea72_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l865_c2_ea72_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l865_c2_ea72_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l870_c11_56a7
BIN_OP_EQ_uxn_opcodes_h_l870_c11_56a7 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l870_c11_56a7_left,
BIN_OP_EQ_uxn_opcodes_h_l870_c11_56a7_right,
BIN_OP_EQ_uxn_opcodes_h_l870_c11_56a7_return_output);

-- n8_MUX_uxn_opcodes_h_l870_c7_903b
n8_MUX_uxn_opcodes_h_l870_c7_903b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l870_c7_903b_cond,
n8_MUX_uxn_opcodes_h_l870_c7_903b_iftrue,
n8_MUX_uxn_opcodes_h_l870_c7_903b_iffalse,
n8_MUX_uxn_opcodes_h_l870_c7_903b_return_output);

-- t8_MUX_uxn_opcodes_h_l870_c7_903b
t8_MUX_uxn_opcodes_h_l870_c7_903b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l870_c7_903b_cond,
t8_MUX_uxn_opcodes_h_l870_c7_903b_iftrue,
t8_MUX_uxn_opcodes_h_l870_c7_903b_iffalse,
t8_MUX_uxn_opcodes_h_l870_c7_903b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_903b
result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_903b : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_903b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_903b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_903b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_903b_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l870_c7_903b
result_stack_value_MUX_uxn_opcodes_h_l870_c7_903b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l870_c7_903b_cond,
result_stack_value_MUX_uxn_opcodes_h_l870_c7_903b_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l870_c7_903b_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l870_c7_903b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_903b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_903b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_903b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_903b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_903b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_903b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l870_c7_903b
result_is_sp_shift_MUX_uxn_opcodes_h_l870_c7_903b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l870_c7_903b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l870_c7_903b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l870_c7_903b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l870_c7_903b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_903b
result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_903b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_903b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_903b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_903b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_903b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_903b
result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_903b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_903b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_903b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_903b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_903b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l873_c11_7d12
BIN_OP_EQ_uxn_opcodes_h_l873_c11_7d12 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l873_c11_7d12_left,
BIN_OP_EQ_uxn_opcodes_h_l873_c11_7d12_right,
BIN_OP_EQ_uxn_opcodes_h_l873_c11_7d12_return_output);

-- n8_MUX_uxn_opcodes_h_l873_c7_9d31
n8_MUX_uxn_opcodes_h_l873_c7_9d31 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l873_c7_9d31_cond,
n8_MUX_uxn_opcodes_h_l873_c7_9d31_iftrue,
n8_MUX_uxn_opcodes_h_l873_c7_9d31_iffalse,
n8_MUX_uxn_opcodes_h_l873_c7_9d31_return_output);

-- t8_MUX_uxn_opcodes_h_l873_c7_9d31
t8_MUX_uxn_opcodes_h_l873_c7_9d31 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l873_c7_9d31_cond,
t8_MUX_uxn_opcodes_h_l873_c7_9d31_iftrue,
t8_MUX_uxn_opcodes_h_l873_c7_9d31_iffalse,
t8_MUX_uxn_opcodes_h_l873_c7_9d31_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l873_c7_9d31
result_sp_relative_shift_MUX_uxn_opcodes_h_l873_c7_9d31 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l873_c7_9d31_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l873_c7_9d31_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l873_c7_9d31_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l873_c7_9d31_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l873_c7_9d31
result_stack_value_MUX_uxn_opcodes_h_l873_c7_9d31 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l873_c7_9d31_cond,
result_stack_value_MUX_uxn_opcodes_h_l873_c7_9d31_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l873_c7_9d31_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l873_c7_9d31_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l873_c7_9d31
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l873_c7_9d31 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l873_c7_9d31_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l873_c7_9d31_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l873_c7_9d31_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l873_c7_9d31_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l873_c7_9d31
result_is_sp_shift_MUX_uxn_opcodes_h_l873_c7_9d31 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l873_c7_9d31_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l873_c7_9d31_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l873_c7_9d31_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l873_c7_9d31_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l873_c7_9d31
result_is_stack_write_MUX_uxn_opcodes_h_l873_c7_9d31 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l873_c7_9d31_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l873_c7_9d31_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l873_c7_9d31_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l873_c7_9d31_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l873_c7_9d31
result_is_opc_done_MUX_uxn_opcodes_h_l873_c7_9d31 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l873_c7_9d31_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l873_c7_9d31_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l873_c7_9d31_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l873_c7_9d31_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l877_c11_4f10
BIN_OP_EQ_uxn_opcodes_h_l877_c11_4f10 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l877_c11_4f10_left,
BIN_OP_EQ_uxn_opcodes_h_l877_c11_4f10_right,
BIN_OP_EQ_uxn_opcodes_h_l877_c11_4f10_return_output);

-- n8_MUX_uxn_opcodes_h_l877_c7_2126
n8_MUX_uxn_opcodes_h_l877_c7_2126 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l877_c7_2126_cond,
n8_MUX_uxn_opcodes_h_l877_c7_2126_iftrue,
n8_MUX_uxn_opcodes_h_l877_c7_2126_iffalse,
n8_MUX_uxn_opcodes_h_l877_c7_2126_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l877_c7_2126
result_sp_relative_shift_MUX_uxn_opcodes_h_l877_c7_2126 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l877_c7_2126_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l877_c7_2126_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l877_c7_2126_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l877_c7_2126_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l877_c7_2126
result_stack_value_MUX_uxn_opcodes_h_l877_c7_2126 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l877_c7_2126_cond,
result_stack_value_MUX_uxn_opcodes_h_l877_c7_2126_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l877_c7_2126_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l877_c7_2126_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l877_c7_2126
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l877_c7_2126 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l877_c7_2126_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l877_c7_2126_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l877_c7_2126_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l877_c7_2126_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l877_c7_2126
result_is_sp_shift_MUX_uxn_opcodes_h_l877_c7_2126 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l877_c7_2126_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l877_c7_2126_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l877_c7_2126_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l877_c7_2126_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l877_c7_2126
result_is_stack_write_MUX_uxn_opcodes_h_l877_c7_2126 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l877_c7_2126_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l877_c7_2126_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l877_c7_2126_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l877_c7_2126_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l877_c7_2126
result_is_opc_done_MUX_uxn_opcodes_h_l877_c7_2126 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l877_c7_2126_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l877_c7_2126_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l877_c7_2126_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l877_c7_2126_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l880_c11_d05b
BIN_OP_EQ_uxn_opcodes_h_l880_c11_d05b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l880_c11_d05b_left,
BIN_OP_EQ_uxn_opcodes_h_l880_c11_d05b_right,
BIN_OP_EQ_uxn_opcodes_h_l880_c11_d05b_return_output);

-- n8_MUX_uxn_opcodes_h_l880_c7_8a1a
n8_MUX_uxn_opcodes_h_l880_c7_8a1a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l880_c7_8a1a_cond,
n8_MUX_uxn_opcodes_h_l880_c7_8a1a_iftrue,
n8_MUX_uxn_opcodes_h_l880_c7_8a1a_iffalse,
n8_MUX_uxn_opcodes_h_l880_c7_8a1a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l880_c7_8a1a
result_sp_relative_shift_MUX_uxn_opcodes_h_l880_c7_8a1a : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l880_c7_8a1a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l880_c7_8a1a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l880_c7_8a1a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l880_c7_8a1a_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l880_c7_8a1a
result_stack_value_MUX_uxn_opcodes_h_l880_c7_8a1a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l880_c7_8a1a_cond,
result_stack_value_MUX_uxn_opcodes_h_l880_c7_8a1a_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l880_c7_8a1a_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l880_c7_8a1a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l880_c7_8a1a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l880_c7_8a1a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l880_c7_8a1a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l880_c7_8a1a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l880_c7_8a1a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l880_c7_8a1a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l880_c7_8a1a
result_is_sp_shift_MUX_uxn_opcodes_h_l880_c7_8a1a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l880_c7_8a1a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l880_c7_8a1a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l880_c7_8a1a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l880_c7_8a1a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l880_c7_8a1a
result_is_stack_write_MUX_uxn_opcodes_h_l880_c7_8a1a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l880_c7_8a1a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l880_c7_8a1a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l880_c7_8a1a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l880_c7_8a1a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l880_c7_8a1a
result_is_opc_done_MUX_uxn_opcodes_h_l880_c7_8a1a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l880_c7_8a1a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l880_c7_8a1a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l880_c7_8a1a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l880_c7_8a1a_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l883_c32_f842
BIN_OP_AND_uxn_opcodes_h_l883_c32_f842 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l883_c32_f842_left,
BIN_OP_AND_uxn_opcodes_h_l883_c32_f842_right,
BIN_OP_AND_uxn_opcodes_h_l883_c32_f842_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l883_c32_49df
BIN_OP_GT_uxn_opcodes_h_l883_c32_49df : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l883_c32_49df_left,
BIN_OP_GT_uxn_opcodes_h_l883_c32_49df_right,
BIN_OP_GT_uxn_opcodes_h_l883_c32_49df_return_output);

-- MUX_uxn_opcodes_h_l883_c32_c5c3
MUX_uxn_opcodes_h_l883_c32_c5c3 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l883_c32_c5c3_cond,
MUX_uxn_opcodes_h_l883_c32_c5c3_iftrue,
MUX_uxn_opcodes_h_l883_c32_c5c3_iffalse,
MUX_uxn_opcodes_h_l883_c32_c5c3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l885_c11_3cca
BIN_OP_EQ_uxn_opcodes_h_l885_c11_3cca : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l885_c11_3cca_left,
BIN_OP_EQ_uxn_opcodes_h_l885_c11_3cca_right,
BIN_OP_EQ_uxn_opcodes_h_l885_c11_3cca_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l885_c7_f616
result_stack_value_MUX_uxn_opcodes_h_l885_c7_f616 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l885_c7_f616_cond,
result_stack_value_MUX_uxn_opcodes_h_l885_c7_f616_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l885_c7_f616_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l885_c7_f616_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l885_c7_f616
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l885_c7_f616 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l885_c7_f616_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l885_c7_f616_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l885_c7_f616_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l885_c7_f616_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l885_c7_f616
result_is_sp_shift_MUX_uxn_opcodes_h_l885_c7_f616 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l885_c7_f616_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l885_c7_f616_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l885_c7_f616_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l885_c7_f616_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l885_c7_f616
result_is_stack_write_MUX_uxn_opcodes_h_l885_c7_f616 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l885_c7_f616_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l885_c7_f616_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l885_c7_f616_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l885_c7_f616_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l885_c7_f616
result_is_opc_done_MUX_uxn_opcodes_h_l885_c7_f616 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l885_c7_f616_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l885_c7_f616_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l885_c7_f616_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l885_c7_f616_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l889_c24_8e20
BIN_OP_PLUS_uxn_opcodes_h_l889_c24_8e20 : entity work.BIN_OP_PLUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l889_c24_8e20_left,
BIN_OP_PLUS_uxn_opcodes_h_l889_c24_8e20_right,
BIN_OP_PLUS_uxn_opcodes_h_l889_c24_8e20_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l891_c11_33f6
BIN_OP_EQ_uxn_opcodes_h_l891_c11_33f6 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l891_c11_33f6_left,
BIN_OP_EQ_uxn_opcodes_h_l891_c11_33f6_right,
BIN_OP_EQ_uxn_opcodes_h_l891_c11_33f6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_b3c3
result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_b3c3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_b3c3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_b3c3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_b3c3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_b3c3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_b3c3
result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_b3c3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_b3c3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_b3c3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_b3c3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_b3c3_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l865_c6_7c38_return_output,
 n8_MUX_uxn_opcodes_h_l865_c2_ea72_return_output,
 t8_MUX_uxn_opcodes_h_l865_c2_ea72_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c2_ea72_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l865_c2_ea72_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c2_ea72_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l865_c2_ea72_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l865_c2_ea72_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l865_c2_ea72_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l870_c11_56a7_return_output,
 n8_MUX_uxn_opcodes_h_l870_c7_903b_return_output,
 t8_MUX_uxn_opcodes_h_l870_c7_903b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_903b_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l870_c7_903b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_903b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l870_c7_903b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_903b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_903b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l873_c11_7d12_return_output,
 n8_MUX_uxn_opcodes_h_l873_c7_9d31_return_output,
 t8_MUX_uxn_opcodes_h_l873_c7_9d31_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l873_c7_9d31_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l873_c7_9d31_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l873_c7_9d31_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l873_c7_9d31_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l873_c7_9d31_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l873_c7_9d31_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l877_c11_4f10_return_output,
 n8_MUX_uxn_opcodes_h_l877_c7_2126_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l877_c7_2126_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l877_c7_2126_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l877_c7_2126_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l877_c7_2126_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l877_c7_2126_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l877_c7_2126_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l880_c11_d05b_return_output,
 n8_MUX_uxn_opcodes_h_l880_c7_8a1a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l880_c7_8a1a_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l880_c7_8a1a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l880_c7_8a1a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l880_c7_8a1a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l880_c7_8a1a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l880_c7_8a1a_return_output,
 BIN_OP_AND_uxn_opcodes_h_l883_c32_f842_return_output,
 BIN_OP_GT_uxn_opcodes_h_l883_c32_49df_return_output,
 MUX_uxn_opcodes_h_l883_c32_c5c3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l885_c11_3cca_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l885_c7_f616_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l885_c7_f616_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l885_c7_f616_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l885_c7_f616_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l885_c7_f616_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l889_c24_8e20_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l891_c11_33f6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_b3c3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_b3c3_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l865_c6_7c38_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l865_c6_7c38_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l865_c6_7c38_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l865_c2_ea72_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l865_c2_ea72_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l870_c7_903b_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l865_c2_ea72_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l865_c2_ea72_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l865_c2_ea72_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l865_c2_ea72_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l870_c7_903b_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l865_c2_ea72_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l865_c2_ea72_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c2_ea72_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c2_ea72_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_903b_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c2_ea72_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c2_ea72_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l865_c2_ea72_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l865_c2_ea72_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l870_c7_903b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l865_c2_ea72_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l865_c2_ea72_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c2_ea72_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l867_c3_89f4 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c2_ea72_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_903b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c2_ea72_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c2_ea72_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l865_c2_ea72_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l865_c2_ea72_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l870_c7_903b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l865_c2_ea72_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l865_c2_ea72_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l865_c2_ea72_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l865_c2_ea72_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_903b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l865_c2_ea72_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l865_c2_ea72_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l865_c2_ea72_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l865_c2_ea72_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_903b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l865_c2_ea72_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l865_c2_ea72_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l870_c11_56a7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l870_c11_56a7_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l870_c11_56a7_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l870_c7_903b_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l870_c7_903b_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l873_c7_9d31_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l870_c7_903b_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l870_c7_903b_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l870_c7_903b_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l873_c7_9d31_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l870_c7_903b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_903b_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_903b_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l873_c7_9d31_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_903b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l870_c7_903b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l870_c7_903b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l873_c7_9d31_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l870_c7_903b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_903b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l871_c3_9691 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_903b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l873_c7_9d31_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_903b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l870_c7_903b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l870_c7_903b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l873_c7_9d31_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l870_c7_903b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_903b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_903b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l873_c7_9d31_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_903b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_903b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_903b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l873_c7_9d31_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_903b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l873_c11_7d12_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l873_c11_7d12_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l873_c11_7d12_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l873_c7_9d31_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l873_c7_9d31_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l877_c7_2126_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l873_c7_9d31_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l873_c7_9d31_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l873_c7_9d31_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l873_c7_9d31_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l873_c7_9d31_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l873_c7_9d31_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l877_c7_2126_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l873_c7_9d31_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l873_c7_9d31_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l873_c7_9d31_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l877_c7_2126_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l873_c7_9d31_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l873_c7_9d31_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l875_c3_29f3 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l873_c7_9d31_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l877_c7_2126_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l873_c7_9d31_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l873_c7_9d31_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l873_c7_9d31_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l877_c7_2126_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l873_c7_9d31_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l873_c7_9d31_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l873_c7_9d31_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l877_c7_2126_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l873_c7_9d31_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l873_c7_9d31_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l873_c7_9d31_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l877_c7_2126_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l873_c7_9d31_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l877_c11_4f10_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l877_c11_4f10_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l877_c11_4f10_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l877_c7_2126_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l877_c7_2126_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l880_c7_8a1a_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l877_c7_2126_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l877_c7_2126_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l877_c7_2126_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l880_c7_8a1a_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l877_c7_2126_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l877_c7_2126_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l877_c7_2126_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l880_c7_8a1a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l877_c7_2126_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l877_c7_2126_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l878_c3_2e13 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l877_c7_2126_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l880_c7_8a1a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l877_c7_2126_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l877_c7_2126_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l877_c7_2126_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l880_c7_8a1a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l877_c7_2126_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l877_c7_2126_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l877_c7_2126_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l880_c7_8a1a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l877_c7_2126_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l877_c7_2126_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l877_c7_2126_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l880_c7_8a1a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l877_c7_2126_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l880_c11_d05b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l880_c11_d05b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l880_c11_d05b_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l880_c7_8a1a_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l880_c7_8a1a_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l880_c7_8a1a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l880_c7_8a1a_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l880_c7_8a1a_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l880_c7_8a1a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l880_c7_8a1a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l880_c7_8a1a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l885_c7_f616_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l880_c7_8a1a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l880_c7_8a1a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l880_c7_8a1a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l885_c7_f616_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l880_c7_8a1a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l880_c7_8a1a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l880_c7_8a1a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l885_c7_f616_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l880_c7_8a1a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l880_c7_8a1a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l880_c7_8a1a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l885_c7_f616_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l880_c7_8a1a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l880_c7_8a1a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l880_c7_8a1a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l885_c7_f616_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l880_c7_8a1a_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l883_c32_c5c3_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l883_c32_c5c3_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l883_c32_c5c3_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l883_c32_f842_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l883_c32_f842_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l883_c32_f842_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l883_c32_49df_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l883_c32_49df_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l883_c32_49df_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l883_c32_c5c3_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l885_c11_3cca_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l885_c11_3cca_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l885_c11_3cca_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l885_c7_f616_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_uxn_opcodes_h_l889_c3_e2c9 : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l885_c7_f616_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l885_c7_f616_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l885_c7_f616_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l888_c3_1746 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l885_c7_f616_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l885_c7_f616_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l885_c7_f616_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l885_c7_f616_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l885_c7_f616_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l885_c7_f616_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l885_c7_f616_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_b3c3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l885_c7_f616_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l885_c7_f616_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l885_c7_f616_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_b3c3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l885_c7_f616_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l889_c24_8e20_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l889_c24_8e20_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l889_c24_8e20_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l891_c11_33f6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l891_c11_33f6_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l891_c11_33f6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_b3c3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_b3c3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_b3c3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_b3c3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_b3c3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_b3c3_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l877_l873_l870_l865_l880_DUPLICATE_0b0e_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l877_l873_l870_l865_l880_l885_DUPLICATE_9a4a_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l877_l873_l870_l865_l885_DUPLICATE_366f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l877_l873_l870_l865_l891_l880_DUPLICATE_58d7_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l877_l873_l870_l891_l880_l885_DUPLICATE_cd4d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l880_l885_DUPLICATE_4deb_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5_uxn_opcodes_h_l896_l861_DUPLICATE_bc20_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l871_c3_9691 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_903b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l871_c3_9691;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l888_c3_1746 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l885_c7_f616_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l888_c3_1746;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l873_c11_7d12_right := to_unsigned(2, 2);
     VAR_MUX_uxn_opcodes_h_l883_c32_c5c3_iffalse := resize(to_signed(-1, 2), 8);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_b3c3_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l885_c11_3cca_right := to_unsigned(5, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_b3c3_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l865_c2_ea72_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l883_c32_f842_right := to_unsigned(128, 8);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l885_c7_f616_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l891_c11_33f6_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l880_c11_d05b_right := to_unsigned(4, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l880_c7_8a1a_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l867_c3_89f4 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c2_ea72_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l867_c3_89f4;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l885_c7_f616_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l870_c11_56a7_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l878_c3_2e13 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l877_c7_2126_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l878_c3_2e13;
     VAR_MUX_uxn_opcodes_h_l883_c32_c5c3_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_BIN_OP_GT_uxn_opcodes_h_l883_c32_49df_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l877_c11_4f10_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l875_c3_29f3 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l873_c7_9d31_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l875_c3_29f3;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l865_c6_7c38_right := to_unsigned(0, 1);

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
     VAR_BIN_OP_AND_uxn_opcodes_h_l883_c32_f842_left := VAR_ins;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l889_c24_8e20_left := n8;
     VAR_n8_MUX_uxn_opcodes_h_l865_c2_ea72_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l870_c7_903b_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l873_c7_9d31_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l877_c7_2126_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l880_c7_8a1a_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l865_c6_7c38_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l870_c11_56a7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l873_c11_7d12_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l877_c11_4f10_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l880_c11_d05b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l885_c11_3cca_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l891_c11_33f6_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l880_c7_8a1a_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l873_c7_9d31_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l889_c24_8e20_right := t8;
     VAR_t8_MUX_uxn_opcodes_h_l865_c2_ea72_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l870_c7_903b_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l873_c7_9d31_iffalse := t8;
     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l877_l873_l870_l865_l880_DUPLICATE_0b0e LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l877_l873_l870_l865_l880_DUPLICATE_0b0e_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l877_l873_l870_l891_l880_l885_DUPLICATE_cd4d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l877_l873_l870_l891_l880_l885_DUPLICATE_cd4d_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l880_l885_DUPLICATE_4deb LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l880_l885_DUPLICATE_4deb_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l870_c11_56a7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l870_c11_56a7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l870_c11_56a7_left;
     BIN_OP_EQ_uxn_opcodes_h_l870_c11_56a7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l870_c11_56a7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l870_c11_56a7_return_output := BIN_OP_EQ_uxn_opcodes_h_l870_c11_56a7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l891_c11_33f6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l891_c11_33f6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l891_c11_33f6_left;
     BIN_OP_EQ_uxn_opcodes_h_l891_c11_33f6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l891_c11_33f6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l891_c11_33f6_return_output := BIN_OP_EQ_uxn_opcodes_h_l891_c11_33f6_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l877_l873_l870_l865_l885_DUPLICATE_366f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l877_l873_l870_l865_l885_DUPLICATE_366f_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l873_c11_7d12] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l873_c11_7d12_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l873_c11_7d12_left;
     BIN_OP_EQ_uxn_opcodes_h_l873_c11_7d12_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l873_c11_7d12_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l873_c11_7d12_return_output := BIN_OP_EQ_uxn_opcodes_h_l873_c11_7d12_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l880_c11_d05b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l880_c11_d05b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l880_c11_d05b_left;
     BIN_OP_EQ_uxn_opcodes_h_l880_c11_d05b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l880_c11_d05b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l880_c11_d05b_return_output := BIN_OP_EQ_uxn_opcodes_h_l880_c11_d05b_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l877_l873_l870_l865_l880_l885_DUPLICATE_9a4a LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l877_l873_l870_l865_l880_l885_DUPLICATE_9a4a_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l885_c11_3cca] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l885_c11_3cca_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l885_c11_3cca_left;
     BIN_OP_EQ_uxn_opcodes_h_l885_c11_3cca_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l885_c11_3cca_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l885_c11_3cca_return_output := BIN_OP_EQ_uxn_opcodes_h_l885_c11_3cca_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l877_c11_4f10] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l877_c11_4f10_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l877_c11_4f10_left;
     BIN_OP_EQ_uxn_opcodes_h_l877_c11_4f10_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l877_c11_4f10_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l877_c11_4f10_return_output := BIN_OP_EQ_uxn_opcodes_h_l877_c11_4f10_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l865_c6_7c38] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l865_c6_7c38_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l865_c6_7c38_left;
     BIN_OP_EQ_uxn_opcodes_h_l865_c6_7c38_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l865_c6_7c38_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l865_c6_7c38_return_output := BIN_OP_EQ_uxn_opcodes_h_l865_c6_7c38_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l883_c32_f842] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l883_c32_f842_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l883_c32_f842_left;
     BIN_OP_AND_uxn_opcodes_h_l883_c32_f842_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l883_c32_f842_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l883_c32_f842_return_output := BIN_OP_AND_uxn_opcodes_h_l883_c32_f842_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l877_l873_l870_l865_l891_l880_DUPLICATE_58d7 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l877_l873_l870_l865_l891_l880_DUPLICATE_58d7_return_output := result.is_stack_write;

     -- BIN_OP_PLUS[uxn_opcodes_h_l889_c24_8e20] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l889_c24_8e20_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l889_c24_8e20_left;
     BIN_OP_PLUS_uxn_opcodes_h_l889_c24_8e20_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l889_c24_8e20_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l889_c24_8e20_return_output := BIN_OP_PLUS_uxn_opcodes_h_l889_c24_8e20_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l883_c32_49df_left := VAR_BIN_OP_AND_uxn_opcodes_h_l883_c32_f842_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l865_c2_ea72_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l865_c6_7c38_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l865_c2_ea72_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l865_c6_7c38_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l865_c2_ea72_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l865_c6_7c38_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l865_c2_ea72_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l865_c6_7c38_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c2_ea72_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l865_c6_7c38_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c2_ea72_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l865_c6_7c38_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l865_c2_ea72_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l865_c6_7c38_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l865_c2_ea72_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l865_c6_7c38_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l870_c7_903b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l870_c11_56a7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_903b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l870_c11_56a7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l870_c7_903b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l870_c11_56a7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_903b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l870_c11_56a7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_903b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l870_c11_56a7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_903b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l870_c11_56a7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l870_c7_903b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l870_c11_56a7_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l870_c7_903b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l870_c11_56a7_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l873_c7_9d31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l873_c11_7d12_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l873_c7_9d31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l873_c11_7d12_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l873_c7_9d31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l873_c11_7d12_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l873_c7_9d31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l873_c11_7d12_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l873_c7_9d31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l873_c11_7d12_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l873_c7_9d31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l873_c11_7d12_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l873_c7_9d31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l873_c11_7d12_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l873_c7_9d31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l873_c11_7d12_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l877_c7_2126_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l877_c11_4f10_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l877_c7_2126_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l877_c11_4f10_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l877_c7_2126_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l877_c11_4f10_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l877_c7_2126_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l877_c11_4f10_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l877_c7_2126_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l877_c11_4f10_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l877_c7_2126_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l877_c11_4f10_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l877_c7_2126_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l877_c11_4f10_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l880_c7_8a1a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l880_c11_d05b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l880_c7_8a1a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l880_c11_d05b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l880_c7_8a1a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l880_c11_d05b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l880_c7_8a1a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l880_c11_d05b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l880_c7_8a1a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l880_c11_d05b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l880_c7_8a1a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l880_c11_d05b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l880_c7_8a1a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l880_c11_d05b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l885_c7_f616_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l885_c11_3cca_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l885_c7_f616_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l885_c11_3cca_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l885_c7_f616_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l885_c11_3cca_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l885_c7_f616_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l885_c11_3cca_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l885_c7_f616_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l885_c11_3cca_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_b3c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l891_c11_33f6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_b3c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l891_c11_33f6_return_output;
     VAR_result_stack_value_uxn_opcodes_h_l889_c3_e2c9 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l889_c24_8e20_return_output, 8);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c2_ea72_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l877_l873_l870_l865_l880_DUPLICATE_0b0e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_903b_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l877_l873_l870_l865_l880_DUPLICATE_0b0e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l873_c7_9d31_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l877_l873_l870_l865_l880_DUPLICATE_0b0e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l877_c7_2126_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l877_l873_l870_l865_l880_DUPLICATE_0b0e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l880_c7_8a1a_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l877_l873_l870_l865_l880_DUPLICATE_0b0e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_903b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l877_l873_l870_l891_l880_l885_DUPLICATE_cd4d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l873_c7_9d31_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l877_l873_l870_l891_l880_l885_DUPLICATE_cd4d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l877_c7_2126_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l877_l873_l870_l891_l880_l885_DUPLICATE_cd4d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l880_c7_8a1a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l877_l873_l870_l891_l880_l885_DUPLICATE_cd4d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l885_c7_f616_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l877_l873_l870_l891_l880_l885_DUPLICATE_cd4d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_b3c3_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l877_l873_l870_l891_l880_l885_DUPLICATE_cd4d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l865_c2_ea72_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l877_l873_l870_l865_l885_DUPLICATE_366f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l870_c7_903b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l877_l873_l870_l865_l885_DUPLICATE_366f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l873_c7_9d31_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l877_l873_l870_l865_l885_DUPLICATE_366f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l877_c7_2126_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l877_l873_l870_l865_l885_DUPLICATE_366f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l885_c7_f616_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l877_l873_l870_l865_l885_DUPLICATE_366f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l865_c2_ea72_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l877_l873_l870_l865_l891_l880_DUPLICATE_58d7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_903b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l877_l873_l870_l865_l891_l880_DUPLICATE_58d7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l873_c7_9d31_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l877_l873_l870_l865_l891_l880_DUPLICATE_58d7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l877_c7_2126_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l877_l873_l870_l865_l891_l880_DUPLICATE_58d7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l880_c7_8a1a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l877_l873_l870_l865_l891_l880_DUPLICATE_58d7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_b3c3_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l877_l873_l870_l865_l891_l880_DUPLICATE_58d7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l880_c7_8a1a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l880_l885_DUPLICATE_4deb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l885_c7_f616_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l880_l885_DUPLICATE_4deb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l865_c2_ea72_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l877_l873_l870_l865_l880_l885_DUPLICATE_9a4a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l870_c7_903b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l877_l873_l870_l865_l880_l885_DUPLICATE_9a4a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l873_c7_9d31_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l877_l873_l870_l865_l880_l885_DUPLICATE_9a4a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l877_c7_2126_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l877_l873_l870_l865_l880_l885_DUPLICATE_9a4a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l880_c7_8a1a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l877_l873_l870_l865_l880_l885_DUPLICATE_9a4a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l885_c7_f616_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l877_l873_l870_l865_l880_l885_DUPLICATE_9a4a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l885_c7_f616_iftrue := VAR_result_stack_value_uxn_opcodes_h_l889_c3_e2c9;
     -- n8_MUX[uxn_opcodes_h_l880_c7_8a1a] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l880_c7_8a1a_cond <= VAR_n8_MUX_uxn_opcodes_h_l880_c7_8a1a_cond;
     n8_MUX_uxn_opcodes_h_l880_c7_8a1a_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l880_c7_8a1a_iftrue;
     n8_MUX_uxn_opcodes_h_l880_c7_8a1a_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l880_c7_8a1a_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l880_c7_8a1a_return_output := n8_MUX_uxn_opcodes_h_l880_c7_8a1a_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l883_c32_49df] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l883_c32_49df_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l883_c32_49df_left;
     BIN_OP_GT_uxn_opcodes_h_l883_c32_49df_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l883_c32_49df_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l883_c32_49df_return_output := BIN_OP_GT_uxn_opcodes_h_l883_c32_49df_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l891_c7_b3c3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_b3c3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_b3c3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_b3c3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_b3c3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_b3c3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_b3c3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_b3c3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_b3c3_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l885_c7_f616] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l885_c7_f616_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l885_c7_f616_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l885_c7_f616_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l885_c7_f616_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l885_c7_f616_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l885_c7_f616_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l885_c7_f616_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l885_c7_f616_return_output;

     -- t8_MUX[uxn_opcodes_h_l873_c7_9d31] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l873_c7_9d31_cond <= VAR_t8_MUX_uxn_opcodes_h_l873_c7_9d31_cond;
     t8_MUX_uxn_opcodes_h_l873_c7_9d31_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l873_c7_9d31_iftrue;
     t8_MUX_uxn_opcodes_h_l873_c7_9d31_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l873_c7_9d31_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l873_c7_9d31_return_output := t8_MUX_uxn_opcodes_h_l873_c7_9d31_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l885_c7_f616] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l885_c7_f616_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l885_c7_f616_cond;
     result_stack_value_MUX_uxn_opcodes_h_l885_c7_f616_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l885_c7_f616_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l885_c7_f616_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l885_c7_f616_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l885_c7_f616_return_output := result_stack_value_MUX_uxn_opcodes_h_l885_c7_f616_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l885_c7_f616] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l885_c7_f616_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l885_c7_f616_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l885_c7_f616_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l885_c7_f616_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l885_c7_f616_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l885_c7_f616_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l885_c7_f616_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l885_c7_f616_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l891_c7_b3c3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_b3c3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_b3c3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_b3c3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_b3c3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_b3c3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_b3c3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_b3c3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_b3c3_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l883_c32_c5c3_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l883_c32_49df_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l877_c7_2126_iffalse := VAR_n8_MUX_uxn_opcodes_h_l880_c7_8a1a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l885_c7_f616_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_b3c3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l880_c7_8a1a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l885_c7_f616_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l885_c7_f616_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_b3c3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l880_c7_8a1a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l885_c7_f616_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l880_c7_8a1a_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l885_c7_f616_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l870_c7_903b_iffalse := VAR_t8_MUX_uxn_opcodes_h_l873_c7_9d31_return_output;
     -- t8_MUX[uxn_opcodes_h_l870_c7_903b] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l870_c7_903b_cond <= VAR_t8_MUX_uxn_opcodes_h_l870_c7_903b_cond;
     t8_MUX_uxn_opcodes_h_l870_c7_903b_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l870_c7_903b_iftrue;
     t8_MUX_uxn_opcodes_h_l870_c7_903b_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l870_c7_903b_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l870_c7_903b_return_output := t8_MUX_uxn_opcodes_h_l870_c7_903b_return_output;

     -- MUX[uxn_opcodes_h_l883_c32_c5c3] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l883_c32_c5c3_cond <= VAR_MUX_uxn_opcodes_h_l883_c32_c5c3_cond;
     MUX_uxn_opcodes_h_l883_c32_c5c3_iftrue <= VAR_MUX_uxn_opcodes_h_l883_c32_c5c3_iftrue;
     MUX_uxn_opcodes_h_l883_c32_c5c3_iffalse <= VAR_MUX_uxn_opcodes_h_l883_c32_c5c3_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l883_c32_c5c3_return_output := MUX_uxn_opcodes_h_l883_c32_c5c3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l880_c7_8a1a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l880_c7_8a1a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l880_c7_8a1a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l880_c7_8a1a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l880_c7_8a1a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l880_c7_8a1a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l880_c7_8a1a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l880_c7_8a1a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l880_c7_8a1a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l885_c7_f616] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l885_c7_f616_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l885_c7_f616_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l885_c7_f616_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l885_c7_f616_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l885_c7_f616_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l885_c7_f616_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l885_c7_f616_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l885_c7_f616_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l885_c7_f616] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l885_c7_f616_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l885_c7_f616_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l885_c7_f616_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l885_c7_f616_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l885_c7_f616_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l885_c7_f616_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l885_c7_f616_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l885_c7_f616_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l880_c7_8a1a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l880_c7_8a1a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l880_c7_8a1a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l880_c7_8a1a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l880_c7_8a1a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l880_c7_8a1a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l880_c7_8a1a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l880_c7_8a1a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l880_c7_8a1a_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l880_c7_8a1a] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l880_c7_8a1a_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l880_c7_8a1a_cond;
     result_stack_value_MUX_uxn_opcodes_h_l880_c7_8a1a_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l880_c7_8a1a_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l880_c7_8a1a_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l880_c7_8a1a_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l880_c7_8a1a_return_output := result_stack_value_MUX_uxn_opcodes_h_l880_c7_8a1a_return_output;

     -- n8_MUX[uxn_opcodes_h_l877_c7_2126] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l877_c7_2126_cond <= VAR_n8_MUX_uxn_opcodes_h_l877_c7_2126_cond;
     n8_MUX_uxn_opcodes_h_l877_c7_2126_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l877_c7_2126_iftrue;
     n8_MUX_uxn_opcodes_h_l877_c7_2126_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l877_c7_2126_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l877_c7_2126_return_output := n8_MUX_uxn_opcodes_h_l877_c7_2126_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l880_c7_8a1a_iftrue := VAR_MUX_uxn_opcodes_h_l883_c32_c5c3_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l873_c7_9d31_iffalse := VAR_n8_MUX_uxn_opcodes_h_l877_c7_2126_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l880_c7_8a1a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l885_c7_f616_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l877_c7_2126_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l880_c7_8a1a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l880_c7_8a1a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l885_c7_f616_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l877_c7_2126_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l880_c7_8a1a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l877_c7_2126_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l880_c7_8a1a_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l865_c2_ea72_iffalse := VAR_t8_MUX_uxn_opcodes_h_l870_c7_903b_return_output;
     -- n8_MUX[uxn_opcodes_h_l873_c7_9d31] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l873_c7_9d31_cond <= VAR_n8_MUX_uxn_opcodes_h_l873_c7_9d31_cond;
     n8_MUX_uxn_opcodes_h_l873_c7_9d31_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l873_c7_9d31_iftrue;
     n8_MUX_uxn_opcodes_h_l873_c7_9d31_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l873_c7_9d31_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l873_c7_9d31_return_output := n8_MUX_uxn_opcodes_h_l873_c7_9d31_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l877_c7_2126] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l877_c7_2126_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l877_c7_2126_cond;
     result_stack_value_MUX_uxn_opcodes_h_l877_c7_2126_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l877_c7_2126_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l877_c7_2126_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l877_c7_2126_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l877_c7_2126_return_output := result_stack_value_MUX_uxn_opcodes_h_l877_c7_2126_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l880_c7_8a1a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l880_c7_8a1a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l880_c7_8a1a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l880_c7_8a1a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l880_c7_8a1a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l880_c7_8a1a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l880_c7_8a1a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l880_c7_8a1a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l880_c7_8a1a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l877_c7_2126] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l877_c7_2126_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l877_c7_2126_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l877_c7_2126_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l877_c7_2126_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l877_c7_2126_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l877_c7_2126_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l877_c7_2126_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l877_c7_2126_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l877_c7_2126] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l877_c7_2126_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l877_c7_2126_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l877_c7_2126_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l877_c7_2126_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l877_c7_2126_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l877_c7_2126_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l877_c7_2126_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l877_c7_2126_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l880_c7_8a1a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l880_c7_8a1a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l880_c7_8a1a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l880_c7_8a1a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l880_c7_8a1a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l880_c7_8a1a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l880_c7_8a1a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l880_c7_8a1a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l880_c7_8a1a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l880_c7_8a1a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l880_c7_8a1a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l880_c7_8a1a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l880_c7_8a1a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l880_c7_8a1a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l880_c7_8a1a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l880_c7_8a1a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l880_c7_8a1a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l880_c7_8a1a_return_output;

     -- t8_MUX[uxn_opcodes_h_l865_c2_ea72] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l865_c2_ea72_cond <= VAR_t8_MUX_uxn_opcodes_h_l865_c2_ea72_cond;
     t8_MUX_uxn_opcodes_h_l865_c2_ea72_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l865_c2_ea72_iftrue;
     t8_MUX_uxn_opcodes_h_l865_c2_ea72_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l865_c2_ea72_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l865_c2_ea72_return_output := t8_MUX_uxn_opcodes_h_l865_c2_ea72_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l870_c7_903b_iffalse := VAR_n8_MUX_uxn_opcodes_h_l873_c7_9d31_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l877_c7_2126_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l880_c7_8a1a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l873_c7_9d31_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l877_c7_2126_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l877_c7_2126_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l880_c7_8a1a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l877_c7_2126_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l880_c7_8a1a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l873_c7_9d31_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l877_c7_2126_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l873_c7_9d31_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l877_c7_2126_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l865_c2_ea72_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l877_c7_2126] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l877_c7_2126_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l877_c7_2126_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l877_c7_2126_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l877_c7_2126_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l877_c7_2126_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l877_c7_2126_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l877_c7_2126_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l877_c7_2126_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l873_c7_9d31] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l873_c7_9d31_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l873_c7_9d31_cond;
     result_stack_value_MUX_uxn_opcodes_h_l873_c7_9d31_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l873_c7_9d31_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l873_c7_9d31_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l873_c7_9d31_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l873_c7_9d31_return_output := result_stack_value_MUX_uxn_opcodes_h_l873_c7_9d31_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l877_c7_2126] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l877_c7_2126_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l877_c7_2126_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l877_c7_2126_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l877_c7_2126_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l877_c7_2126_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l877_c7_2126_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l877_c7_2126_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l877_c7_2126_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l877_c7_2126] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l877_c7_2126_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l877_c7_2126_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l877_c7_2126_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l877_c7_2126_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l877_c7_2126_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l877_c7_2126_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l877_c7_2126_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l877_c7_2126_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l873_c7_9d31] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l873_c7_9d31_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l873_c7_9d31_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l873_c7_9d31_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l873_c7_9d31_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l873_c7_9d31_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l873_c7_9d31_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l873_c7_9d31_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l873_c7_9d31_return_output;

     -- n8_MUX[uxn_opcodes_h_l870_c7_903b] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l870_c7_903b_cond <= VAR_n8_MUX_uxn_opcodes_h_l870_c7_903b_cond;
     n8_MUX_uxn_opcodes_h_l870_c7_903b_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l870_c7_903b_iftrue;
     n8_MUX_uxn_opcodes_h_l870_c7_903b_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l870_c7_903b_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l870_c7_903b_return_output := n8_MUX_uxn_opcodes_h_l870_c7_903b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l873_c7_9d31] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l873_c7_9d31_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l873_c7_9d31_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l873_c7_9d31_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l873_c7_9d31_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l873_c7_9d31_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l873_c7_9d31_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l873_c7_9d31_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l873_c7_9d31_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l865_c2_ea72_iffalse := VAR_n8_MUX_uxn_opcodes_h_l870_c7_903b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l873_c7_9d31_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l877_c7_2126_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l870_c7_903b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l873_c7_9d31_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l873_c7_9d31_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l877_c7_2126_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l873_c7_9d31_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l877_c7_2126_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_903b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l873_c7_9d31_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l870_c7_903b_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l873_c7_9d31_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l870_c7_903b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l870_c7_903b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l870_c7_903b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l870_c7_903b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l870_c7_903b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l870_c7_903b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l870_c7_903b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l870_c7_903b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l870_c7_903b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l873_c7_9d31] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l873_c7_9d31_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l873_c7_9d31_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l873_c7_9d31_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l873_c7_9d31_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l873_c7_9d31_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l873_c7_9d31_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l873_c7_9d31_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l873_c7_9d31_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l870_c7_903b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_903b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_903b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_903b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_903b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_903b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_903b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_903b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_903b_return_output;

     -- n8_MUX[uxn_opcodes_h_l865_c2_ea72] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l865_c2_ea72_cond <= VAR_n8_MUX_uxn_opcodes_h_l865_c2_ea72_cond;
     n8_MUX_uxn_opcodes_h_l865_c2_ea72_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l865_c2_ea72_iftrue;
     n8_MUX_uxn_opcodes_h_l865_c2_ea72_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l865_c2_ea72_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l865_c2_ea72_return_output := n8_MUX_uxn_opcodes_h_l865_c2_ea72_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l873_c7_9d31] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l873_c7_9d31_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l873_c7_9d31_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l873_c7_9d31_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l873_c7_9d31_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l873_c7_9d31_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l873_c7_9d31_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l873_c7_9d31_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l873_c7_9d31_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l873_c7_9d31] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l873_c7_9d31_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l873_c7_9d31_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l873_c7_9d31_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l873_c7_9d31_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l873_c7_9d31_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l873_c7_9d31_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l873_c7_9d31_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l873_c7_9d31_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l870_c7_903b] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l870_c7_903b_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l870_c7_903b_cond;
     result_stack_value_MUX_uxn_opcodes_h_l870_c7_903b_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l870_c7_903b_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l870_c7_903b_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l870_c7_903b_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l870_c7_903b_return_output := result_stack_value_MUX_uxn_opcodes_h_l870_c7_903b_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l865_c2_ea72_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_903b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l873_c7_9d31_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l865_c2_ea72_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l870_c7_903b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_903b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l873_c7_9d31_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_903b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l873_c7_9d31_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c2_ea72_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_903b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l865_c2_ea72_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l870_c7_903b_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l865_c2_ea72] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c2_ea72_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c2_ea72_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c2_ea72_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c2_ea72_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c2_ea72_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c2_ea72_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c2_ea72_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c2_ea72_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l870_c7_903b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_903b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_903b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_903b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_903b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_903b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_903b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_903b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_903b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l865_c2_ea72] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l865_c2_ea72_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l865_c2_ea72_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l865_c2_ea72_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l865_c2_ea72_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l865_c2_ea72_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l865_c2_ea72_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l865_c2_ea72_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l865_c2_ea72_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l870_c7_903b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_903b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_903b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_903b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_903b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_903b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_903b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_903b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_903b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l870_c7_903b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_903b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_903b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_903b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_903b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_903b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_903b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_903b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_903b_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l865_c2_ea72] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l865_c2_ea72_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l865_c2_ea72_cond;
     result_stack_value_MUX_uxn_opcodes_h_l865_c2_ea72_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l865_c2_ea72_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l865_c2_ea72_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l865_c2_ea72_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l865_c2_ea72_return_output := result_stack_value_MUX_uxn_opcodes_h_l865_c2_ea72_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l865_c2_ea72_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_903b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l865_c2_ea72_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_903b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c2_ea72_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_903b_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l865_c2_ea72] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l865_c2_ea72_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l865_c2_ea72_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l865_c2_ea72_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l865_c2_ea72_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l865_c2_ea72_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l865_c2_ea72_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l865_c2_ea72_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l865_c2_ea72_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l865_c2_ea72] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l865_c2_ea72_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l865_c2_ea72_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l865_c2_ea72_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l865_c2_ea72_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l865_c2_ea72_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l865_c2_ea72_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l865_c2_ea72_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l865_c2_ea72_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l865_c2_ea72] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c2_ea72_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c2_ea72_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c2_ea72_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c2_ea72_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c2_ea72_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c2_ea72_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c2_ea72_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c2_ea72_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5_uxn_opcodes_h_l896_l861_DUPLICATE_bc20 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5_uxn_opcodes_h_l896_l861_DUPLICATE_bc20_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c2_ea72_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l865_c2_ea72_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c2_ea72_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l865_c2_ea72_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l865_c2_ea72_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l865_c2_ea72_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5_uxn_opcodes_h_l896_l861_DUPLICATE_bc20_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5_uxn_opcodes_h_l896_l861_DUPLICATE_bc20_return_output;
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
