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
-- Submodules: 59
entity add_0CLK_3220bbf1 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end add_0CLK_3220bbf1;
architecture arch of add_0CLK_3220bbf1 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l865_c6_6482]
signal BIN_OP_EQ_uxn_opcodes_h_l865_c6_6482_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l865_c6_6482_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l865_c6_6482_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l865_c1_5281]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_5281_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_5281_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_5281_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_5281_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l865_c2_4e9b]
signal n8_MUX_uxn_opcodes_h_l865_c2_4e9b_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l865_c2_4e9b_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l865_c2_4e9b_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l865_c2_4e9b_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l865_c2_4e9b]
signal t8_MUX_uxn_opcodes_h_l865_c2_4e9b_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l865_c2_4e9b_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l865_c2_4e9b_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l865_c2_4e9b_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l865_c2_4e9b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l865_c2_4e9b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l865_c2_4e9b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l865_c2_4e9b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l865_c2_4e9b_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l865_c2_4e9b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l865_c2_4e9b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l865_c2_4e9b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l865_c2_4e9b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l865_c2_4e9b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l865_c2_4e9b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c2_4e9b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c2_4e9b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c2_4e9b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c2_4e9b_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l865_c2_4e9b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c2_4e9b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c2_4e9b_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c2_4e9b_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c2_4e9b_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l865_c2_4e9b]
signal result_stack_value_MUX_uxn_opcodes_h_l865_c2_4e9b_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l865_c2_4e9b_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l865_c2_4e9b_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l865_c2_4e9b_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l865_c2_4e9b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l865_c2_4e9b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l865_c2_4e9b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l865_c2_4e9b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l865_c2_4e9b_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l866_c3_1fee[uxn_opcodes_h_l866_c3_1fee]
signal printf_uxn_opcodes_h_l866_c3_1fee_uxn_opcodes_h_l866_c3_1fee_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l870_c11_c18a]
signal BIN_OP_EQ_uxn_opcodes_h_l870_c11_c18a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l870_c11_c18a_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l870_c11_c18a_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l870_c7_07e6]
signal n8_MUX_uxn_opcodes_h_l870_c7_07e6_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l870_c7_07e6_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l870_c7_07e6_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l870_c7_07e6_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l870_c7_07e6]
signal t8_MUX_uxn_opcodes_h_l870_c7_07e6_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l870_c7_07e6_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l870_c7_07e6_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l870_c7_07e6_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l870_c7_07e6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_07e6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_07e6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_07e6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_07e6_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l870_c7_07e6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l870_c7_07e6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l870_c7_07e6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l870_c7_07e6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l870_c7_07e6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l870_c7_07e6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_07e6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_07e6_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_07e6_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_07e6_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l870_c7_07e6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_07e6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_07e6_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_07e6_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_07e6_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l870_c7_07e6]
signal result_stack_value_MUX_uxn_opcodes_h_l870_c7_07e6_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l870_c7_07e6_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l870_c7_07e6_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l870_c7_07e6_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l870_c7_07e6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_07e6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_07e6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_07e6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_07e6_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l873_c11_d84c]
signal BIN_OP_EQ_uxn_opcodes_h_l873_c11_d84c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l873_c11_d84c_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l873_c11_d84c_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l873_c7_02e6]
signal n8_MUX_uxn_opcodes_h_l873_c7_02e6_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l873_c7_02e6_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l873_c7_02e6_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l873_c7_02e6_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l873_c7_02e6]
signal t8_MUX_uxn_opcodes_h_l873_c7_02e6_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l873_c7_02e6_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l873_c7_02e6_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l873_c7_02e6_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l873_c7_02e6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l873_c7_02e6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l873_c7_02e6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l873_c7_02e6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l873_c7_02e6_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l873_c7_02e6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l873_c7_02e6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l873_c7_02e6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l873_c7_02e6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l873_c7_02e6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l873_c7_02e6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l873_c7_02e6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l873_c7_02e6_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l873_c7_02e6_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l873_c7_02e6_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l873_c7_02e6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l873_c7_02e6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l873_c7_02e6_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l873_c7_02e6_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l873_c7_02e6_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l873_c7_02e6]
signal result_stack_value_MUX_uxn_opcodes_h_l873_c7_02e6_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l873_c7_02e6_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l873_c7_02e6_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l873_c7_02e6_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l873_c7_02e6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l873_c7_02e6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l873_c7_02e6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l873_c7_02e6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l873_c7_02e6_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l877_c11_b9d9]
signal BIN_OP_EQ_uxn_opcodes_h_l877_c11_b9d9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l877_c11_b9d9_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l877_c11_b9d9_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l877_c7_1685]
signal n8_MUX_uxn_opcodes_h_l877_c7_1685_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l877_c7_1685_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l877_c7_1685_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l877_c7_1685_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l877_c7_1685]
signal result_is_stack_write_MUX_uxn_opcodes_h_l877_c7_1685_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l877_c7_1685_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l877_c7_1685_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l877_c7_1685_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l877_c7_1685]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l877_c7_1685_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l877_c7_1685_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l877_c7_1685_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l877_c7_1685_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l877_c7_1685]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l877_c7_1685_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l877_c7_1685_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l877_c7_1685_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l877_c7_1685_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l877_c7_1685]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l877_c7_1685_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l877_c7_1685_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l877_c7_1685_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l877_c7_1685_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l877_c7_1685]
signal result_stack_value_MUX_uxn_opcodes_h_l877_c7_1685_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l877_c7_1685_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l877_c7_1685_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l877_c7_1685_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l877_c7_1685]
signal result_is_opc_done_MUX_uxn_opcodes_h_l877_c7_1685_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l877_c7_1685_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l877_c7_1685_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l877_c7_1685_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l880_c11_1824]
signal BIN_OP_EQ_uxn_opcodes_h_l880_c11_1824_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l880_c11_1824_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l880_c11_1824_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l880_c7_7af2]
signal n8_MUX_uxn_opcodes_h_l880_c7_7af2_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l880_c7_7af2_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l880_c7_7af2_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l880_c7_7af2_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l880_c7_7af2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l880_c7_7af2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l880_c7_7af2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l880_c7_7af2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l880_c7_7af2_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l880_c7_7af2]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l880_c7_7af2_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l880_c7_7af2_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l880_c7_7af2_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l880_c7_7af2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l880_c7_7af2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l880_c7_7af2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l880_c7_7af2_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l880_c7_7af2_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l880_c7_7af2_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l880_c7_7af2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l880_c7_7af2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l880_c7_7af2_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l880_c7_7af2_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l880_c7_7af2_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l880_c7_7af2]
signal result_stack_value_MUX_uxn_opcodes_h_l880_c7_7af2_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l880_c7_7af2_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l880_c7_7af2_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l880_c7_7af2_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l880_c7_7af2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l880_c7_7af2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l880_c7_7af2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l880_c7_7af2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l880_c7_7af2_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l883_c32_8541]
signal BIN_OP_AND_uxn_opcodes_h_l883_c32_8541_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l883_c32_8541_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l883_c32_8541_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l883_c32_6a8d]
signal BIN_OP_GT_uxn_opcodes_h_l883_c32_6a8d_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l883_c32_6a8d_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l883_c32_6a8d_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l883_c32_4c66]
signal MUX_uxn_opcodes_h_l883_c32_4c66_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l883_c32_4c66_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l883_c32_4c66_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l883_c32_4c66_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l885_c11_a6a6]
signal BIN_OP_EQ_uxn_opcodes_h_l885_c11_a6a6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l885_c11_a6a6_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l885_c11_a6a6_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l885_c7_6e9d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l885_c7_6e9d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l885_c7_6e9d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l885_c7_6e9d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l885_c7_6e9d_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l885_c7_6e9d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l885_c7_6e9d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l885_c7_6e9d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l885_c7_6e9d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l885_c7_6e9d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l885_c7_6e9d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l885_c7_6e9d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l885_c7_6e9d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l885_c7_6e9d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l885_c7_6e9d_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l885_c7_6e9d]
signal result_stack_value_MUX_uxn_opcodes_h_l885_c7_6e9d_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l885_c7_6e9d_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l885_c7_6e9d_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l885_c7_6e9d_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l885_c7_6e9d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l885_c7_6e9d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l885_c7_6e9d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l885_c7_6e9d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l885_c7_6e9d_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l889_c24_efc0]
signal BIN_OP_PLUS_uxn_opcodes_h_l889_c24_efc0_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l889_c24_efc0_right : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l889_c24_efc0_return_output : unsigned(8 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l891_c11_3abb]
signal BIN_OP_EQ_uxn_opcodes_h_l891_c11_3abb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l891_c11_3abb_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l891_c11_3abb_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l891_c7_c1fc]
signal result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_c1fc_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_c1fc_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_c1fc_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_c1fc_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l891_c7_c1fc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_c1fc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_c1fc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_c1fc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_c1fc_return_output : unsigned(0 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_09c5( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : signed;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_stack_write := ref_toks_1;
      base.is_sp_shift := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.sp_relative_shift := ref_toks_4;
      base.stack_value := ref_toks_5;
      base.is_opc_done := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l865_c6_6482
BIN_OP_EQ_uxn_opcodes_h_l865_c6_6482 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l865_c6_6482_left,
BIN_OP_EQ_uxn_opcodes_h_l865_c6_6482_right,
BIN_OP_EQ_uxn_opcodes_h_l865_c6_6482_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_5281
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_5281 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_5281_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_5281_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_5281_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_5281_return_output);

-- n8_MUX_uxn_opcodes_h_l865_c2_4e9b
n8_MUX_uxn_opcodes_h_l865_c2_4e9b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l865_c2_4e9b_cond,
n8_MUX_uxn_opcodes_h_l865_c2_4e9b_iftrue,
n8_MUX_uxn_opcodes_h_l865_c2_4e9b_iffalse,
n8_MUX_uxn_opcodes_h_l865_c2_4e9b_return_output);

-- t8_MUX_uxn_opcodes_h_l865_c2_4e9b
t8_MUX_uxn_opcodes_h_l865_c2_4e9b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l865_c2_4e9b_cond,
t8_MUX_uxn_opcodes_h_l865_c2_4e9b_iftrue,
t8_MUX_uxn_opcodes_h_l865_c2_4e9b_iffalse,
t8_MUX_uxn_opcodes_h_l865_c2_4e9b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l865_c2_4e9b
result_is_stack_write_MUX_uxn_opcodes_h_l865_c2_4e9b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l865_c2_4e9b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l865_c2_4e9b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l865_c2_4e9b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l865_c2_4e9b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l865_c2_4e9b
result_is_sp_shift_MUX_uxn_opcodes_h_l865_c2_4e9b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l865_c2_4e9b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l865_c2_4e9b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l865_c2_4e9b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l865_c2_4e9b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c2_4e9b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c2_4e9b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c2_4e9b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c2_4e9b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c2_4e9b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c2_4e9b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c2_4e9b
result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c2_4e9b : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c2_4e9b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c2_4e9b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c2_4e9b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c2_4e9b_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l865_c2_4e9b
result_stack_value_MUX_uxn_opcodes_h_l865_c2_4e9b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l865_c2_4e9b_cond,
result_stack_value_MUX_uxn_opcodes_h_l865_c2_4e9b_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l865_c2_4e9b_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l865_c2_4e9b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l865_c2_4e9b
result_is_opc_done_MUX_uxn_opcodes_h_l865_c2_4e9b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l865_c2_4e9b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l865_c2_4e9b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l865_c2_4e9b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l865_c2_4e9b_return_output);

-- printf_uxn_opcodes_h_l866_c3_1fee_uxn_opcodes_h_l866_c3_1fee
printf_uxn_opcodes_h_l866_c3_1fee_uxn_opcodes_h_l866_c3_1fee : entity work.printf_uxn_opcodes_h_l866_c3_1fee_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l866_c3_1fee_uxn_opcodes_h_l866_c3_1fee_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l870_c11_c18a
BIN_OP_EQ_uxn_opcodes_h_l870_c11_c18a : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l870_c11_c18a_left,
BIN_OP_EQ_uxn_opcodes_h_l870_c11_c18a_right,
BIN_OP_EQ_uxn_opcodes_h_l870_c11_c18a_return_output);

-- n8_MUX_uxn_opcodes_h_l870_c7_07e6
n8_MUX_uxn_opcodes_h_l870_c7_07e6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l870_c7_07e6_cond,
n8_MUX_uxn_opcodes_h_l870_c7_07e6_iftrue,
n8_MUX_uxn_opcodes_h_l870_c7_07e6_iffalse,
n8_MUX_uxn_opcodes_h_l870_c7_07e6_return_output);

-- t8_MUX_uxn_opcodes_h_l870_c7_07e6
t8_MUX_uxn_opcodes_h_l870_c7_07e6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l870_c7_07e6_cond,
t8_MUX_uxn_opcodes_h_l870_c7_07e6_iftrue,
t8_MUX_uxn_opcodes_h_l870_c7_07e6_iffalse,
t8_MUX_uxn_opcodes_h_l870_c7_07e6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_07e6
result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_07e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_07e6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_07e6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_07e6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_07e6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l870_c7_07e6
result_is_sp_shift_MUX_uxn_opcodes_h_l870_c7_07e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l870_c7_07e6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l870_c7_07e6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l870_c7_07e6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l870_c7_07e6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_07e6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_07e6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_07e6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_07e6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_07e6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_07e6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_07e6
result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_07e6 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_07e6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_07e6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_07e6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_07e6_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l870_c7_07e6
result_stack_value_MUX_uxn_opcodes_h_l870_c7_07e6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l870_c7_07e6_cond,
result_stack_value_MUX_uxn_opcodes_h_l870_c7_07e6_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l870_c7_07e6_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l870_c7_07e6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_07e6
result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_07e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_07e6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_07e6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_07e6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_07e6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l873_c11_d84c
BIN_OP_EQ_uxn_opcodes_h_l873_c11_d84c : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l873_c11_d84c_left,
BIN_OP_EQ_uxn_opcodes_h_l873_c11_d84c_right,
BIN_OP_EQ_uxn_opcodes_h_l873_c11_d84c_return_output);

-- n8_MUX_uxn_opcodes_h_l873_c7_02e6
n8_MUX_uxn_opcodes_h_l873_c7_02e6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l873_c7_02e6_cond,
n8_MUX_uxn_opcodes_h_l873_c7_02e6_iftrue,
n8_MUX_uxn_opcodes_h_l873_c7_02e6_iffalse,
n8_MUX_uxn_opcodes_h_l873_c7_02e6_return_output);

-- t8_MUX_uxn_opcodes_h_l873_c7_02e6
t8_MUX_uxn_opcodes_h_l873_c7_02e6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l873_c7_02e6_cond,
t8_MUX_uxn_opcodes_h_l873_c7_02e6_iftrue,
t8_MUX_uxn_opcodes_h_l873_c7_02e6_iffalse,
t8_MUX_uxn_opcodes_h_l873_c7_02e6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l873_c7_02e6
result_is_stack_write_MUX_uxn_opcodes_h_l873_c7_02e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l873_c7_02e6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l873_c7_02e6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l873_c7_02e6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l873_c7_02e6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l873_c7_02e6
result_is_sp_shift_MUX_uxn_opcodes_h_l873_c7_02e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l873_c7_02e6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l873_c7_02e6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l873_c7_02e6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l873_c7_02e6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l873_c7_02e6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l873_c7_02e6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l873_c7_02e6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l873_c7_02e6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l873_c7_02e6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l873_c7_02e6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l873_c7_02e6
result_sp_relative_shift_MUX_uxn_opcodes_h_l873_c7_02e6 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l873_c7_02e6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l873_c7_02e6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l873_c7_02e6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l873_c7_02e6_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l873_c7_02e6
result_stack_value_MUX_uxn_opcodes_h_l873_c7_02e6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l873_c7_02e6_cond,
result_stack_value_MUX_uxn_opcodes_h_l873_c7_02e6_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l873_c7_02e6_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l873_c7_02e6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l873_c7_02e6
result_is_opc_done_MUX_uxn_opcodes_h_l873_c7_02e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l873_c7_02e6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l873_c7_02e6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l873_c7_02e6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l873_c7_02e6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l877_c11_b9d9
BIN_OP_EQ_uxn_opcodes_h_l877_c11_b9d9 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l877_c11_b9d9_left,
BIN_OP_EQ_uxn_opcodes_h_l877_c11_b9d9_right,
BIN_OP_EQ_uxn_opcodes_h_l877_c11_b9d9_return_output);

-- n8_MUX_uxn_opcodes_h_l877_c7_1685
n8_MUX_uxn_opcodes_h_l877_c7_1685 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l877_c7_1685_cond,
n8_MUX_uxn_opcodes_h_l877_c7_1685_iftrue,
n8_MUX_uxn_opcodes_h_l877_c7_1685_iffalse,
n8_MUX_uxn_opcodes_h_l877_c7_1685_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l877_c7_1685
result_is_stack_write_MUX_uxn_opcodes_h_l877_c7_1685 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l877_c7_1685_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l877_c7_1685_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l877_c7_1685_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l877_c7_1685_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l877_c7_1685
result_is_sp_shift_MUX_uxn_opcodes_h_l877_c7_1685 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l877_c7_1685_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l877_c7_1685_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l877_c7_1685_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l877_c7_1685_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l877_c7_1685
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l877_c7_1685 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l877_c7_1685_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l877_c7_1685_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l877_c7_1685_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l877_c7_1685_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l877_c7_1685
result_sp_relative_shift_MUX_uxn_opcodes_h_l877_c7_1685 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l877_c7_1685_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l877_c7_1685_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l877_c7_1685_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l877_c7_1685_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l877_c7_1685
result_stack_value_MUX_uxn_opcodes_h_l877_c7_1685 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l877_c7_1685_cond,
result_stack_value_MUX_uxn_opcodes_h_l877_c7_1685_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l877_c7_1685_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l877_c7_1685_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l877_c7_1685
result_is_opc_done_MUX_uxn_opcodes_h_l877_c7_1685 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l877_c7_1685_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l877_c7_1685_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l877_c7_1685_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l877_c7_1685_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l880_c11_1824
BIN_OP_EQ_uxn_opcodes_h_l880_c11_1824 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l880_c11_1824_left,
BIN_OP_EQ_uxn_opcodes_h_l880_c11_1824_right,
BIN_OP_EQ_uxn_opcodes_h_l880_c11_1824_return_output);

-- n8_MUX_uxn_opcodes_h_l880_c7_7af2
n8_MUX_uxn_opcodes_h_l880_c7_7af2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l880_c7_7af2_cond,
n8_MUX_uxn_opcodes_h_l880_c7_7af2_iftrue,
n8_MUX_uxn_opcodes_h_l880_c7_7af2_iffalse,
n8_MUX_uxn_opcodes_h_l880_c7_7af2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l880_c7_7af2
result_is_stack_write_MUX_uxn_opcodes_h_l880_c7_7af2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l880_c7_7af2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l880_c7_7af2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l880_c7_7af2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l880_c7_7af2_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l880_c7_7af2
result_is_sp_shift_MUX_uxn_opcodes_h_l880_c7_7af2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l880_c7_7af2_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l880_c7_7af2_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l880_c7_7af2_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l880_c7_7af2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l880_c7_7af2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l880_c7_7af2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l880_c7_7af2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l880_c7_7af2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l880_c7_7af2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l880_c7_7af2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l880_c7_7af2
result_sp_relative_shift_MUX_uxn_opcodes_h_l880_c7_7af2 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l880_c7_7af2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l880_c7_7af2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l880_c7_7af2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l880_c7_7af2_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l880_c7_7af2
result_stack_value_MUX_uxn_opcodes_h_l880_c7_7af2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l880_c7_7af2_cond,
result_stack_value_MUX_uxn_opcodes_h_l880_c7_7af2_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l880_c7_7af2_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l880_c7_7af2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l880_c7_7af2
result_is_opc_done_MUX_uxn_opcodes_h_l880_c7_7af2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l880_c7_7af2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l880_c7_7af2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l880_c7_7af2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l880_c7_7af2_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l883_c32_8541
BIN_OP_AND_uxn_opcodes_h_l883_c32_8541 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l883_c32_8541_left,
BIN_OP_AND_uxn_opcodes_h_l883_c32_8541_right,
BIN_OP_AND_uxn_opcodes_h_l883_c32_8541_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l883_c32_6a8d
BIN_OP_GT_uxn_opcodes_h_l883_c32_6a8d : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l883_c32_6a8d_left,
BIN_OP_GT_uxn_opcodes_h_l883_c32_6a8d_right,
BIN_OP_GT_uxn_opcodes_h_l883_c32_6a8d_return_output);

-- MUX_uxn_opcodes_h_l883_c32_4c66
MUX_uxn_opcodes_h_l883_c32_4c66 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l883_c32_4c66_cond,
MUX_uxn_opcodes_h_l883_c32_4c66_iftrue,
MUX_uxn_opcodes_h_l883_c32_4c66_iffalse,
MUX_uxn_opcodes_h_l883_c32_4c66_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l885_c11_a6a6
BIN_OP_EQ_uxn_opcodes_h_l885_c11_a6a6 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l885_c11_a6a6_left,
BIN_OP_EQ_uxn_opcodes_h_l885_c11_a6a6_right,
BIN_OP_EQ_uxn_opcodes_h_l885_c11_a6a6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l885_c7_6e9d
result_is_stack_write_MUX_uxn_opcodes_h_l885_c7_6e9d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l885_c7_6e9d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l885_c7_6e9d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l885_c7_6e9d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l885_c7_6e9d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l885_c7_6e9d
result_is_sp_shift_MUX_uxn_opcodes_h_l885_c7_6e9d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l885_c7_6e9d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l885_c7_6e9d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l885_c7_6e9d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l885_c7_6e9d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l885_c7_6e9d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l885_c7_6e9d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l885_c7_6e9d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l885_c7_6e9d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l885_c7_6e9d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l885_c7_6e9d_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l885_c7_6e9d
result_stack_value_MUX_uxn_opcodes_h_l885_c7_6e9d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l885_c7_6e9d_cond,
result_stack_value_MUX_uxn_opcodes_h_l885_c7_6e9d_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l885_c7_6e9d_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l885_c7_6e9d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l885_c7_6e9d
result_is_opc_done_MUX_uxn_opcodes_h_l885_c7_6e9d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l885_c7_6e9d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l885_c7_6e9d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l885_c7_6e9d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l885_c7_6e9d_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l889_c24_efc0
BIN_OP_PLUS_uxn_opcodes_h_l889_c24_efc0 : entity work.BIN_OP_PLUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l889_c24_efc0_left,
BIN_OP_PLUS_uxn_opcodes_h_l889_c24_efc0_right,
BIN_OP_PLUS_uxn_opcodes_h_l889_c24_efc0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l891_c11_3abb
BIN_OP_EQ_uxn_opcodes_h_l891_c11_3abb : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l891_c11_3abb_left,
BIN_OP_EQ_uxn_opcodes_h_l891_c11_3abb_right,
BIN_OP_EQ_uxn_opcodes_h_l891_c11_3abb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_c1fc
result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_c1fc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_c1fc_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_c1fc_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_c1fc_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_c1fc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_c1fc
result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_c1fc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_c1fc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_c1fc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_c1fc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_c1fc_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l865_c6_6482_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_5281_return_output,
 n8_MUX_uxn_opcodes_h_l865_c2_4e9b_return_output,
 t8_MUX_uxn_opcodes_h_l865_c2_4e9b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l865_c2_4e9b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l865_c2_4e9b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c2_4e9b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c2_4e9b_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l865_c2_4e9b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l865_c2_4e9b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l870_c11_c18a_return_output,
 n8_MUX_uxn_opcodes_h_l870_c7_07e6_return_output,
 t8_MUX_uxn_opcodes_h_l870_c7_07e6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_07e6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l870_c7_07e6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_07e6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_07e6_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l870_c7_07e6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_07e6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l873_c11_d84c_return_output,
 n8_MUX_uxn_opcodes_h_l873_c7_02e6_return_output,
 t8_MUX_uxn_opcodes_h_l873_c7_02e6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l873_c7_02e6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l873_c7_02e6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l873_c7_02e6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l873_c7_02e6_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l873_c7_02e6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l873_c7_02e6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l877_c11_b9d9_return_output,
 n8_MUX_uxn_opcodes_h_l877_c7_1685_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l877_c7_1685_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l877_c7_1685_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l877_c7_1685_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l877_c7_1685_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l877_c7_1685_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l877_c7_1685_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l880_c11_1824_return_output,
 n8_MUX_uxn_opcodes_h_l880_c7_7af2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l880_c7_7af2_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l880_c7_7af2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l880_c7_7af2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l880_c7_7af2_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l880_c7_7af2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l880_c7_7af2_return_output,
 BIN_OP_AND_uxn_opcodes_h_l883_c32_8541_return_output,
 BIN_OP_GT_uxn_opcodes_h_l883_c32_6a8d_return_output,
 MUX_uxn_opcodes_h_l883_c32_4c66_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l885_c11_a6a6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l885_c7_6e9d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l885_c7_6e9d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l885_c7_6e9d_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l885_c7_6e9d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l885_c7_6e9d_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l889_c24_efc0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l891_c11_3abb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_c1fc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_c1fc_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l865_c6_6482_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l865_c6_6482_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l865_c6_6482_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_5281_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_5281_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_5281_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_5281_iffalse : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l865_c2_4e9b_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l865_c2_4e9b_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l870_c7_07e6_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l865_c2_4e9b_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l865_c2_4e9b_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l865_c2_4e9b_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l865_c2_4e9b_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l870_c7_07e6_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l865_c2_4e9b_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l865_c2_4e9b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l865_c2_4e9b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l865_c2_4e9b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_07e6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l865_c2_4e9b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l865_c2_4e9b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l865_c2_4e9b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l865_c2_4e9b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l870_c7_07e6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l865_c2_4e9b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l865_c2_4e9b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c2_4e9b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l867_c3_4277 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c2_4e9b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_07e6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c2_4e9b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c2_4e9b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c2_4e9b_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c2_4e9b_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_07e6_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c2_4e9b_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c2_4e9b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l865_c2_4e9b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l865_c2_4e9b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l870_c7_07e6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l865_c2_4e9b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l865_c2_4e9b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l865_c2_4e9b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l865_c2_4e9b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_07e6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l865_c2_4e9b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l865_c2_4e9b_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l866_c3_1fee_uxn_opcodes_h_l866_c3_1fee_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l870_c11_c18a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l870_c11_c18a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l870_c11_c18a_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l870_c7_07e6_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l870_c7_07e6_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l873_c7_02e6_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l870_c7_07e6_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l870_c7_07e6_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l870_c7_07e6_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l873_c7_02e6_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l870_c7_07e6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_07e6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_07e6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l873_c7_02e6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_07e6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l870_c7_07e6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l870_c7_07e6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l873_c7_02e6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l870_c7_07e6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_07e6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l871_c3_5176 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_07e6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l873_c7_02e6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_07e6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_07e6_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_07e6_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l873_c7_02e6_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_07e6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l870_c7_07e6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l870_c7_07e6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l873_c7_02e6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l870_c7_07e6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_07e6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_07e6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l873_c7_02e6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_07e6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l873_c11_d84c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l873_c11_d84c_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l873_c11_d84c_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l873_c7_02e6_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l873_c7_02e6_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l877_c7_1685_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l873_c7_02e6_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l873_c7_02e6_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l873_c7_02e6_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l873_c7_02e6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l873_c7_02e6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l873_c7_02e6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l877_c7_1685_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l873_c7_02e6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l873_c7_02e6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l873_c7_02e6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l877_c7_1685_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l873_c7_02e6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l873_c7_02e6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l875_c3_ccda : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l873_c7_02e6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l877_c7_1685_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l873_c7_02e6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l873_c7_02e6_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l873_c7_02e6_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l877_c7_1685_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l873_c7_02e6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l873_c7_02e6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l873_c7_02e6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l877_c7_1685_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l873_c7_02e6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l873_c7_02e6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l873_c7_02e6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l877_c7_1685_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l873_c7_02e6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l877_c11_b9d9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l877_c11_b9d9_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l877_c11_b9d9_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l877_c7_1685_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l877_c7_1685_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l880_c7_7af2_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l877_c7_1685_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l877_c7_1685_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l877_c7_1685_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l880_c7_7af2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l877_c7_1685_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l877_c7_1685_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l877_c7_1685_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l880_c7_7af2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l877_c7_1685_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l877_c7_1685_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l878_c3_b217 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l877_c7_1685_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l880_c7_7af2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l877_c7_1685_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l877_c7_1685_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l877_c7_1685_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l880_c7_7af2_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l877_c7_1685_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l877_c7_1685_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l877_c7_1685_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l880_c7_7af2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l877_c7_1685_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l877_c7_1685_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l877_c7_1685_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l880_c7_7af2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l877_c7_1685_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l880_c11_1824_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l880_c11_1824_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l880_c11_1824_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l880_c7_7af2_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l880_c7_7af2_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l880_c7_7af2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l880_c7_7af2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l880_c7_7af2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l885_c7_6e9d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l880_c7_7af2_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l880_c7_7af2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l880_c7_7af2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l885_c7_6e9d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l880_c7_7af2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l880_c7_7af2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l880_c7_7af2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l885_c7_6e9d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l880_c7_7af2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l880_c7_7af2_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l880_c7_7af2_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l880_c7_7af2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l880_c7_7af2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l880_c7_7af2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l885_c7_6e9d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l880_c7_7af2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l880_c7_7af2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l880_c7_7af2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l885_c7_6e9d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l880_c7_7af2_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l883_c32_4c66_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l883_c32_4c66_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l883_c32_4c66_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l883_c32_8541_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l883_c32_8541_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l883_c32_8541_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l883_c32_6a8d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l883_c32_6a8d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l883_c32_6a8d_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l883_c32_4c66_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l885_c11_a6a6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l885_c11_a6a6_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l885_c11_a6a6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l885_c7_6e9d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l885_c7_6e9d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_c1fc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l885_c7_6e9d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l885_c7_6e9d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l885_c7_6e9d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l885_c7_6e9d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l885_c7_6e9d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l888_c3_e5c7 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l885_c7_6e9d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l885_c7_6e9d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l885_c7_6e9d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_uxn_opcodes_h_l889_c3_76c6 : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l885_c7_6e9d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l885_c7_6e9d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l885_c7_6e9d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l885_c7_6e9d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_c1fc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l885_c7_6e9d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l889_c24_efc0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l889_c24_efc0_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l889_c24_efc0_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l891_c11_3abb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l891_c11_3abb_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l891_c11_3abb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_c1fc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_c1fc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_c1fc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_c1fc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_c1fc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_c1fc_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l880_l877_l873_l870_l865_l891_DUPLICATE_2991_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l877_l873_l870_l865_l885_DUPLICATE_b83a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l880_l877_l873_l870_l865_DUPLICATE_50be_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l880_l877_l873_l870_l865_l885_DUPLICATE_24d9_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l880_l877_l873_l870_l891_l885_DUPLICATE_2a7a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l880_l885_DUPLICATE_d596_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l896_l861_DUPLICATE_d269_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l888_c3_e5c7 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l885_c7_6e9d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l888_c3_e5c7;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l865_c2_4e9b_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l885_c7_6e9d_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l891_c11_3abb_right := to_unsigned(6, 3);
     VAR_MUX_uxn_opcodes_h_l883_c32_4c66_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_5281_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l871_c3_5176 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_07e6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l871_c3_5176;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l865_c6_6482_right := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l880_c7_7af2_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_c1fc_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l867_c3_4277 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c2_4e9b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l867_c3_4277;
     VAR_BIN_OP_GT_uxn_opcodes_h_l883_c32_6a8d_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l870_c11_c18a_right := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_c1fc_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l883_c32_8541_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l880_c11_1824_right := to_unsigned(4, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l885_c7_6e9d_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l877_c11_b9d9_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l885_c11_a6a6_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l878_c3_b217 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l877_c7_1685_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l878_c3_b217;
     VAR_MUX_uxn_opcodes_h_l883_c32_4c66_iffalse := resize(to_signed(-1, 2), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l873_c11_d84c_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l875_c3_ccda := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l873_c7_02e6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l875_c3_ccda;

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_5281_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l883_c32_8541_left := VAR_ins;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l889_c24_efc0_left := n8;
     VAR_n8_MUX_uxn_opcodes_h_l865_c2_4e9b_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l870_c7_07e6_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l873_c7_02e6_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l877_c7_1685_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l880_c7_7af2_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l865_c6_6482_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l870_c11_c18a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l873_c11_d84c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l877_c11_b9d9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l880_c11_1824_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l885_c11_a6a6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l891_c11_3abb_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l880_c7_7af2_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l873_c7_02e6_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l889_c24_efc0_right := t8;
     VAR_t8_MUX_uxn_opcodes_h_l865_c2_4e9b_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l870_c7_07e6_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l873_c7_02e6_iffalse := t8;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l880_l877_l873_l870_l891_l885_DUPLICATE_2a7a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l880_l877_l873_l870_l891_l885_DUPLICATE_2a7a_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l870_c11_c18a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l870_c11_c18a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l870_c11_c18a_left;
     BIN_OP_EQ_uxn_opcodes_h_l870_c11_c18a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l870_c11_c18a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l870_c11_c18a_return_output := BIN_OP_EQ_uxn_opcodes_h_l870_c11_c18a_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l880_l885_DUPLICATE_d596 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l880_l885_DUPLICATE_d596_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l891_c11_3abb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l891_c11_3abb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l891_c11_3abb_left;
     BIN_OP_EQ_uxn_opcodes_h_l891_c11_3abb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l891_c11_3abb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l891_c11_3abb_return_output := BIN_OP_EQ_uxn_opcodes_h_l891_c11_3abb_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l880_l877_l873_l870_l865_DUPLICATE_50be LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l880_l877_l873_l870_l865_DUPLICATE_50be_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l873_c11_d84c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l873_c11_d84c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l873_c11_d84c_left;
     BIN_OP_EQ_uxn_opcodes_h_l873_c11_d84c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l873_c11_d84c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l873_c11_d84c_return_output := BIN_OP_EQ_uxn_opcodes_h_l873_c11_d84c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l865_c6_6482] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l865_c6_6482_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l865_c6_6482_left;
     BIN_OP_EQ_uxn_opcodes_h_l865_c6_6482_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l865_c6_6482_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l865_c6_6482_return_output := BIN_OP_EQ_uxn_opcodes_h_l865_c6_6482_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l889_c24_efc0] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l889_c24_efc0_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l889_c24_efc0_left;
     BIN_OP_PLUS_uxn_opcodes_h_l889_c24_efc0_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l889_c24_efc0_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l889_c24_efc0_return_output := BIN_OP_PLUS_uxn_opcodes_h_l889_c24_efc0_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l880_l877_l873_l870_l865_l891_DUPLICATE_2991 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l880_l877_l873_l870_l865_l891_DUPLICATE_2991_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l880_c11_1824] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l880_c11_1824_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l880_c11_1824_left;
     BIN_OP_EQ_uxn_opcodes_h_l880_c11_1824_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l880_c11_1824_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l880_c11_1824_return_output := BIN_OP_EQ_uxn_opcodes_h_l880_c11_1824_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l885_c11_a6a6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l885_c11_a6a6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l885_c11_a6a6_left;
     BIN_OP_EQ_uxn_opcodes_h_l885_c11_a6a6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l885_c11_a6a6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l885_c11_a6a6_return_output := BIN_OP_EQ_uxn_opcodes_h_l885_c11_a6a6_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l883_c32_8541] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l883_c32_8541_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l883_c32_8541_left;
     BIN_OP_AND_uxn_opcodes_h_l883_c32_8541_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l883_c32_8541_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l883_c32_8541_return_output := BIN_OP_AND_uxn_opcodes_h_l883_c32_8541_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l877_c11_b9d9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l877_c11_b9d9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l877_c11_b9d9_left;
     BIN_OP_EQ_uxn_opcodes_h_l877_c11_b9d9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l877_c11_b9d9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l877_c11_b9d9_return_output := BIN_OP_EQ_uxn_opcodes_h_l877_c11_b9d9_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l880_l877_l873_l870_l865_l885_DUPLICATE_24d9 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l880_l877_l873_l870_l865_l885_DUPLICATE_24d9_return_output := result.stack_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l877_l873_l870_l865_l885_DUPLICATE_b83a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l877_l873_l870_l865_l885_DUPLICATE_b83a_return_output := result.is_sp_shift;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l883_c32_6a8d_left := VAR_BIN_OP_AND_uxn_opcodes_h_l883_c32_8541_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_5281_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l865_c6_6482_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l865_c2_4e9b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l865_c6_6482_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l865_c2_4e9b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l865_c6_6482_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l865_c2_4e9b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l865_c6_6482_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l865_c2_4e9b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l865_c6_6482_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c2_4e9b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l865_c6_6482_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c2_4e9b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l865_c6_6482_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l865_c2_4e9b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l865_c6_6482_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l865_c2_4e9b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l865_c6_6482_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l870_c7_07e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l870_c11_c18a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_07e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l870_c11_c18a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l870_c7_07e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l870_c11_c18a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_07e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l870_c11_c18a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_07e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l870_c11_c18a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_07e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l870_c11_c18a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l870_c7_07e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l870_c11_c18a_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l870_c7_07e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l870_c11_c18a_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l873_c7_02e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l873_c11_d84c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l873_c7_02e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l873_c11_d84c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l873_c7_02e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l873_c11_d84c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l873_c7_02e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l873_c11_d84c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l873_c7_02e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l873_c11_d84c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l873_c7_02e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l873_c11_d84c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l873_c7_02e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l873_c11_d84c_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l873_c7_02e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l873_c11_d84c_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l877_c7_1685_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l877_c11_b9d9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l877_c7_1685_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l877_c11_b9d9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l877_c7_1685_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l877_c11_b9d9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l877_c7_1685_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l877_c11_b9d9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l877_c7_1685_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l877_c11_b9d9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l877_c7_1685_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l877_c11_b9d9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l877_c7_1685_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l877_c11_b9d9_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l880_c7_7af2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l880_c11_1824_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l880_c7_7af2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l880_c11_1824_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l880_c7_7af2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l880_c11_1824_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l880_c7_7af2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l880_c11_1824_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l880_c7_7af2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l880_c11_1824_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l880_c7_7af2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l880_c11_1824_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l880_c7_7af2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l880_c11_1824_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l885_c7_6e9d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l885_c11_a6a6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l885_c7_6e9d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l885_c11_a6a6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l885_c7_6e9d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l885_c11_a6a6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l885_c7_6e9d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l885_c11_a6a6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l885_c7_6e9d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l885_c11_a6a6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_c1fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l891_c11_3abb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_c1fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l891_c11_3abb_return_output;
     VAR_result_stack_value_uxn_opcodes_h_l889_c3_76c6 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l889_c24_efc0_return_output, 8);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c2_4e9b_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l880_l877_l873_l870_l865_DUPLICATE_50be_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_07e6_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l880_l877_l873_l870_l865_DUPLICATE_50be_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l873_c7_02e6_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l880_l877_l873_l870_l865_DUPLICATE_50be_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l877_c7_1685_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l880_l877_l873_l870_l865_DUPLICATE_50be_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l880_c7_7af2_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l880_l877_l873_l870_l865_DUPLICATE_50be_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_07e6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l880_l877_l873_l870_l891_l885_DUPLICATE_2a7a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l873_c7_02e6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l880_l877_l873_l870_l891_l885_DUPLICATE_2a7a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l877_c7_1685_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l880_l877_l873_l870_l891_l885_DUPLICATE_2a7a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l880_c7_7af2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l880_l877_l873_l870_l891_l885_DUPLICATE_2a7a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l885_c7_6e9d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l880_l877_l873_l870_l891_l885_DUPLICATE_2a7a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_c1fc_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l880_l877_l873_l870_l891_l885_DUPLICATE_2a7a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l865_c2_4e9b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l877_l873_l870_l865_l885_DUPLICATE_b83a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l870_c7_07e6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l877_l873_l870_l865_l885_DUPLICATE_b83a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l873_c7_02e6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l877_l873_l870_l865_l885_DUPLICATE_b83a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l877_c7_1685_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l877_l873_l870_l865_l885_DUPLICATE_b83a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l885_c7_6e9d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l877_l873_l870_l865_l885_DUPLICATE_b83a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l865_c2_4e9b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l880_l877_l873_l870_l865_l891_DUPLICATE_2991_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_07e6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l880_l877_l873_l870_l865_l891_DUPLICATE_2991_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l873_c7_02e6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l880_l877_l873_l870_l865_l891_DUPLICATE_2991_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l877_c7_1685_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l880_l877_l873_l870_l865_l891_DUPLICATE_2991_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l880_c7_7af2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l880_l877_l873_l870_l865_l891_DUPLICATE_2991_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_c1fc_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l880_l877_l873_l870_l865_l891_DUPLICATE_2991_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l880_c7_7af2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l880_l885_DUPLICATE_d596_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l885_c7_6e9d_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l880_l885_DUPLICATE_d596_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l865_c2_4e9b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l880_l877_l873_l870_l865_l885_DUPLICATE_24d9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l870_c7_07e6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l880_l877_l873_l870_l865_l885_DUPLICATE_24d9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l873_c7_02e6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l880_l877_l873_l870_l865_l885_DUPLICATE_24d9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l877_c7_1685_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l880_l877_l873_l870_l865_l885_DUPLICATE_24d9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l880_c7_7af2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l880_l877_l873_l870_l865_l885_DUPLICATE_24d9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l885_c7_6e9d_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l880_l877_l873_l870_l865_l885_DUPLICATE_24d9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l885_c7_6e9d_iftrue := VAR_result_stack_value_uxn_opcodes_h_l889_c3_76c6;
     -- n8_MUX[uxn_opcodes_h_l880_c7_7af2] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l880_c7_7af2_cond <= VAR_n8_MUX_uxn_opcodes_h_l880_c7_7af2_cond;
     n8_MUX_uxn_opcodes_h_l880_c7_7af2_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l880_c7_7af2_iftrue;
     n8_MUX_uxn_opcodes_h_l880_c7_7af2_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l880_c7_7af2_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l880_c7_7af2_return_output := n8_MUX_uxn_opcodes_h_l880_c7_7af2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l891_c7_c1fc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_c1fc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_c1fc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_c1fc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_c1fc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_c1fc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_c1fc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_c1fc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_c1fc_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l885_c7_6e9d] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l885_c7_6e9d_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l885_c7_6e9d_cond;
     result_stack_value_MUX_uxn_opcodes_h_l885_c7_6e9d_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l885_c7_6e9d_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l885_c7_6e9d_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l885_c7_6e9d_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l885_c7_6e9d_return_output := result_stack_value_MUX_uxn_opcodes_h_l885_c7_6e9d_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l883_c32_6a8d] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l883_c32_6a8d_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l883_c32_6a8d_left;
     BIN_OP_GT_uxn_opcodes_h_l883_c32_6a8d_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l883_c32_6a8d_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l883_c32_6a8d_return_output := BIN_OP_GT_uxn_opcodes_h_l883_c32_6a8d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l891_c7_c1fc] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_c1fc_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_c1fc_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_c1fc_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_c1fc_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_c1fc_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_c1fc_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_c1fc_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_c1fc_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l865_c1_5281] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_5281_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_5281_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_5281_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_5281_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_5281_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_5281_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_5281_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_5281_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l885_c7_6e9d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l885_c7_6e9d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l885_c7_6e9d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l885_c7_6e9d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l885_c7_6e9d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l885_c7_6e9d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l885_c7_6e9d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l885_c7_6e9d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l885_c7_6e9d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l885_c7_6e9d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l885_c7_6e9d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l885_c7_6e9d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l885_c7_6e9d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l885_c7_6e9d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l885_c7_6e9d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l885_c7_6e9d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l885_c7_6e9d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l885_c7_6e9d_return_output;

     -- t8_MUX[uxn_opcodes_h_l873_c7_02e6] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l873_c7_02e6_cond <= VAR_t8_MUX_uxn_opcodes_h_l873_c7_02e6_cond;
     t8_MUX_uxn_opcodes_h_l873_c7_02e6_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l873_c7_02e6_iftrue;
     t8_MUX_uxn_opcodes_h_l873_c7_02e6_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l873_c7_02e6_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l873_c7_02e6_return_output := t8_MUX_uxn_opcodes_h_l873_c7_02e6_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l883_c32_4c66_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l883_c32_6a8d_return_output;
     VAR_printf_uxn_opcodes_h_l866_c3_1fee_uxn_opcodes_h_l866_c3_1fee_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_5281_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l877_c7_1685_iffalse := VAR_n8_MUX_uxn_opcodes_h_l880_c7_7af2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l885_c7_6e9d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_c1fc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l880_c7_7af2_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l885_c7_6e9d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l885_c7_6e9d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_c1fc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l880_c7_7af2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l885_c7_6e9d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l880_c7_7af2_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l885_c7_6e9d_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l870_c7_07e6_iffalse := VAR_t8_MUX_uxn_opcodes_h_l873_c7_02e6_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l880_c7_7af2] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l880_c7_7af2_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l880_c7_7af2_cond;
     result_stack_value_MUX_uxn_opcodes_h_l880_c7_7af2_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l880_c7_7af2_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l880_c7_7af2_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l880_c7_7af2_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l880_c7_7af2_return_output := result_stack_value_MUX_uxn_opcodes_h_l880_c7_7af2_return_output;

     -- n8_MUX[uxn_opcodes_h_l877_c7_1685] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l877_c7_1685_cond <= VAR_n8_MUX_uxn_opcodes_h_l877_c7_1685_cond;
     n8_MUX_uxn_opcodes_h_l877_c7_1685_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l877_c7_1685_iftrue;
     n8_MUX_uxn_opcodes_h_l877_c7_1685_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l877_c7_1685_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l877_c7_1685_return_output := n8_MUX_uxn_opcodes_h_l877_c7_1685_return_output;

     -- MUX[uxn_opcodes_h_l883_c32_4c66] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l883_c32_4c66_cond <= VAR_MUX_uxn_opcodes_h_l883_c32_4c66_cond;
     MUX_uxn_opcodes_h_l883_c32_4c66_iftrue <= VAR_MUX_uxn_opcodes_h_l883_c32_4c66_iftrue;
     MUX_uxn_opcodes_h_l883_c32_4c66_iffalse <= VAR_MUX_uxn_opcodes_h_l883_c32_4c66_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l883_c32_4c66_return_output := MUX_uxn_opcodes_h_l883_c32_4c66_return_output;

     -- t8_MUX[uxn_opcodes_h_l870_c7_07e6] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l870_c7_07e6_cond <= VAR_t8_MUX_uxn_opcodes_h_l870_c7_07e6_cond;
     t8_MUX_uxn_opcodes_h_l870_c7_07e6_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l870_c7_07e6_iftrue;
     t8_MUX_uxn_opcodes_h_l870_c7_07e6_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l870_c7_07e6_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l870_c7_07e6_return_output := t8_MUX_uxn_opcodes_h_l870_c7_07e6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l885_c7_6e9d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l885_c7_6e9d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l885_c7_6e9d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l885_c7_6e9d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l885_c7_6e9d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l885_c7_6e9d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l885_c7_6e9d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l885_c7_6e9d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l885_c7_6e9d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l880_c7_7af2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l880_c7_7af2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l880_c7_7af2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l880_c7_7af2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l880_c7_7af2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l880_c7_7af2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l880_c7_7af2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l880_c7_7af2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l880_c7_7af2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l885_c7_6e9d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l885_c7_6e9d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l885_c7_6e9d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l885_c7_6e9d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l885_c7_6e9d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l885_c7_6e9d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l885_c7_6e9d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l885_c7_6e9d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l885_c7_6e9d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l880_c7_7af2] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l880_c7_7af2_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l880_c7_7af2_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l880_c7_7af2_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l880_c7_7af2_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l880_c7_7af2_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l880_c7_7af2_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l880_c7_7af2_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l880_c7_7af2_return_output;

     -- printf_uxn_opcodes_h_l866_c3_1fee[uxn_opcodes_h_l866_c3_1fee] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l866_c3_1fee_uxn_opcodes_h_l866_c3_1fee_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l866_c3_1fee_uxn_opcodes_h_l866_c3_1fee_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l880_c7_7af2_iftrue := VAR_MUX_uxn_opcodes_h_l883_c32_4c66_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l873_c7_02e6_iffalse := VAR_n8_MUX_uxn_opcodes_h_l877_c7_1685_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l880_c7_7af2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l885_c7_6e9d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l877_c7_1685_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l880_c7_7af2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l880_c7_7af2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l885_c7_6e9d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l877_c7_1685_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l880_c7_7af2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l877_c7_1685_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l880_c7_7af2_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l865_c2_4e9b_iffalse := VAR_t8_MUX_uxn_opcodes_h_l870_c7_07e6_return_output;
     -- n8_MUX[uxn_opcodes_h_l873_c7_02e6] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l873_c7_02e6_cond <= VAR_n8_MUX_uxn_opcodes_h_l873_c7_02e6_cond;
     n8_MUX_uxn_opcodes_h_l873_c7_02e6_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l873_c7_02e6_iftrue;
     n8_MUX_uxn_opcodes_h_l873_c7_02e6_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l873_c7_02e6_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l873_c7_02e6_return_output := n8_MUX_uxn_opcodes_h_l873_c7_02e6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l880_c7_7af2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l880_c7_7af2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l880_c7_7af2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l880_c7_7af2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l880_c7_7af2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l880_c7_7af2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l880_c7_7af2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l880_c7_7af2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l880_c7_7af2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l880_c7_7af2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l880_c7_7af2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l880_c7_7af2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l880_c7_7af2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l880_c7_7af2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l880_c7_7af2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l880_c7_7af2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l880_c7_7af2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l880_c7_7af2_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l877_c7_1685] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l877_c7_1685_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l877_c7_1685_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l877_c7_1685_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l877_c7_1685_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l877_c7_1685_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l877_c7_1685_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l877_c7_1685_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l877_c7_1685_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l877_c7_1685] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l877_c7_1685_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l877_c7_1685_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l877_c7_1685_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l877_c7_1685_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l877_c7_1685_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l877_c7_1685_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l877_c7_1685_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l877_c7_1685_return_output;

     -- t8_MUX[uxn_opcodes_h_l865_c2_4e9b] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l865_c2_4e9b_cond <= VAR_t8_MUX_uxn_opcodes_h_l865_c2_4e9b_cond;
     t8_MUX_uxn_opcodes_h_l865_c2_4e9b_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l865_c2_4e9b_iftrue;
     t8_MUX_uxn_opcodes_h_l865_c2_4e9b_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l865_c2_4e9b_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l865_c2_4e9b_return_output := t8_MUX_uxn_opcodes_h_l865_c2_4e9b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l880_c7_7af2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l880_c7_7af2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l880_c7_7af2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l880_c7_7af2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l880_c7_7af2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l880_c7_7af2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l880_c7_7af2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l880_c7_7af2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l880_c7_7af2_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l877_c7_1685] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l877_c7_1685_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l877_c7_1685_cond;
     result_stack_value_MUX_uxn_opcodes_h_l877_c7_1685_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l877_c7_1685_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l877_c7_1685_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l877_c7_1685_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l877_c7_1685_return_output := result_stack_value_MUX_uxn_opcodes_h_l877_c7_1685_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l870_c7_07e6_iffalse := VAR_n8_MUX_uxn_opcodes_h_l873_c7_02e6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l877_c7_1685_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l880_c7_7af2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l873_c7_02e6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l877_c7_1685_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l877_c7_1685_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l880_c7_7af2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l877_c7_1685_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l880_c7_7af2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l873_c7_02e6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l877_c7_1685_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l873_c7_02e6_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l877_c7_1685_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l865_c2_4e9b_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l877_c7_1685] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l877_c7_1685_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l877_c7_1685_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l877_c7_1685_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l877_c7_1685_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l877_c7_1685_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l877_c7_1685_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l877_c7_1685_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l877_c7_1685_return_output;

     -- n8_MUX[uxn_opcodes_h_l870_c7_07e6] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l870_c7_07e6_cond <= VAR_n8_MUX_uxn_opcodes_h_l870_c7_07e6_cond;
     n8_MUX_uxn_opcodes_h_l870_c7_07e6_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l870_c7_07e6_iftrue;
     n8_MUX_uxn_opcodes_h_l870_c7_07e6_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l870_c7_07e6_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l870_c7_07e6_return_output := n8_MUX_uxn_opcodes_h_l870_c7_07e6_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l873_c7_02e6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l873_c7_02e6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l873_c7_02e6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l873_c7_02e6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l873_c7_02e6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l873_c7_02e6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l873_c7_02e6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l873_c7_02e6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l873_c7_02e6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l877_c7_1685] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l877_c7_1685_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l877_c7_1685_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l877_c7_1685_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l877_c7_1685_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l877_c7_1685_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l877_c7_1685_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l877_c7_1685_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l877_c7_1685_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l877_c7_1685] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l877_c7_1685_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l877_c7_1685_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l877_c7_1685_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l877_c7_1685_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l877_c7_1685_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l877_c7_1685_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l877_c7_1685_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l877_c7_1685_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l873_c7_02e6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l873_c7_02e6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l873_c7_02e6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l873_c7_02e6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l873_c7_02e6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l873_c7_02e6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l873_c7_02e6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l873_c7_02e6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l873_c7_02e6_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l873_c7_02e6] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l873_c7_02e6_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l873_c7_02e6_cond;
     result_stack_value_MUX_uxn_opcodes_h_l873_c7_02e6_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l873_c7_02e6_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l873_c7_02e6_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l873_c7_02e6_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l873_c7_02e6_return_output := result_stack_value_MUX_uxn_opcodes_h_l873_c7_02e6_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l865_c2_4e9b_iffalse := VAR_n8_MUX_uxn_opcodes_h_l870_c7_07e6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l873_c7_02e6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l877_c7_1685_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l870_c7_07e6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l873_c7_02e6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l873_c7_02e6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l877_c7_1685_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l873_c7_02e6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l877_c7_1685_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_07e6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l873_c7_02e6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l870_c7_07e6_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l873_c7_02e6_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l873_c7_02e6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l873_c7_02e6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l873_c7_02e6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l873_c7_02e6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l873_c7_02e6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l873_c7_02e6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l873_c7_02e6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l873_c7_02e6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l873_c7_02e6_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l870_c7_07e6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l870_c7_07e6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l870_c7_07e6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l870_c7_07e6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l870_c7_07e6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l870_c7_07e6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l870_c7_07e6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l870_c7_07e6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l870_c7_07e6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l873_c7_02e6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l873_c7_02e6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l873_c7_02e6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l873_c7_02e6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l873_c7_02e6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l873_c7_02e6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l873_c7_02e6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l873_c7_02e6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l873_c7_02e6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l870_c7_07e6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_07e6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_07e6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_07e6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_07e6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_07e6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_07e6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_07e6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_07e6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l873_c7_02e6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l873_c7_02e6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l873_c7_02e6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l873_c7_02e6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l873_c7_02e6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l873_c7_02e6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l873_c7_02e6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l873_c7_02e6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l873_c7_02e6_return_output;

     -- n8_MUX[uxn_opcodes_h_l865_c2_4e9b] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l865_c2_4e9b_cond <= VAR_n8_MUX_uxn_opcodes_h_l865_c2_4e9b_cond;
     n8_MUX_uxn_opcodes_h_l865_c2_4e9b_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l865_c2_4e9b_iftrue;
     n8_MUX_uxn_opcodes_h_l865_c2_4e9b_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l865_c2_4e9b_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l865_c2_4e9b_return_output := n8_MUX_uxn_opcodes_h_l865_c2_4e9b_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l870_c7_07e6] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l870_c7_07e6_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l870_c7_07e6_cond;
     result_stack_value_MUX_uxn_opcodes_h_l870_c7_07e6_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l870_c7_07e6_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l870_c7_07e6_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l870_c7_07e6_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l870_c7_07e6_return_output := result_stack_value_MUX_uxn_opcodes_h_l870_c7_07e6_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l865_c2_4e9b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_07e6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l873_c7_02e6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l865_c2_4e9b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l870_c7_07e6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_07e6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l873_c7_02e6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_07e6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l873_c7_02e6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c2_4e9b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_07e6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l865_c2_4e9b_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l870_c7_07e6_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l865_c2_4e9b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l865_c2_4e9b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l865_c2_4e9b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l865_c2_4e9b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l865_c2_4e9b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l865_c2_4e9b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l865_c2_4e9b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l865_c2_4e9b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l865_c2_4e9b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l865_c2_4e9b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c2_4e9b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c2_4e9b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c2_4e9b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c2_4e9b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c2_4e9b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c2_4e9b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c2_4e9b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c2_4e9b_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l865_c2_4e9b] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l865_c2_4e9b_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l865_c2_4e9b_cond;
     result_stack_value_MUX_uxn_opcodes_h_l865_c2_4e9b_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l865_c2_4e9b_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l865_c2_4e9b_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l865_c2_4e9b_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l865_c2_4e9b_return_output := result_stack_value_MUX_uxn_opcodes_h_l865_c2_4e9b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l870_c7_07e6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_07e6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_07e6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_07e6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_07e6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_07e6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_07e6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_07e6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_07e6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l870_c7_07e6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_07e6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_07e6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_07e6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_07e6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_07e6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_07e6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_07e6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_07e6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l870_c7_07e6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_07e6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_07e6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_07e6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_07e6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_07e6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_07e6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_07e6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_07e6_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l865_c2_4e9b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_07e6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l865_c2_4e9b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_07e6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c2_4e9b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_07e6_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l865_c2_4e9b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l865_c2_4e9b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l865_c2_4e9b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l865_c2_4e9b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l865_c2_4e9b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l865_c2_4e9b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l865_c2_4e9b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l865_c2_4e9b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l865_c2_4e9b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l865_c2_4e9b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c2_4e9b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c2_4e9b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c2_4e9b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c2_4e9b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c2_4e9b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c2_4e9b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c2_4e9b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c2_4e9b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l865_c2_4e9b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l865_c2_4e9b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l865_c2_4e9b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l865_c2_4e9b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l865_c2_4e9b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l865_c2_4e9b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l865_c2_4e9b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l865_c2_4e9b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l865_c2_4e9b_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l896_l861_DUPLICATE_d269 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l896_l861_DUPLICATE_d269_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_09c5(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l865_c2_4e9b_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l865_c2_4e9b_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c2_4e9b_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c2_4e9b_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l865_c2_4e9b_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l865_c2_4e9b_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l896_l861_DUPLICATE_d269_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l896_l861_DUPLICATE_d269_return_output;
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
