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
entity gth2_0CLK_302e9520 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end gth2_0CLK_302e9520;
architecture arch of gth2_0CLK_302e9520 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1750_c6_94ad]
signal BIN_OP_EQ_uxn_opcodes_h_l1750_c6_94ad_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1750_c6_94ad_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1750_c6_94ad_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1750_c1_42d7]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1750_c1_42d7_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1750_c1_42d7_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1750_c1_42d7_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1750_c1_42d7_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1750_c2_0a25]
signal n16_MUX_uxn_opcodes_h_l1750_c2_0a25_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1750_c2_0a25_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1750_c2_0a25_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1750_c2_0a25_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1750_c2_0a25]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1750_c2_0a25_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1750_c2_0a25_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1750_c2_0a25_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1750_c2_0a25_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1750_c2_0a25]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1750_c2_0a25_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1750_c2_0a25_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1750_c2_0a25_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1750_c2_0a25_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1750_c2_0a25]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1750_c2_0a25_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1750_c2_0a25_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1750_c2_0a25_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1750_c2_0a25_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1750_c2_0a25]
signal result_u8_value_MUX_uxn_opcodes_h_l1750_c2_0a25_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1750_c2_0a25_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1750_c2_0a25_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1750_c2_0a25_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1750_c2_0a25]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1750_c2_0a25_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1750_c2_0a25_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1750_c2_0a25_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1750_c2_0a25_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1750_c2_0a25]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1750_c2_0a25_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1750_c2_0a25_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1750_c2_0a25_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1750_c2_0a25_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1750_c2_0a25]
signal t16_MUX_uxn_opcodes_h_l1750_c2_0a25_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1750_c2_0a25_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1750_c2_0a25_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1750_c2_0a25_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l1751_c3_682c[uxn_opcodes_h_l1751_c3_682c]
signal printf_uxn_opcodes_h_l1751_c3_682c_uxn_opcodes_h_l1751_c3_682c_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1755_c11_9962]
signal BIN_OP_EQ_uxn_opcodes_h_l1755_c11_9962_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1755_c11_9962_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1755_c11_9962_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1755_c7_d192]
signal n16_MUX_uxn_opcodes_h_l1755_c7_d192_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1755_c7_d192_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1755_c7_d192_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1755_c7_d192_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1755_c7_d192]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1755_c7_d192_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1755_c7_d192_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1755_c7_d192_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1755_c7_d192_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1755_c7_d192]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1755_c7_d192_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1755_c7_d192_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1755_c7_d192_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1755_c7_d192_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1755_c7_d192]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1755_c7_d192_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1755_c7_d192_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1755_c7_d192_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1755_c7_d192_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1755_c7_d192]
signal result_u8_value_MUX_uxn_opcodes_h_l1755_c7_d192_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1755_c7_d192_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1755_c7_d192_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1755_c7_d192_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1755_c7_d192]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1755_c7_d192_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1755_c7_d192_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1755_c7_d192_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1755_c7_d192_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1755_c7_d192]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1755_c7_d192_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1755_c7_d192_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1755_c7_d192_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1755_c7_d192_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1755_c7_d192]
signal t16_MUX_uxn_opcodes_h_l1755_c7_d192_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1755_c7_d192_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1755_c7_d192_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1755_c7_d192_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1758_c11_1d0e]
signal BIN_OP_EQ_uxn_opcodes_h_l1758_c11_1d0e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1758_c11_1d0e_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1758_c11_1d0e_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1758_c7_36d1]
signal n16_MUX_uxn_opcodes_h_l1758_c7_36d1_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1758_c7_36d1_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1758_c7_36d1_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1758_c7_36d1_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1758_c7_36d1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_36d1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_36d1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_36d1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_36d1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1758_c7_36d1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_36d1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_36d1_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_36d1_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_36d1_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1758_c7_36d1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c7_36d1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c7_36d1_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c7_36d1_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c7_36d1_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1758_c7_36d1]
signal result_u8_value_MUX_uxn_opcodes_h_l1758_c7_36d1_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1758_c7_36d1_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1758_c7_36d1_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1758_c7_36d1_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1758_c7_36d1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_36d1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_36d1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_36d1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_36d1_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1758_c7_36d1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c7_36d1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c7_36d1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c7_36d1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c7_36d1_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1758_c7_36d1]
signal t16_MUX_uxn_opcodes_h_l1758_c7_36d1_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1758_c7_36d1_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1758_c7_36d1_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1758_c7_36d1_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1763_c11_e9ee]
signal BIN_OP_EQ_uxn_opcodes_h_l1763_c11_e9ee_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1763_c11_e9ee_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1763_c11_e9ee_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1763_c7_87b3]
signal n16_MUX_uxn_opcodes_h_l1763_c7_87b3_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1763_c7_87b3_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1763_c7_87b3_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1763_c7_87b3_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1763_c7_87b3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_87b3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_87b3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_87b3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_87b3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1763_c7_87b3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_87b3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_87b3_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_87b3_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_87b3_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1763_c7_87b3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_87b3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_87b3_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_87b3_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_87b3_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1763_c7_87b3]
signal result_u8_value_MUX_uxn_opcodes_h_l1763_c7_87b3_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1763_c7_87b3_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1763_c7_87b3_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1763_c7_87b3_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1763_c7_87b3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_87b3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_87b3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_87b3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_87b3_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1763_c7_87b3]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_87b3_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_87b3_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_87b3_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_87b3_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1763_c7_87b3]
signal t16_MUX_uxn_opcodes_h_l1763_c7_87b3_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1763_c7_87b3_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1763_c7_87b3_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1763_c7_87b3_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1764_c3_c956]
signal BIN_OP_OR_uxn_opcodes_h_l1764_c3_c956_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1764_c3_c956_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1764_c3_c956_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1767_c11_41b3]
signal BIN_OP_EQ_uxn_opcodes_h_l1767_c11_41b3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1767_c11_41b3_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1767_c11_41b3_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1767_c7_c53f]
signal n16_MUX_uxn_opcodes_h_l1767_c7_c53f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1767_c7_c53f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1767_c7_c53f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1767_c7_c53f_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1767_c7_c53f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_c53f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_c53f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_c53f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_c53f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1767_c7_c53f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_c53f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_c53f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_c53f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_c53f_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1767_c7_c53f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_c53f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_c53f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_c53f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_c53f_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1767_c7_c53f]
signal result_u8_value_MUX_uxn_opcodes_h_l1767_c7_c53f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1767_c7_c53f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1767_c7_c53f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1767_c7_c53f_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1767_c7_c53f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_c53f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_c53f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_c53f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_c53f_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1767_c7_c53f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_c53f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_c53f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_c53f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_c53f_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1771_c11_7bfb]
signal BIN_OP_EQ_uxn_opcodes_h_l1771_c11_7bfb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1771_c11_7bfb_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1771_c11_7bfb_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1771_c7_d3b7]
signal n16_MUX_uxn_opcodes_h_l1771_c7_d3b7_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1771_c7_d3b7_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1771_c7_d3b7_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1771_c7_d3b7_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1771_c7_d3b7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_d3b7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_d3b7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_d3b7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_d3b7_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1771_c7_d3b7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_d3b7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_d3b7_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_d3b7_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_d3b7_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1771_c7_d3b7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_d3b7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_d3b7_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_d3b7_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_d3b7_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1771_c7_d3b7]
signal result_u8_value_MUX_uxn_opcodes_h_l1771_c7_d3b7_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1771_c7_d3b7_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1771_c7_d3b7_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1771_c7_d3b7_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1771_c7_d3b7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_d3b7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_d3b7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_d3b7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_d3b7_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1771_c7_d3b7]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_d3b7_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_d3b7_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_d3b7_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_d3b7_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1772_c3_819c]
signal BIN_OP_OR_uxn_opcodes_h_l1772_c3_819c_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1772_c3_819c_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1772_c3_819c_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1774_c30_d5bf]
signal sp_relative_shift_uxn_opcodes_h_l1774_c30_d5bf_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1774_c30_d5bf_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1774_c30_d5bf_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1774_c30_d5bf_return_output : signed(3 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1777_c21_0afb]
signal BIN_OP_GT_uxn_opcodes_h_l1777_c21_0afb_left : unsigned(15 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1777_c21_0afb_right : unsigned(15 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1777_c21_0afb_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1777_c21_42f1]
signal MUX_uxn_opcodes_h_l1777_c21_42f1_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1777_c21_42f1_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1777_c21_42f1_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1777_c21_42f1_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1779_c11_ae82]
signal BIN_OP_EQ_uxn_opcodes_h_l1779_c11_ae82_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1779_c11_ae82_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1779_c11_ae82_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1779_c7_46d4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_46d4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_46d4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_46d4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_46d4_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1779_c7_46d4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_46d4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_46d4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_46d4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_46d4_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1779_c7_46d4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_46d4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_46d4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_46d4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_46d4_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1760_l1769_DUPLICATE_3b63
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1760_l1769_DUPLICATE_3b63_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1760_l1769_DUPLICATE_3b63_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_c551( ref_toks_0 : opcode_result_t;
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
      base.u8_value := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.is_sp_shift := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1750_c6_94ad
BIN_OP_EQ_uxn_opcodes_h_l1750_c6_94ad : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1750_c6_94ad_left,
BIN_OP_EQ_uxn_opcodes_h_l1750_c6_94ad_right,
BIN_OP_EQ_uxn_opcodes_h_l1750_c6_94ad_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1750_c1_42d7
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1750_c1_42d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1750_c1_42d7_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1750_c1_42d7_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1750_c1_42d7_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1750_c1_42d7_return_output);

-- n16_MUX_uxn_opcodes_h_l1750_c2_0a25
n16_MUX_uxn_opcodes_h_l1750_c2_0a25 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1750_c2_0a25_cond,
n16_MUX_uxn_opcodes_h_l1750_c2_0a25_iftrue,
n16_MUX_uxn_opcodes_h_l1750_c2_0a25_iffalse,
n16_MUX_uxn_opcodes_h_l1750_c2_0a25_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1750_c2_0a25
result_is_stack_write_MUX_uxn_opcodes_h_l1750_c2_0a25 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1750_c2_0a25_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1750_c2_0a25_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1750_c2_0a25_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1750_c2_0a25_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1750_c2_0a25
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1750_c2_0a25 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1750_c2_0a25_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1750_c2_0a25_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1750_c2_0a25_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1750_c2_0a25_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1750_c2_0a25
result_sp_relative_shift_MUX_uxn_opcodes_h_l1750_c2_0a25 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1750_c2_0a25_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1750_c2_0a25_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1750_c2_0a25_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1750_c2_0a25_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1750_c2_0a25
result_u8_value_MUX_uxn_opcodes_h_l1750_c2_0a25 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1750_c2_0a25_cond,
result_u8_value_MUX_uxn_opcodes_h_l1750_c2_0a25_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1750_c2_0a25_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1750_c2_0a25_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1750_c2_0a25
result_is_opc_done_MUX_uxn_opcodes_h_l1750_c2_0a25 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1750_c2_0a25_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1750_c2_0a25_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1750_c2_0a25_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1750_c2_0a25_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1750_c2_0a25
result_is_sp_shift_MUX_uxn_opcodes_h_l1750_c2_0a25 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1750_c2_0a25_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1750_c2_0a25_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1750_c2_0a25_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1750_c2_0a25_return_output);

-- t16_MUX_uxn_opcodes_h_l1750_c2_0a25
t16_MUX_uxn_opcodes_h_l1750_c2_0a25 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1750_c2_0a25_cond,
t16_MUX_uxn_opcodes_h_l1750_c2_0a25_iftrue,
t16_MUX_uxn_opcodes_h_l1750_c2_0a25_iffalse,
t16_MUX_uxn_opcodes_h_l1750_c2_0a25_return_output);

-- printf_uxn_opcodes_h_l1751_c3_682c_uxn_opcodes_h_l1751_c3_682c
printf_uxn_opcodes_h_l1751_c3_682c_uxn_opcodes_h_l1751_c3_682c : entity work.printf_uxn_opcodes_h_l1751_c3_682c_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1751_c3_682c_uxn_opcodes_h_l1751_c3_682c_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1755_c11_9962
BIN_OP_EQ_uxn_opcodes_h_l1755_c11_9962 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1755_c11_9962_left,
BIN_OP_EQ_uxn_opcodes_h_l1755_c11_9962_right,
BIN_OP_EQ_uxn_opcodes_h_l1755_c11_9962_return_output);

-- n16_MUX_uxn_opcodes_h_l1755_c7_d192
n16_MUX_uxn_opcodes_h_l1755_c7_d192 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1755_c7_d192_cond,
n16_MUX_uxn_opcodes_h_l1755_c7_d192_iftrue,
n16_MUX_uxn_opcodes_h_l1755_c7_d192_iffalse,
n16_MUX_uxn_opcodes_h_l1755_c7_d192_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1755_c7_d192
result_is_stack_write_MUX_uxn_opcodes_h_l1755_c7_d192 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1755_c7_d192_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1755_c7_d192_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1755_c7_d192_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1755_c7_d192_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1755_c7_d192
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1755_c7_d192 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1755_c7_d192_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1755_c7_d192_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1755_c7_d192_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1755_c7_d192_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1755_c7_d192
result_sp_relative_shift_MUX_uxn_opcodes_h_l1755_c7_d192 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1755_c7_d192_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1755_c7_d192_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1755_c7_d192_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1755_c7_d192_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1755_c7_d192
result_u8_value_MUX_uxn_opcodes_h_l1755_c7_d192 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1755_c7_d192_cond,
result_u8_value_MUX_uxn_opcodes_h_l1755_c7_d192_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1755_c7_d192_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1755_c7_d192_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1755_c7_d192
result_is_opc_done_MUX_uxn_opcodes_h_l1755_c7_d192 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1755_c7_d192_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1755_c7_d192_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1755_c7_d192_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1755_c7_d192_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1755_c7_d192
result_is_sp_shift_MUX_uxn_opcodes_h_l1755_c7_d192 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1755_c7_d192_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1755_c7_d192_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1755_c7_d192_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1755_c7_d192_return_output);

-- t16_MUX_uxn_opcodes_h_l1755_c7_d192
t16_MUX_uxn_opcodes_h_l1755_c7_d192 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1755_c7_d192_cond,
t16_MUX_uxn_opcodes_h_l1755_c7_d192_iftrue,
t16_MUX_uxn_opcodes_h_l1755_c7_d192_iffalse,
t16_MUX_uxn_opcodes_h_l1755_c7_d192_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1758_c11_1d0e
BIN_OP_EQ_uxn_opcodes_h_l1758_c11_1d0e : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1758_c11_1d0e_left,
BIN_OP_EQ_uxn_opcodes_h_l1758_c11_1d0e_right,
BIN_OP_EQ_uxn_opcodes_h_l1758_c11_1d0e_return_output);

-- n16_MUX_uxn_opcodes_h_l1758_c7_36d1
n16_MUX_uxn_opcodes_h_l1758_c7_36d1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1758_c7_36d1_cond,
n16_MUX_uxn_opcodes_h_l1758_c7_36d1_iftrue,
n16_MUX_uxn_opcodes_h_l1758_c7_36d1_iffalse,
n16_MUX_uxn_opcodes_h_l1758_c7_36d1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_36d1
result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_36d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_36d1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_36d1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_36d1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_36d1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_36d1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_36d1 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_36d1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_36d1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_36d1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_36d1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c7_36d1
result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c7_36d1 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c7_36d1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c7_36d1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c7_36d1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c7_36d1_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1758_c7_36d1
result_u8_value_MUX_uxn_opcodes_h_l1758_c7_36d1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1758_c7_36d1_cond,
result_u8_value_MUX_uxn_opcodes_h_l1758_c7_36d1_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1758_c7_36d1_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1758_c7_36d1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_36d1
result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_36d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_36d1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_36d1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_36d1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_36d1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c7_36d1
result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c7_36d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c7_36d1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c7_36d1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c7_36d1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c7_36d1_return_output);

-- t16_MUX_uxn_opcodes_h_l1758_c7_36d1
t16_MUX_uxn_opcodes_h_l1758_c7_36d1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1758_c7_36d1_cond,
t16_MUX_uxn_opcodes_h_l1758_c7_36d1_iftrue,
t16_MUX_uxn_opcodes_h_l1758_c7_36d1_iffalse,
t16_MUX_uxn_opcodes_h_l1758_c7_36d1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1763_c11_e9ee
BIN_OP_EQ_uxn_opcodes_h_l1763_c11_e9ee : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1763_c11_e9ee_left,
BIN_OP_EQ_uxn_opcodes_h_l1763_c11_e9ee_right,
BIN_OP_EQ_uxn_opcodes_h_l1763_c11_e9ee_return_output);

-- n16_MUX_uxn_opcodes_h_l1763_c7_87b3
n16_MUX_uxn_opcodes_h_l1763_c7_87b3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1763_c7_87b3_cond,
n16_MUX_uxn_opcodes_h_l1763_c7_87b3_iftrue,
n16_MUX_uxn_opcodes_h_l1763_c7_87b3_iffalse,
n16_MUX_uxn_opcodes_h_l1763_c7_87b3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_87b3
result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_87b3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_87b3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_87b3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_87b3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_87b3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_87b3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_87b3 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_87b3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_87b3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_87b3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_87b3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_87b3
result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_87b3 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_87b3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_87b3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_87b3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_87b3_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1763_c7_87b3
result_u8_value_MUX_uxn_opcodes_h_l1763_c7_87b3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1763_c7_87b3_cond,
result_u8_value_MUX_uxn_opcodes_h_l1763_c7_87b3_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1763_c7_87b3_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1763_c7_87b3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_87b3
result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_87b3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_87b3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_87b3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_87b3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_87b3_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_87b3
result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_87b3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_87b3_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_87b3_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_87b3_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_87b3_return_output);

-- t16_MUX_uxn_opcodes_h_l1763_c7_87b3
t16_MUX_uxn_opcodes_h_l1763_c7_87b3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1763_c7_87b3_cond,
t16_MUX_uxn_opcodes_h_l1763_c7_87b3_iftrue,
t16_MUX_uxn_opcodes_h_l1763_c7_87b3_iffalse,
t16_MUX_uxn_opcodes_h_l1763_c7_87b3_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1764_c3_c956
BIN_OP_OR_uxn_opcodes_h_l1764_c3_c956 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1764_c3_c956_left,
BIN_OP_OR_uxn_opcodes_h_l1764_c3_c956_right,
BIN_OP_OR_uxn_opcodes_h_l1764_c3_c956_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1767_c11_41b3
BIN_OP_EQ_uxn_opcodes_h_l1767_c11_41b3 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1767_c11_41b3_left,
BIN_OP_EQ_uxn_opcodes_h_l1767_c11_41b3_right,
BIN_OP_EQ_uxn_opcodes_h_l1767_c11_41b3_return_output);

-- n16_MUX_uxn_opcodes_h_l1767_c7_c53f
n16_MUX_uxn_opcodes_h_l1767_c7_c53f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1767_c7_c53f_cond,
n16_MUX_uxn_opcodes_h_l1767_c7_c53f_iftrue,
n16_MUX_uxn_opcodes_h_l1767_c7_c53f_iffalse,
n16_MUX_uxn_opcodes_h_l1767_c7_c53f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_c53f
result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_c53f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_c53f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_c53f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_c53f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_c53f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_c53f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_c53f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_c53f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_c53f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_c53f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_c53f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_c53f
result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_c53f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_c53f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_c53f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_c53f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_c53f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1767_c7_c53f
result_u8_value_MUX_uxn_opcodes_h_l1767_c7_c53f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1767_c7_c53f_cond,
result_u8_value_MUX_uxn_opcodes_h_l1767_c7_c53f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1767_c7_c53f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1767_c7_c53f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_c53f
result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_c53f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_c53f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_c53f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_c53f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_c53f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_c53f
result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_c53f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_c53f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_c53f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_c53f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_c53f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1771_c11_7bfb
BIN_OP_EQ_uxn_opcodes_h_l1771_c11_7bfb : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1771_c11_7bfb_left,
BIN_OP_EQ_uxn_opcodes_h_l1771_c11_7bfb_right,
BIN_OP_EQ_uxn_opcodes_h_l1771_c11_7bfb_return_output);

-- n16_MUX_uxn_opcodes_h_l1771_c7_d3b7
n16_MUX_uxn_opcodes_h_l1771_c7_d3b7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1771_c7_d3b7_cond,
n16_MUX_uxn_opcodes_h_l1771_c7_d3b7_iftrue,
n16_MUX_uxn_opcodes_h_l1771_c7_d3b7_iffalse,
n16_MUX_uxn_opcodes_h_l1771_c7_d3b7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_d3b7
result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_d3b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_d3b7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_d3b7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_d3b7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_d3b7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_d3b7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_d3b7 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_d3b7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_d3b7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_d3b7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_d3b7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_d3b7
result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_d3b7 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_d3b7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_d3b7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_d3b7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_d3b7_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1771_c7_d3b7
result_u8_value_MUX_uxn_opcodes_h_l1771_c7_d3b7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1771_c7_d3b7_cond,
result_u8_value_MUX_uxn_opcodes_h_l1771_c7_d3b7_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1771_c7_d3b7_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1771_c7_d3b7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_d3b7
result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_d3b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_d3b7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_d3b7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_d3b7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_d3b7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_d3b7
result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_d3b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_d3b7_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_d3b7_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_d3b7_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_d3b7_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1772_c3_819c
BIN_OP_OR_uxn_opcodes_h_l1772_c3_819c : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1772_c3_819c_left,
BIN_OP_OR_uxn_opcodes_h_l1772_c3_819c_right,
BIN_OP_OR_uxn_opcodes_h_l1772_c3_819c_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1774_c30_d5bf
sp_relative_shift_uxn_opcodes_h_l1774_c30_d5bf : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1774_c30_d5bf_ins,
sp_relative_shift_uxn_opcodes_h_l1774_c30_d5bf_x,
sp_relative_shift_uxn_opcodes_h_l1774_c30_d5bf_y,
sp_relative_shift_uxn_opcodes_h_l1774_c30_d5bf_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1777_c21_0afb
BIN_OP_GT_uxn_opcodes_h_l1777_c21_0afb : entity work.BIN_OP_GT_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1777_c21_0afb_left,
BIN_OP_GT_uxn_opcodes_h_l1777_c21_0afb_right,
BIN_OP_GT_uxn_opcodes_h_l1777_c21_0afb_return_output);

-- MUX_uxn_opcodes_h_l1777_c21_42f1
MUX_uxn_opcodes_h_l1777_c21_42f1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1777_c21_42f1_cond,
MUX_uxn_opcodes_h_l1777_c21_42f1_iftrue,
MUX_uxn_opcodes_h_l1777_c21_42f1_iffalse,
MUX_uxn_opcodes_h_l1777_c21_42f1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1779_c11_ae82
BIN_OP_EQ_uxn_opcodes_h_l1779_c11_ae82 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1779_c11_ae82_left,
BIN_OP_EQ_uxn_opcodes_h_l1779_c11_ae82_right,
BIN_OP_EQ_uxn_opcodes_h_l1779_c11_ae82_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_46d4
result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_46d4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_46d4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_46d4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_46d4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_46d4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_46d4
result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_46d4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_46d4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_46d4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_46d4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_46d4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_46d4
result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_46d4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_46d4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_46d4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_46d4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_46d4_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1760_l1769_DUPLICATE_3b63
CONST_SL_8_uint16_t_uxn_opcodes_h_l1760_l1769_DUPLICATE_3b63 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1760_l1769_DUPLICATE_3b63_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1760_l1769_DUPLICATE_3b63_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1750_c6_94ad_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1750_c1_42d7_return_output,
 n16_MUX_uxn_opcodes_h_l1750_c2_0a25_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1750_c2_0a25_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1750_c2_0a25_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1750_c2_0a25_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1750_c2_0a25_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1750_c2_0a25_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1750_c2_0a25_return_output,
 t16_MUX_uxn_opcodes_h_l1750_c2_0a25_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1755_c11_9962_return_output,
 n16_MUX_uxn_opcodes_h_l1755_c7_d192_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1755_c7_d192_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1755_c7_d192_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1755_c7_d192_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1755_c7_d192_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1755_c7_d192_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1755_c7_d192_return_output,
 t16_MUX_uxn_opcodes_h_l1755_c7_d192_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1758_c11_1d0e_return_output,
 n16_MUX_uxn_opcodes_h_l1758_c7_36d1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_36d1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_36d1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c7_36d1_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1758_c7_36d1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_36d1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c7_36d1_return_output,
 t16_MUX_uxn_opcodes_h_l1758_c7_36d1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1763_c11_e9ee_return_output,
 n16_MUX_uxn_opcodes_h_l1763_c7_87b3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_87b3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_87b3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_87b3_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1763_c7_87b3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_87b3_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_87b3_return_output,
 t16_MUX_uxn_opcodes_h_l1763_c7_87b3_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1764_c3_c956_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1767_c11_41b3_return_output,
 n16_MUX_uxn_opcodes_h_l1767_c7_c53f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_c53f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_c53f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_c53f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1767_c7_c53f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_c53f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_c53f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1771_c11_7bfb_return_output,
 n16_MUX_uxn_opcodes_h_l1771_c7_d3b7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_d3b7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_d3b7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_d3b7_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1771_c7_d3b7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_d3b7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_d3b7_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1772_c3_819c_return_output,
 sp_relative_shift_uxn_opcodes_h_l1774_c30_d5bf_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1777_c21_0afb_return_output,
 MUX_uxn_opcodes_h_l1777_c21_42f1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1779_c11_ae82_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_46d4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_46d4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_46d4_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1760_l1769_DUPLICATE_3b63_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1750_c6_94ad_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1750_c6_94ad_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1750_c6_94ad_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1750_c1_42d7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1750_c1_42d7_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1750_c1_42d7_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1750_c1_42d7_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1750_c2_0a25_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1750_c2_0a25_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1755_c7_d192_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1750_c2_0a25_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1750_c2_0a25_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1750_c2_0a25_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1750_c2_0a25_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1755_c7_d192_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1750_c2_0a25_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1750_c2_0a25_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1750_c2_0a25_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1752_c3_e97f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1750_c2_0a25_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1755_c7_d192_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1750_c2_0a25_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1750_c2_0a25_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1750_c2_0a25_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1750_c2_0a25_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1755_c7_d192_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1750_c2_0a25_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1750_c2_0a25_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1750_c2_0a25_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1750_c2_0a25_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1755_c7_d192_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1750_c2_0a25_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1750_c2_0a25_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1750_c2_0a25_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1750_c2_0a25_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1755_c7_d192_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1750_c2_0a25_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1750_c2_0a25_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1750_c2_0a25_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1750_c2_0a25_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1755_c7_d192_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1750_c2_0a25_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1750_c2_0a25_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1750_c2_0a25_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1750_c2_0a25_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1755_c7_d192_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1750_c2_0a25_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1750_c2_0a25_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1751_c3_682c_uxn_opcodes_h_l1751_c3_682c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1755_c11_9962_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1755_c11_9962_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1755_c11_9962_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1755_c7_d192_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1755_c7_d192_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1758_c7_36d1_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1755_c7_d192_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1755_c7_d192_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1755_c7_d192_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_36d1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1755_c7_d192_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1755_c7_d192_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1756_c3_ce16 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1755_c7_d192_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_36d1_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1755_c7_d192_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1755_c7_d192_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1755_c7_d192_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c7_36d1_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1755_c7_d192_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1755_c7_d192_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1755_c7_d192_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1758_c7_36d1_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1755_c7_d192_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1755_c7_d192_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1755_c7_d192_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_36d1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1755_c7_d192_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1755_c7_d192_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1755_c7_d192_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c7_36d1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1755_c7_d192_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1755_c7_d192_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1755_c7_d192_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1758_c7_36d1_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1755_c7_d192_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c11_1d0e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c11_1d0e_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c11_1d0e_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1758_c7_36d1_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1758_c7_36d1_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1763_c7_87b3_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1758_c7_36d1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_36d1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_36d1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_87b3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_36d1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_36d1_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1761_c3_1fe6 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_36d1_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_87b3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_36d1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c7_36d1_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c7_36d1_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_87b3_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c7_36d1_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1758_c7_36d1_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1758_c7_36d1_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1763_c7_87b3_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1758_c7_36d1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_36d1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_36d1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_87b3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_36d1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c7_36d1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c7_36d1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_87b3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c7_36d1_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1758_c7_36d1_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1758_c7_36d1_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1763_c7_87b3_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1758_c7_36d1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_e9ee_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_e9ee_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_e9ee_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1763_c7_87b3_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1763_c7_87b3_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1767_c7_c53f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1763_c7_87b3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_87b3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_87b3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_c53f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_87b3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_87b3_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1765_c3_2de8 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_87b3_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_c53f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_87b3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_87b3_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_87b3_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_c53f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_87b3_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1763_c7_87b3_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1763_c7_87b3_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1767_c7_c53f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1763_c7_87b3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_87b3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_87b3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_c53f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_87b3_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_87b3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_87b3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_c53f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_87b3_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1763_c7_87b3_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1763_c7_87b3_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1763_c7_87b3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1764_c3_c956_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1764_c3_c956_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1764_c3_c956_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1767_c11_41b3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1767_c11_41b3_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1767_c11_41b3_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1767_c7_c53f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1767_c7_c53f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1771_c7_d3b7_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1767_c7_c53f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_c53f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_c53f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_d3b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_c53f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_c53f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_c53f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_d3b7_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_c53f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_c53f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_c53f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_d3b7_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_c53f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1767_c7_c53f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1767_c7_c53f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1771_c7_d3b7_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1767_c7_c53f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_c53f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_c53f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_d3b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_c53f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_c53f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_c53f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_d3b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_c53f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1771_c11_7bfb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1771_c11_7bfb_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1771_c11_7bfb_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1771_c7_d3b7_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1771_c7_d3b7_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1771_c7_d3b7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_d3b7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_d3b7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_46d4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_d3b7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_d3b7_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1776_c3_51da : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_d3b7_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_d3b7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_d3b7_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_d3b7_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_d3b7_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1771_c7_d3b7_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1771_c7_d3b7_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1771_c7_d3b7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_d3b7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_d3b7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_46d4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_d3b7_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_d3b7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_d3b7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_46d4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_d3b7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1772_c3_819c_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1772_c3_819c_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1772_c3_819c_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1774_c30_d5bf_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1774_c30_d5bf_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1774_c30_d5bf_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1774_c30_d5bf_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1777_c21_42f1_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1777_c21_42f1_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1777_c21_42f1_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1777_c21_0afb_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1777_c21_0afb_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1777_c21_0afb_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1777_c21_42f1_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c11_ae82_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c11_ae82_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c11_ae82_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_46d4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_46d4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_46d4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_46d4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_46d4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_46d4_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_46d4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_46d4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_46d4_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1758_l1755_l1750_l1779_l1767_l1763_DUPLICATE_6309_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1758_l1755_l1750_l1771_l1767_l1763_DUPLICATE_90bf_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1758_l1755_l1750_l1771_l1767_l1763_DUPLICATE_4c43_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1758_l1755_l1750_l1779_l1767_l1763_DUPLICATE_7427_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1758_l1755_l1779_l1771_l1767_l1763_DUPLICATE_1fd9_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1772_l1764_l1759_l1768_DUPLICATE_fbae_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1760_l1769_DUPLICATE_3b63_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1760_l1769_DUPLICATE_3b63_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1767_l1771_DUPLICATE_d565_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c551_uxn_opcodes_h_l1746_l1785_DUPLICATE_479d_return_output : opcode_result_t;
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
     VAR_sp_relative_shift_uxn_opcodes_h_l1774_c30_d5bf_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_d3b7_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1755_c11_9962_right := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_d3b7_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_46d4_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1777_c21_42f1_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1750_c6_94ad_right := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_46d4_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_46d4_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_e9ee_right := to_unsigned(3, 2);
     VAR_MUX_uxn_opcodes_h_l1777_c21_42f1_iftrue := resize(to_unsigned(1, 1), 8);
     VAR_sp_relative_shift_uxn_opcodes_h_l1774_c30_d5bf_y := resize(to_signed(-3, 3), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1767_c11_41b3_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1761_c3_1fe6 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_36d1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1761_c3_1fe6;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1771_c11_7bfb_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1752_c3_e97f := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1750_c2_0a25_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1752_c3_e97f;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c11_1d0e_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c11_ae82_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1756_c3_ce16 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1755_c7_d192_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1756_c3_ce16;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1765_c3_2de8 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_87b3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1765_c3_2de8;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1776_c3_51da := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_d3b7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1776_c3_51da;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1750_c2_0a25_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1750_c1_42d7_iffalse := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1750_c1_42d7_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l1774_c30_d5bf_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1772_c3_819c_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1750_c2_0a25_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1755_c7_d192_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1758_c7_36d1_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1763_c7_87b3_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1771_c7_d3b7_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1750_c6_94ad_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1755_c11_9962_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c11_1d0e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_e9ee_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1767_c11_41b3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1771_c11_7bfb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c11_ae82_left := VAR_phase;
     VAR_BIN_OP_GT_uxn_opcodes_h_l1777_c21_0afb_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1764_c3_c956_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1750_c2_0a25_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1755_c7_d192_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1763_c7_87b3_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l1771_c11_7bfb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1771_c11_7bfb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1771_c11_7bfb_left;
     BIN_OP_EQ_uxn_opcodes_h_l1771_c11_7bfb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1771_c11_7bfb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1771_c11_7bfb_return_output := BIN_OP_EQ_uxn_opcodes_h_l1771_c11_7bfb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1755_c11_9962] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1755_c11_9962_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1755_c11_9962_left;
     BIN_OP_EQ_uxn_opcodes_h_l1755_c11_9962_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1755_c11_9962_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1755_c11_9962_return_output := BIN_OP_EQ_uxn_opcodes_h_l1755_c11_9962_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1772_l1764_l1759_l1768_DUPLICATE_fbae LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1772_l1764_l1759_l1768_DUPLICATE_fbae_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1758_l1755_l1750_l1771_l1767_l1763_DUPLICATE_90bf LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1758_l1755_l1750_l1771_l1767_l1763_DUPLICATE_90bf_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1758_l1755_l1750_l1779_l1767_l1763_DUPLICATE_7427 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1758_l1755_l1750_l1779_l1767_l1763_DUPLICATE_7427_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1763_c11_e9ee] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1763_c11_e9ee_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_e9ee_left;
     BIN_OP_EQ_uxn_opcodes_h_l1763_c11_e9ee_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_e9ee_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_e9ee_return_output := BIN_OP_EQ_uxn_opcodes_h_l1763_c11_e9ee_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1758_l1755_l1750_l1779_l1767_l1763_DUPLICATE_6309 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1758_l1755_l1750_l1779_l1767_l1763_DUPLICATE_6309_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1767_c11_41b3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1767_c11_41b3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1767_c11_41b3_left;
     BIN_OP_EQ_uxn_opcodes_h_l1767_c11_41b3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1767_c11_41b3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1767_c11_41b3_return_output := BIN_OP_EQ_uxn_opcodes_h_l1767_c11_41b3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1750_c6_94ad] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1750_c6_94ad_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1750_c6_94ad_left;
     BIN_OP_EQ_uxn_opcodes_h_l1750_c6_94ad_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1750_c6_94ad_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1750_c6_94ad_return_output := BIN_OP_EQ_uxn_opcodes_h_l1750_c6_94ad_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1779_c11_ae82] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1779_c11_ae82_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c11_ae82_left;
     BIN_OP_EQ_uxn_opcodes_h_l1779_c11_ae82_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c11_ae82_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c11_ae82_return_output := BIN_OP_EQ_uxn_opcodes_h_l1779_c11_ae82_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1758_l1755_l1779_l1771_l1767_l1763_DUPLICATE_1fd9 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1758_l1755_l1779_l1771_l1767_l1763_DUPLICATE_1fd9_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1758_c11_1d0e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1758_c11_1d0e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c11_1d0e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1758_c11_1d0e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c11_1d0e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c11_1d0e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1758_c11_1d0e_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1767_l1771_DUPLICATE_d565 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1767_l1771_DUPLICATE_d565_return_output := result.stack_address_sp_offset;

     -- sp_relative_shift[uxn_opcodes_h_l1774_c30_d5bf] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1774_c30_d5bf_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1774_c30_d5bf_ins;
     sp_relative_shift_uxn_opcodes_h_l1774_c30_d5bf_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1774_c30_d5bf_x;
     sp_relative_shift_uxn_opcodes_h_l1774_c30_d5bf_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1774_c30_d5bf_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1774_c30_d5bf_return_output := sp_relative_shift_uxn_opcodes_h_l1774_c30_d5bf_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1758_l1755_l1750_l1771_l1767_l1763_DUPLICATE_4c43 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1758_l1755_l1750_l1771_l1767_l1763_DUPLICATE_4c43_return_output := result.u8_value;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1750_c1_42d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1750_c6_94ad_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1750_c2_0a25_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1750_c6_94ad_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1750_c2_0a25_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1750_c6_94ad_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1750_c2_0a25_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1750_c6_94ad_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1750_c2_0a25_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1750_c6_94ad_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1750_c2_0a25_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1750_c6_94ad_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1750_c2_0a25_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1750_c6_94ad_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1750_c2_0a25_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1750_c6_94ad_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1750_c2_0a25_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1750_c6_94ad_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1755_c7_d192_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1755_c11_9962_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1755_c7_d192_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1755_c11_9962_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1755_c7_d192_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1755_c11_9962_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1755_c7_d192_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1755_c11_9962_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1755_c7_d192_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1755_c11_9962_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1755_c7_d192_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1755_c11_9962_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1755_c7_d192_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1755_c11_9962_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1755_c7_d192_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1755_c11_9962_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1758_c7_36d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c11_1d0e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_36d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c11_1d0e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c7_36d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c11_1d0e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_36d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c11_1d0e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c7_36d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c11_1d0e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_36d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c11_1d0e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1758_c7_36d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c11_1d0e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1758_c7_36d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c11_1d0e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1763_c7_87b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_e9ee_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_87b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_e9ee_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_87b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_e9ee_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_87b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_e9ee_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_87b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_e9ee_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_87b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_e9ee_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1763_c7_87b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_e9ee_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1763_c7_87b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_e9ee_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1767_c7_c53f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1767_c11_41b3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_c53f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1767_c11_41b3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_c53f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1767_c11_41b3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_c53f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1767_c11_41b3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_c53f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1767_c11_41b3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_c53f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1767_c11_41b3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1767_c7_c53f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1767_c11_41b3_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1771_c7_d3b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1771_c11_7bfb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_d3b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1771_c11_7bfb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_d3b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1771_c11_7bfb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_d3b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1771_c11_7bfb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_d3b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1771_c11_7bfb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_d3b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1771_c11_7bfb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1771_c7_d3b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1771_c11_7bfb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_46d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c11_ae82_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_46d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c11_ae82_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_46d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c11_ae82_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1764_c3_c956_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1772_l1764_l1759_l1768_DUPLICATE_fbae_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1772_c3_819c_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1772_l1764_l1759_l1768_DUPLICATE_fbae_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1760_l1769_DUPLICATE_3b63_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1772_l1764_l1759_l1768_DUPLICATE_fbae_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1750_c2_0a25_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1758_l1755_l1750_l1771_l1767_l1763_DUPLICATE_90bf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1755_c7_d192_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1758_l1755_l1750_l1771_l1767_l1763_DUPLICATE_90bf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c7_36d1_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1758_l1755_l1750_l1771_l1767_l1763_DUPLICATE_90bf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_87b3_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1758_l1755_l1750_l1771_l1767_l1763_DUPLICATE_90bf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_c53f_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1758_l1755_l1750_l1771_l1767_l1763_DUPLICATE_90bf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_d3b7_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1758_l1755_l1750_l1771_l1767_l1763_DUPLICATE_90bf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1755_c7_d192_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1758_l1755_l1779_l1771_l1767_l1763_DUPLICATE_1fd9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_36d1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1758_l1755_l1779_l1771_l1767_l1763_DUPLICATE_1fd9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_87b3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1758_l1755_l1779_l1771_l1767_l1763_DUPLICATE_1fd9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_c53f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1758_l1755_l1779_l1771_l1767_l1763_DUPLICATE_1fd9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_d3b7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1758_l1755_l1779_l1771_l1767_l1763_DUPLICATE_1fd9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_46d4_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1758_l1755_l1779_l1771_l1767_l1763_DUPLICATE_1fd9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1750_c2_0a25_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1758_l1755_l1750_l1779_l1767_l1763_DUPLICATE_7427_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1755_c7_d192_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1758_l1755_l1750_l1779_l1767_l1763_DUPLICATE_7427_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c7_36d1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1758_l1755_l1750_l1779_l1767_l1763_DUPLICATE_7427_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_87b3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1758_l1755_l1750_l1779_l1767_l1763_DUPLICATE_7427_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_c53f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1758_l1755_l1750_l1779_l1767_l1763_DUPLICATE_7427_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_46d4_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1758_l1755_l1750_l1779_l1767_l1763_DUPLICATE_7427_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1750_c2_0a25_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1758_l1755_l1750_l1779_l1767_l1763_DUPLICATE_6309_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1755_c7_d192_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1758_l1755_l1750_l1779_l1767_l1763_DUPLICATE_6309_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_36d1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1758_l1755_l1750_l1779_l1767_l1763_DUPLICATE_6309_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_87b3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1758_l1755_l1750_l1779_l1767_l1763_DUPLICATE_6309_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_c53f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1758_l1755_l1750_l1779_l1767_l1763_DUPLICATE_6309_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_46d4_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1758_l1755_l1750_l1779_l1767_l1763_DUPLICATE_6309_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_c53f_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1767_l1771_DUPLICATE_d565_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_d3b7_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1767_l1771_DUPLICATE_d565_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1750_c2_0a25_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1758_l1755_l1750_l1771_l1767_l1763_DUPLICATE_4c43_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1755_c7_d192_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1758_l1755_l1750_l1771_l1767_l1763_DUPLICATE_4c43_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1758_c7_36d1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1758_l1755_l1750_l1771_l1767_l1763_DUPLICATE_4c43_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1763_c7_87b3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1758_l1755_l1750_l1771_l1767_l1763_DUPLICATE_4c43_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1767_c7_c53f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1758_l1755_l1750_l1771_l1767_l1763_DUPLICATE_4c43_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1771_c7_d3b7_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1758_l1755_l1750_l1771_l1767_l1763_DUPLICATE_4c43_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_d3b7_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1774_c30_d5bf_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1771_c7_d3b7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_d3b7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_d3b7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_d3b7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_d3b7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_d3b7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_d3b7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_d3b7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_d3b7_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1764_c3_c956] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1764_c3_c956_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1764_c3_c956_left;
     BIN_OP_OR_uxn_opcodes_h_l1764_c3_c956_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1764_c3_c956_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1764_c3_c956_return_output := BIN_OP_OR_uxn_opcodes_h_l1764_c3_c956_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1772_c3_819c] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1772_c3_819c_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1772_c3_819c_left;
     BIN_OP_OR_uxn_opcodes_h_l1772_c3_819c_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1772_c3_819c_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1772_c3_819c_return_output := BIN_OP_OR_uxn_opcodes_h_l1772_c3_819c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1779_c7_46d4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_46d4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_46d4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_46d4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_46d4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_46d4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_46d4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_46d4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_46d4_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1760_l1769_DUPLICATE_3b63 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1760_l1769_DUPLICATE_3b63_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1760_l1769_DUPLICATE_3b63_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1760_l1769_DUPLICATE_3b63_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1760_l1769_DUPLICATE_3b63_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1779_c7_46d4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_46d4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_46d4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_46d4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_46d4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_46d4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_46d4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_46d4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_46d4_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1779_c7_46d4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_46d4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_46d4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_46d4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_46d4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_46d4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_46d4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_46d4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_46d4_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1750_c1_42d7] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1750_c1_42d7_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1750_c1_42d7_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1750_c1_42d7_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1750_c1_42d7_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1750_c1_42d7_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1750_c1_42d7_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1750_c1_42d7_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1750_c1_42d7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1771_c7_d3b7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_d3b7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_d3b7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_d3b7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_d3b7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_d3b7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_d3b7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_d3b7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_d3b7_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1763_c7_87b3_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1764_c3_c956_return_output;
     VAR_BIN_OP_GT_uxn_opcodes_h_l1777_c21_0afb_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1772_c3_819c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1771_c7_d3b7_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1772_c3_819c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1767_c7_c53f_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1760_l1769_DUPLICATE_3b63_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1758_c7_36d1_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1760_l1769_DUPLICATE_3b63_return_output;
     VAR_printf_uxn_opcodes_h_l1751_c3_682c_uxn_opcodes_h_l1751_c3_682c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1750_c1_42d7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_d3b7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_46d4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_d3b7_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_46d4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_d3b7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_46d4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_c53f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_d3b7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_c53f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_d3b7_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1771_c7_d3b7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_d3b7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_d3b7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_d3b7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_d3b7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_d3b7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_d3b7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_d3b7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_d3b7_return_output;

     -- n16_MUX[uxn_opcodes_h_l1771_c7_d3b7] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1771_c7_d3b7_cond <= VAR_n16_MUX_uxn_opcodes_h_l1771_c7_d3b7_cond;
     n16_MUX_uxn_opcodes_h_l1771_c7_d3b7_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1771_c7_d3b7_iftrue;
     n16_MUX_uxn_opcodes_h_l1771_c7_d3b7_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1771_c7_d3b7_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1771_c7_d3b7_return_output := n16_MUX_uxn_opcodes_h_l1771_c7_d3b7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1767_c7_c53f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_c53f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_c53f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_c53f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_c53f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_c53f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_c53f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_c53f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_c53f_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1777_c21_0afb] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1777_c21_0afb_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1777_c21_0afb_left;
     BIN_OP_GT_uxn_opcodes_h_l1777_c21_0afb_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1777_c21_0afb_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1777_c21_0afb_return_output := BIN_OP_GT_uxn_opcodes_h_l1777_c21_0afb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1771_c7_d3b7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_d3b7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_d3b7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_d3b7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_d3b7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_d3b7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_d3b7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_d3b7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_d3b7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1767_c7_c53f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_c53f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_c53f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_c53f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_c53f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_c53f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_c53f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_c53f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_c53f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1771_c7_d3b7] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_d3b7_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_d3b7_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_d3b7_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_d3b7_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_d3b7_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_d3b7_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_d3b7_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_d3b7_return_output;

     -- printf_uxn_opcodes_h_l1751_c3_682c[uxn_opcodes_h_l1751_c3_682c] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1751_c3_682c_uxn_opcodes_h_l1751_c3_682c_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1751_c3_682c_uxn_opcodes_h_l1751_c3_682c_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- t16_MUX[uxn_opcodes_h_l1763_c7_87b3] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1763_c7_87b3_cond <= VAR_t16_MUX_uxn_opcodes_h_l1763_c7_87b3_cond;
     t16_MUX_uxn_opcodes_h_l1763_c7_87b3_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1763_c7_87b3_iftrue;
     t16_MUX_uxn_opcodes_h_l1763_c7_87b3_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1763_c7_87b3_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1763_c7_87b3_return_output := t16_MUX_uxn_opcodes_h_l1763_c7_87b3_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_opcodes_h_l1777_c21_42f1_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1777_c21_0afb_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1767_c7_c53f_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1771_c7_d3b7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_c53f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_d3b7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_c53f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_d3b7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_c53f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_d3b7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_87b3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_c53f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_87b3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_c53f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1758_c7_36d1_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1763_c7_87b3_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1763_c7_87b3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_87b3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_87b3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_87b3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_87b3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_87b3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_87b3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_87b3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_87b3_return_output;

     -- n16_MUX[uxn_opcodes_h_l1767_c7_c53f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1767_c7_c53f_cond <= VAR_n16_MUX_uxn_opcodes_h_l1767_c7_c53f_cond;
     n16_MUX_uxn_opcodes_h_l1767_c7_c53f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1767_c7_c53f_iftrue;
     n16_MUX_uxn_opcodes_h_l1767_c7_c53f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1767_c7_c53f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1767_c7_c53f_return_output := n16_MUX_uxn_opcodes_h_l1767_c7_c53f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1767_c7_c53f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_c53f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_c53f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_c53f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_c53f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_c53f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_c53f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_c53f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_c53f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1763_c7_87b3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_87b3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_87b3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_87b3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_87b3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_87b3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_87b3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_87b3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_87b3_return_output;

     -- t16_MUX[uxn_opcodes_h_l1758_c7_36d1] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1758_c7_36d1_cond <= VAR_t16_MUX_uxn_opcodes_h_l1758_c7_36d1_cond;
     t16_MUX_uxn_opcodes_h_l1758_c7_36d1_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1758_c7_36d1_iftrue;
     t16_MUX_uxn_opcodes_h_l1758_c7_36d1_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1758_c7_36d1_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1758_c7_36d1_return_output := t16_MUX_uxn_opcodes_h_l1758_c7_36d1_return_output;

     -- MUX[uxn_opcodes_h_l1777_c21_42f1] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1777_c21_42f1_cond <= VAR_MUX_uxn_opcodes_h_l1777_c21_42f1_cond;
     MUX_uxn_opcodes_h_l1777_c21_42f1_iftrue <= VAR_MUX_uxn_opcodes_h_l1777_c21_42f1_iftrue;
     MUX_uxn_opcodes_h_l1777_c21_42f1_iffalse <= VAR_MUX_uxn_opcodes_h_l1777_c21_42f1_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1777_c21_42f1_return_output := MUX_uxn_opcodes_h_l1777_c21_42f1_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1767_c7_c53f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_c53f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_c53f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_c53f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_c53f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_c53f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_c53f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_c53f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_c53f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1767_c7_c53f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_c53f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_c53f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_c53f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_c53f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_c53f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_c53f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_c53f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_c53f_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1771_c7_d3b7_iftrue := VAR_MUX_uxn_opcodes_h_l1777_c21_42f1_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1763_c7_87b3_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1767_c7_c53f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_87b3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_c53f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_87b3_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_c53f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_87b3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_c53f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c7_36d1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_87b3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_36d1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_87b3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1755_c7_d192_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1758_c7_36d1_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1763_c7_87b3] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_87b3_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_87b3_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_87b3_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_87b3_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_87b3_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_87b3_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_87b3_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_87b3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1763_c7_87b3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_87b3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_87b3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_87b3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_87b3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_87b3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_87b3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_87b3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_87b3_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1771_c7_d3b7] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1771_c7_d3b7_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1771_c7_d3b7_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1771_c7_d3b7_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1771_c7_d3b7_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1771_c7_d3b7_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1771_c7_d3b7_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1771_c7_d3b7_return_output := result_u8_value_MUX_uxn_opcodes_h_l1771_c7_d3b7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1758_c7_36d1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c7_36d1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c7_36d1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c7_36d1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c7_36d1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c7_36d1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c7_36d1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c7_36d1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c7_36d1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1763_c7_87b3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_87b3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_87b3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_87b3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_87b3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_87b3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_87b3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_87b3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_87b3_return_output;

     -- t16_MUX[uxn_opcodes_h_l1755_c7_d192] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1755_c7_d192_cond <= VAR_t16_MUX_uxn_opcodes_h_l1755_c7_d192_cond;
     t16_MUX_uxn_opcodes_h_l1755_c7_d192_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1755_c7_d192_iftrue;
     t16_MUX_uxn_opcodes_h_l1755_c7_d192_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1755_c7_d192_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1755_c7_d192_return_output := t16_MUX_uxn_opcodes_h_l1755_c7_d192_return_output;

     -- n16_MUX[uxn_opcodes_h_l1763_c7_87b3] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1763_c7_87b3_cond <= VAR_n16_MUX_uxn_opcodes_h_l1763_c7_87b3_cond;
     n16_MUX_uxn_opcodes_h_l1763_c7_87b3_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1763_c7_87b3_iftrue;
     n16_MUX_uxn_opcodes_h_l1763_c7_87b3_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1763_c7_87b3_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1763_c7_87b3_return_output := n16_MUX_uxn_opcodes_h_l1763_c7_87b3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1758_c7_36d1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_36d1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_36d1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_36d1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_36d1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_36d1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_36d1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_36d1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_36d1_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1758_c7_36d1_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1763_c7_87b3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_36d1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_87b3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c7_36d1_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_87b3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_36d1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_87b3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1755_c7_d192_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c7_36d1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1755_c7_d192_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_36d1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1767_c7_c53f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1771_c7_d3b7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1750_c2_0a25_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1755_c7_d192_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1758_c7_36d1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_36d1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_36d1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_36d1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_36d1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_36d1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_36d1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_36d1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_36d1_return_output;

     -- n16_MUX[uxn_opcodes_h_l1758_c7_36d1] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1758_c7_36d1_cond <= VAR_n16_MUX_uxn_opcodes_h_l1758_c7_36d1_cond;
     n16_MUX_uxn_opcodes_h_l1758_c7_36d1_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1758_c7_36d1_iftrue;
     n16_MUX_uxn_opcodes_h_l1758_c7_36d1_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1758_c7_36d1_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1758_c7_36d1_return_output := n16_MUX_uxn_opcodes_h_l1758_c7_36d1_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1767_c7_c53f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1767_c7_c53f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1767_c7_c53f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1767_c7_c53f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1767_c7_c53f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1767_c7_c53f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1767_c7_c53f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1767_c7_c53f_return_output := result_u8_value_MUX_uxn_opcodes_h_l1767_c7_c53f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1755_c7_d192] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1755_c7_d192_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1755_c7_d192_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1755_c7_d192_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1755_c7_d192_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1755_c7_d192_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1755_c7_d192_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1755_c7_d192_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1755_c7_d192_return_output;

     -- t16_MUX[uxn_opcodes_h_l1750_c2_0a25] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1750_c2_0a25_cond <= VAR_t16_MUX_uxn_opcodes_h_l1750_c2_0a25_cond;
     t16_MUX_uxn_opcodes_h_l1750_c2_0a25_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1750_c2_0a25_iftrue;
     t16_MUX_uxn_opcodes_h_l1750_c2_0a25_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1750_c2_0a25_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1750_c2_0a25_return_output := t16_MUX_uxn_opcodes_h_l1750_c2_0a25_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1758_c7_36d1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_36d1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_36d1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_36d1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_36d1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_36d1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_36d1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_36d1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_36d1_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1755_c7_d192] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1755_c7_d192_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1755_c7_d192_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1755_c7_d192_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1755_c7_d192_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1755_c7_d192_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1755_c7_d192_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1755_c7_d192_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1755_c7_d192_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1758_c7_36d1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c7_36d1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c7_36d1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c7_36d1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c7_36d1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c7_36d1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c7_36d1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c7_36d1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c7_36d1_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1755_c7_d192_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1758_c7_36d1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1755_c7_d192_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_36d1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1755_c7_d192_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c7_36d1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1755_c7_d192_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_36d1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1750_c2_0a25_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1755_c7_d192_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1750_c2_0a25_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1755_c7_d192_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1763_c7_87b3_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1767_c7_c53f_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1750_c2_0a25_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1763_c7_87b3] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1763_c7_87b3_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1763_c7_87b3_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1763_c7_87b3_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1763_c7_87b3_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1763_c7_87b3_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1763_c7_87b3_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1763_c7_87b3_return_output := result_u8_value_MUX_uxn_opcodes_h_l1763_c7_87b3_return_output;

     -- n16_MUX[uxn_opcodes_h_l1755_c7_d192] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1755_c7_d192_cond <= VAR_n16_MUX_uxn_opcodes_h_l1755_c7_d192_cond;
     n16_MUX_uxn_opcodes_h_l1755_c7_d192_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1755_c7_d192_iftrue;
     n16_MUX_uxn_opcodes_h_l1755_c7_d192_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1755_c7_d192_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1755_c7_d192_return_output := n16_MUX_uxn_opcodes_h_l1755_c7_d192_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1755_c7_d192] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1755_c7_d192_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1755_c7_d192_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1755_c7_d192_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1755_c7_d192_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1755_c7_d192_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1755_c7_d192_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1755_c7_d192_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1755_c7_d192_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1750_c2_0a25] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1750_c2_0a25_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1750_c2_0a25_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1750_c2_0a25_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1750_c2_0a25_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1750_c2_0a25_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1750_c2_0a25_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1750_c2_0a25_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1750_c2_0a25_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1755_c7_d192] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1755_c7_d192_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1755_c7_d192_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1755_c7_d192_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1755_c7_d192_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1755_c7_d192_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1755_c7_d192_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1755_c7_d192_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1755_c7_d192_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1755_c7_d192] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1755_c7_d192_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1755_c7_d192_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1755_c7_d192_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1755_c7_d192_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1755_c7_d192_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1755_c7_d192_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1755_c7_d192_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1755_c7_d192_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1750_c2_0a25] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1750_c2_0a25_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1750_c2_0a25_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1750_c2_0a25_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1750_c2_0a25_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1750_c2_0a25_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1750_c2_0a25_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1750_c2_0a25_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1750_c2_0a25_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1750_c2_0a25_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1755_c7_d192_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1750_c2_0a25_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1755_c7_d192_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1750_c2_0a25_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1755_c7_d192_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1750_c2_0a25_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1755_c7_d192_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1758_c7_36d1_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1763_c7_87b3_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1750_c2_0a25] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1750_c2_0a25_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1750_c2_0a25_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1750_c2_0a25_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1750_c2_0a25_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1750_c2_0a25_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1750_c2_0a25_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1750_c2_0a25_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1750_c2_0a25_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1750_c2_0a25] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1750_c2_0a25_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1750_c2_0a25_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1750_c2_0a25_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1750_c2_0a25_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1750_c2_0a25_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1750_c2_0a25_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1750_c2_0a25_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1750_c2_0a25_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1750_c2_0a25] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1750_c2_0a25_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1750_c2_0a25_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1750_c2_0a25_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1750_c2_0a25_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1750_c2_0a25_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1750_c2_0a25_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1750_c2_0a25_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1750_c2_0a25_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1758_c7_36d1] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1758_c7_36d1_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1758_c7_36d1_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1758_c7_36d1_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1758_c7_36d1_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1758_c7_36d1_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1758_c7_36d1_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1758_c7_36d1_return_output := result_u8_value_MUX_uxn_opcodes_h_l1758_c7_36d1_return_output;

     -- n16_MUX[uxn_opcodes_h_l1750_c2_0a25] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1750_c2_0a25_cond <= VAR_n16_MUX_uxn_opcodes_h_l1750_c2_0a25_cond;
     n16_MUX_uxn_opcodes_h_l1750_c2_0a25_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1750_c2_0a25_iftrue;
     n16_MUX_uxn_opcodes_h_l1750_c2_0a25_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1750_c2_0a25_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1750_c2_0a25_return_output := n16_MUX_uxn_opcodes_h_l1750_c2_0a25_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1750_c2_0a25_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1755_c7_d192_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1758_c7_36d1_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1755_c7_d192] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1755_c7_d192_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1755_c7_d192_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1755_c7_d192_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1755_c7_d192_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1755_c7_d192_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1755_c7_d192_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1755_c7_d192_return_output := result_u8_value_MUX_uxn_opcodes_h_l1755_c7_d192_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1750_c2_0a25_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1755_c7_d192_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1750_c2_0a25] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1750_c2_0a25_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1750_c2_0a25_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1750_c2_0a25_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1750_c2_0a25_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1750_c2_0a25_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1750_c2_0a25_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1750_c2_0a25_return_output := result_u8_value_MUX_uxn_opcodes_h_l1750_c2_0a25_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_c551_uxn_opcodes_h_l1746_l1785_DUPLICATE_479d LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c551_uxn_opcodes_h_l1746_l1785_DUPLICATE_479d_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_c551(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1750_c2_0a25_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1750_c2_0a25_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1750_c2_0a25_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1750_c2_0a25_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1750_c2_0a25_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1750_c2_0a25_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c551_uxn_opcodes_h_l1746_l1785_DUPLICATE_479d_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c551_uxn_opcodes_h_l1746_l1785_DUPLICATE_479d_return_output;
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
