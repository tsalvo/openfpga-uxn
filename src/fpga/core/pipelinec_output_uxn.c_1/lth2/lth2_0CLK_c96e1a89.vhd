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
-- Submodules: 91
entity lth2_0CLK_c96e1a89 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end lth2_0CLK_c96e1a89;
architecture arch of lth2_0CLK_c96e1a89 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l2040_c6_bde7]
signal BIN_OP_EQ_uxn_opcodes_h_l2040_c6_bde7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2040_c6_bde7_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2040_c6_bde7_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2040_c1_356a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c1_356a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c1_356a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c1_356a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c1_356a_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2040_c2_3903]
signal n16_MUX_uxn_opcodes_h_l2040_c2_3903_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2040_c2_3903_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2040_c2_3903_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2040_c2_3903_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2040_c2_3903]
signal result_u8_value_MUX_uxn_opcodes_h_l2040_c2_3903_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2040_c2_3903_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2040_c2_3903_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2040_c2_3903_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2040_c2_3903]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2040_c2_3903_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2040_c2_3903_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2040_c2_3903_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2040_c2_3903_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2040_c2_3903]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c2_3903_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c2_3903_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c2_3903_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c2_3903_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2040_c2_3903]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2040_c2_3903_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2040_c2_3903_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2040_c2_3903_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2040_c2_3903_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2040_c2_3903]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c2_3903_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c2_3903_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c2_3903_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c2_3903_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2040_c2_3903]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c2_3903_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c2_3903_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c2_3903_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c2_3903_return_output : unsigned(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l2040_c2_3903]
signal t16_MUX_uxn_opcodes_h_l2040_c2_3903_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2040_c2_3903_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2040_c2_3903_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2040_c2_3903_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l2041_c3_ba67[uxn_opcodes_h_l2041_c3_ba67]
signal printf_uxn_opcodes_h_l2041_c3_ba67_uxn_opcodes_h_l2041_c3_ba67_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2045_c11_6a0b]
signal BIN_OP_EQ_uxn_opcodes_h_l2045_c11_6a0b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2045_c11_6a0b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2045_c11_6a0b_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2045_c7_9dea]
signal n16_MUX_uxn_opcodes_h_l2045_c7_9dea_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2045_c7_9dea_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2045_c7_9dea_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2045_c7_9dea_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2045_c7_9dea]
signal result_u8_value_MUX_uxn_opcodes_h_l2045_c7_9dea_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2045_c7_9dea_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2045_c7_9dea_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2045_c7_9dea_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2045_c7_9dea]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2045_c7_9dea_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2045_c7_9dea_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2045_c7_9dea_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2045_c7_9dea_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2045_c7_9dea]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2045_c7_9dea_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2045_c7_9dea_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2045_c7_9dea_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2045_c7_9dea_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2045_c7_9dea]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2045_c7_9dea_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2045_c7_9dea_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2045_c7_9dea_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2045_c7_9dea_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2045_c7_9dea]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2045_c7_9dea_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2045_c7_9dea_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2045_c7_9dea_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2045_c7_9dea_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2045_c7_9dea]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2045_c7_9dea_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2045_c7_9dea_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2045_c7_9dea_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2045_c7_9dea_return_output : unsigned(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l2045_c7_9dea]
signal t16_MUX_uxn_opcodes_h_l2045_c7_9dea_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2045_c7_9dea_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2045_c7_9dea_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2045_c7_9dea_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2048_c11_b86e]
signal BIN_OP_EQ_uxn_opcodes_h_l2048_c11_b86e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2048_c11_b86e_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2048_c11_b86e_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2048_c7_73b4]
signal n16_MUX_uxn_opcodes_h_l2048_c7_73b4_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2048_c7_73b4_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2048_c7_73b4_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2048_c7_73b4_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2048_c7_73b4]
signal result_u8_value_MUX_uxn_opcodes_h_l2048_c7_73b4_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2048_c7_73b4_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2048_c7_73b4_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2048_c7_73b4_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2048_c7_73b4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_73b4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_73b4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_73b4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_73b4_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2048_c7_73b4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_73b4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_73b4_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_73b4_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_73b4_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2048_c7_73b4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_73b4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_73b4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_73b4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_73b4_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2048_c7_73b4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_73b4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_73b4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_73b4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_73b4_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2048_c7_73b4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_73b4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_73b4_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_73b4_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_73b4_return_output : unsigned(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l2048_c7_73b4]
signal t16_MUX_uxn_opcodes_h_l2048_c7_73b4_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2048_c7_73b4_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2048_c7_73b4_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2048_c7_73b4_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2053_c11_ff2a]
signal BIN_OP_EQ_uxn_opcodes_h_l2053_c11_ff2a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2053_c11_ff2a_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2053_c11_ff2a_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2053_c7_90db]
signal n16_MUX_uxn_opcodes_h_l2053_c7_90db_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2053_c7_90db_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2053_c7_90db_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2053_c7_90db_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2053_c7_90db]
signal result_u8_value_MUX_uxn_opcodes_h_l2053_c7_90db_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2053_c7_90db_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2053_c7_90db_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2053_c7_90db_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2053_c7_90db]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2053_c7_90db_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2053_c7_90db_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2053_c7_90db_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2053_c7_90db_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2053_c7_90db]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2053_c7_90db_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2053_c7_90db_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2053_c7_90db_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2053_c7_90db_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2053_c7_90db]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2053_c7_90db_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2053_c7_90db_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2053_c7_90db_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2053_c7_90db_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2053_c7_90db]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2053_c7_90db_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2053_c7_90db_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2053_c7_90db_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2053_c7_90db_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2053_c7_90db]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2053_c7_90db_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2053_c7_90db_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2053_c7_90db_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2053_c7_90db_return_output : unsigned(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l2053_c7_90db]
signal t16_MUX_uxn_opcodes_h_l2053_c7_90db_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2053_c7_90db_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2053_c7_90db_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2053_c7_90db_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2056_c11_7f43]
signal BIN_OP_EQ_uxn_opcodes_h_l2056_c11_7f43_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2056_c11_7f43_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2056_c11_7f43_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2056_c7_3034]
signal n16_MUX_uxn_opcodes_h_l2056_c7_3034_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2056_c7_3034_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2056_c7_3034_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2056_c7_3034_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2056_c7_3034]
signal result_u8_value_MUX_uxn_opcodes_h_l2056_c7_3034_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2056_c7_3034_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2056_c7_3034_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2056_c7_3034_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2056_c7_3034]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2056_c7_3034_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2056_c7_3034_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2056_c7_3034_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2056_c7_3034_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2056_c7_3034]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2056_c7_3034_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2056_c7_3034_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2056_c7_3034_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2056_c7_3034_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2056_c7_3034]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2056_c7_3034_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2056_c7_3034_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2056_c7_3034_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2056_c7_3034_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2056_c7_3034]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2056_c7_3034_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2056_c7_3034_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2056_c7_3034_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2056_c7_3034_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2056_c7_3034]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2056_c7_3034_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2056_c7_3034_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2056_c7_3034_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2056_c7_3034_return_output : unsigned(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l2056_c7_3034]
signal t16_MUX_uxn_opcodes_h_l2056_c7_3034_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2056_c7_3034_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2056_c7_3034_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2056_c7_3034_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2057_c3_d6ed]
signal BIN_OP_OR_uxn_opcodes_h_l2057_c3_d6ed_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2057_c3_d6ed_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2057_c3_d6ed_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2060_c11_7df2]
signal BIN_OP_EQ_uxn_opcodes_h_l2060_c11_7df2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2060_c11_7df2_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2060_c11_7df2_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2060_c7_735e]
signal n16_MUX_uxn_opcodes_h_l2060_c7_735e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2060_c7_735e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2060_c7_735e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2060_c7_735e_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2060_c7_735e]
signal result_u8_value_MUX_uxn_opcodes_h_l2060_c7_735e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2060_c7_735e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2060_c7_735e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2060_c7_735e_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2060_c7_735e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2060_c7_735e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2060_c7_735e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2060_c7_735e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2060_c7_735e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2060_c7_735e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2060_c7_735e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2060_c7_735e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2060_c7_735e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2060_c7_735e_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2060_c7_735e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2060_c7_735e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2060_c7_735e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2060_c7_735e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2060_c7_735e_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2060_c7_735e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2060_c7_735e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2060_c7_735e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2060_c7_735e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2060_c7_735e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2060_c7_735e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2060_c7_735e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2060_c7_735e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2060_c7_735e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2060_c7_735e_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2063_c11_0334]
signal BIN_OP_EQ_uxn_opcodes_h_l2063_c11_0334_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2063_c11_0334_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2063_c11_0334_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2063_c7_e0d8]
signal n16_MUX_uxn_opcodes_h_l2063_c7_e0d8_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2063_c7_e0d8_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2063_c7_e0d8_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2063_c7_e0d8_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2063_c7_e0d8]
signal result_u8_value_MUX_uxn_opcodes_h_l2063_c7_e0d8_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2063_c7_e0d8_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2063_c7_e0d8_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2063_c7_e0d8_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2063_c7_e0d8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2063_c7_e0d8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2063_c7_e0d8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2063_c7_e0d8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2063_c7_e0d8_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2063_c7_e0d8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2063_c7_e0d8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2063_c7_e0d8_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2063_c7_e0d8_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2063_c7_e0d8_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2063_c7_e0d8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2063_c7_e0d8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2063_c7_e0d8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2063_c7_e0d8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2063_c7_e0d8_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2063_c7_e0d8]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2063_c7_e0d8_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2063_c7_e0d8_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2063_c7_e0d8_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2063_c7_e0d8_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2063_c7_e0d8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2063_c7_e0d8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2063_c7_e0d8_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2063_c7_e0d8_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2063_c7_e0d8_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2068_c11_ae0d]
signal BIN_OP_EQ_uxn_opcodes_h_l2068_c11_ae0d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2068_c11_ae0d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2068_c11_ae0d_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2068_c7_29e9]
signal n16_MUX_uxn_opcodes_h_l2068_c7_29e9_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2068_c7_29e9_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2068_c7_29e9_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2068_c7_29e9_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2068_c7_29e9]
signal result_u8_value_MUX_uxn_opcodes_h_l2068_c7_29e9_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2068_c7_29e9_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2068_c7_29e9_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2068_c7_29e9_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2068_c7_29e9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2068_c7_29e9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2068_c7_29e9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2068_c7_29e9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2068_c7_29e9_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2068_c7_29e9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2068_c7_29e9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2068_c7_29e9_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2068_c7_29e9_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2068_c7_29e9_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2068_c7_29e9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2068_c7_29e9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2068_c7_29e9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2068_c7_29e9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2068_c7_29e9_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2068_c7_29e9]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2068_c7_29e9_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2068_c7_29e9_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2068_c7_29e9_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2068_c7_29e9_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2068_c7_29e9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2068_c7_29e9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2068_c7_29e9_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2068_c7_29e9_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2068_c7_29e9_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2071_c11_242c]
signal BIN_OP_EQ_uxn_opcodes_h_l2071_c11_242c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2071_c11_242c_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2071_c11_242c_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2071_c7_c59d]
signal n16_MUX_uxn_opcodes_h_l2071_c7_c59d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2071_c7_c59d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2071_c7_c59d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2071_c7_c59d_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2071_c7_c59d]
signal result_u8_value_MUX_uxn_opcodes_h_l2071_c7_c59d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2071_c7_c59d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2071_c7_c59d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2071_c7_c59d_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2071_c7_c59d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2071_c7_c59d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2071_c7_c59d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2071_c7_c59d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2071_c7_c59d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2071_c7_c59d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2071_c7_c59d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2071_c7_c59d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2071_c7_c59d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2071_c7_c59d_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2071_c7_c59d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2071_c7_c59d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2071_c7_c59d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2071_c7_c59d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2071_c7_c59d_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2071_c7_c59d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c7_c59d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c7_c59d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c7_c59d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c7_c59d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2071_c7_c59d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c7_c59d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c7_c59d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c7_c59d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c7_c59d_return_output : unsigned(3 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2072_c3_f218]
signal BIN_OP_OR_uxn_opcodes_h_l2072_c3_f218_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2072_c3_f218_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2072_c3_f218_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2074_c30_d29a]
signal sp_relative_shift_uxn_opcodes_h_l2074_c30_d29a_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2074_c30_d29a_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2074_c30_d29a_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2074_c30_d29a_return_output : signed(3 downto 0);

-- BIN_OP_LT[uxn_opcodes_h_l2077_c21_7de3]
signal BIN_OP_LT_uxn_opcodes_h_l2077_c21_7de3_left : unsigned(15 downto 0);
signal BIN_OP_LT_uxn_opcodes_h_l2077_c21_7de3_right : unsigned(15 downto 0);
signal BIN_OP_LT_uxn_opcodes_h_l2077_c21_7de3_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2077_c21_9592]
signal MUX_uxn_opcodes_h_l2077_c21_9592_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2077_c21_9592_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2077_c21_9592_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2077_c21_9592_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2079_c11_f763]
signal BIN_OP_EQ_uxn_opcodes_h_l2079_c11_f763_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2079_c11_f763_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2079_c11_f763_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2079_c7_be6b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2079_c7_be6b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2079_c7_be6b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2079_c7_be6b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2079_c7_be6b_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2079_c7_be6b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2079_c7_be6b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2079_c7_be6b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2079_c7_be6b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2079_c7_be6b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2079_c7_be6b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2079_c7_be6b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2079_c7_be6b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2079_c7_be6b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2079_c7_be6b_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2065_l2050_DUPLICATE_e25c
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2065_l2050_DUPLICATE_e25c_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2065_l2050_DUPLICATE_e25c_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_25e8( ref_toks_0 : opcode_result_t;
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
      base.u8_value := ref_toks_1;
      base.is_opc_done := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.is_sp_shift := ref_toks_5;
      base.stack_address_sp_offset := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2040_c6_bde7
BIN_OP_EQ_uxn_opcodes_h_l2040_c6_bde7 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2040_c6_bde7_left,
BIN_OP_EQ_uxn_opcodes_h_l2040_c6_bde7_right,
BIN_OP_EQ_uxn_opcodes_h_l2040_c6_bde7_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c1_356a
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c1_356a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c1_356a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c1_356a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c1_356a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c1_356a_return_output);

-- n16_MUX_uxn_opcodes_h_l2040_c2_3903
n16_MUX_uxn_opcodes_h_l2040_c2_3903 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2040_c2_3903_cond,
n16_MUX_uxn_opcodes_h_l2040_c2_3903_iftrue,
n16_MUX_uxn_opcodes_h_l2040_c2_3903_iffalse,
n16_MUX_uxn_opcodes_h_l2040_c2_3903_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2040_c2_3903
result_u8_value_MUX_uxn_opcodes_h_l2040_c2_3903 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2040_c2_3903_cond,
result_u8_value_MUX_uxn_opcodes_h_l2040_c2_3903_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2040_c2_3903_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2040_c2_3903_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2040_c2_3903
result_is_opc_done_MUX_uxn_opcodes_h_l2040_c2_3903 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2040_c2_3903_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2040_c2_3903_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2040_c2_3903_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2040_c2_3903_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c2_3903
result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c2_3903 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c2_3903_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c2_3903_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c2_3903_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c2_3903_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2040_c2_3903
result_is_stack_write_MUX_uxn_opcodes_h_l2040_c2_3903 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2040_c2_3903_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2040_c2_3903_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2040_c2_3903_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2040_c2_3903_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c2_3903
result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c2_3903 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c2_3903_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c2_3903_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c2_3903_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c2_3903_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c2_3903
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c2_3903 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c2_3903_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c2_3903_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c2_3903_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c2_3903_return_output);

-- t16_MUX_uxn_opcodes_h_l2040_c2_3903
t16_MUX_uxn_opcodes_h_l2040_c2_3903 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2040_c2_3903_cond,
t16_MUX_uxn_opcodes_h_l2040_c2_3903_iftrue,
t16_MUX_uxn_opcodes_h_l2040_c2_3903_iffalse,
t16_MUX_uxn_opcodes_h_l2040_c2_3903_return_output);

-- printf_uxn_opcodes_h_l2041_c3_ba67_uxn_opcodes_h_l2041_c3_ba67
printf_uxn_opcodes_h_l2041_c3_ba67_uxn_opcodes_h_l2041_c3_ba67 : entity work.printf_uxn_opcodes_h_l2041_c3_ba67_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2041_c3_ba67_uxn_opcodes_h_l2041_c3_ba67_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2045_c11_6a0b
BIN_OP_EQ_uxn_opcodes_h_l2045_c11_6a0b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2045_c11_6a0b_left,
BIN_OP_EQ_uxn_opcodes_h_l2045_c11_6a0b_right,
BIN_OP_EQ_uxn_opcodes_h_l2045_c11_6a0b_return_output);

-- n16_MUX_uxn_opcodes_h_l2045_c7_9dea
n16_MUX_uxn_opcodes_h_l2045_c7_9dea : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2045_c7_9dea_cond,
n16_MUX_uxn_opcodes_h_l2045_c7_9dea_iftrue,
n16_MUX_uxn_opcodes_h_l2045_c7_9dea_iffalse,
n16_MUX_uxn_opcodes_h_l2045_c7_9dea_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2045_c7_9dea
result_u8_value_MUX_uxn_opcodes_h_l2045_c7_9dea : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2045_c7_9dea_cond,
result_u8_value_MUX_uxn_opcodes_h_l2045_c7_9dea_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2045_c7_9dea_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2045_c7_9dea_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2045_c7_9dea
result_is_opc_done_MUX_uxn_opcodes_h_l2045_c7_9dea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2045_c7_9dea_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2045_c7_9dea_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2045_c7_9dea_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2045_c7_9dea_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2045_c7_9dea
result_sp_relative_shift_MUX_uxn_opcodes_h_l2045_c7_9dea : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2045_c7_9dea_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2045_c7_9dea_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2045_c7_9dea_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2045_c7_9dea_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2045_c7_9dea
result_is_stack_write_MUX_uxn_opcodes_h_l2045_c7_9dea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2045_c7_9dea_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2045_c7_9dea_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2045_c7_9dea_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2045_c7_9dea_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2045_c7_9dea
result_is_sp_shift_MUX_uxn_opcodes_h_l2045_c7_9dea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2045_c7_9dea_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2045_c7_9dea_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2045_c7_9dea_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2045_c7_9dea_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2045_c7_9dea
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2045_c7_9dea : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2045_c7_9dea_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2045_c7_9dea_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2045_c7_9dea_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2045_c7_9dea_return_output);

-- t16_MUX_uxn_opcodes_h_l2045_c7_9dea
t16_MUX_uxn_opcodes_h_l2045_c7_9dea : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2045_c7_9dea_cond,
t16_MUX_uxn_opcodes_h_l2045_c7_9dea_iftrue,
t16_MUX_uxn_opcodes_h_l2045_c7_9dea_iffalse,
t16_MUX_uxn_opcodes_h_l2045_c7_9dea_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2048_c11_b86e
BIN_OP_EQ_uxn_opcodes_h_l2048_c11_b86e : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2048_c11_b86e_left,
BIN_OP_EQ_uxn_opcodes_h_l2048_c11_b86e_right,
BIN_OP_EQ_uxn_opcodes_h_l2048_c11_b86e_return_output);

-- n16_MUX_uxn_opcodes_h_l2048_c7_73b4
n16_MUX_uxn_opcodes_h_l2048_c7_73b4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2048_c7_73b4_cond,
n16_MUX_uxn_opcodes_h_l2048_c7_73b4_iftrue,
n16_MUX_uxn_opcodes_h_l2048_c7_73b4_iffalse,
n16_MUX_uxn_opcodes_h_l2048_c7_73b4_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2048_c7_73b4
result_u8_value_MUX_uxn_opcodes_h_l2048_c7_73b4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2048_c7_73b4_cond,
result_u8_value_MUX_uxn_opcodes_h_l2048_c7_73b4_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2048_c7_73b4_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2048_c7_73b4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_73b4
result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_73b4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_73b4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_73b4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_73b4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_73b4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_73b4
result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_73b4 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_73b4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_73b4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_73b4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_73b4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_73b4
result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_73b4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_73b4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_73b4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_73b4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_73b4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_73b4
result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_73b4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_73b4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_73b4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_73b4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_73b4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_73b4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_73b4 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_73b4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_73b4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_73b4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_73b4_return_output);

-- t16_MUX_uxn_opcodes_h_l2048_c7_73b4
t16_MUX_uxn_opcodes_h_l2048_c7_73b4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2048_c7_73b4_cond,
t16_MUX_uxn_opcodes_h_l2048_c7_73b4_iftrue,
t16_MUX_uxn_opcodes_h_l2048_c7_73b4_iffalse,
t16_MUX_uxn_opcodes_h_l2048_c7_73b4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2053_c11_ff2a
BIN_OP_EQ_uxn_opcodes_h_l2053_c11_ff2a : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2053_c11_ff2a_left,
BIN_OP_EQ_uxn_opcodes_h_l2053_c11_ff2a_right,
BIN_OP_EQ_uxn_opcodes_h_l2053_c11_ff2a_return_output);

-- n16_MUX_uxn_opcodes_h_l2053_c7_90db
n16_MUX_uxn_opcodes_h_l2053_c7_90db : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2053_c7_90db_cond,
n16_MUX_uxn_opcodes_h_l2053_c7_90db_iftrue,
n16_MUX_uxn_opcodes_h_l2053_c7_90db_iffalse,
n16_MUX_uxn_opcodes_h_l2053_c7_90db_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2053_c7_90db
result_u8_value_MUX_uxn_opcodes_h_l2053_c7_90db : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2053_c7_90db_cond,
result_u8_value_MUX_uxn_opcodes_h_l2053_c7_90db_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2053_c7_90db_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2053_c7_90db_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2053_c7_90db
result_is_opc_done_MUX_uxn_opcodes_h_l2053_c7_90db : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2053_c7_90db_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2053_c7_90db_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2053_c7_90db_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2053_c7_90db_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2053_c7_90db
result_sp_relative_shift_MUX_uxn_opcodes_h_l2053_c7_90db : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2053_c7_90db_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2053_c7_90db_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2053_c7_90db_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2053_c7_90db_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2053_c7_90db
result_is_stack_write_MUX_uxn_opcodes_h_l2053_c7_90db : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2053_c7_90db_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2053_c7_90db_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2053_c7_90db_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2053_c7_90db_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2053_c7_90db
result_is_sp_shift_MUX_uxn_opcodes_h_l2053_c7_90db : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2053_c7_90db_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2053_c7_90db_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2053_c7_90db_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2053_c7_90db_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2053_c7_90db
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2053_c7_90db : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2053_c7_90db_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2053_c7_90db_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2053_c7_90db_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2053_c7_90db_return_output);

-- t16_MUX_uxn_opcodes_h_l2053_c7_90db
t16_MUX_uxn_opcodes_h_l2053_c7_90db : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2053_c7_90db_cond,
t16_MUX_uxn_opcodes_h_l2053_c7_90db_iftrue,
t16_MUX_uxn_opcodes_h_l2053_c7_90db_iffalse,
t16_MUX_uxn_opcodes_h_l2053_c7_90db_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2056_c11_7f43
BIN_OP_EQ_uxn_opcodes_h_l2056_c11_7f43 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2056_c11_7f43_left,
BIN_OP_EQ_uxn_opcodes_h_l2056_c11_7f43_right,
BIN_OP_EQ_uxn_opcodes_h_l2056_c11_7f43_return_output);

-- n16_MUX_uxn_opcodes_h_l2056_c7_3034
n16_MUX_uxn_opcodes_h_l2056_c7_3034 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2056_c7_3034_cond,
n16_MUX_uxn_opcodes_h_l2056_c7_3034_iftrue,
n16_MUX_uxn_opcodes_h_l2056_c7_3034_iffalse,
n16_MUX_uxn_opcodes_h_l2056_c7_3034_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2056_c7_3034
result_u8_value_MUX_uxn_opcodes_h_l2056_c7_3034 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2056_c7_3034_cond,
result_u8_value_MUX_uxn_opcodes_h_l2056_c7_3034_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2056_c7_3034_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2056_c7_3034_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2056_c7_3034
result_is_opc_done_MUX_uxn_opcodes_h_l2056_c7_3034 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2056_c7_3034_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2056_c7_3034_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2056_c7_3034_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2056_c7_3034_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2056_c7_3034
result_sp_relative_shift_MUX_uxn_opcodes_h_l2056_c7_3034 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2056_c7_3034_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2056_c7_3034_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2056_c7_3034_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2056_c7_3034_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2056_c7_3034
result_is_stack_write_MUX_uxn_opcodes_h_l2056_c7_3034 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2056_c7_3034_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2056_c7_3034_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2056_c7_3034_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2056_c7_3034_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2056_c7_3034
result_is_sp_shift_MUX_uxn_opcodes_h_l2056_c7_3034 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2056_c7_3034_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2056_c7_3034_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2056_c7_3034_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2056_c7_3034_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2056_c7_3034
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2056_c7_3034 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2056_c7_3034_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2056_c7_3034_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2056_c7_3034_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2056_c7_3034_return_output);

-- t16_MUX_uxn_opcodes_h_l2056_c7_3034
t16_MUX_uxn_opcodes_h_l2056_c7_3034 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2056_c7_3034_cond,
t16_MUX_uxn_opcodes_h_l2056_c7_3034_iftrue,
t16_MUX_uxn_opcodes_h_l2056_c7_3034_iffalse,
t16_MUX_uxn_opcodes_h_l2056_c7_3034_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2057_c3_d6ed
BIN_OP_OR_uxn_opcodes_h_l2057_c3_d6ed : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2057_c3_d6ed_left,
BIN_OP_OR_uxn_opcodes_h_l2057_c3_d6ed_right,
BIN_OP_OR_uxn_opcodes_h_l2057_c3_d6ed_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2060_c11_7df2
BIN_OP_EQ_uxn_opcodes_h_l2060_c11_7df2 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2060_c11_7df2_left,
BIN_OP_EQ_uxn_opcodes_h_l2060_c11_7df2_right,
BIN_OP_EQ_uxn_opcodes_h_l2060_c11_7df2_return_output);

-- n16_MUX_uxn_opcodes_h_l2060_c7_735e
n16_MUX_uxn_opcodes_h_l2060_c7_735e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2060_c7_735e_cond,
n16_MUX_uxn_opcodes_h_l2060_c7_735e_iftrue,
n16_MUX_uxn_opcodes_h_l2060_c7_735e_iffalse,
n16_MUX_uxn_opcodes_h_l2060_c7_735e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2060_c7_735e
result_u8_value_MUX_uxn_opcodes_h_l2060_c7_735e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2060_c7_735e_cond,
result_u8_value_MUX_uxn_opcodes_h_l2060_c7_735e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2060_c7_735e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2060_c7_735e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2060_c7_735e
result_is_opc_done_MUX_uxn_opcodes_h_l2060_c7_735e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2060_c7_735e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2060_c7_735e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2060_c7_735e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2060_c7_735e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2060_c7_735e
result_sp_relative_shift_MUX_uxn_opcodes_h_l2060_c7_735e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2060_c7_735e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2060_c7_735e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2060_c7_735e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2060_c7_735e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2060_c7_735e
result_is_stack_write_MUX_uxn_opcodes_h_l2060_c7_735e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2060_c7_735e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2060_c7_735e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2060_c7_735e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2060_c7_735e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2060_c7_735e
result_is_sp_shift_MUX_uxn_opcodes_h_l2060_c7_735e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2060_c7_735e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2060_c7_735e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2060_c7_735e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2060_c7_735e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2060_c7_735e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2060_c7_735e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2060_c7_735e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2060_c7_735e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2060_c7_735e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2060_c7_735e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2063_c11_0334
BIN_OP_EQ_uxn_opcodes_h_l2063_c11_0334 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2063_c11_0334_left,
BIN_OP_EQ_uxn_opcodes_h_l2063_c11_0334_right,
BIN_OP_EQ_uxn_opcodes_h_l2063_c11_0334_return_output);

-- n16_MUX_uxn_opcodes_h_l2063_c7_e0d8
n16_MUX_uxn_opcodes_h_l2063_c7_e0d8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2063_c7_e0d8_cond,
n16_MUX_uxn_opcodes_h_l2063_c7_e0d8_iftrue,
n16_MUX_uxn_opcodes_h_l2063_c7_e0d8_iffalse,
n16_MUX_uxn_opcodes_h_l2063_c7_e0d8_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2063_c7_e0d8
result_u8_value_MUX_uxn_opcodes_h_l2063_c7_e0d8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2063_c7_e0d8_cond,
result_u8_value_MUX_uxn_opcodes_h_l2063_c7_e0d8_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2063_c7_e0d8_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2063_c7_e0d8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2063_c7_e0d8
result_is_opc_done_MUX_uxn_opcodes_h_l2063_c7_e0d8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2063_c7_e0d8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2063_c7_e0d8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2063_c7_e0d8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2063_c7_e0d8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2063_c7_e0d8
result_sp_relative_shift_MUX_uxn_opcodes_h_l2063_c7_e0d8 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2063_c7_e0d8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2063_c7_e0d8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2063_c7_e0d8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2063_c7_e0d8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2063_c7_e0d8
result_is_stack_write_MUX_uxn_opcodes_h_l2063_c7_e0d8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2063_c7_e0d8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2063_c7_e0d8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2063_c7_e0d8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2063_c7_e0d8_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2063_c7_e0d8
result_is_sp_shift_MUX_uxn_opcodes_h_l2063_c7_e0d8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2063_c7_e0d8_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2063_c7_e0d8_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2063_c7_e0d8_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2063_c7_e0d8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2063_c7_e0d8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2063_c7_e0d8 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2063_c7_e0d8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2063_c7_e0d8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2063_c7_e0d8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2063_c7_e0d8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2068_c11_ae0d
BIN_OP_EQ_uxn_opcodes_h_l2068_c11_ae0d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2068_c11_ae0d_left,
BIN_OP_EQ_uxn_opcodes_h_l2068_c11_ae0d_right,
BIN_OP_EQ_uxn_opcodes_h_l2068_c11_ae0d_return_output);

-- n16_MUX_uxn_opcodes_h_l2068_c7_29e9
n16_MUX_uxn_opcodes_h_l2068_c7_29e9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2068_c7_29e9_cond,
n16_MUX_uxn_opcodes_h_l2068_c7_29e9_iftrue,
n16_MUX_uxn_opcodes_h_l2068_c7_29e9_iffalse,
n16_MUX_uxn_opcodes_h_l2068_c7_29e9_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2068_c7_29e9
result_u8_value_MUX_uxn_opcodes_h_l2068_c7_29e9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2068_c7_29e9_cond,
result_u8_value_MUX_uxn_opcodes_h_l2068_c7_29e9_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2068_c7_29e9_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2068_c7_29e9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2068_c7_29e9
result_is_opc_done_MUX_uxn_opcodes_h_l2068_c7_29e9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2068_c7_29e9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2068_c7_29e9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2068_c7_29e9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2068_c7_29e9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2068_c7_29e9
result_sp_relative_shift_MUX_uxn_opcodes_h_l2068_c7_29e9 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2068_c7_29e9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2068_c7_29e9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2068_c7_29e9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2068_c7_29e9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2068_c7_29e9
result_is_stack_write_MUX_uxn_opcodes_h_l2068_c7_29e9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2068_c7_29e9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2068_c7_29e9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2068_c7_29e9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2068_c7_29e9_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2068_c7_29e9
result_is_sp_shift_MUX_uxn_opcodes_h_l2068_c7_29e9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2068_c7_29e9_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2068_c7_29e9_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2068_c7_29e9_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2068_c7_29e9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2068_c7_29e9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2068_c7_29e9 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2068_c7_29e9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2068_c7_29e9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2068_c7_29e9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2068_c7_29e9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2071_c11_242c
BIN_OP_EQ_uxn_opcodes_h_l2071_c11_242c : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2071_c11_242c_left,
BIN_OP_EQ_uxn_opcodes_h_l2071_c11_242c_right,
BIN_OP_EQ_uxn_opcodes_h_l2071_c11_242c_return_output);

-- n16_MUX_uxn_opcodes_h_l2071_c7_c59d
n16_MUX_uxn_opcodes_h_l2071_c7_c59d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2071_c7_c59d_cond,
n16_MUX_uxn_opcodes_h_l2071_c7_c59d_iftrue,
n16_MUX_uxn_opcodes_h_l2071_c7_c59d_iffalse,
n16_MUX_uxn_opcodes_h_l2071_c7_c59d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2071_c7_c59d
result_u8_value_MUX_uxn_opcodes_h_l2071_c7_c59d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2071_c7_c59d_cond,
result_u8_value_MUX_uxn_opcodes_h_l2071_c7_c59d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2071_c7_c59d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2071_c7_c59d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2071_c7_c59d
result_is_opc_done_MUX_uxn_opcodes_h_l2071_c7_c59d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2071_c7_c59d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2071_c7_c59d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2071_c7_c59d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2071_c7_c59d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2071_c7_c59d
result_sp_relative_shift_MUX_uxn_opcodes_h_l2071_c7_c59d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2071_c7_c59d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2071_c7_c59d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2071_c7_c59d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2071_c7_c59d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2071_c7_c59d
result_is_stack_write_MUX_uxn_opcodes_h_l2071_c7_c59d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2071_c7_c59d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2071_c7_c59d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2071_c7_c59d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2071_c7_c59d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c7_c59d
result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c7_c59d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c7_c59d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c7_c59d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c7_c59d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c7_c59d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c7_c59d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c7_c59d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c7_c59d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c7_c59d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c7_c59d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c7_c59d_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2072_c3_f218
BIN_OP_OR_uxn_opcodes_h_l2072_c3_f218 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2072_c3_f218_left,
BIN_OP_OR_uxn_opcodes_h_l2072_c3_f218_right,
BIN_OP_OR_uxn_opcodes_h_l2072_c3_f218_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2074_c30_d29a
sp_relative_shift_uxn_opcodes_h_l2074_c30_d29a : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2074_c30_d29a_ins,
sp_relative_shift_uxn_opcodes_h_l2074_c30_d29a_x,
sp_relative_shift_uxn_opcodes_h_l2074_c30_d29a_y,
sp_relative_shift_uxn_opcodes_h_l2074_c30_d29a_return_output);

-- BIN_OP_LT_uxn_opcodes_h_l2077_c21_7de3
BIN_OP_LT_uxn_opcodes_h_l2077_c21_7de3 : entity work.BIN_OP_LT_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_LT_uxn_opcodes_h_l2077_c21_7de3_left,
BIN_OP_LT_uxn_opcodes_h_l2077_c21_7de3_right,
BIN_OP_LT_uxn_opcodes_h_l2077_c21_7de3_return_output);

-- MUX_uxn_opcodes_h_l2077_c21_9592
MUX_uxn_opcodes_h_l2077_c21_9592 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2077_c21_9592_cond,
MUX_uxn_opcodes_h_l2077_c21_9592_iftrue,
MUX_uxn_opcodes_h_l2077_c21_9592_iffalse,
MUX_uxn_opcodes_h_l2077_c21_9592_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2079_c11_f763
BIN_OP_EQ_uxn_opcodes_h_l2079_c11_f763 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2079_c11_f763_left,
BIN_OP_EQ_uxn_opcodes_h_l2079_c11_f763_right,
BIN_OP_EQ_uxn_opcodes_h_l2079_c11_f763_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2079_c7_be6b
result_is_stack_write_MUX_uxn_opcodes_h_l2079_c7_be6b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2079_c7_be6b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2079_c7_be6b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2079_c7_be6b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2079_c7_be6b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2079_c7_be6b
result_is_sp_shift_MUX_uxn_opcodes_h_l2079_c7_be6b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2079_c7_be6b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2079_c7_be6b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2079_c7_be6b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2079_c7_be6b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2079_c7_be6b
result_is_opc_done_MUX_uxn_opcodes_h_l2079_c7_be6b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2079_c7_be6b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2079_c7_be6b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2079_c7_be6b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2079_c7_be6b_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2065_l2050_DUPLICATE_e25c
CONST_SL_8_uint16_t_uxn_opcodes_h_l2065_l2050_DUPLICATE_e25c : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l2065_l2050_DUPLICATE_e25c_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l2065_l2050_DUPLICATE_e25c_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2040_c6_bde7_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c1_356a_return_output,
 n16_MUX_uxn_opcodes_h_l2040_c2_3903_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2040_c2_3903_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2040_c2_3903_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c2_3903_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2040_c2_3903_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c2_3903_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c2_3903_return_output,
 t16_MUX_uxn_opcodes_h_l2040_c2_3903_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2045_c11_6a0b_return_output,
 n16_MUX_uxn_opcodes_h_l2045_c7_9dea_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2045_c7_9dea_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2045_c7_9dea_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2045_c7_9dea_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2045_c7_9dea_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2045_c7_9dea_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2045_c7_9dea_return_output,
 t16_MUX_uxn_opcodes_h_l2045_c7_9dea_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2048_c11_b86e_return_output,
 n16_MUX_uxn_opcodes_h_l2048_c7_73b4_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2048_c7_73b4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_73b4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_73b4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_73b4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_73b4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_73b4_return_output,
 t16_MUX_uxn_opcodes_h_l2048_c7_73b4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2053_c11_ff2a_return_output,
 n16_MUX_uxn_opcodes_h_l2053_c7_90db_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2053_c7_90db_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2053_c7_90db_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2053_c7_90db_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2053_c7_90db_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2053_c7_90db_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2053_c7_90db_return_output,
 t16_MUX_uxn_opcodes_h_l2053_c7_90db_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2056_c11_7f43_return_output,
 n16_MUX_uxn_opcodes_h_l2056_c7_3034_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2056_c7_3034_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2056_c7_3034_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2056_c7_3034_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2056_c7_3034_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2056_c7_3034_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2056_c7_3034_return_output,
 t16_MUX_uxn_opcodes_h_l2056_c7_3034_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2057_c3_d6ed_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2060_c11_7df2_return_output,
 n16_MUX_uxn_opcodes_h_l2060_c7_735e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2060_c7_735e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2060_c7_735e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2060_c7_735e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2060_c7_735e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2060_c7_735e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2060_c7_735e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2063_c11_0334_return_output,
 n16_MUX_uxn_opcodes_h_l2063_c7_e0d8_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2063_c7_e0d8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2063_c7_e0d8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2063_c7_e0d8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2063_c7_e0d8_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2063_c7_e0d8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2063_c7_e0d8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2068_c11_ae0d_return_output,
 n16_MUX_uxn_opcodes_h_l2068_c7_29e9_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2068_c7_29e9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2068_c7_29e9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2068_c7_29e9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2068_c7_29e9_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2068_c7_29e9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2068_c7_29e9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2071_c11_242c_return_output,
 n16_MUX_uxn_opcodes_h_l2071_c7_c59d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2071_c7_c59d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2071_c7_c59d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2071_c7_c59d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2071_c7_c59d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c7_c59d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c7_c59d_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2072_c3_f218_return_output,
 sp_relative_shift_uxn_opcodes_h_l2074_c30_d29a_return_output,
 BIN_OP_LT_uxn_opcodes_h_l2077_c21_7de3_return_output,
 MUX_uxn_opcodes_h_l2077_c21_9592_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2079_c11_f763_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2079_c7_be6b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2079_c7_be6b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2079_c7_be6b_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l2065_l2050_DUPLICATE_e25c_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c6_bde7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c6_bde7_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c6_bde7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c1_356a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c1_356a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c1_356a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c1_356a_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2040_c2_3903_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2040_c2_3903_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2045_c7_9dea_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2040_c2_3903_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2040_c2_3903_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2040_c2_3903_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2040_c2_3903_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2045_c7_9dea_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2040_c2_3903_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2040_c2_3903_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2040_c2_3903_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2040_c2_3903_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2045_c7_9dea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2040_c2_3903_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2040_c2_3903_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c2_3903_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c2_3903_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2045_c7_9dea_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c2_3903_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c2_3903_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2040_c2_3903_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2040_c2_3903_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2045_c7_9dea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2040_c2_3903_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2040_c2_3903_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c2_3903_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c2_3903_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2045_c7_9dea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c2_3903_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c2_3903_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c2_3903_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2042_c3_a5b2 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c2_3903_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2045_c7_9dea_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c2_3903_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c2_3903_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2040_c2_3903_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2040_c2_3903_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2045_c7_9dea_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2040_c2_3903_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2040_c2_3903_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2041_c3_ba67_uxn_opcodes_h_l2041_c3_ba67_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2045_c11_6a0b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2045_c11_6a0b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2045_c11_6a0b_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2045_c7_9dea_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2045_c7_9dea_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2048_c7_73b4_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2045_c7_9dea_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2045_c7_9dea_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2045_c7_9dea_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2048_c7_73b4_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2045_c7_9dea_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2045_c7_9dea_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2045_c7_9dea_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_73b4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2045_c7_9dea_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2045_c7_9dea_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2045_c7_9dea_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_73b4_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2045_c7_9dea_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2045_c7_9dea_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2045_c7_9dea_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_73b4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2045_c7_9dea_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2045_c7_9dea_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2045_c7_9dea_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_73b4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2045_c7_9dea_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2045_c7_9dea_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2046_c3_854e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2045_c7_9dea_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_73b4_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2045_c7_9dea_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2045_c7_9dea_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2045_c7_9dea_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2048_c7_73b4_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2045_c7_9dea_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_b86e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_b86e_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_b86e_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2048_c7_73b4_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2048_c7_73b4_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2053_c7_90db_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2048_c7_73b4_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2048_c7_73b4_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2048_c7_73b4_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2053_c7_90db_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2048_c7_73b4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_73b4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_73b4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2053_c7_90db_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_73b4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_73b4_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_73b4_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2053_c7_90db_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_73b4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_73b4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_73b4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2053_c7_90db_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_73b4_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_73b4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_73b4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2053_c7_90db_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_73b4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_73b4_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2051_c3_a939 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_73b4_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2053_c7_90db_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_73b4_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2048_c7_73b4_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2048_c7_73b4_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2053_c7_90db_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2048_c7_73b4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2053_c11_ff2a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2053_c11_ff2a_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2053_c11_ff2a_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2053_c7_90db_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2053_c7_90db_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2056_c7_3034_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2053_c7_90db_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2053_c7_90db_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2053_c7_90db_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2056_c7_3034_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2053_c7_90db_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2053_c7_90db_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2053_c7_90db_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2056_c7_3034_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2053_c7_90db_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2053_c7_90db_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2053_c7_90db_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2056_c7_3034_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2053_c7_90db_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2053_c7_90db_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2053_c7_90db_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2056_c7_3034_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2053_c7_90db_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2053_c7_90db_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2053_c7_90db_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2056_c7_3034_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2053_c7_90db_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2053_c7_90db_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2054_c3_6943 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2053_c7_90db_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2056_c7_3034_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2053_c7_90db_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2053_c7_90db_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2053_c7_90db_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2056_c7_3034_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2053_c7_90db_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2056_c11_7f43_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2056_c11_7f43_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2056_c11_7f43_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2056_c7_3034_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2056_c7_3034_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2060_c7_735e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2056_c7_3034_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2056_c7_3034_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2056_c7_3034_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2060_c7_735e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2056_c7_3034_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2056_c7_3034_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2056_c7_3034_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2060_c7_735e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2056_c7_3034_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2056_c7_3034_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2056_c7_3034_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2060_c7_735e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2056_c7_3034_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2056_c7_3034_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2056_c7_3034_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2060_c7_735e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2056_c7_3034_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2056_c7_3034_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2056_c7_3034_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2060_c7_735e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2056_c7_3034_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2056_c7_3034_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2058_c3_43ec : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2056_c7_3034_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2060_c7_735e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2056_c7_3034_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2056_c7_3034_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2056_c7_3034_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2056_c7_3034_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2057_c3_d6ed_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2057_c3_d6ed_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2057_c3_d6ed_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2060_c11_7df2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2060_c11_7df2_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2060_c11_7df2_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2060_c7_735e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2060_c7_735e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2063_c7_e0d8_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2060_c7_735e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2060_c7_735e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2060_c7_735e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2063_c7_e0d8_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2060_c7_735e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2060_c7_735e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2060_c7_735e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2063_c7_e0d8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2060_c7_735e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2060_c7_735e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2060_c7_735e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2063_c7_e0d8_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2060_c7_735e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2060_c7_735e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2060_c7_735e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2063_c7_e0d8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2060_c7_735e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2060_c7_735e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2060_c7_735e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2063_c7_e0d8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2060_c7_735e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2060_c7_735e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2061_c3_ee9f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2060_c7_735e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2063_c7_e0d8_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2060_c7_735e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2063_c11_0334_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2063_c11_0334_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2063_c11_0334_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2063_c7_e0d8_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2063_c7_e0d8_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2068_c7_29e9_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2063_c7_e0d8_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2063_c7_e0d8_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2063_c7_e0d8_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2068_c7_29e9_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2063_c7_e0d8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2063_c7_e0d8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2063_c7_e0d8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2068_c7_29e9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2063_c7_e0d8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2063_c7_e0d8_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2063_c7_e0d8_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2068_c7_29e9_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2063_c7_e0d8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2063_c7_e0d8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2063_c7_e0d8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2068_c7_29e9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2063_c7_e0d8_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2063_c7_e0d8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2063_c7_e0d8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2068_c7_29e9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2063_c7_e0d8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2063_c7_e0d8_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2066_c3_7264 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2063_c7_e0d8_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2068_c7_29e9_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2063_c7_e0d8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2068_c11_ae0d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2068_c11_ae0d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2068_c11_ae0d_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2068_c7_29e9_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2068_c7_29e9_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2071_c7_c59d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2068_c7_29e9_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2068_c7_29e9_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2068_c7_29e9_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2071_c7_c59d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2068_c7_29e9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2068_c7_29e9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2068_c7_29e9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2071_c7_c59d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2068_c7_29e9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2068_c7_29e9_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2068_c7_29e9_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2071_c7_c59d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2068_c7_29e9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2068_c7_29e9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2068_c7_29e9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2071_c7_c59d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2068_c7_29e9_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2068_c7_29e9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2068_c7_29e9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c7_c59d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2068_c7_29e9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2068_c7_29e9_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2069_c3_f893 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2068_c7_29e9_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c7_c59d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2068_c7_29e9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2071_c11_242c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2071_c11_242c_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2071_c11_242c_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2071_c7_c59d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2071_c7_c59d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2071_c7_c59d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2071_c7_c59d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2071_c7_c59d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2071_c7_c59d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2071_c7_c59d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2071_c7_c59d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2079_c7_be6b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2071_c7_c59d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2071_c7_c59d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2071_c7_c59d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2071_c7_c59d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2071_c7_c59d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2071_c7_c59d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2079_c7_be6b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2071_c7_c59d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c7_c59d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c7_c59d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2079_c7_be6b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c7_c59d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c7_c59d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2076_c3_69c7 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c7_c59d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2071_c7_c59d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c7_c59d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2072_c3_f218_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2072_c3_f218_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2072_c3_f218_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2074_c30_d29a_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2074_c30_d29a_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2074_c30_d29a_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2074_c30_d29a_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2077_c21_9592_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2077_c21_9592_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2077_c21_9592_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_LT_uxn_opcodes_h_l2077_c21_7de3_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_LT_uxn_opcodes_h_l2077_c21_7de3_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_LT_uxn_opcodes_h_l2077_c21_7de3_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2077_c21_9592_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2079_c11_f763_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2079_c11_f763_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2079_c11_f763_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2079_c7_be6b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2079_c7_be6b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2079_c7_be6b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2079_c7_be6b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2079_c7_be6b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2079_c7_be6b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2079_c7_be6b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2079_c7_be6b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2079_c7_be6b_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2048_l2071_l2045_l2068_l2040_l2063_l2060_l2056_l2053_DUPLICATE_7efc_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2048_l2071_l2045_l2068_l2040_l2063_l2060_l2056_l2053_DUPLICATE_e713_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2048_l2045_l2068_l2040_l2063_l2060_l2056_l2053_l2079_DUPLICATE_6017_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2048_l2045_l2068_l2040_l2063_l2060_l2056_l2053_l2079_DUPLICATE_22ea_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2048_l2071_l2045_l2068_l2063_l2060_l2056_l2053_l2079_DUPLICATE_c97b_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2049_l2072_l2057_l2064_DUPLICATE_8a65_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2065_l2050_DUPLICATE_e25c_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2065_l2050_DUPLICATE_e25c_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_25e8_uxn_opcodes_h_l2036_l2085_DUPLICATE_14d5_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2063_c11_0334_right := to_unsigned(6, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2071_c7_c59d_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2056_c11_7f43_right := to_unsigned(4, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c7_c59d_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2054_c3_6943 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2053_c7_90db_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2054_c3_6943;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2061_c3_ee9f := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2060_c7_735e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2061_c3_ee9f;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2053_c11_ff2a_right := to_unsigned(3, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l2074_c30_d29a_y := resize(to_signed(-3, 3), 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2051_c3_a939 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_73b4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2051_c3_a939;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2079_c11_f763_right := to_unsigned(9, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2046_c3_854e := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2045_c7_9dea_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2046_c3_854e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2045_c11_6a0b_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2079_c7_be6b_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l2077_c21_9592_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2071_c11_242c_right := to_unsigned(8, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2066_c3_7264 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2063_c7_e0d8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2066_c3_7264;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2042_c3_a5b2 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c2_3903_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2042_c3_a5b2;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2069_c3_f893 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2068_c7_29e9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2069_c3_f893;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c1_356a_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2060_c11_7df2_right := to_unsigned(5, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2079_c7_be6b_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c6_bde7_right := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2079_c7_be6b_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2040_c2_3903_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l2077_c21_9592_iftrue := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2076_c3_69c7 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c7_c59d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2076_c3_69c7;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2058_c3_43ec := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2056_c7_3034_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2058_c3_43ec;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_b86e_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2068_c11_ae0d_right := to_unsigned(7, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l2074_c30_d29a_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c1_356a_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l2074_c30_d29a_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2072_c3_f218_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2040_c2_3903_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2045_c7_9dea_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2048_c7_73b4_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2053_c7_90db_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2056_c7_3034_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2060_c7_735e_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2068_c7_29e9_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2071_c7_c59d_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c6_bde7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2045_c11_6a0b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_b86e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2053_c11_ff2a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2056_c11_7f43_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2060_c11_7df2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2063_c11_0334_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2068_c11_ae0d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2071_c11_242c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2079_c11_f763_left := VAR_phase;
     VAR_BIN_OP_LT_uxn_opcodes_h_l2077_c21_7de3_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2057_c3_d6ed_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2040_c2_3903_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2045_c7_9dea_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2053_c7_90db_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2056_c7_3034_iffalse := t16;
     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2071_c7_c59d] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2071_c7_c59d_return_output := result.stack_address_sp_offset;

     -- sp_relative_shift[uxn_opcodes_h_l2074_c30_d29a] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2074_c30_d29a_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2074_c30_d29a_ins;
     sp_relative_shift_uxn_opcodes_h_l2074_c30_d29a_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2074_c30_d29a_x;
     sp_relative_shift_uxn_opcodes_h_l2074_c30_d29a_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2074_c30_d29a_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2074_c30_d29a_return_output := sp_relative_shift_uxn_opcodes_h_l2074_c30_d29a_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2048_l2045_l2068_l2040_l2063_l2060_l2056_l2053_l2079_DUPLICATE_6017 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2048_l2045_l2068_l2040_l2063_l2060_l2056_l2053_l2079_DUPLICATE_6017_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2040_c6_bde7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2040_c6_bde7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c6_bde7_left;
     BIN_OP_EQ_uxn_opcodes_h_l2040_c6_bde7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c6_bde7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c6_bde7_return_output := BIN_OP_EQ_uxn_opcodes_h_l2040_c6_bde7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2063_c11_0334] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2063_c11_0334_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2063_c11_0334_left;
     BIN_OP_EQ_uxn_opcodes_h_l2063_c11_0334_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2063_c11_0334_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2063_c11_0334_return_output := BIN_OP_EQ_uxn_opcodes_h_l2063_c11_0334_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2048_l2045_l2068_l2040_l2063_l2060_l2056_l2053_l2079_DUPLICATE_22ea LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2048_l2045_l2068_l2040_l2063_l2060_l2056_l2053_l2079_DUPLICATE_22ea_return_output := result.is_sp_shift;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2049_l2072_l2057_l2064_DUPLICATE_8a65 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2049_l2072_l2057_l2064_DUPLICATE_8a65_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l2079_c11_f763] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2079_c11_f763_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2079_c11_f763_left;
     BIN_OP_EQ_uxn_opcodes_h_l2079_c11_f763_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2079_c11_f763_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2079_c11_f763_return_output := BIN_OP_EQ_uxn_opcodes_h_l2079_c11_f763_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2056_c11_7f43] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2056_c11_7f43_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2056_c11_7f43_left;
     BIN_OP_EQ_uxn_opcodes_h_l2056_c11_7f43_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2056_c11_7f43_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2056_c11_7f43_return_output := BIN_OP_EQ_uxn_opcodes_h_l2056_c11_7f43_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2048_l2071_l2045_l2068_l2040_l2063_l2060_l2056_l2053_DUPLICATE_e713 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2048_l2071_l2045_l2068_l2040_l2063_l2060_l2056_l2053_DUPLICATE_e713_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2048_c11_b86e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2048_c11_b86e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_b86e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2048_c11_b86e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_b86e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_b86e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2048_c11_b86e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2053_c11_ff2a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2053_c11_ff2a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2053_c11_ff2a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2053_c11_ff2a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2053_c11_ff2a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2053_c11_ff2a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2053_c11_ff2a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2068_c11_ae0d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2068_c11_ae0d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2068_c11_ae0d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2068_c11_ae0d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2068_c11_ae0d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2068_c11_ae0d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2068_c11_ae0d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2060_c11_7df2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2060_c11_7df2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2060_c11_7df2_left;
     BIN_OP_EQ_uxn_opcodes_h_l2060_c11_7df2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2060_c11_7df2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2060_c11_7df2_return_output := BIN_OP_EQ_uxn_opcodes_h_l2060_c11_7df2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2045_c11_6a0b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2045_c11_6a0b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2045_c11_6a0b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2045_c11_6a0b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2045_c11_6a0b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2045_c11_6a0b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2045_c11_6a0b_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2048_l2071_l2045_l2068_l2040_l2063_l2060_l2056_l2053_DUPLICATE_7efc LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2048_l2071_l2045_l2068_l2040_l2063_l2060_l2056_l2053_DUPLICATE_7efc_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2071_c11_242c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2071_c11_242c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2071_c11_242c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2071_c11_242c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2071_c11_242c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2071_c11_242c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2071_c11_242c_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2048_l2071_l2045_l2068_l2063_l2060_l2056_l2053_l2079_DUPLICATE_c97b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2048_l2071_l2045_l2068_l2063_l2060_l2056_l2053_l2079_DUPLICATE_c97b_return_output := result.is_opc_done;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c1_356a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c6_bde7_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2040_c2_3903_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c6_bde7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2040_c2_3903_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c6_bde7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c2_3903_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c6_bde7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2040_c2_3903_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c6_bde7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c2_3903_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c6_bde7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c2_3903_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c6_bde7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2040_c2_3903_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c6_bde7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2040_c2_3903_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c6_bde7_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2045_c7_9dea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2045_c11_6a0b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2045_c7_9dea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2045_c11_6a0b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2045_c7_9dea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2045_c11_6a0b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2045_c7_9dea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2045_c11_6a0b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2045_c7_9dea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2045_c11_6a0b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2045_c7_9dea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2045_c11_6a0b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2045_c7_9dea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2045_c11_6a0b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2045_c7_9dea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2045_c11_6a0b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2048_c7_73b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_b86e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_73b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_b86e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_73b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_b86e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_73b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_b86e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_73b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_b86e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_73b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_b86e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2048_c7_73b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_b86e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2048_c7_73b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_b86e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2053_c7_90db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2053_c11_ff2a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2053_c7_90db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2053_c11_ff2a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2053_c7_90db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2053_c11_ff2a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2053_c7_90db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2053_c11_ff2a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2053_c7_90db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2053_c11_ff2a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2053_c7_90db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2053_c11_ff2a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2053_c7_90db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2053_c11_ff2a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2053_c7_90db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2053_c11_ff2a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2056_c7_3034_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2056_c11_7f43_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2056_c7_3034_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2056_c11_7f43_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2056_c7_3034_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2056_c11_7f43_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2056_c7_3034_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2056_c11_7f43_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2056_c7_3034_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2056_c11_7f43_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2056_c7_3034_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2056_c11_7f43_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2056_c7_3034_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2056_c11_7f43_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2056_c7_3034_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2056_c11_7f43_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2060_c7_735e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2060_c11_7df2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2060_c7_735e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2060_c11_7df2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2060_c7_735e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2060_c11_7df2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2060_c7_735e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2060_c11_7df2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2060_c7_735e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2060_c11_7df2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2060_c7_735e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2060_c11_7df2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2060_c7_735e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2060_c11_7df2_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2063_c7_e0d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2063_c11_0334_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2063_c7_e0d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2063_c11_0334_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2063_c7_e0d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2063_c11_0334_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2063_c7_e0d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2063_c11_0334_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2063_c7_e0d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2063_c11_0334_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2063_c7_e0d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2063_c11_0334_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2063_c7_e0d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2063_c11_0334_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2068_c7_29e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2068_c11_ae0d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2068_c7_29e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2068_c11_ae0d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2068_c7_29e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2068_c11_ae0d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2068_c7_29e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2068_c11_ae0d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2068_c7_29e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2068_c11_ae0d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2068_c7_29e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2068_c11_ae0d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2068_c7_29e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2068_c11_ae0d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2071_c7_c59d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2071_c11_242c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2071_c7_c59d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2071_c11_242c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c7_c59d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2071_c11_242c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2071_c7_c59d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2071_c11_242c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2071_c7_c59d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2071_c11_242c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c7_c59d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2071_c11_242c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2071_c7_c59d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2071_c11_242c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2079_c7_be6b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2079_c11_f763_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2079_c7_be6b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2079_c11_f763_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2079_c7_be6b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2079_c11_f763_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2057_c3_d6ed_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2049_l2072_l2057_l2064_DUPLICATE_8a65_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2072_c3_f218_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2049_l2072_l2057_l2064_DUPLICATE_8a65_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2065_l2050_DUPLICATE_e25c_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2049_l2072_l2057_l2064_DUPLICATE_8a65_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c2_3903_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2048_l2071_l2045_l2068_l2040_l2063_l2060_l2056_l2053_DUPLICATE_e713_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2045_c7_9dea_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2048_l2071_l2045_l2068_l2040_l2063_l2060_l2056_l2053_DUPLICATE_e713_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_73b4_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2048_l2071_l2045_l2068_l2040_l2063_l2060_l2056_l2053_DUPLICATE_e713_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2053_c7_90db_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2048_l2071_l2045_l2068_l2040_l2063_l2060_l2056_l2053_DUPLICATE_e713_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2056_c7_3034_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2048_l2071_l2045_l2068_l2040_l2063_l2060_l2056_l2053_DUPLICATE_e713_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2060_c7_735e_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2048_l2071_l2045_l2068_l2040_l2063_l2060_l2056_l2053_DUPLICATE_e713_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2063_c7_e0d8_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2048_l2071_l2045_l2068_l2040_l2063_l2060_l2056_l2053_DUPLICATE_e713_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2068_c7_29e9_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2048_l2071_l2045_l2068_l2040_l2063_l2060_l2056_l2053_DUPLICATE_e713_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2071_c7_c59d_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2048_l2071_l2045_l2068_l2040_l2063_l2060_l2056_l2053_DUPLICATE_e713_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2045_c7_9dea_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2048_l2071_l2045_l2068_l2063_l2060_l2056_l2053_l2079_DUPLICATE_c97b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_73b4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2048_l2071_l2045_l2068_l2063_l2060_l2056_l2053_l2079_DUPLICATE_c97b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2053_c7_90db_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2048_l2071_l2045_l2068_l2063_l2060_l2056_l2053_l2079_DUPLICATE_c97b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2056_c7_3034_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2048_l2071_l2045_l2068_l2063_l2060_l2056_l2053_l2079_DUPLICATE_c97b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2060_c7_735e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2048_l2071_l2045_l2068_l2063_l2060_l2056_l2053_l2079_DUPLICATE_c97b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2063_c7_e0d8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2048_l2071_l2045_l2068_l2063_l2060_l2056_l2053_l2079_DUPLICATE_c97b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2068_c7_29e9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2048_l2071_l2045_l2068_l2063_l2060_l2056_l2053_l2079_DUPLICATE_c97b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2071_c7_c59d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2048_l2071_l2045_l2068_l2063_l2060_l2056_l2053_l2079_DUPLICATE_c97b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2079_c7_be6b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2048_l2071_l2045_l2068_l2063_l2060_l2056_l2053_l2079_DUPLICATE_c97b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c2_3903_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2048_l2045_l2068_l2040_l2063_l2060_l2056_l2053_l2079_DUPLICATE_22ea_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2045_c7_9dea_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2048_l2045_l2068_l2040_l2063_l2060_l2056_l2053_l2079_DUPLICATE_22ea_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_73b4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2048_l2045_l2068_l2040_l2063_l2060_l2056_l2053_l2079_DUPLICATE_22ea_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2053_c7_90db_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2048_l2045_l2068_l2040_l2063_l2060_l2056_l2053_l2079_DUPLICATE_22ea_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2056_c7_3034_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2048_l2045_l2068_l2040_l2063_l2060_l2056_l2053_l2079_DUPLICATE_22ea_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2060_c7_735e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2048_l2045_l2068_l2040_l2063_l2060_l2056_l2053_l2079_DUPLICATE_22ea_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2063_c7_e0d8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2048_l2045_l2068_l2040_l2063_l2060_l2056_l2053_l2079_DUPLICATE_22ea_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2068_c7_29e9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2048_l2045_l2068_l2040_l2063_l2060_l2056_l2053_l2079_DUPLICATE_22ea_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2079_c7_be6b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2048_l2045_l2068_l2040_l2063_l2060_l2056_l2053_l2079_DUPLICATE_22ea_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2040_c2_3903_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2048_l2045_l2068_l2040_l2063_l2060_l2056_l2053_l2079_DUPLICATE_6017_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2045_c7_9dea_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2048_l2045_l2068_l2040_l2063_l2060_l2056_l2053_l2079_DUPLICATE_6017_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_73b4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2048_l2045_l2068_l2040_l2063_l2060_l2056_l2053_l2079_DUPLICATE_6017_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2053_c7_90db_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2048_l2045_l2068_l2040_l2063_l2060_l2056_l2053_l2079_DUPLICATE_6017_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2056_c7_3034_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2048_l2045_l2068_l2040_l2063_l2060_l2056_l2053_l2079_DUPLICATE_6017_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2060_c7_735e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2048_l2045_l2068_l2040_l2063_l2060_l2056_l2053_l2079_DUPLICATE_6017_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2063_c7_e0d8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2048_l2045_l2068_l2040_l2063_l2060_l2056_l2053_l2079_DUPLICATE_6017_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2068_c7_29e9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2048_l2045_l2068_l2040_l2063_l2060_l2056_l2053_l2079_DUPLICATE_6017_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2079_c7_be6b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2048_l2045_l2068_l2040_l2063_l2060_l2056_l2053_l2079_DUPLICATE_6017_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2040_c2_3903_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2048_l2071_l2045_l2068_l2040_l2063_l2060_l2056_l2053_DUPLICATE_7efc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2045_c7_9dea_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2048_l2071_l2045_l2068_l2040_l2063_l2060_l2056_l2053_DUPLICATE_7efc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2048_c7_73b4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2048_l2071_l2045_l2068_l2040_l2063_l2060_l2056_l2053_DUPLICATE_7efc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2053_c7_90db_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2048_l2071_l2045_l2068_l2040_l2063_l2060_l2056_l2053_DUPLICATE_7efc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2056_c7_3034_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2048_l2071_l2045_l2068_l2040_l2063_l2060_l2056_l2053_DUPLICATE_7efc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2060_c7_735e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2048_l2071_l2045_l2068_l2040_l2063_l2060_l2056_l2053_DUPLICATE_7efc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2063_c7_e0d8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2048_l2071_l2045_l2068_l2040_l2063_l2060_l2056_l2053_DUPLICATE_7efc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2068_c7_29e9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2048_l2071_l2045_l2068_l2040_l2063_l2060_l2056_l2053_DUPLICATE_7efc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2071_c7_c59d_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2048_l2071_l2045_l2068_l2040_l2063_l2060_l2056_l2053_DUPLICATE_7efc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c7_c59d_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2071_c7_c59d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2071_c7_c59d_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2074_c30_d29a_return_output;
     -- BIN_OP_OR[uxn_opcodes_h_l2072_c3_f218] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2072_c3_f218_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2072_c3_f218_left;
     BIN_OP_OR_uxn_opcodes_h_l2072_c3_f218_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2072_c3_f218_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2072_c3_f218_return_output := BIN_OP_OR_uxn_opcodes_h_l2072_c3_f218_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2057_c3_d6ed] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2057_c3_d6ed_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2057_c3_d6ed_left;
     BIN_OP_OR_uxn_opcodes_h_l2057_c3_d6ed_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2057_c3_d6ed_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2057_c3_d6ed_return_output := BIN_OP_OR_uxn_opcodes_h_l2057_c3_d6ed_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2071_c7_c59d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2071_c7_c59d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2071_c7_c59d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2071_c7_c59d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2071_c7_c59d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2071_c7_c59d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2071_c7_c59d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2071_c7_c59d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2071_c7_c59d_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l2065_l2050_DUPLICATE_e25c LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l2065_l2050_DUPLICATE_e25c_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2065_l2050_DUPLICATE_e25c_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2065_l2050_DUPLICATE_e25c_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l2065_l2050_DUPLICATE_e25c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2079_c7_be6b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2079_c7_be6b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2079_c7_be6b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2079_c7_be6b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2079_c7_be6b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2079_c7_be6b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2079_c7_be6b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2079_c7_be6b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2079_c7_be6b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2071_c7_c59d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c7_c59d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c7_c59d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c7_c59d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c7_c59d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c7_c59d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c7_c59d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c7_c59d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c7_c59d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2079_c7_be6b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2079_c7_be6b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2079_c7_be6b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2079_c7_be6b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2079_c7_be6b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2079_c7_be6b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2079_c7_be6b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2079_c7_be6b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2079_c7_be6b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2079_c7_be6b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2079_c7_be6b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2079_c7_be6b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2079_c7_be6b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2079_c7_be6b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2079_c7_be6b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2079_c7_be6b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2079_c7_be6b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2079_c7_be6b_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2040_c1_356a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c1_356a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c1_356a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c1_356a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c1_356a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c1_356a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c1_356a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c1_356a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c1_356a_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l2056_c7_3034_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2057_c3_d6ed_return_output;
     VAR_BIN_OP_LT_uxn_opcodes_h_l2077_c21_7de3_left := VAR_BIN_OP_OR_uxn_opcodes_h_l2072_c3_f218_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2071_c7_c59d_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2072_c3_f218_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2063_c7_e0d8_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2065_l2050_DUPLICATE_e25c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2048_c7_73b4_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2065_l2050_DUPLICATE_e25c_return_output;
     VAR_printf_uxn_opcodes_h_l2041_c3_ba67_uxn_opcodes_h_l2041_c3_ba67_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2040_c1_356a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2071_c7_c59d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2079_c7_be6b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c7_c59d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2079_c7_be6b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2071_c7_c59d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2079_c7_be6b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2068_c7_29e9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2071_c7_c59d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2068_c7_29e9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c7_c59d_return_output;
     -- BIN_OP_LT[uxn_opcodes_h_l2077_c21_7de3] LATENCY=0
     -- Inputs
     BIN_OP_LT_uxn_opcodes_h_l2077_c21_7de3_left <= VAR_BIN_OP_LT_uxn_opcodes_h_l2077_c21_7de3_left;
     BIN_OP_LT_uxn_opcodes_h_l2077_c21_7de3_right <= VAR_BIN_OP_LT_uxn_opcodes_h_l2077_c21_7de3_right;
     -- Outputs
     VAR_BIN_OP_LT_uxn_opcodes_h_l2077_c21_7de3_return_output := BIN_OP_LT_uxn_opcodes_h_l2077_c21_7de3_return_output;

     -- n16_MUX[uxn_opcodes_h_l2071_c7_c59d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2071_c7_c59d_cond <= VAR_n16_MUX_uxn_opcodes_h_l2071_c7_c59d_cond;
     n16_MUX_uxn_opcodes_h_l2071_c7_c59d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2071_c7_c59d_iftrue;
     n16_MUX_uxn_opcodes_h_l2071_c7_c59d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2071_c7_c59d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2071_c7_c59d_return_output := n16_MUX_uxn_opcodes_h_l2071_c7_c59d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2071_c7_c59d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2071_c7_c59d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2071_c7_c59d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2071_c7_c59d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2071_c7_c59d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2071_c7_c59d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2071_c7_c59d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2071_c7_c59d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2071_c7_c59d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2071_c7_c59d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2071_c7_c59d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2071_c7_c59d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2071_c7_c59d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2071_c7_c59d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2071_c7_c59d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2071_c7_c59d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2071_c7_c59d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2071_c7_c59d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2071_c7_c59d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c7_c59d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c7_c59d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c7_c59d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c7_c59d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c7_c59d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c7_c59d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c7_c59d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c7_c59d_return_output;

     -- printf_uxn_opcodes_h_l2041_c3_ba67[uxn_opcodes_h_l2041_c3_ba67] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2041_c3_ba67_uxn_opcodes_h_l2041_c3_ba67_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2041_c3_ba67_uxn_opcodes_h_l2041_c3_ba67_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- t16_MUX[uxn_opcodes_h_l2056_c7_3034] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2056_c7_3034_cond <= VAR_t16_MUX_uxn_opcodes_h_l2056_c7_3034_cond;
     t16_MUX_uxn_opcodes_h_l2056_c7_3034_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2056_c7_3034_iftrue;
     t16_MUX_uxn_opcodes_h_l2056_c7_3034_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2056_c7_3034_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2056_c7_3034_return_output := t16_MUX_uxn_opcodes_h_l2056_c7_3034_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2068_c7_29e9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2068_c7_29e9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2068_c7_29e9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2068_c7_29e9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2068_c7_29e9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2068_c7_29e9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2068_c7_29e9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2068_c7_29e9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2068_c7_29e9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2068_c7_29e9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2068_c7_29e9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2068_c7_29e9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2068_c7_29e9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2068_c7_29e9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2068_c7_29e9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2068_c7_29e9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2068_c7_29e9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2068_c7_29e9_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_opcodes_h_l2077_c21_9592_cond := VAR_BIN_OP_LT_uxn_opcodes_h_l2077_c21_7de3_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2068_c7_29e9_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2071_c7_c59d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2068_c7_29e9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2071_c7_c59d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2068_c7_29e9_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c7_c59d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2068_c7_29e9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2071_c7_c59d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2063_c7_e0d8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2068_c7_29e9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2063_c7_e0d8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2068_c7_29e9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2053_c7_90db_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2056_c7_3034_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2068_c7_29e9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2068_c7_29e9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2068_c7_29e9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2068_c7_29e9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2068_c7_29e9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2068_c7_29e9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2068_c7_29e9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2068_c7_29e9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2068_c7_29e9_return_output;

     -- MUX[uxn_opcodes_h_l2077_c21_9592] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2077_c21_9592_cond <= VAR_MUX_uxn_opcodes_h_l2077_c21_9592_cond;
     MUX_uxn_opcodes_h_l2077_c21_9592_iftrue <= VAR_MUX_uxn_opcodes_h_l2077_c21_9592_iftrue;
     MUX_uxn_opcodes_h_l2077_c21_9592_iffalse <= VAR_MUX_uxn_opcodes_h_l2077_c21_9592_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2077_c21_9592_return_output := MUX_uxn_opcodes_h_l2077_c21_9592_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2063_c7_e0d8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2063_c7_e0d8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2063_c7_e0d8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2063_c7_e0d8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2063_c7_e0d8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2063_c7_e0d8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2063_c7_e0d8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2063_c7_e0d8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2063_c7_e0d8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2068_c7_29e9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2068_c7_29e9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2068_c7_29e9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2068_c7_29e9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2068_c7_29e9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2068_c7_29e9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2068_c7_29e9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2068_c7_29e9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2068_c7_29e9_return_output;

     -- t16_MUX[uxn_opcodes_h_l2053_c7_90db] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2053_c7_90db_cond <= VAR_t16_MUX_uxn_opcodes_h_l2053_c7_90db_cond;
     t16_MUX_uxn_opcodes_h_l2053_c7_90db_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2053_c7_90db_iftrue;
     t16_MUX_uxn_opcodes_h_l2053_c7_90db_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2053_c7_90db_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2053_c7_90db_return_output := t16_MUX_uxn_opcodes_h_l2053_c7_90db_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2063_c7_e0d8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2063_c7_e0d8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2063_c7_e0d8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2063_c7_e0d8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2063_c7_e0d8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2063_c7_e0d8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2063_c7_e0d8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2063_c7_e0d8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2063_c7_e0d8_return_output;

     -- n16_MUX[uxn_opcodes_h_l2068_c7_29e9] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2068_c7_29e9_cond <= VAR_n16_MUX_uxn_opcodes_h_l2068_c7_29e9_cond;
     n16_MUX_uxn_opcodes_h_l2068_c7_29e9_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2068_c7_29e9_iftrue;
     n16_MUX_uxn_opcodes_h_l2068_c7_29e9_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2068_c7_29e9_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2068_c7_29e9_return_output := n16_MUX_uxn_opcodes_h_l2068_c7_29e9_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2068_c7_29e9] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2068_c7_29e9_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2068_c7_29e9_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2068_c7_29e9_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2068_c7_29e9_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2068_c7_29e9_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2068_c7_29e9_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2068_c7_29e9_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2068_c7_29e9_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2071_c7_c59d_iftrue := VAR_MUX_uxn_opcodes_h_l2077_c21_9592_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2063_c7_e0d8_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2068_c7_29e9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2063_c7_e0d8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2068_c7_29e9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2063_c7_e0d8_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2068_c7_29e9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2063_c7_e0d8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2068_c7_29e9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2060_c7_735e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2063_c7_e0d8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2060_c7_735e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2063_c7_e0d8_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2048_c7_73b4_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2053_c7_90db_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2060_c7_735e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2060_c7_735e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2060_c7_735e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2060_c7_735e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2060_c7_735e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2060_c7_735e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2060_c7_735e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2060_c7_735e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2060_c7_735e_return_output;

     -- t16_MUX[uxn_opcodes_h_l2048_c7_73b4] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2048_c7_73b4_cond <= VAR_t16_MUX_uxn_opcodes_h_l2048_c7_73b4_cond;
     t16_MUX_uxn_opcodes_h_l2048_c7_73b4_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2048_c7_73b4_iftrue;
     t16_MUX_uxn_opcodes_h_l2048_c7_73b4_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2048_c7_73b4_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2048_c7_73b4_return_output := t16_MUX_uxn_opcodes_h_l2048_c7_73b4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2063_c7_e0d8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2063_c7_e0d8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2063_c7_e0d8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2063_c7_e0d8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2063_c7_e0d8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2063_c7_e0d8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2063_c7_e0d8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2063_c7_e0d8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2063_c7_e0d8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2063_c7_e0d8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2063_c7_e0d8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2063_c7_e0d8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2063_c7_e0d8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2063_c7_e0d8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2063_c7_e0d8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2063_c7_e0d8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2063_c7_e0d8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2063_c7_e0d8_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2060_c7_735e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2060_c7_735e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2060_c7_735e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2060_c7_735e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2060_c7_735e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2060_c7_735e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2060_c7_735e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2060_c7_735e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2060_c7_735e_return_output;

     -- n16_MUX[uxn_opcodes_h_l2063_c7_e0d8] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2063_c7_e0d8_cond <= VAR_n16_MUX_uxn_opcodes_h_l2063_c7_e0d8_cond;
     n16_MUX_uxn_opcodes_h_l2063_c7_e0d8_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2063_c7_e0d8_iftrue;
     n16_MUX_uxn_opcodes_h_l2063_c7_e0d8_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2063_c7_e0d8_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2063_c7_e0d8_return_output := n16_MUX_uxn_opcodes_h_l2063_c7_e0d8_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2071_c7_c59d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2071_c7_c59d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2071_c7_c59d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2071_c7_c59d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2071_c7_c59d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2071_c7_c59d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2071_c7_c59d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2071_c7_c59d_return_output := result_u8_value_MUX_uxn_opcodes_h_l2071_c7_c59d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2063_c7_e0d8] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2063_c7_e0d8_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2063_c7_e0d8_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2063_c7_e0d8_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2063_c7_e0d8_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2063_c7_e0d8_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2063_c7_e0d8_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2063_c7_e0d8_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2063_c7_e0d8_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l2060_c7_735e_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2063_c7_e0d8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2060_c7_735e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2063_c7_e0d8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2060_c7_735e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2063_c7_e0d8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2060_c7_735e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2063_c7_e0d8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2056_c7_3034_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2060_c7_735e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2056_c7_3034_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2060_c7_735e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2068_c7_29e9_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2071_c7_c59d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2045_c7_9dea_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2048_c7_73b4_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2060_c7_735e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2060_c7_735e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2060_c7_735e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2060_c7_735e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2060_c7_735e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2060_c7_735e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2060_c7_735e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2060_c7_735e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2060_c7_735e_return_output;

     -- t16_MUX[uxn_opcodes_h_l2045_c7_9dea] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2045_c7_9dea_cond <= VAR_t16_MUX_uxn_opcodes_h_l2045_c7_9dea_cond;
     t16_MUX_uxn_opcodes_h_l2045_c7_9dea_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2045_c7_9dea_iftrue;
     t16_MUX_uxn_opcodes_h_l2045_c7_9dea_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2045_c7_9dea_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2045_c7_9dea_return_output := t16_MUX_uxn_opcodes_h_l2045_c7_9dea_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2060_c7_735e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2060_c7_735e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2060_c7_735e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2060_c7_735e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2060_c7_735e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2060_c7_735e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2060_c7_735e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2060_c7_735e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2060_c7_735e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2056_c7_3034] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2056_c7_3034_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2056_c7_3034_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2056_c7_3034_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2056_c7_3034_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2056_c7_3034_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2056_c7_3034_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2056_c7_3034_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2056_c7_3034_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2068_c7_29e9] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2068_c7_29e9_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2068_c7_29e9_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2068_c7_29e9_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2068_c7_29e9_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2068_c7_29e9_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2068_c7_29e9_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2068_c7_29e9_return_output := result_u8_value_MUX_uxn_opcodes_h_l2068_c7_29e9_return_output;

     -- n16_MUX[uxn_opcodes_h_l2060_c7_735e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2060_c7_735e_cond <= VAR_n16_MUX_uxn_opcodes_h_l2060_c7_735e_cond;
     n16_MUX_uxn_opcodes_h_l2060_c7_735e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2060_c7_735e_iftrue;
     n16_MUX_uxn_opcodes_h_l2060_c7_735e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2060_c7_735e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2060_c7_735e_return_output := n16_MUX_uxn_opcodes_h_l2060_c7_735e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2060_c7_735e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2060_c7_735e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2060_c7_735e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2060_c7_735e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2060_c7_735e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2060_c7_735e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2060_c7_735e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2060_c7_735e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2060_c7_735e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2056_c7_3034] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2056_c7_3034_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2056_c7_3034_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2056_c7_3034_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2056_c7_3034_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2056_c7_3034_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2056_c7_3034_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2056_c7_3034_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2056_c7_3034_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2056_c7_3034_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2060_c7_735e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2056_c7_3034_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2060_c7_735e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2056_c7_3034_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2060_c7_735e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2056_c7_3034_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2060_c7_735e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2053_c7_90db_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2056_c7_3034_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2053_c7_90db_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2056_c7_3034_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2063_c7_e0d8_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2068_c7_29e9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2040_c2_3903_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2045_c7_9dea_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2063_c7_e0d8] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2063_c7_e0d8_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2063_c7_e0d8_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2063_c7_e0d8_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2063_c7_e0d8_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2063_c7_e0d8_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2063_c7_e0d8_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2063_c7_e0d8_return_output := result_u8_value_MUX_uxn_opcodes_h_l2063_c7_e0d8_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2056_c7_3034] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2056_c7_3034_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2056_c7_3034_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2056_c7_3034_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2056_c7_3034_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2056_c7_3034_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2056_c7_3034_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2056_c7_3034_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2056_c7_3034_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2053_c7_90db] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2053_c7_90db_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2053_c7_90db_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2053_c7_90db_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2053_c7_90db_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2053_c7_90db_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2053_c7_90db_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2053_c7_90db_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2053_c7_90db_return_output;

     -- n16_MUX[uxn_opcodes_h_l2056_c7_3034] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2056_c7_3034_cond <= VAR_n16_MUX_uxn_opcodes_h_l2056_c7_3034_cond;
     n16_MUX_uxn_opcodes_h_l2056_c7_3034_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2056_c7_3034_iftrue;
     n16_MUX_uxn_opcodes_h_l2056_c7_3034_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2056_c7_3034_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2056_c7_3034_return_output := n16_MUX_uxn_opcodes_h_l2056_c7_3034_return_output;

     -- t16_MUX[uxn_opcodes_h_l2040_c2_3903] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2040_c2_3903_cond <= VAR_t16_MUX_uxn_opcodes_h_l2040_c2_3903_cond;
     t16_MUX_uxn_opcodes_h_l2040_c2_3903_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2040_c2_3903_iftrue;
     t16_MUX_uxn_opcodes_h_l2040_c2_3903_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2040_c2_3903_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2040_c2_3903_return_output := t16_MUX_uxn_opcodes_h_l2040_c2_3903_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2056_c7_3034] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2056_c7_3034_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2056_c7_3034_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2056_c7_3034_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2056_c7_3034_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2056_c7_3034_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2056_c7_3034_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2056_c7_3034_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2056_c7_3034_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2053_c7_90db] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2053_c7_90db_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2053_c7_90db_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2053_c7_90db_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2053_c7_90db_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2053_c7_90db_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2053_c7_90db_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2053_c7_90db_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2053_c7_90db_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2056_c7_3034] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2056_c7_3034_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2056_c7_3034_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2056_c7_3034_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2056_c7_3034_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2056_c7_3034_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2056_c7_3034_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2056_c7_3034_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2056_c7_3034_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l2053_c7_90db_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2056_c7_3034_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2053_c7_90db_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2056_c7_3034_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2053_c7_90db_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2056_c7_3034_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2053_c7_90db_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2056_c7_3034_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_73b4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2053_c7_90db_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_73b4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2053_c7_90db_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2060_c7_735e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2063_c7_e0d8_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2040_c2_3903_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2048_c7_73b4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_73b4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_73b4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_73b4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_73b4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_73b4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_73b4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_73b4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_73b4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2053_c7_90db] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2053_c7_90db_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2053_c7_90db_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2053_c7_90db_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2053_c7_90db_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2053_c7_90db_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2053_c7_90db_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2053_c7_90db_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2053_c7_90db_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2053_c7_90db] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2053_c7_90db_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2053_c7_90db_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2053_c7_90db_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2053_c7_90db_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2053_c7_90db_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2053_c7_90db_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2053_c7_90db_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2053_c7_90db_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2048_c7_73b4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_73b4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_73b4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_73b4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_73b4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_73b4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_73b4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_73b4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_73b4_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2060_c7_735e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2060_c7_735e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2060_c7_735e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2060_c7_735e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2060_c7_735e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2060_c7_735e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2060_c7_735e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2060_c7_735e_return_output := result_u8_value_MUX_uxn_opcodes_h_l2060_c7_735e_return_output;

     -- n16_MUX[uxn_opcodes_h_l2053_c7_90db] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2053_c7_90db_cond <= VAR_n16_MUX_uxn_opcodes_h_l2053_c7_90db_cond;
     n16_MUX_uxn_opcodes_h_l2053_c7_90db_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2053_c7_90db_iftrue;
     n16_MUX_uxn_opcodes_h_l2053_c7_90db_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2053_c7_90db_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2053_c7_90db_return_output := n16_MUX_uxn_opcodes_h_l2053_c7_90db_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2053_c7_90db] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2053_c7_90db_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2053_c7_90db_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2053_c7_90db_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2053_c7_90db_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2053_c7_90db_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2053_c7_90db_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2053_c7_90db_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2053_c7_90db_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l2048_c7_73b4_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2053_c7_90db_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_73b4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2053_c7_90db_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_73b4_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2053_c7_90db_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_73b4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2053_c7_90db_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2045_c7_9dea_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_73b4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2045_c7_9dea_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_73b4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2056_c7_3034_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2060_c7_735e_return_output;
     -- n16_MUX[uxn_opcodes_h_l2048_c7_73b4] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2048_c7_73b4_cond <= VAR_n16_MUX_uxn_opcodes_h_l2048_c7_73b4_cond;
     n16_MUX_uxn_opcodes_h_l2048_c7_73b4_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2048_c7_73b4_iftrue;
     n16_MUX_uxn_opcodes_h_l2048_c7_73b4_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2048_c7_73b4_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2048_c7_73b4_return_output := n16_MUX_uxn_opcodes_h_l2048_c7_73b4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2045_c7_9dea] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2045_c7_9dea_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2045_c7_9dea_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2045_c7_9dea_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2045_c7_9dea_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2045_c7_9dea_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2045_c7_9dea_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2045_c7_9dea_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2045_c7_9dea_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2048_c7_73b4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_73b4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_73b4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_73b4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_73b4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_73b4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_73b4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_73b4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_73b4_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2048_c7_73b4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_73b4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_73b4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_73b4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_73b4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_73b4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_73b4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_73b4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_73b4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2048_c7_73b4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_73b4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_73b4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_73b4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_73b4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_73b4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_73b4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_73b4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_73b4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2045_c7_9dea] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2045_c7_9dea_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2045_c7_9dea_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2045_c7_9dea_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2045_c7_9dea_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2045_c7_9dea_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2045_c7_9dea_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2045_c7_9dea_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2045_c7_9dea_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2056_c7_3034] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2056_c7_3034_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2056_c7_3034_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2056_c7_3034_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2056_c7_3034_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2056_c7_3034_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2056_c7_3034_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2056_c7_3034_return_output := result_u8_value_MUX_uxn_opcodes_h_l2056_c7_3034_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l2045_c7_9dea_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2048_c7_73b4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2045_c7_9dea_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_73b4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2045_c7_9dea_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_73b4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2045_c7_9dea_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_73b4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c2_3903_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2045_c7_9dea_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c2_3903_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2045_c7_9dea_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2053_c7_90db_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2056_c7_3034_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2040_c2_3903] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c2_3903_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c2_3903_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c2_3903_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c2_3903_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c2_3903_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c2_3903_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c2_3903_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c2_3903_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2045_c7_9dea] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2045_c7_9dea_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2045_c7_9dea_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2045_c7_9dea_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2045_c7_9dea_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2045_c7_9dea_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2045_c7_9dea_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2045_c7_9dea_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2045_c7_9dea_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2040_c2_3903] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c2_3903_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c2_3903_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c2_3903_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c2_3903_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c2_3903_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c2_3903_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c2_3903_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c2_3903_return_output;

     -- n16_MUX[uxn_opcodes_h_l2045_c7_9dea] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2045_c7_9dea_cond <= VAR_n16_MUX_uxn_opcodes_h_l2045_c7_9dea_cond;
     n16_MUX_uxn_opcodes_h_l2045_c7_9dea_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2045_c7_9dea_iftrue;
     n16_MUX_uxn_opcodes_h_l2045_c7_9dea_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2045_c7_9dea_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2045_c7_9dea_return_output := n16_MUX_uxn_opcodes_h_l2045_c7_9dea_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2045_c7_9dea] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2045_c7_9dea_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2045_c7_9dea_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2045_c7_9dea_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2045_c7_9dea_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2045_c7_9dea_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2045_c7_9dea_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2045_c7_9dea_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2045_c7_9dea_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2045_c7_9dea] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2045_c7_9dea_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2045_c7_9dea_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2045_c7_9dea_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2045_c7_9dea_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2045_c7_9dea_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2045_c7_9dea_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2045_c7_9dea_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2045_c7_9dea_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2053_c7_90db] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2053_c7_90db_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2053_c7_90db_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2053_c7_90db_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2053_c7_90db_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2053_c7_90db_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2053_c7_90db_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2053_c7_90db_return_output := result_u8_value_MUX_uxn_opcodes_h_l2053_c7_90db_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l2040_c2_3903_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2045_c7_9dea_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2040_c2_3903_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2045_c7_9dea_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c2_3903_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2045_c7_9dea_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2040_c2_3903_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2045_c7_9dea_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2048_c7_73b4_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2053_c7_90db_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2040_c2_3903] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2040_c2_3903_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2040_c2_3903_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2040_c2_3903_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2040_c2_3903_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2040_c2_3903_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2040_c2_3903_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2040_c2_3903_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2040_c2_3903_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2040_c2_3903] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c2_3903_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c2_3903_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c2_3903_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c2_3903_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c2_3903_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c2_3903_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c2_3903_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c2_3903_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2048_c7_73b4] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2048_c7_73b4_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2048_c7_73b4_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2048_c7_73b4_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2048_c7_73b4_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2048_c7_73b4_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2048_c7_73b4_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2048_c7_73b4_return_output := result_u8_value_MUX_uxn_opcodes_h_l2048_c7_73b4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2040_c2_3903] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2040_c2_3903_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2040_c2_3903_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2040_c2_3903_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2040_c2_3903_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2040_c2_3903_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2040_c2_3903_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2040_c2_3903_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2040_c2_3903_return_output;

     -- n16_MUX[uxn_opcodes_h_l2040_c2_3903] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2040_c2_3903_cond <= VAR_n16_MUX_uxn_opcodes_h_l2040_c2_3903_cond;
     n16_MUX_uxn_opcodes_h_l2040_c2_3903_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2040_c2_3903_iftrue;
     n16_MUX_uxn_opcodes_h_l2040_c2_3903_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2040_c2_3903_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2040_c2_3903_return_output := n16_MUX_uxn_opcodes_h_l2040_c2_3903_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2040_c2_3903_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2045_c7_9dea_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2048_c7_73b4_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2045_c7_9dea] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2045_c7_9dea_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2045_c7_9dea_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2045_c7_9dea_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2045_c7_9dea_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2045_c7_9dea_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2045_c7_9dea_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2045_c7_9dea_return_output := result_u8_value_MUX_uxn_opcodes_h_l2045_c7_9dea_return_output;

     -- Submodule level 12
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2040_c2_3903_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2045_c7_9dea_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2040_c2_3903] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2040_c2_3903_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2040_c2_3903_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2040_c2_3903_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2040_c2_3903_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2040_c2_3903_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2040_c2_3903_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2040_c2_3903_return_output := result_u8_value_MUX_uxn_opcodes_h_l2040_c2_3903_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_25e8_uxn_opcodes_h_l2036_l2085_DUPLICATE_14d5 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_25e8_uxn_opcodes_h_l2036_l2085_DUPLICATE_14d5_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_25e8(
     result,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2040_c2_3903_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2040_c2_3903_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c2_3903_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2040_c2_3903_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c2_3903_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c2_3903_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_25e8_uxn_opcodes_h_l2036_l2085_DUPLICATE_14d5_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_25e8_uxn_opcodes_h_l2036_l2085_DUPLICATE_14d5_return_output;
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
