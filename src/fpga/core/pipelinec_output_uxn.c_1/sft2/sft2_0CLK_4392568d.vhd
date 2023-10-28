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
-- Submodules: 89
entity sft2_0CLK_4392568d is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end sft2_0CLK_4392568d;
architecture arch of sft2_0CLK_4392568d is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal tmp16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_n16 : unsigned(15 downto 0);
signal REG_COMB_tmp16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l2392_c6_6067]
signal BIN_OP_EQ_uxn_opcodes_h_l2392_c6_6067_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2392_c6_6067_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2392_c6_6067_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2392_c1_40f5]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2392_c1_40f5_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2392_c1_40f5_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2392_c1_40f5_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2392_c1_40f5_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2392_c2_6eaa]
signal tmp16_MUX_uxn_opcodes_h_l2392_c2_6eaa_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2392_c2_6eaa_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2392_c2_6eaa_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2392_c2_6eaa_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2392_c2_6eaa]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2392_c2_6eaa_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2392_c2_6eaa_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2392_c2_6eaa_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2392_c2_6eaa_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2392_c2_6eaa]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2392_c2_6eaa_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2392_c2_6eaa_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2392_c2_6eaa_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2392_c2_6eaa_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2392_c2_6eaa]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2392_c2_6eaa_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2392_c2_6eaa_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2392_c2_6eaa_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2392_c2_6eaa_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2392_c2_6eaa]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2392_c2_6eaa_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2392_c2_6eaa_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2392_c2_6eaa_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2392_c2_6eaa_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2392_c2_6eaa]
signal result_u8_value_MUX_uxn_opcodes_h_l2392_c2_6eaa_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2392_c2_6eaa_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2392_c2_6eaa_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2392_c2_6eaa_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2392_c2_6eaa]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2392_c2_6eaa_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2392_c2_6eaa_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2392_c2_6eaa_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2392_c2_6eaa_return_output : signed(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l2392_c2_6eaa]
signal n16_MUX_uxn_opcodes_h_l2392_c2_6eaa_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2392_c2_6eaa_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2392_c2_6eaa_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2392_c2_6eaa_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l2392_c2_6eaa]
signal t8_MUX_uxn_opcodes_h_l2392_c2_6eaa_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2392_c2_6eaa_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2392_c2_6eaa_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2392_c2_6eaa_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l2393_c3_867b[uxn_opcodes_h_l2393_c3_867b]
signal printf_uxn_opcodes_h_l2393_c3_867b_uxn_opcodes_h_l2393_c3_867b_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2397_c11_3f4e]
signal BIN_OP_EQ_uxn_opcodes_h_l2397_c11_3f4e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2397_c11_3f4e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2397_c11_3f4e_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2397_c7_2903]
signal tmp16_MUX_uxn_opcodes_h_l2397_c7_2903_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2397_c7_2903_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2397_c7_2903_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2397_c7_2903_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2397_c7_2903]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_2903_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_2903_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_2903_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_2903_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2397_c7_2903]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_2903_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_2903_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_2903_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_2903_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2397_c7_2903]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_2903_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_2903_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_2903_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_2903_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2397_c7_2903]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_2903_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_2903_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_2903_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_2903_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2397_c7_2903]
signal result_u8_value_MUX_uxn_opcodes_h_l2397_c7_2903_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2397_c7_2903_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2397_c7_2903_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2397_c7_2903_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2397_c7_2903]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2397_c7_2903_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2397_c7_2903_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2397_c7_2903_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2397_c7_2903_return_output : signed(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l2397_c7_2903]
signal n16_MUX_uxn_opcodes_h_l2397_c7_2903_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2397_c7_2903_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2397_c7_2903_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2397_c7_2903_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l2397_c7_2903]
signal t8_MUX_uxn_opcodes_h_l2397_c7_2903_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2397_c7_2903_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2397_c7_2903_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2397_c7_2903_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2400_c11_e917]
signal BIN_OP_EQ_uxn_opcodes_h_l2400_c11_e917_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2400_c11_e917_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2400_c11_e917_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2400_c7_34c4]
signal tmp16_MUX_uxn_opcodes_h_l2400_c7_34c4_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2400_c7_34c4_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2400_c7_34c4_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2400_c7_34c4_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2400_c7_34c4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2400_c7_34c4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2400_c7_34c4_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2400_c7_34c4_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2400_c7_34c4_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2400_c7_34c4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2400_c7_34c4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2400_c7_34c4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2400_c7_34c4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2400_c7_34c4_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2400_c7_34c4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2400_c7_34c4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2400_c7_34c4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2400_c7_34c4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2400_c7_34c4_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2400_c7_34c4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2400_c7_34c4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2400_c7_34c4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2400_c7_34c4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2400_c7_34c4_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2400_c7_34c4]
signal result_u8_value_MUX_uxn_opcodes_h_l2400_c7_34c4_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2400_c7_34c4_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2400_c7_34c4_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2400_c7_34c4_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2400_c7_34c4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2400_c7_34c4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2400_c7_34c4_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2400_c7_34c4_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2400_c7_34c4_return_output : signed(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l2400_c7_34c4]
signal n16_MUX_uxn_opcodes_h_l2400_c7_34c4_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2400_c7_34c4_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2400_c7_34c4_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2400_c7_34c4_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l2400_c7_34c4]
signal t8_MUX_uxn_opcodes_h_l2400_c7_34c4_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2400_c7_34c4_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2400_c7_34c4_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2400_c7_34c4_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2404_c11_b435]
signal BIN_OP_EQ_uxn_opcodes_h_l2404_c11_b435_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2404_c11_b435_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2404_c11_b435_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2404_c7_29f2]
signal tmp16_MUX_uxn_opcodes_h_l2404_c7_29f2_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2404_c7_29f2_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2404_c7_29f2_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2404_c7_29f2_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2404_c7_29f2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2404_c7_29f2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2404_c7_29f2_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2404_c7_29f2_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2404_c7_29f2_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2404_c7_29f2]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2404_c7_29f2_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2404_c7_29f2_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2404_c7_29f2_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2404_c7_29f2_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2404_c7_29f2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2404_c7_29f2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2404_c7_29f2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2404_c7_29f2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2404_c7_29f2_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2404_c7_29f2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2404_c7_29f2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2404_c7_29f2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2404_c7_29f2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2404_c7_29f2_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2404_c7_29f2]
signal result_u8_value_MUX_uxn_opcodes_h_l2404_c7_29f2_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2404_c7_29f2_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2404_c7_29f2_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2404_c7_29f2_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2404_c7_29f2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2404_c7_29f2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2404_c7_29f2_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2404_c7_29f2_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2404_c7_29f2_return_output : signed(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l2404_c7_29f2]
signal n16_MUX_uxn_opcodes_h_l2404_c7_29f2_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2404_c7_29f2_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2404_c7_29f2_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2404_c7_29f2_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2407_c11_f63c]
signal BIN_OP_EQ_uxn_opcodes_h_l2407_c11_f63c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2407_c11_f63c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2407_c11_f63c_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2407_c7_45e2]
signal tmp16_MUX_uxn_opcodes_h_l2407_c7_45e2_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2407_c7_45e2_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2407_c7_45e2_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2407_c7_45e2_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2407_c7_45e2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2407_c7_45e2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2407_c7_45e2_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2407_c7_45e2_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2407_c7_45e2_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2407_c7_45e2]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2407_c7_45e2_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2407_c7_45e2_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2407_c7_45e2_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2407_c7_45e2_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2407_c7_45e2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2407_c7_45e2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2407_c7_45e2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2407_c7_45e2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2407_c7_45e2_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2407_c7_45e2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2407_c7_45e2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2407_c7_45e2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2407_c7_45e2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2407_c7_45e2_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2407_c7_45e2]
signal result_u8_value_MUX_uxn_opcodes_h_l2407_c7_45e2_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2407_c7_45e2_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2407_c7_45e2_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2407_c7_45e2_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2407_c7_45e2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2407_c7_45e2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2407_c7_45e2_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2407_c7_45e2_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2407_c7_45e2_return_output : signed(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l2407_c7_45e2]
signal n16_MUX_uxn_opcodes_h_l2407_c7_45e2_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2407_c7_45e2_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2407_c7_45e2_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2407_c7_45e2_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l2409_c3_0716]
signal CONST_SL_8_uxn_opcodes_h_l2409_c3_0716_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l2409_c3_0716_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2412_c11_2126]
signal BIN_OP_EQ_uxn_opcodes_h_l2412_c11_2126_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2412_c11_2126_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2412_c11_2126_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2412_c7_d908]
signal tmp16_MUX_uxn_opcodes_h_l2412_c7_d908_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2412_c7_d908_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2412_c7_d908_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2412_c7_d908_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2412_c7_d908]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2412_c7_d908_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2412_c7_d908_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2412_c7_d908_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2412_c7_d908_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2412_c7_d908]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2412_c7_d908_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2412_c7_d908_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2412_c7_d908_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2412_c7_d908_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2412_c7_d908]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2412_c7_d908_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2412_c7_d908_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2412_c7_d908_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2412_c7_d908_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2412_c7_d908]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2412_c7_d908_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2412_c7_d908_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2412_c7_d908_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2412_c7_d908_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2412_c7_d908]
signal result_u8_value_MUX_uxn_opcodes_h_l2412_c7_d908_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2412_c7_d908_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2412_c7_d908_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2412_c7_d908_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2412_c7_d908]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2412_c7_d908_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2412_c7_d908_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2412_c7_d908_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2412_c7_d908_return_output : signed(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l2412_c7_d908]
signal n16_MUX_uxn_opcodes_h_l2412_c7_d908_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2412_c7_d908_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2412_c7_d908_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2412_c7_d908_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2415_c11_c839]
signal BIN_OP_EQ_uxn_opcodes_h_l2415_c11_c839_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2415_c11_c839_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2415_c11_c839_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2415_c7_279b]
signal tmp16_MUX_uxn_opcodes_h_l2415_c7_279b_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2415_c7_279b_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2415_c7_279b_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2415_c7_279b_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2415_c7_279b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2415_c7_279b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2415_c7_279b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2415_c7_279b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2415_c7_279b_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2415_c7_279b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2415_c7_279b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2415_c7_279b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2415_c7_279b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2415_c7_279b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2415_c7_279b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2415_c7_279b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2415_c7_279b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2415_c7_279b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2415_c7_279b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2415_c7_279b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2415_c7_279b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2415_c7_279b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2415_c7_279b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2415_c7_279b_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2415_c7_279b]
signal result_u8_value_MUX_uxn_opcodes_h_l2415_c7_279b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2415_c7_279b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2415_c7_279b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2415_c7_279b_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2415_c7_279b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2415_c7_279b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2415_c7_279b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2415_c7_279b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2415_c7_279b_return_output : signed(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l2415_c7_279b]
signal n16_MUX_uxn_opcodes_h_l2415_c7_279b_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2415_c7_279b_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2415_c7_279b_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2415_c7_279b_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2416_c3_3a5e]
signal BIN_OP_OR_uxn_opcodes_h_l2416_c3_3a5e_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2416_c3_3a5e_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2416_c3_3a5e_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2418_c30_8a81]
signal sp_relative_shift_uxn_opcodes_h_l2418_c30_8a81_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2418_c30_8a81_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2418_c30_8a81_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2418_c30_8a81_return_output : signed(3 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2419_c20_8cd0]
signal BIN_OP_AND_uxn_opcodes_h_l2419_c20_8cd0_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2419_c20_8cd0_right : unsigned(3 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2419_c20_8cd0_return_output : unsigned(7 downto 0);

-- BIN_OP_SR[uxn_opcodes_h_l2419_c12_92d6]
signal BIN_OP_SR_uxn_opcodes_h_l2419_c12_92d6_left : unsigned(15 downto 0);
signal BIN_OP_SR_uxn_opcodes_h_l2419_c12_92d6_right : unsigned(7 downto 0);
signal BIN_OP_SR_uxn_opcodes_h_l2419_c12_92d6_return_output : unsigned(15 downto 0);

-- CONST_SR_4[uxn_opcodes_h_l2419_c36_2e67]
signal CONST_SR_4_uxn_opcodes_h_l2419_c36_2e67_x : unsigned(7 downto 0);
signal CONST_SR_4_uxn_opcodes_h_l2419_c36_2e67_return_output : unsigned(7 downto 0);

-- BIN_OP_SL[uxn_opcodes_h_l2419_c12_83b9]
signal BIN_OP_SL_uxn_opcodes_h_l2419_c12_83b9_left : unsigned(15 downto 0);
signal BIN_OP_SL_uxn_opcodes_h_l2419_c12_83b9_right : unsigned(7 downto 0);
signal BIN_OP_SL_uxn_opcodes_h_l2419_c12_83b9_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2424_c11_581b]
signal BIN_OP_EQ_uxn_opcodes_h_l2424_c11_581b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2424_c11_581b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2424_c11_581b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2424_c7_2442]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2424_c7_2442_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2424_c7_2442_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2424_c7_2442_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2424_c7_2442_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2424_c7_2442]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2424_c7_2442_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2424_c7_2442_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2424_c7_2442_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2424_c7_2442_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2424_c7_2442]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2424_c7_2442_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2424_c7_2442_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2424_c7_2442_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2424_c7_2442_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2424_c7_2442]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2424_c7_2442_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2424_c7_2442_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2424_c7_2442_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2424_c7_2442_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2424_c7_2442]
signal result_u8_value_MUX_uxn_opcodes_h_l2424_c7_2442_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2424_c7_2442_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2424_c7_2442_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2424_c7_2442_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2427_c31_77b8]
signal CONST_SR_8_uxn_opcodes_h_l2427_c31_77b8_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2427_c31_77b8_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2429_c11_3d17]
signal BIN_OP_EQ_uxn_opcodes_h_l2429_c11_3d17_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2429_c11_3d17_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2429_c11_3d17_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2429_c7_1f84]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2429_c7_1f84_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2429_c7_1f84_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2429_c7_1f84_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2429_c7_1f84_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2429_c7_1f84]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2429_c7_1f84_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2429_c7_1f84_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2429_c7_1f84_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2429_c7_1f84_return_output : unsigned(0 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l2392_c6_6067
BIN_OP_EQ_uxn_opcodes_h_l2392_c6_6067 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2392_c6_6067_left,
BIN_OP_EQ_uxn_opcodes_h_l2392_c6_6067_right,
BIN_OP_EQ_uxn_opcodes_h_l2392_c6_6067_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2392_c1_40f5
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2392_c1_40f5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2392_c1_40f5_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2392_c1_40f5_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2392_c1_40f5_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2392_c1_40f5_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2392_c2_6eaa
tmp16_MUX_uxn_opcodes_h_l2392_c2_6eaa : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2392_c2_6eaa_cond,
tmp16_MUX_uxn_opcodes_h_l2392_c2_6eaa_iftrue,
tmp16_MUX_uxn_opcodes_h_l2392_c2_6eaa_iffalse,
tmp16_MUX_uxn_opcodes_h_l2392_c2_6eaa_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2392_c2_6eaa
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2392_c2_6eaa : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2392_c2_6eaa_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2392_c2_6eaa_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2392_c2_6eaa_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2392_c2_6eaa_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2392_c2_6eaa
result_is_sp_shift_MUX_uxn_opcodes_h_l2392_c2_6eaa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2392_c2_6eaa_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2392_c2_6eaa_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2392_c2_6eaa_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2392_c2_6eaa_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2392_c2_6eaa
result_is_opc_done_MUX_uxn_opcodes_h_l2392_c2_6eaa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2392_c2_6eaa_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2392_c2_6eaa_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2392_c2_6eaa_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2392_c2_6eaa_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2392_c2_6eaa
result_is_stack_write_MUX_uxn_opcodes_h_l2392_c2_6eaa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2392_c2_6eaa_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2392_c2_6eaa_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2392_c2_6eaa_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2392_c2_6eaa_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2392_c2_6eaa
result_u8_value_MUX_uxn_opcodes_h_l2392_c2_6eaa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2392_c2_6eaa_cond,
result_u8_value_MUX_uxn_opcodes_h_l2392_c2_6eaa_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2392_c2_6eaa_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2392_c2_6eaa_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2392_c2_6eaa
result_sp_relative_shift_MUX_uxn_opcodes_h_l2392_c2_6eaa : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2392_c2_6eaa_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2392_c2_6eaa_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2392_c2_6eaa_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2392_c2_6eaa_return_output);

-- n16_MUX_uxn_opcodes_h_l2392_c2_6eaa
n16_MUX_uxn_opcodes_h_l2392_c2_6eaa : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2392_c2_6eaa_cond,
n16_MUX_uxn_opcodes_h_l2392_c2_6eaa_iftrue,
n16_MUX_uxn_opcodes_h_l2392_c2_6eaa_iffalse,
n16_MUX_uxn_opcodes_h_l2392_c2_6eaa_return_output);

-- t8_MUX_uxn_opcodes_h_l2392_c2_6eaa
t8_MUX_uxn_opcodes_h_l2392_c2_6eaa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2392_c2_6eaa_cond,
t8_MUX_uxn_opcodes_h_l2392_c2_6eaa_iftrue,
t8_MUX_uxn_opcodes_h_l2392_c2_6eaa_iffalse,
t8_MUX_uxn_opcodes_h_l2392_c2_6eaa_return_output);

-- printf_uxn_opcodes_h_l2393_c3_867b_uxn_opcodes_h_l2393_c3_867b
printf_uxn_opcodes_h_l2393_c3_867b_uxn_opcodes_h_l2393_c3_867b : entity work.printf_uxn_opcodes_h_l2393_c3_867b_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2393_c3_867b_uxn_opcodes_h_l2393_c3_867b_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2397_c11_3f4e
BIN_OP_EQ_uxn_opcodes_h_l2397_c11_3f4e : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2397_c11_3f4e_left,
BIN_OP_EQ_uxn_opcodes_h_l2397_c11_3f4e_right,
BIN_OP_EQ_uxn_opcodes_h_l2397_c11_3f4e_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2397_c7_2903
tmp16_MUX_uxn_opcodes_h_l2397_c7_2903 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2397_c7_2903_cond,
tmp16_MUX_uxn_opcodes_h_l2397_c7_2903_iftrue,
tmp16_MUX_uxn_opcodes_h_l2397_c7_2903_iffalse,
tmp16_MUX_uxn_opcodes_h_l2397_c7_2903_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_2903
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_2903 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_2903_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_2903_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_2903_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_2903_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_2903
result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_2903 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_2903_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_2903_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_2903_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_2903_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_2903
result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_2903 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_2903_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_2903_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_2903_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_2903_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_2903
result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_2903 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_2903_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_2903_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_2903_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_2903_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2397_c7_2903
result_u8_value_MUX_uxn_opcodes_h_l2397_c7_2903 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2397_c7_2903_cond,
result_u8_value_MUX_uxn_opcodes_h_l2397_c7_2903_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2397_c7_2903_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2397_c7_2903_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2397_c7_2903
result_sp_relative_shift_MUX_uxn_opcodes_h_l2397_c7_2903 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2397_c7_2903_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2397_c7_2903_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2397_c7_2903_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2397_c7_2903_return_output);

-- n16_MUX_uxn_opcodes_h_l2397_c7_2903
n16_MUX_uxn_opcodes_h_l2397_c7_2903 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2397_c7_2903_cond,
n16_MUX_uxn_opcodes_h_l2397_c7_2903_iftrue,
n16_MUX_uxn_opcodes_h_l2397_c7_2903_iffalse,
n16_MUX_uxn_opcodes_h_l2397_c7_2903_return_output);

-- t8_MUX_uxn_opcodes_h_l2397_c7_2903
t8_MUX_uxn_opcodes_h_l2397_c7_2903 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2397_c7_2903_cond,
t8_MUX_uxn_opcodes_h_l2397_c7_2903_iftrue,
t8_MUX_uxn_opcodes_h_l2397_c7_2903_iffalse,
t8_MUX_uxn_opcodes_h_l2397_c7_2903_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2400_c11_e917
BIN_OP_EQ_uxn_opcodes_h_l2400_c11_e917 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2400_c11_e917_left,
BIN_OP_EQ_uxn_opcodes_h_l2400_c11_e917_right,
BIN_OP_EQ_uxn_opcodes_h_l2400_c11_e917_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2400_c7_34c4
tmp16_MUX_uxn_opcodes_h_l2400_c7_34c4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2400_c7_34c4_cond,
tmp16_MUX_uxn_opcodes_h_l2400_c7_34c4_iftrue,
tmp16_MUX_uxn_opcodes_h_l2400_c7_34c4_iffalse,
tmp16_MUX_uxn_opcodes_h_l2400_c7_34c4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2400_c7_34c4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2400_c7_34c4 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2400_c7_34c4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2400_c7_34c4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2400_c7_34c4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2400_c7_34c4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2400_c7_34c4
result_is_sp_shift_MUX_uxn_opcodes_h_l2400_c7_34c4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2400_c7_34c4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2400_c7_34c4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2400_c7_34c4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2400_c7_34c4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2400_c7_34c4
result_is_opc_done_MUX_uxn_opcodes_h_l2400_c7_34c4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2400_c7_34c4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2400_c7_34c4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2400_c7_34c4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2400_c7_34c4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2400_c7_34c4
result_is_stack_write_MUX_uxn_opcodes_h_l2400_c7_34c4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2400_c7_34c4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2400_c7_34c4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2400_c7_34c4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2400_c7_34c4_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2400_c7_34c4
result_u8_value_MUX_uxn_opcodes_h_l2400_c7_34c4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2400_c7_34c4_cond,
result_u8_value_MUX_uxn_opcodes_h_l2400_c7_34c4_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2400_c7_34c4_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2400_c7_34c4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2400_c7_34c4
result_sp_relative_shift_MUX_uxn_opcodes_h_l2400_c7_34c4 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2400_c7_34c4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2400_c7_34c4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2400_c7_34c4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2400_c7_34c4_return_output);

-- n16_MUX_uxn_opcodes_h_l2400_c7_34c4
n16_MUX_uxn_opcodes_h_l2400_c7_34c4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2400_c7_34c4_cond,
n16_MUX_uxn_opcodes_h_l2400_c7_34c4_iftrue,
n16_MUX_uxn_opcodes_h_l2400_c7_34c4_iffalse,
n16_MUX_uxn_opcodes_h_l2400_c7_34c4_return_output);

-- t8_MUX_uxn_opcodes_h_l2400_c7_34c4
t8_MUX_uxn_opcodes_h_l2400_c7_34c4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2400_c7_34c4_cond,
t8_MUX_uxn_opcodes_h_l2400_c7_34c4_iftrue,
t8_MUX_uxn_opcodes_h_l2400_c7_34c4_iffalse,
t8_MUX_uxn_opcodes_h_l2400_c7_34c4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2404_c11_b435
BIN_OP_EQ_uxn_opcodes_h_l2404_c11_b435 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2404_c11_b435_left,
BIN_OP_EQ_uxn_opcodes_h_l2404_c11_b435_right,
BIN_OP_EQ_uxn_opcodes_h_l2404_c11_b435_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2404_c7_29f2
tmp16_MUX_uxn_opcodes_h_l2404_c7_29f2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2404_c7_29f2_cond,
tmp16_MUX_uxn_opcodes_h_l2404_c7_29f2_iftrue,
tmp16_MUX_uxn_opcodes_h_l2404_c7_29f2_iffalse,
tmp16_MUX_uxn_opcodes_h_l2404_c7_29f2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2404_c7_29f2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2404_c7_29f2 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2404_c7_29f2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2404_c7_29f2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2404_c7_29f2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2404_c7_29f2_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2404_c7_29f2
result_is_sp_shift_MUX_uxn_opcodes_h_l2404_c7_29f2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2404_c7_29f2_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2404_c7_29f2_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2404_c7_29f2_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2404_c7_29f2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2404_c7_29f2
result_is_opc_done_MUX_uxn_opcodes_h_l2404_c7_29f2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2404_c7_29f2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2404_c7_29f2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2404_c7_29f2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2404_c7_29f2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2404_c7_29f2
result_is_stack_write_MUX_uxn_opcodes_h_l2404_c7_29f2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2404_c7_29f2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2404_c7_29f2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2404_c7_29f2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2404_c7_29f2_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2404_c7_29f2
result_u8_value_MUX_uxn_opcodes_h_l2404_c7_29f2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2404_c7_29f2_cond,
result_u8_value_MUX_uxn_opcodes_h_l2404_c7_29f2_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2404_c7_29f2_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2404_c7_29f2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2404_c7_29f2
result_sp_relative_shift_MUX_uxn_opcodes_h_l2404_c7_29f2 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2404_c7_29f2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2404_c7_29f2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2404_c7_29f2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2404_c7_29f2_return_output);

-- n16_MUX_uxn_opcodes_h_l2404_c7_29f2
n16_MUX_uxn_opcodes_h_l2404_c7_29f2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2404_c7_29f2_cond,
n16_MUX_uxn_opcodes_h_l2404_c7_29f2_iftrue,
n16_MUX_uxn_opcodes_h_l2404_c7_29f2_iffalse,
n16_MUX_uxn_opcodes_h_l2404_c7_29f2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2407_c11_f63c
BIN_OP_EQ_uxn_opcodes_h_l2407_c11_f63c : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2407_c11_f63c_left,
BIN_OP_EQ_uxn_opcodes_h_l2407_c11_f63c_right,
BIN_OP_EQ_uxn_opcodes_h_l2407_c11_f63c_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2407_c7_45e2
tmp16_MUX_uxn_opcodes_h_l2407_c7_45e2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2407_c7_45e2_cond,
tmp16_MUX_uxn_opcodes_h_l2407_c7_45e2_iftrue,
tmp16_MUX_uxn_opcodes_h_l2407_c7_45e2_iffalse,
tmp16_MUX_uxn_opcodes_h_l2407_c7_45e2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2407_c7_45e2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2407_c7_45e2 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2407_c7_45e2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2407_c7_45e2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2407_c7_45e2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2407_c7_45e2_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2407_c7_45e2
result_is_sp_shift_MUX_uxn_opcodes_h_l2407_c7_45e2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2407_c7_45e2_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2407_c7_45e2_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2407_c7_45e2_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2407_c7_45e2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2407_c7_45e2
result_is_opc_done_MUX_uxn_opcodes_h_l2407_c7_45e2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2407_c7_45e2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2407_c7_45e2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2407_c7_45e2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2407_c7_45e2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2407_c7_45e2
result_is_stack_write_MUX_uxn_opcodes_h_l2407_c7_45e2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2407_c7_45e2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2407_c7_45e2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2407_c7_45e2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2407_c7_45e2_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2407_c7_45e2
result_u8_value_MUX_uxn_opcodes_h_l2407_c7_45e2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2407_c7_45e2_cond,
result_u8_value_MUX_uxn_opcodes_h_l2407_c7_45e2_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2407_c7_45e2_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2407_c7_45e2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2407_c7_45e2
result_sp_relative_shift_MUX_uxn_opcodes_h_l2407_c7_45e2 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2407_c7_45e2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2407_c7_45e2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2407_c7_45e2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2407_c7_45e2_return_output);

-- n16_MUX_uxn_opcodes_h_l2407_c7_45e2
n16_MUX_uxn_opcodes_h_l2407_c7_45e2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2407_c7_45e2_cond,
n16_MUX_uxn_opcodes_h_l2407_c7_45e2_iftrue,
n16_MUX_uxn_opcodes_h_l2407_c7_45e2_iffalse,
n16_MUX_uxn_opcodes_h_l2407_c7_45e2_return_output);

-- CONST_SL_8_uxn_opcodes_h_l2409_c3_0716
CONST_SL_8_uxn_opcodes_h_l2409_c3_0716 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l2409_c3_0716_x,
CONST_SL_8_uxn_opcodes_h_l2409_c3_0716_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2412_c11_2126
BIN_OP_EQ_uxn_opcodes_h_l2412_c11_2126 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2412_c11_2126_left,
BIN_OP_EQ_uxn_opcodes_h_l2412_c11_2126_right,
BIN_OP_EQ_uxn_opcodes_h_l2412_c11_2126_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2412_c7_d908
tmp16_MUX_uxn_opcodes_h_l2412_c7_d908 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2412_c7_d908_cond,
tmp16_MUX_uxn_opcodes_h_l2412_c7_d908_iftrue,
tmp16_MUX_uxn_opcodes_h_l2412_c7_d908_iffalse,
tmp16_MUX_uxn_opcodes_h_l2412_c7_d908_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2412_c7_d908
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2412_c7_d908 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2412_c7_d908_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2412_c7_d908_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2412_c7_d908_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2412_c7_d908_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2412_c7_d908
result_is_sp_shift_MUX_uxn_opcodes_h_l2412_c7_d908 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2412_c7_d908_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2412_c7_d908_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2412_c7_d908_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2412_c7_d908_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2412_c7_d908
result_is_opc_done_MUX_uxn_opcodes_h_l2412_c7_d908 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2412_c7_d908_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2412_c7_d908_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2412_c7_d908_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2412_c7_d908_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2412_c7_d908
result_is_stack_write_MUX_uxn_opcodes_h_l2412_c7_d908 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2412_c7_d908_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2412_c7_d908_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2412_c7_d908_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2412_c7_d908_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2412_c7_d908
result_u8_value_MUX_uxn_opcodes_h_l2412_c7_d908 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2412_c7_d908_cond,
result_u8_value_MUX_uxn_opcodes_h_l2412_c7_d908_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2412_c7_d908_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2412_c7_d908_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2412_c7_d908
result_sp_relative_shift_MUX_uxn_opcodes_h_l2412_c7_d908 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2412_c7_d908_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2412_c7_d908_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2412_c7_d908_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2412_c7_d908_return_output);

-- n16_MUX_uxn_opcodes_h_l2412_c7_d908
n16_MUX_uxn_opcodes_h_l2412_c7_d908 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2412_c7_d908_cond,
n16_MUX_uxn_opcodes_h_l2412_c7_d908_iftrue,
n16_MUX_uxn_opcodes_h_l2412_c7_d908_iffalse,
n16_MUX_uxn_opcodes_h_l2412_c7_d908_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2415_c11_c839
BIN_OP_EQ_uxn_opcodes_h_l2415_c11_c839 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2415_c11_c839_left,
BIN_OP_EQ_uxn_opcodes_h_l2415_c11_c839_right,
BIN_OP_EQ_uxn_opcodes_h_l2415_c11_c839_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2415_c7_279b
tmp16_MUX_uxn_opcodes_h_l2415_c7_279b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2415_c7_279b_cond,
tmp16_MUX_uxn_opcodes_h_l2415_c7_279b_iftrue,
tmp16_MUX_uxn_opcodes_h_l2415_c7_279b_iffalse,
tmp16_MUX_uxn_opcodes_h_l2415_c7_279b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2415_c7_279b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2415_c7_279b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2415_c7_279b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2415_c7_279b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2415_c7_279b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2415_c7_279b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2415_c7_279b
result_is_sp_shift_MUX_uxn_opcodes_h_l2415_c7_279b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2415_c7_279b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2415_c7_279b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2415_c7_279b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2415_c7_279b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2415_c7_279b
result_is_opc_done_MUX_uxn_opcodes_h_l2415_c7_279b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2415_c7_279b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2415_c7_279b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2415_c7_279b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2415_c7_279b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2415_c7_279b
result_is_stack_write_MUX_uxn_opcodes_h_l2415_c7_279b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2415_c7_279b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2415_c7_279b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2415_c7_279b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2415_c7_279b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2415_c7_279b
result_u8_value_MUX_uxn_opcodes_h_l2415_c7_279b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2415_c7_279b_cond,
result_u8_value_MUX_uxn_opcodes_h_l2415_c7_279b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2415_c7_279b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2415_c7_279b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2415_c7_279b
result_sp_relative_shift_MUX_uxn_opcodes_h_l2415_c7_279b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2415_c7_279b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2415_c7_279b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2415_c7_279b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2415_c7_279b_return_output);

-- n16_MUX_uxn_opcodes_h_l2415_c7_279b
n16_MUX_uxn_opcodes_h_l2415_c7_279b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2415_c7_279b_cond,
n16_MUX_uxn_opcodes_h_l2415_c7_279b_iftrue,
n16_MUX_uxn_opcodes_h_l2415_c7_279b_iffalse,
n16_MUX_uxn_opcodes_h_l2415_c7_279b_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2416_c3_3a5e
BIN_OP_OR_uxn_opcodes_h_l2416_c3_3a5e : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2416_c3_3a5e_left,
BIN_OP_OR_uxn_opcodes_h_l2416_c3_3a5e_right,
BIN_OP_OR_uxn_opcodes_h_l2416_c3_3a5e_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2418_c30_8a81
sp_relative_shift_uxn_opcodes_h_l2418_c30_8a81 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2418_c30_8a81_ins,
sp_relative_shift_uxn_opcodes_h_l2418_c30_8a81_x,
sp_relative_shift_uxn_opcodes_h_l2418_c30_8a81_y,
sp_relative_shift_uxn_opcodes_h_l2418_c30_8a81_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2419_c20_8cd0
BIN_OP_AND_uxn_opcodes_h_l2419_c20_8cd0 : entity work.BIN_OP_AND_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2419_c20_8cd0_left,
BIN_OP_AND_uxn_opcodes_h_l2419_c20_8cd0_right,
BIN_OP_AND_uxn_opcodes_h_l2419_c20_8cd0_return_output);

-- BIN_OP_SR_uxn_opcodes_h_l2419_c12_92d6
BIN_OP_SR_uxn_opcodes_h_l2419_c12_92d6 : entity work.BIN_OP_SR_uint16_t_uint8_t_0CLK_295015b8 port map (
BIN_OP_SR_uxn_opcodes_h_l2419_c12_92d6_left,
BIN_OP_SR_uxn_opcodes_h_l2419_c12_92d6_right,
BIN_OP_SR_uxn_opcodes_h_l2419_c12_92d6_return_output);

-- CONST_SR_4_uxn_opcodes_h_l2419_c36_2e67
CONST_SR_4_uxn_opcodes_h_l2419_c36_2e67 : entity work.CONST_SR_4_uint8_t_0CLK_de264c78 port map (
CONST_SR_4_uxn_opcodes_h_l2419_c36_2e67_x,
CONST_SR_4_uxn_opcodes_h_l2419_c36_2e67_return_output);

-- BIN_OP_SL_uxn_opcodes_h_l2419_c12_83b9
BIN_OP_SL_uxn_opcodes_h_l2419_c12_83b9 : entity work.BIN_OP_SL_uint16_t_uint8_t_0CLK_b6546dec port map (
BIN_OP_SL_uxn_opcodes_h_l2419_c12_83b9_left,
BIN_OP_SL_uxn_opcodes_h_l2419_c12_83b9_right,
BIN_OP_SL_uxn_opcodes_h_l2419_c12_83b9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2424_c11_581b
BIN_OP_EQ_uxn_opcodes_h_l2424_c11_581b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2424_c11_581b_left,
BIN_OP_EQ_uxn_opcodes_h_l2424_c11_581b_right,
BIN_OP_EQ_uxn_opcodes_h_l2424_c11_581b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2424_c7_2442
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2424_c7_2442 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2424_c7_2442_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2424_c7_2442_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2424_c7_2442_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2424_c7_2442_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2424_c7_2442
result_is_sp_shift_MUX_uxn_opcodes_h_l2424_c7_2442 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2424_c7_2442_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2424_c7_2442_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2424_c7_2442_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2424_c7_2442_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2424_c7_2442
result_is_opc_done_MUX_uxn_opcodes_h_l2424_c7_2442 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2424_c7_2442_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2424_c7_2442_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2424_c7_2442_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2424_c7_2442_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2424_c7_2442
result_is_stack_write_MUX_uxn_opcodes_h_l2424_c7_2442 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2424_c7_2442_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2424_c7_2442_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2424_c7_2442_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2424_c7_2442_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2424_c7_2442
result_u8_value_MUX_uxn_opcodes_h_l2424_c7_2442 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2424_c7_2442_cond,
result_u8_value_MUX_uxn_opcodes_h_l2424_c7_2442_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2424_c7_2442_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2424_c7_2442_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2427_c31_77b8
CONST_SR_8_uxn_opcodes_h_l2427_c31_77b8 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2427_c31_77b8_x,
CONST_SR_8_uxn_opcodes_h_l2427_c31_77b8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2429_c11_3d17
BIN_OP_EQ_uxn_opcodes_h_l2429_c11_3d17 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2429_c11_3d17_left,
BIN_OP_EQ_uxn_opcodes_h_l2429_c11_3d17_right,
BIN_OP_EQ_uxn_opcodes_h_l2429_c11_3d17_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2429_c7_1f84
result_is_stack_write_MUX_uxn_opcodes_h_l2429_c7_1f84 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2429_c7_1f84_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2429_c7_1f84_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2429_c7_1f84_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2429_c7_1f84_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2429_c7_1f84
result_is_opc_done_MUX_uxn_opcodes_h_l2429_c7_1f84 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2429_c7_1f84_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2429_c7_1f84_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2429_c7_1f84_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2429_c7_1f84_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t8,
 n16,
 tmp16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l2392_c6_6067_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2392_c1_40f5_return_output,
 tmp16_MUX_uxn_opcodes_h_l2392_c2_6eaa_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2392_c2_6eaa_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2392_c2_6eaa_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2392_c2_6eaa_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2392_c2_6eaa_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2392_c2_6eaa_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2392_c2_6eaa_return_output,
 n16_MUX_uxn_opcodes_h_l2392_c2_6eaa_return_output,
 t8_MUX_uxn_opcodes_h_l2392_c2_6eaa_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2397_c11_3f4e_return_output,
 tmp16_MUX_uxn_opcodes_h_l2397_c7_2903_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_2903_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_2903_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_2903_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_2903_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2397_c7_2903_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2397_c7_2903_return_output,
 n16_MUX_uxn_opcodes_h_l2397_c7_2903_return_output,
 t8_MUX_uxn_opcodes_h_l2397_c7_2903_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2400_c11_e917_return_output,
 tmp16_MUX_uxn_opcodes_h_l2400_c7_34c4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2400_c7_34c4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2400_c7_34c4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2400_c7_34c4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2400_c7_34c4_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2400_c7_34c4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2400_c7_34c4_return_output,
 n16_MUX_uxn_opcodes_h_l2400_c7_34c4_return_output,
 t8_MUX_uxn_opcodes_h_l2400_c7_34c4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2404_c11_b435_return_output,
 tmp16_MUX_uxn_opcodes_h_l2404_c7_29f2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2404_c7_29f2_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2404_c7_29f2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2404_c7_29f2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2404_c7_29f2_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2404_c7_29f2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2404_c7_29f2_return_output,
 n16_MUX_uxn_opcodes_h_l2404_c7_29f2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2407_c11_f63c_return_output,
 tmp16_MUX_uxn_opcodes_h_l2407_c7_45e2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2407_c7_45e2_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2407_c7_45e2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2407_c7_45e2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2407_c7_45e2_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2407_c7_45e2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2407_c7_45e2_return_output,
 n16_MUX_uxn_opcodes_h_l2407_c7_45e2_return_output,
 CONST_SL_8_uxn_opcodes_h_l2409_c3_0716_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2412_c11_2126_return_output,
 tmp16_MUX_uxn_opcodes_h_l2412_c7_d908_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2412_c7_d908_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2412_c7_d908_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2412_c7_d908_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2412_c7_d908_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2412_c7_d908_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2412_c7_d908_return_output,
 n16_MUX_uxn_opcodes_h_l2412_c7_d908_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2415_c11_c839_return_output,
 tmp16_MUX_uxn_opcodes_h_l2415_c7_279b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2415_c7_279b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2415_c7_279b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2415_c7_279b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2415_c7_279b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2415_c7_279b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2415_c7_279b_return_output,
 n16_MUX_uxn_opcodes_h_l2415_c7_279b_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2416_c3_3a5e_return_output,
 sp_relative_shift_uxn_opcodes_h_l2418_c30_8a81_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2419_c20_8cd0_return_output,
 BIN_OP_SR_uxn_opcodes_h_l2419_c12_92d6_return_output,
 CONST_SR_4_uxn_opcodes_h_l2419_c36_2e67_return_output,
 BIN_OP_SL_uxn_opcodes_h_l2419_c12_83b9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2424_c11_581b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2424_c7_2442_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2424_c7_2442_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2424_c7_2442_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2424_c7_2442_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2424_c7_2442_return_output,
 CONST_SR_8_uxn_opcodes_h_l2427_c31_77b8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2429_c11_3d17_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2429_c7_1f84_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2429_c7_1f84_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2392_c6_6067_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2392_c6_6067_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2392_c6_6067_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2392_c1_40f5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2392_c1_40f5_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2392_c1_40f5_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2392_c1_40f5_iffalse : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2392_c2_6eaa_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2392_c2_6eaa_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2397_c7_2903_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2392_c2_6eaa_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2392_c2_6eaa_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2392_c2_6eaa_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2394_c3_9718 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2392_c2_6eaa_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_2903_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2392_c2_6eaa_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2392_c2_6eaa_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2392_c2_6eaa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2392_c2_6eaa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_2903_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2392_c2_6eaa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2392_c2_6eaa_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2392_c2_6eaa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2392_c2_6eaa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_2903_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2392_c2_6eaa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2392_c2_6eaa_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2392_c2_6eaa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2392_c2_6eaa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_2903_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2392_c2_6eaa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2392_c2_6eaa_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2392_c2_6eaa_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2392_c2_6eaa_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2397_c7_2903_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2392_c2_6eaa_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2392_c2_6eaa_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2392_c2_6eaa_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2392_c2_6eaa_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2397_c7_2903_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2392_c2_6eaa_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2392_c2_6eaa_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2392_c2_6eaa_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2392_c2_6eaa_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2397_c7_2903_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2392_c2_6eaa_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2392_c2_6eaa_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2392_c2_6eaa_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2392_c2_6eaa_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2397_c7_2903_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2392_c2_6eaa_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2392_c2_6eaa_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2393_c3_867b_uxn_opcodes_h_l2393_c3_867b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2397_c11_3f4e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2397_c11_3f4e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2397_c11_3f4e_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2397_c7_2903_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2397_c7_2903_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2400_c7_34c4_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2397_c7_2903_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_2903_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2398_c3_b56b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_2903_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2400_c7_34c4_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_2903_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_2903_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_2903_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2400_c7_34c4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_2903_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_2903_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_2903_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2400_c7_34c4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_2903_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_2903_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_2903_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2400_c7_34c4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_2903_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2397_c7_2903_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2397_c7_2903_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2400_c7_34c4_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2397_c7_2903_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2397_c7_2903_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2397_c7_2903_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2400_c7_34c4_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2397_c7_2903_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2397_c7_2903_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2397_c7_2903_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2400_c7_34c4_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2397_c7_2903_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2397_c7_2903_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2397_c7_2903_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2400_c7_34c4_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2397_c7_2903_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2400_c11_e917_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2400_c11_e917_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2400_c11_e917_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2400_c7_34c4_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2400_c7_34c4_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2404_c7_29f2_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2400_c7_34c4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2400_c7_34c4_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2402_c3_fcae : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2400_c7_34c4_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2404_c7_29f2_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2400_c7_34c4_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2400_c7_34c4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2400_c7_34c4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2404_c7_29f2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2400_c7_34c4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2400_c7_34c4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2400_c7_34c4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2404_c7_29f2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2400_c7_34c4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2400_c7_34c4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2400_c7_34c4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2404_c7_29f2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2400_c7_34c4_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2400_c7_34c4_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2400_c7_34c4_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2404_c7_29f2_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2400_c7_34c4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2400_c7_34c4_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2400_c7_34c4_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2404_c7_29f2_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2400_c7_34c4_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2400_c7_34c4_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2400_c7_34c4_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2404_c7_29f2_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2400_c7_34c4_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2400_c7_34c4_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2400_c7_34c4_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2400_c7_34c4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2404_c11_b435_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2404_c11_b435_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2404_c11_b435_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2404_c7_29f2_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2404_c7_29f2_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2407_c7_45e2_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2404_c7_29f2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2404_c7_29f2_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2405_c3_db18 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2404_c7_29f2_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2407_c7_45e2_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2404_c7_29f2_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2404_c7_29f2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2404_c7_29f2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2407_c7_45e2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2404_c7_29f2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2404_c7_29f2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2404_c7_29f2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2407_c7_45e2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2404_c7_29f2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2404_c7_29f2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2404_c7_29f2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2407_c7_45e2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2404_c7_29f2_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2404_c7_29f2_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2404_c7_29f2_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2407_c7_45e2_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2404_c7_29f2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2404_c7_29f2_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2404_c7_29f2_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2407_c7_45e2_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2404_c7_29f2_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2404_c7_29f2_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2404_c7_29f2_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2407_c7_45e2_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2404_c7_29f2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2407_c11_f63c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2407_c11_f63c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2407_c11_f63c_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2407_c7_45e2_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2407_c7_45e2_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2412_c7_d908_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2407_c7_45e2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2407_c7_45e2_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2410_c3_f526 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2407_c7_45e2_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2412_c7_d908_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2407_c7_45e2_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2407_c7_45e2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2407_c7_45e2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2412_c7_d908_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2407_c7_45e2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2407_c7_45e2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2407_c7_45e2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2412_c7_d908_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2407_c7_45e2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2407_c7_45e2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2407_c7_45e2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2412_c7_d908_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2407_c7_45e2_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2407_c7_45e2_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2407_c7_45e2_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2412_c7_d908_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2407_c7_45e2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2407_c7_45e2_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2407_c7_45e2_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2412_c7_d908_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2407_c7_45e2_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2407_c7_45e2_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2407_c7_45e2_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2412_c7_d908_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2407_c7_45e2_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2409_c3_0716_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2409_c3_0716_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2412_c11_2126_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2412_c11_2126_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2412_c11_2126_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2412_c7_d908_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2412_c7_d908_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2415_c7_279b_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2412_c7_d908_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2412_c7_d908_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2413_c3_98eb : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2412_c7_d908_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2415_c7_279b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2412_c7_d908_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2412_c7_d908_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2412_c7_d908_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2415_c7_279b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2412_c7_d908_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2412_c7_d908_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2412_c7_d908_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2415_c7_279b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2412_c7_d908_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2412_c7_d908_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2412_c7_d908_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2415_c7_279b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2412_c7_d908_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2412_c7_d908_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2412_c7_d908_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2415_c7_279b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2412_c7_d908_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2412_c7_d908_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2412_c7_d908_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2415_c7_279b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2412_c7_d908_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2412_c7_d908_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2412_c7_d908_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2415_c7_279b_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2412_c7_d908_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2415_c11_c839_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2415_c11_c839_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2415_c11_c839_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2415_c7_279b_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2415_c7_279b_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2415_c7_279b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2415_c7_279b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2421_c3_3006 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2415_c7_279b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2424_c7_2442_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2415_c7_279b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2415_c7_279b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2415_c7_279b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2424_c7_2442_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2415_c7_279b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2415_c7_279b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2415_c7_279b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2424_c7_2442_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2415_c7_279b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2415_c7_279b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2415_c7_279b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2424_c7_2442_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2415_c7_279b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2415_c7_279b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2415_c7_279b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2424_c7_2442_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2415_c7_279b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2415_c7_279b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2415_c7_279b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2415_c7_279b_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2415_c7_279b_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2415_c7_279b_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2415_c7_279b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2416_c3_3a5e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2416_c3_3a5e_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2416_c3_3a5e_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2418_c30_8a81_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2418_c30_8a81_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2418_c30_8a81_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2418_c30_8a81_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l2419_c12_92d6_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2419_c20_8cd0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2419_c20_8cd0_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2419_c20_8cd0_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l2419_c12_92d6_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l2419_c12_92d6_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l2419_c12_83b9_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l2419_c12_83b9_right : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_opcodes_h_l2419_c36_2e67_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_opcodes_h_l2419_c36_2e67_x : unsigned(7 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l2419_c12_83b9_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2422_c21_7cd2_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2424_c11_581b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2424_c11_581b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2424_c11_581b_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2424_c7_2442_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2426_c3_5a88 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2424_c7_2442_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2424_c7_2442_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2424_c7_2442_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2424_c7_2442_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2424_c7_2442_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2424_c7_2442_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2424_c7_2442_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2424_c7_2442_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2429_c7_1f84_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2424_c7_2442_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2424_c7_2442_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2424_c7_2442_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2429_c7_1f84_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2424_c7_2442_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2424_c7_2442_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2424_c7_2442_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2424_c7_2442_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2427_c31_77b8_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2427_c31_77b8_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2427_c21_740f_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2429_c11_3d17_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2429_c11_3d17_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2429_c11_3d17_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2429_c7_1f84_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2429_c7_1f84_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2429_c7_1f84_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2429_c7_1f84_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2429_c7_1f84_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2429_c7_1f84_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2392_l2412_l2407_l2404_l2400_l2397_l2424_DUPLICATE_4165_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2392_l2412_l2407_l2404_l2400_l2429_l2397_l2424_DUPLICATE_185d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2392_l2412_l2407_l2404_l2400_l2397_l2424_DUPLICATE_5e17_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2392_l2415_l2412_l2407_l2404_l2400_l2397_DUPLICATE_8054_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2415_l2412_l2407_l2404_l2400_l2429_l2397_l2424_DUPLICATE_0150_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2416_l2408_DUPLICATE_0576_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_641b_uxn_opcodes_h_l2434_l2387_DUPLICATE_2ac1_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_n16 : unsigned(15 downto 0);
variable REG_VAR_tmp16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_n16 := n16;
  REG_VAR_tmp16 := tmp16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2402_c3_fcae := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2400_c7_34c4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2402_c3_fcae;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2405_c3_db18 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2404_c7_29f2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2405_c3_db18;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2392_c2_6eaa_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2424_c11_581b_right := to_unsigned(7, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l2418_c30_8a81_y := resize(to_signed(-1, 2), 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2398_c3_b56b := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_2903_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2398_c3_b56b;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2426_c3_5a88 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2424_c7_2442_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2426_c3_5a88;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2412_c11_2126_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2421_c3_3006 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2415_c7_279b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2421_c3_3006;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2415_c7_279b_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2415_c11_c839_right := to_unsigned(6, 3);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2392_c1_40f5_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2407_c11_f63c_right := to_unsigned(4, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2429_c7_1f84_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2404_c11_b435_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2394_c3_9718 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2392_c2_6eaa_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2394_c3_9718;
     VAR_sp_relative_shift_uxn_opcodes_h_l2418_c30_8a81_x := signed(std_logic_vector(resize(to_unsigned(3, 2), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2392_c6_6067_right := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2429_c7_1f84_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2424_c7_2442_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2400_c11_e917_right := to_unsigned(2, 2);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2419_c20_8cd0_right := to_unsigned(15, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2397_c11_3f4e_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2410_c3_f526 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2407_c7_45e2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2410_c3_f526;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2429_c11_3d17_right := to_unsigned(8, 4);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2415_c7_279b_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2413_c3_98eb := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2412_c7_d908_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2413_c3_98eb;

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2392_c1_40f5_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l2418_c30_8a81_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2416_c3_3a5e_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2392_c2_6eaa_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2397_c7_2903_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2400_c7_34c4_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2404_c7_29f2_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2412_c7_d908_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2415_c7_279b_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2392_c6_6067_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2397_c11_3f4e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2400_c11_e917_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2404_c11_b435_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2407_c11_f63c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2412_c11_2126_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2415_c11_c839_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2424_c11_581b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2429_c11_3d17_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l2400_c7_34c4_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2419_c20_8cd0_left := t8;
     VAR_CONST_SR_4_uxn_opcodes_h_l2419_c36_2e67_x := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2392_c2_6eaa_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2397_c7_2903_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2400_c7_34c4_iffalse := t8;
     VAR_CONST_SR_8_uxn_opcodes_h_l2427_c31_77b8_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2392_c2_6eaa_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2397_c7_2903_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2400_c7_34c4_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2404_c7_29f2_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2407_c7_45e2_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2412_c7_d908_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2415_c7_279b_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l2415_c11_c839] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2415_c11_c839_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2415_c11_c839_left;
     BIN_OP_EQ_uxn_opcodes_h_l2415_c11_c839_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2415_c11_c839_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2415_c11_c839_return_output := BIN_OP_EQ_uxn_opcodes_h_l2415_c11_c839_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2400_c11_e917] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2400_c11_e917_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2400_c11_e917_left;
     BIN_OP_EQ_uxn_opcodes_h_l2400_c11_e917_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2400_c11_e917_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2400_c11_e917_return_output := BIN_OP_EQ_uxn_opcodes_h_l2400_c11_e917_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2416_l2408_DUPLICATE_0576 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2416_l2408_DUPLICATE_0576_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2415_l2412_l2407_l2404_l2400_l2429_l2397_l2424_DUPLICATE_0150 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2415_l2412_l2407_l2404_l2400_l2429_l2397_l2424_DUPLICATE_0150_return_output := result.is_opc_done;

     -- sp_relative_shift[uxn_opcodes_h_l2418_c30_8a81] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2418_c30_8a81_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2418_c30_8a81_ins;
     sp_relative_shift_uxn_opcodes_h_l2418_c30_8a81_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2418_c30_8a81_x;
     sp_relative_shift_uxn_opcodes_h_l2418_c30_8a81_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2418_c30_8a81_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2418_c30_8a81_return_output := sp_relative_shift_uxn_opcodes_h_l2418_c30_8a81_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2412_c11_2126] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2412_c11_2126_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2412_c11_2126_left;
     BIN_OP_EQ_uxn_opcodes_h_l2412_c11_2126_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2412_c11_2126_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2412_c11_2126_return_output := BIN_OP_EQ_uxn_opcodes_h_l2412_c11_2126_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2429_c11_3d17] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2429_c11_3d17_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2429_c11_3d17_left;
     BIN_OP_EQ_uxn_opcodes_h_l2429_c11_3d17_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2429_c11_3d17_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2429_c11_3d17_return_output := BIN_OP_EQ_uxn_opcodes_h_l2429_c11_3d17_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2392_c6_6067] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2392_c6_6067_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2392_c6_6067_left;
     BIN_OP_EQ_uxn_opcodes_h_l2392_c6_6067_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2392_c6_6067_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2392_c6_6067_return_output := BIN_OP_EQ_uxn_opcodes_h_l2392_c6_6067_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2407_c11_f63c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2407_c11_f63c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2407_c11_f63c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2407_c11_f63c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2407_c11_f63c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2407_c11_f63c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2407_c11_f63c_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2424_c7_2442] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2424_c7_2442_return_output := result.stack_address_sp_offset;

     -- CONST_SR_8[uxn_opcodes_h_l2427_c31_77b8] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2427_c31_77b8_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2427_c31_77b8_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2427_c31_77b8_return_output := CONST_SR_8_uxn_opcodes_h_l2427_c31_77b8_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2392_l2412_l2407_l2404_l2400_l2397_l2424_DUPLICATE_5e17 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2392_l2412_l2407_l2404_l2400_l2397_l2424_DUPLICATE_5e17_return_output := result.u8_value;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2392_l2415_l2412_l2407_l2404_l2400_l2397_DUPLICATE_8054 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2392_l2415_l2412_l2407_l2404_l2400_l2397_DUPLICATE_8054_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2424_c11_581b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2424_c11_581b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2424_c11_581b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2424_c11_581b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2424_c11_581b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2424_c11_581b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2424_c11_581b_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2392_l2412_l2407_l2404_l2400_l2429_l2397_l2424_DUPLICATE_185d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2392_l2412_l2407_l2404_l2400_l2429_l2397_l2424_DUPLICATE_185d_return_output := result.is_stack_write;

     -- CONST_SR_4[uxn_opcodes_h_l2419_c36_2e67] LATENCY=0
     -- Inputs
     CONST_SR_4_uxn_opcodes_h_l2419_c36_2e67_x <= VAR_CONST_SR_4_uxn_opcodes_h_l2419_c36_2e67_x;
     -- Outputs
     VAR_CONST_SR_4_uxn_opcodes_h_l2419_c36_2e67_return_output := CONST_SR_4_uxn_opcodes_h_l2419_c36_2e67_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2392_l2412_l2407_l2404_l2400_l2397_l2424_DUPLICATE_4165 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2392_l2412_l2407_l2404_l2400_l2397_l2424_DUPLICATE_4165_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2397_c11_3f4e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2397_c11_3f4e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2397_c11_3f4e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2397_c11_3f4e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2397_c11_3f4e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2397_c11_3f4e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2397_c11_3f4e_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l2419_c20_8cd0] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2419_c20_8cd0_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2419_c20_8cd0_left;
     BIN_OP_AND_uxn_opcodes_h_l2419_c20_8cd0_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2419_c20_8cd0_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2419_c20_8cd0_return_output := BIN_OP_AND_uxn_opcodes_h_l2419_c20_8cd0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2404_c11_b435] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2404_c11_b435_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2404_c11_b435_left;
     BIN_OP_EQ_uxn_opcodes_h_l2404_c11_b435_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2404_c11_b435_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2404_c11_b435_return_output := BIN_OP_EQ_uxn_opcodes_h_l2404_c11_b435_return_output;

     -- Submodule level 1
     VAR_BIN_OP_SR_uxn_opcodes_h_l2419_c12_92d6_right := VAR_BIN_OP_AND_uxn_opcodes_h_l2419_c20_8cd0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2392_c1_40f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2392_c6_6067_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2392_c2_6eaa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2392_c6_6067_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2392_c2_6eaa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2392_c6_6067_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2392_c2_6eaa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2392_c6_6067_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2392_c2_6eaa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2392_c6_6067_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2392_c2_6eaa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2392_c6_6067_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2392_c2_6eaa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2392_c6_6067_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2392_c2_6eaa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2392_c6_6067_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2392_c2_6eaa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2392_c6_6067_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2392_c2_6eaa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2392_c6_6067_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2397_c7_2903_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2397_c11_3f4e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_2903_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2397_c11_3f4e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_2903_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2397_c11_3f4e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_2903_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2397_c11_3f4e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2397_c7_2903_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2397_c11_3f4e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_2903_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2397_c11_3f4e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2397_c7_2903_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2397_c11_3f4e_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2397_c7_2903_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2397_c11_3f4e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2397_c7_2903_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2397_c11_3f4e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2400_c7_34c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2400_c11_e917_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2400_c7_34c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2400_c11_e917_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2400_c7_34c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2400_c11_e917_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2400_c7_34c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2400_c11_e917_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2400_c7_34c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2400_c11_e917_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2400_c7_34c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2400_c11_e917_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2400_c7_34c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2400_c11_e917_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2400_c7_34c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2400_c11_e917_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2400_c7_34c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2400_c11_e917_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2404_c7_29f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2404_c11_b435_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2404_c7_29f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2404_c11_b435_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2404_c7_29f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2404_c11_b435_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2404_c7_29f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2404_c11_b435_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2404_c7_29f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2404_c11_b435_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2404_c7_29f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2404_c11_b435_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2404_c7_29f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2404_c11_b435_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2404_c7_29f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2404_c11_b435_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2407_c7_45e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2407_c11_f63c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2407_c7_45e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2407_c11_f63c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2407_c7_45e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2407_c11_f63c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2407_c7_45e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2407_c11_f63c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2407_c7_45e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2407_c11_f63c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2407_c7_45e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2407_c11_f63c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2407_c7_45e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2407_c11_f63c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2407_c7_45e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2407_c11_f63c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2412_c7_d908_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2412_c11_2126_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2412_c7_d908_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2412_c11_2126_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2412_c7_d908_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2412_c11_2126_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2412_c7_d908_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2412_c11_2126_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2412_c7_d908_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2412_c11_2126_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2412_c7_d908_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2412_c11_2126_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2412_c7_d908_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2412_c11_2126_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2412_c7_d908_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2412_c11_2126_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2415_c7_279b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2415_c11_c839_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2415_c7_279b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2415_c11_c839_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2415_c7_279b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2415_c11_c839_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2415_c7_279b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2415_c11_c839_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2415_c7_279b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2415_c11_c839_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2415_c7_279b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2415_c11_c839_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2415_c7_279b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2415_c11_c839_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2415_c7_279b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2415_c11_c839_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2424_c7_2442_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2424_c11_581b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2424_c7_2442_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2424_c11_581b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2424_c7_2442_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2424_c11_581b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2424_c7_2442_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2424_c11_581b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2424_c7_2442_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2424_c11_581b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2429_c7_1f84_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2429_c11_3d17_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2429_c7_1f84_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2429_c11_3d17_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2416_c3_3a5e_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2416_l2408_DUPLICATE_0576_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l2409_c3_0716_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2416_l2408_DUPLICATE_0576_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2392_c2_6eaa_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2392_l2415_l2412_l2407_l2404_l2400_l2397_DUPLICATE_8054_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2397_c7_2903_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2392_l2415_l2412_l2407_l2404_l2400_l2397_DUPLICATE_8054_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2400_c7_34c4_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2392_l2415_l2412_l2407_l2404_l2400_l2397_DUPLICATE_8054_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2404_c7_29f2_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2392_l2415_l2412_l2407_l2404_l2400_l2397_DUPLICATE_8054_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2407_c7_45e2_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2392_l2415_l2412_l2407_l2404_l2400_l2397_DUPLICATE_8054_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2412_c7_d908_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2392_l2415_l2412_l2407_l2404_l2400_l2397_DUPLICATE_8054_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2415_c7_279b_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2392_l2415_l2412_l2407_l2404_l2400_l2397_DUPLICATE_8054_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_2903_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2415_l2412_l2407_l2404_l2400_l2429_l2397_l2424_DUPLICATE_0150_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2400_c7_34c4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2415_l2412_l2407_l2404_l2400_l2429_l2397_l2424_DUPLICATE_0150_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2404_c7_29f2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2415_l2412_l2407_l2404_l2400_l2429_l2397_l2424_DUPLICATE_0150_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2407_c7_45e2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2415_l2412_l2407_l2404_l2400_l2429_l2397_l2424_DUPLICATE_0150_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2412_c7_d908_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2415_l2412_l2407_l2404_l2400_l2429_l2397_l2424_DUPLICATE_0150_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2415_c7_279b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2415_l2412_l2407_l2404_l2400_l2429_l2397_l2424_DUPLICATE_0150_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2424_c7_2442_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2415_l2412_l2407_l2404_l2400_l2429_l2397_l2424_DUPLICATE_0150_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2429_c7_1f84_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2415_l2412_l2407_l2404_l2400_l2429_l2397_l2424_DUPLICATE_0150_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2392_c2_6eaa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2392_l2412_l2407_l2404_l2400_l2397_l2424_DUPLICATE_4165_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_2903_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2392_l2412_l2407_l2404_l2400_l2397_l2424_DUPLICATE_4165_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2400_c7_34c4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2392_l2412_l2407_l2404_l2400_l2397_l2424_DUPLICATE_4165_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2404_c7_29f2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2392_l2412_l2407_l2404_l2400_l2397_l2424_DUPLICATE_4165_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2407_c7_45e2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2392_l2412_l2407_l2404_l2400_l2397_l2424_DUPLICATE_4165_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2412_c7_d908_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2392_l2412_l2407_l2404_l2400_l2397_l2424_DUPLICATE_4165_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2424_c7_2442_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2392_l2412_l2407_l2404_l2400_l2397_l2424_DUPLICATE_4165_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2392_c2_6eaa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2392_l2412_l2407_l2404_l2400_l2429_l2397_l2424_DUPLICATE_185d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_2903_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2392_l2412_l2407_l2404_l2400_l2429_l2397_l2424_DUPLICATE_185d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2400_c7_34c4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2392_l2412_l2407_l2404_l2400_l2429_l2397_l2424_DUPLICATE_185d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2404_c7_29f2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2392_l2412_l2407_l2404_l2400_l2429_l2397_l2424_DUPLICATE_185d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2407_c7_45e2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2392_l2412_l2407_l2404_l2400_l2429_l2397_l2424_DUPLICATE_185d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2412_c7_d908_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2392_l2412_l2407_l2404_l2400_l2429_l2397_l2424_DUPLICATE_185d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2424_c7_2442_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2392_l2412_l2407_l2404_l2400_l2429_l2397_l2424_DUPLICATE_185d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2429_c7_1f84_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2392_l2412_l2407_l2404_l2400_l2429_l2397_l2424_DUPLICATE_185d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2392_c2_6eaa_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2392_l2412_l2407_l2404_l2400_l2397_l2424_DUPLICATE_5e17_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2397_c7_2903_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2392_l2412_l2407_l2404_l2400_l2397_l2424_DUPLICATE_5e17_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2400_c7_34c4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2392_l2412_l2407_l2404_l2400_l2397_l2424_DUPLICATE_5e17_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2404_c7_29f2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2392_l2412_l2407_l2404_l2400_l2397_l2424_DUPLICATE_5e17_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2407_c7_45e2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2392_l2412_l2407_l2404_l2400_l2397_l2424_DUPLICATE_5e17_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2412_c7_d908_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2392_l2412_l2407_l2404_l2400_l2397_l2424_DUPLICATE_5e17_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2424_c7_2442_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2392_l2412_l2407_l2404_l2400_l2397_l2424_DUPLICATE_5e17_return_output;
     VAR_BIN_OP_SL_uxn_opcodes_h_l2419_c12_83b9_right := VAR_CONST_SR_4_uxn_opcodes_h_l2419_c36_2e67_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2424_c7_2442_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2424_c7_2442_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2415_c7_279b_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2418_c30_8a81_return_output;
     -- BIN_OP_OR[uxn_opcodes_h_l2416_c3_3a5e] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2416_c3_3a5e_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2416_c3_3a5e_left;
     BIN_OP_OR_uxn_opcodes_h_l2416_c3_3a5e_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2416_c3_3a5e_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2416_c3_3a5e_return_output := BIN_OP_OR_uxn_opcodes_h_l2416_c3_3a5e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2424_c7_2442] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2424_c7_2442_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2424_c7_2442_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2424_c7_2442_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2424_c7_2442_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2424_c7_2442_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2424_c7_2442_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2424_c7_2442_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2424_c7_2442_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2427_c21_740f] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2427_c21_740f_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2427_c31_77b8_return_output);

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2429_c7_1f84] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2429_c7_1f84_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2429_c7_1f84_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2429_c7_1f84_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2429_c7_1f84_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2429_c7_1f84_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2429_c7_1f84_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2429_c7_1f84_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2429_c7_1f84_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2392_c1_40f5] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2392_c1_40f5_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2392_c1_40f5_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2392_c1_40f5_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2392_c1_40f5_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2392_c1_40f5_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2392_c1_40f5_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2392_c1_40f5_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2392_c1_40f5_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l2409_c3_0716] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l2409_c3_0716_x <= VAR_CONST_SL_8_uxn_opcodes_h_l2409_c3_0716_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l2409_c3_0716_return_output := CONST_SL_8_uxn_opcodes_h_l2409_c3_0716_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2424_c7_2442] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2424_c7_2442_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2424_c7_2442_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2424_c7_2442_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2424_c7_2442_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2424_c7_2442_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2424_c7_2442_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2424_c7_2442_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2424_c7_2442_return_output;

     -- t8_MUX[uxn_opcodes_h_l2400_c7_34c4] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2400_c7_34c4_cond <= VAR_t8_MUX_uxn_opcodes_h_l2400_c7_34c4_cond;
     t8_MUX_uxn_opcodes_h_l2400_c7_34c4_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2400_c7_34c4_iftrue;
     t8_MUX_uxn_opcodes_h_l2400_c7_34c4_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2400_c7_34c4_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2400_c7_34c4_return_output := t8_MUX_uxn_opcodes_h_l2400_c7_34c4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2415_c7_279b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2415_c7_279b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2415_c7_279b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2415_c7_279b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2415_c7_279b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2415_c7_279b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2415_c7_279b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2415_c7_279b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2415_c7_279b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2429_c7_1f84] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2429_c7_1f84_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2429_c7_1f84_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2429_c7_1f84_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2429_c7_1f84_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2429_c7_1f84_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2429_c7_1f84_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2429_c7_1f84_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2429_c7_1f84_return_output;

     -- Submodule level 2
     VAR_BIN_OP_SR_uxn_opcodes_h_l2419_c12_92d6_left := VAR_BIN_OP_OR_uxn_opcodes_h_l2416_c3_3a5e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2415_c7_279b_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2416_c3_3a5e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2424_c7_2442_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2427_c21_740f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2407_c7_45e2_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l2409_c3_0716_return_output;
     VAR_printf_uxn_opcodes_h_l2393_c3_867b_uxn_opcodes_h_l2393_c3_867b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2392_c1_40f5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2424_c7_2442_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2429_c7_1f84_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2415_c7_279b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2424_c7_2442_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2424_c7_2442_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2429_c7_1f84_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2412_c7_d908_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2415_c7_279b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2415_c7_279b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2424_c7_2442_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2397_c7_2903_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2400_c7_34c4_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2424_c7_2442] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2424_c7_2442_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2424_c7_2442_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2424_c7_2442_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2424_c7_2442_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2424_c7_2442_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2424_c7_2442_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2424_c7_2442_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2424_c7_2442_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2415_c7_279b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2415_c7_279b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2415_c7_279b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2415_c7_279b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2415_c7_279b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2415_c7_279b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2415_c7_279b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2415_c7_279b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2415_c7_279b_return_output;

     -- t8_MUX[uxn_opcodes_h_l2397_c7_2903] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2397_c7_2903_cond <= VAR_t8_MUX_uxn_opcodes_h_l2397_c7_2903_cond;
     t8_MUX_uxn_opcodes_h_l2397_c7_2903_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2397_c7_2903_iftrue;
     t8_MUX_uxn_opcodes_h_l2397_c7_2903_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2397_c7_2903_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2397_c7_2903_return_output := t8_MUX_uxn_opcodes_h_l2397_c7_2903_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2412_c7_d908] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2412_c7_d908_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2412_c7_d908_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2412_c7_d908_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2412_c7_d908_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2412_c7_d908_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2412_c7_d908_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2412_c7_d908_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2412_c7_d908_return_output;

     -- printf_uxn_opcodes_h_l2393_c3_867b[uxn_opcodes_h_l2393_c3_867b] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2393_c3_867b_uxn_opcodes_h_l2393_c3_867b_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2393_c3_867b_uxn_opcodes_h_l2393_c3_867b_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- n16_MUX[uxn_opcodes_h_l2415_c7_279b] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2415_c7_279b_cond <= VAR_n16_MUX_uxn_opcodes_h_l2415_c7_279b_cond;
     n16_MUX_uxn_opcodes_h_l2415_c7_279b_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2415_c7_279b_iftrue;
     n16_MUX_uxn_opcodes_h_l2415_c7_279b_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2415_c7_279b_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2415_c7_279b_return_output := n16_MUX_uxn_opcodes_h_l2415_c7_279b_return_output;

     -- BIN_OP_SR[uxn_opcodes_h_l2419_c12_92d6] LATENCY=0
     -- Inputs
     BIN_OP_SR_uxn_opcodes_h_l2419_c12_92d6_left <= VAR_BIN_OP_SR_uxn_opcodes_h_l2419_c12_92d6_left;
     BIN_OP_SR_uxn_opcodes_h_l2419_c12_92d6_right <= VAR_BIN_OP_SR_uxn_opcodes_h_l2419_c12_92d6_right;
     -- Outputs
     VAR_BIN_OP_SR_uxn_opcodes_h_l2419_c12_92d6_return_output := BIN_OP_SR_uxn_opcodes_h_l2419_c12_92d6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2424_c7_2442] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2424_c7_2442_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2424_c7_2442_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2424_c7_2442_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2424_c7_2442_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2424_c7_2442_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2424_c7_2442_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2424_c7_2442_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2424_c7_2442_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2424_c7_2442] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2424_c7_2442_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2424_c7_2442_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2424_c7_2442_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2424_c7_2442_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2424_c7_2442_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2424_c7_2442_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2424_c7_2442_return_output := result_u8_value_MUX_uxn_opcodes_h_l2424_c7_2442_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2415_c7_279b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2415_c7_279b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2415_c7_279b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2415_c7_279b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2415_c7_279b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2415_c7_279b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2415_c7_279b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2415_c7_279b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2415_c7_279b_return_output;

     -- Submodule level 3
     VAR_BIN_OP_SL_uxn_opcodes_h_l2419_c12_83b9_left := VAR_BIN_OP_SR_uxn_opcodes_h_l2419_c12_92d6_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2412_c7_d908_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2415_c7_279b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2415_c7_279b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2424_c7_2442_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2412_c7_d908_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2415_c7_279b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2415_c7_279b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2424_c7_2442_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2407_c7_45e2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2412_c7_d908_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2412_c7_d908_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2415_c7_279b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2415_c7_279b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2424_c7_2442_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2392_c2_6eaa_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2397_c7_2903_return_output;
     -- BIN_OP_SL[uxn_opcodes_h_l2419_c12_83b9] LATENCY=0
     -- Inputs
     BIN_OP_SL_uxn_opcodes_h_l2419_c12_83b9_left <= VAR_BIN_OP_SL_uxn_opcodes_h_l2419_c12_83b9_left;
     BIN_OP_SL_uxn_opcodes_h_l2419_c12_83b9_right <= VAR_BIN_OP_SL_uxn_opcodes_h_l2419_c12_83b9_right;
     -- Outputs
     VAR_BIN_OP_SL_uxn_opcodes_h_l2419_c12_83b9_return_output := BIN_OP_SL_uxn_opcodes_h_l2419_c12_83b9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2407_c7_45e2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2407_c7_45e2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2407_c7_45e2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2407_c7_45e2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2407_c7_45e2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2407_c7_45e2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2407_c7_45e2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2407_c7_45e2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2407_c7_45e2_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2412_c7_d908] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2412_c7_d908_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2412_c7_d908_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2412_c7_d908_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2412_c7_d908_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2412_c7_d908_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2412_c7_d908_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2412_c7_d908_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2412_c7_d908_return_output;

     -- n16_MUX[uxn_opcodes_h_l2412_c7_d908] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2412_c7_d908_cond <= VAR_n16_MUX_uxn_opcodes_h_l2412_c7_d908_cond;
     n16_MUX_uxn_opcodes_h_l2412_c7_d908_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2412_c7_d908_iftrue;
     n16_MUX_uxn_opcodes_h_l2412_c7_d908_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2412_c7_d908_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2412_c7_d908_return_output := n16_MUX_uxn_opcodes_h_l2412_c7_d908_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2412_c7_d908] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2412_c7_d908_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2412_c7_d908_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2412_c7_d908_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2412_c7_d908_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2412_c7_d908_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2412_c7_d908_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2412_c7_d908_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2412_c7_d908_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2415_c7_279b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2415_c7_279b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2415_c7_279b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2415_c7_279b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2415_c7_279b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2415_c7_279b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2415_c7_279b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2415_c7_279b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2415_c7_279b_return_output;

     -- t8_MUX[uxn_opcodes_h_l2392_c2_6eaa] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2392_c2_6eaa_cond <= VAR_t8_MUX_uxn_opcodes_h_l2392_c2_6eaa_cond;
     t8_MUX_uxn_opcodes_h_l2392_c2_6eaa_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2392_c2_6eaa_iftrue;
     t8_MUX_uxn_opcodes_h_l2392_c2_6eaa_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2392_c2_6eaa_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2392_c2_6eaa_return_output := t8_MUX_uxn_opcodes_h_l2392_c2_6eaa_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2415_c7_279b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2415_c7_279b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2415_c7_279b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2415_c7_279b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2415_c7_279b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2415_c7_279b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2415_c7_279b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2415_c7_279b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2415_c7_279b_return_output;

     -- Submodule level 4
     VAR_tmp16_MUX_uxn_opcodes_h_l2415_c7_279b_iftrue := VAR_BIN_OP_SL_uxn_opcodes_h_l2419_c12_83b9_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2407_c7_45e2_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2412_c7_d908_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2412_c7_d908_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2415_c7_279b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2407_c7_45e2_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2412_c7_d908_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2412_c7_d908_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2415_c7_279b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2404_c7_29f2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2407_c7_45e2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2407_c7_45e2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2412_c7_d908_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l2392_c2_6eaa_return_output;
     -- CAST_TO_uint8_t[uxn_opcodes_h_l2422_c21_7cd2] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2422_c21_7cd2_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_SL_uxn_opcodes_h_l2419_c12_83b9_return_output);

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2412_c7_d908] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2412_c7_d908_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2412_c7_d908_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2412_c7_d908_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2412_c7_d908_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2412_c7_d908_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2412_c7_d908_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2412_c7_d908_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2412_c7_d908_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2415_c7_279b] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2415_c7_279b_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2415_c7_279b_cond;
     tmp16_MUX_uxn_opcodes_h_l2415_c7_279b_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2415_c7_279b_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2415_c7_279b_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2415_c7_279b_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2415_c7_279b_return_output := tmp16_MUX_uxn_opcodes_h_l2415_c7_279b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2407_c7_45e2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2407_c7_45e2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2407_c7_45e2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2407_c7_45e2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2407_c7_45e2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2407_c7_45e2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2407_c7_45e2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2407_c7_45e2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2407_c7_45e2_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2407_c7_45e2] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2407_c7_45e2_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2407_c7_45e2_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2407_c7_45e2_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2407_c7_45e2_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2407_c7_45e2_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2407_c7_45e2_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2407_c7_45e2_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2407_c7_45e2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2412_c7_d908] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2412_c7_d908_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2412_c7_d908_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2412_c7_d908_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2412_c7_d908_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2412_c7_d908_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2412_c7_d908_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2412_c7_d908_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2412_c7_d908_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2404_c7_29f2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2404_c7_29f2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2404_c7_29f2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2404_c7_29f2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2404_c7_29f2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2404_c7_29f2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2404_c7_29f2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2404_c7_29f2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2404_c7_29f2_return_output;

     -- n16_MUX[uxn_opcodes_h_l2407_c7_45e2] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2407_c7_45e2_cond <= VAR_n16_MUX_uxn_opcodes_h_l2407_c7_45e2_cond;
     n16_MUX_uxn_opcodes_h_l2407_c7_45e2_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2407_c7_45e2_iftrue;
     n16_MUX_uxn_opcodes_h_l2407_c7_45e2_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2407_c7_45e2_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2407_c7_45e2_return_output := n16_MUX_uxn_opcodes_h_l2407_c7_45e2_return_output;

     -- Submodule level 5
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2415_c7_279b_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2422_c21_7cd2_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2404_c7_29f2_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2407_c7_45e2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2407_c7_45e2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2412_c7_d908_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2404_c7_29f2_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2407_c7_45e2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2407_c7_45e2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2412_c7_d908_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2400_c7_34c4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2404_c7_29f2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2404_c7_29f2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2407_c7_45e2_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2412_c7_d908_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2415_c7_279b_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2404_c7_29f2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2404_c7_29f2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2404_c7_29f2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2404_c7_29f2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2404_c7_29f2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2404_c7_29f2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2404_c7_29f2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2404_c7_29f2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2404_c7_29f2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2407_c7_45e2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2407_c7_45e2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2407_c7_45e2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2407_c7_45e2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2407_c7_45e2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2407_c7_45e2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2407_c7_45e2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2407_c7_45e2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2407_c7_45e2_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2412_c7_d908] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2412_c7_d908_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2412_c7_d908_cond;
     tmp16_MUX_uxn_opcodes_h_l2412_c7_d908_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2412_c7_d908_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2412_c7_d908_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2412_c7_d908_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2412_c7_d908_return_output := tmp16_MUX_uxn_opcodes_h_l2412_c7_d908_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2415_c7_279b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2415_c7_279b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2415_c7_279b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2415_c7_279b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2415_c7_279b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2415_c7_279b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2415_c7_279b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2415_c7_279b_return_output := result_u8_value_MUX_uxn_opcodes_h_l2415_c7_279b_return_output;

     -- n16_MUX[uxn_opcodes_h_l2404_c7_29f2] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2404_c7_29f2_cond <= VAR_n16_MUX_uxn_opcodes_h_l2404_c7_29f2_cond;
     n16_MUX_uxn_opcodes_h_l2404_c7_29f2_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2404_c7_29f2_iftrue;
     n16_MUX_uxn_opcodes_h_l2404_c7_29f2_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2404_c7_29f2_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2404_c7_29f2_return_output := n16_MUX_uxn_opcodes_h_l2404_c7_29f2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2407_c7_45e2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2407_c7_45e2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2407_c7_45e2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2407_c7_45e2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2407_c7_45e2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2407_c7_45e2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2407_c7_45e2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2407_c7_45e2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2407_c7_45e2_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2404_c7_29f2] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2404_c7_29f2_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2404_c7_29f2_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2404_c7_29f2_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2404_c7_29f2_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2404_c7_29f2_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2404_c7_29f2_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2404_c7_29f2_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2404_c7_29f2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2400_c7_34c4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2400_c7_34c4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2400_c7_34c4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2400_c7_34c4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2400_c7_34c4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2400_c7_34c4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2400_c7_34c4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2400_c7_34c4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2400_c7_34c4_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2400_c7_34c4_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2404_c7_29f2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2404_c7_29f2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2407_c7_45e2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2400_c7_34c4_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2404_c7_29f2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2404_c7_29f2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2407_c7_45e2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2397_c7_2903_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2400_c7_34c4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2400_c7_34c4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2404_c7_29f2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2412_c7_d908_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2415_c7_279b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2407_c7_45e2_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2412_c7_d908_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2400_c7_34c4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2400_c7_34c4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2400_c7_34c4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2400_c7_34c4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2400_c7_34c4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2400_c7_34c4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2400_c7_34c4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2400_c7_34c4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2400_c7_34c4_return_output;

     -- n16_MUX[uxn_opcodes_h_l2400_c7_34c4] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2400_c7_34c4_cond <= VAR_n16_MUX_uxn_opcodes_h_l2400_c7_34c4_cond;
     n16_MUX_uxn_opcodes_h_l2400_c7_34c4_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2400_c7_34c4_iftrue;
     n16_MUX_uxn_opcodes_h_l2400_c7_34c4_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2400_c7_34c4_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2400_c7_34c4_return_output := n16_MUX_uxn_opcodes_h_l2400_c7_34c4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2397_c7_2903] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2397_c7_2903_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2397_c7_2903_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2397_c7_2903_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2397_c7_2903_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2397_c7_2903_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2397_c7_2903_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2397_c7_2903_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2397_c7_2903_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2400_c7_34c4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2400_c7_34c4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2400_c7_34c4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2400_c7_34c4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2400_c7_34c4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2400_c7_34c4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2400_c7_34c4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2400_c7_34c4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2400_c7_34c4_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2412_c7_d908] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2412_c7_d908_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2412_c7_d908_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2412_c7_d908_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2412_c7_d908_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2412_c7_d908_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2412_c7_d908_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2412_c7_d908_return_output := result_u8_value_MUX_uxn_opcodes_h_l2412_c7_d908_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2407_c7_45e2] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2407_c7_45e2_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2407_c7_45e2_cond;
     tmp16_MUX_uxn_opcodes_h_l2407_c7_45e2_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2407_c7_45e2_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2407_c7_45e2_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2407_c7_45e2_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2407_c7_45e2_return_output := tmp16_MUX_uxn_opcodes_h_l2407_c7_45e2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2404_c7_29f2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2404_c7_29f2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2404_c7_29f2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2404_c7_29f2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2404_c7_29f2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2404_c7_29f2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2404_c7_29f2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2404_c7_29f2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2404_c7_29f2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2404_c7_29f2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2404_c7_29f2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2404_c7_29f2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2404_c7_29f2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2404_c7_29f2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2404_c7_29f2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2404_c7_29f2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2404_c7_29f2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2404_c7_29f2_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l2397_c7_2903_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2400_c7_34c4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2400_c7_34c4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2404_c7_29f2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_2903_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2400_c7_34c4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2400_c7_34c4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2404_c7_29f2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2392_c2_6eaa_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2397_c7_2903_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_2903_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2400_c7_34c4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2407_c7_45e2_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2412_c7_d908_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2404_c7_29f2_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2407_c7_45e2_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2400_c7_34c4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2400_c7_34c4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2400_c7_34c4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2400_c7_34c4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2400_c7_34c4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2400_c7_34c4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2400_c7_34c4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2400_c7_34c4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2400_c7_34c4_return_output;

     -- n16_MUX[uxn_opcodes_h_l2397_c7_2903] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2397_c7_2903_cond <= VAR_n16_MUX_uxn_opcodes_h_l2397_c7_2903_cond;
     n16_MUX_uxn_opcodes_h_l2397_c7_2903_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2397_c7_2903_iftrue;
     n16_MUX_uxn_opcodes_h_l2397_c7_2903_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2397_c7_2903_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2397_c7_2903_return_output := n16_MUX_uxn_opcodes_h_l2397_c7_2903_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2392_c2_6eaa] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2392_c2_6eaa_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2392_c2_6eaa_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2392_c2_6eaa_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2392_c2_6eaa_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2392_c2_6eaa_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2392_c2_6eaa_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2392_c2_6eaa_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2392_c2_6eaa_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2400_c7_34c4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2400_c7_34c4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2400_c7_34c4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2400_c7_34c4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2400_c7_34c4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2400_c7_34c4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2400_c7_34c4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2400_c7_34c4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2400_c7_34c4_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2407_c7_45e2] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2407_c7_45e2_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2407_c7_45e2_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2407_c7_45e2_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2407_c7_45e2_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2407_c7_45e2_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2407_c7_45e2_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2407_c7_45e2_return_output := result_u8_value_MUX_uxn_opcodes_h_l2407_c7_45e2_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2404_c7_29f2] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2404_c7_29f2_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2404_c7_29f2_cond;
     tmp16_MUX_uxn_opcodes_h_l2404_c7_29f2_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2404_c7_29f2_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2404_c7_29f2_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2404_c7_29f2_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2404_c7_29f2_return_output := tmp16_MUX_uxn_opcodes_h_l2404_c7_29f2_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2397_c7_2903] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_2903_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_2903_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_2903_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_2903_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_2903_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_2903_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_2903_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_2903_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2397_c7_2903] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_2903_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_2903_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_2903_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_2903_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_2903_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_2903_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_2903_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_2903_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l2392_c2_6eaa_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2397_c7_2903_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_2903_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2400_c7_34c4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2392_c2_6eaa_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_2903_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_2903_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2400_c7_34c4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2392_c2_6eaa_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_2903_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2404_c7_29f2_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2407_c7_45e2_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2400_c7_34c4_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2404_c7_29f2_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2392_c2_6eaa] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2392_c2_6eaa_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2392_c2_6eaa_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2392_c2_6eaa_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2392_c2_6eaa_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2392_c2_6eaa_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2392_c2_6eaa_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2392_c2_6eaa_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2392_c2_6eaa_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2392_c2_6eaa] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2392_c2_6eaa_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2392_c2_6eaa_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2392_c2_6eaa_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2392_c2_6eaa_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2392_c2_6eaa_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2392_c2_6eaa_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2392_c2_6eaa_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2392_c2_6eaa_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2404_c7_29f2] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2404_c7_29f2_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2404_c7_29f2_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2404_c7_29f2_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2404_c7_29f2_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2404_c7_29f2_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2404_c7_29f2_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2404_c7_29f2_return_output := result_u8_value_MUX_uxn_opcodes_h_l2404_c7_29f2_return_output;

     -- n16_MUX[uxn_opcodes_h_l2392_c2_6eaa] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2392_c2_6eaa_cond <= VAR_n16_MUX_uxn_opcodes_h_l2392_c2_6eaa_cond;
     n16_MUX_uxn_opcodes_h_l2392_c2_6eaa_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2392_c2_6eaa_iftrue;
     n16_MUX_uxn_opcodes_h_l2392_c2_6eaa_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2392_c2_6eaa_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2392_c2_6eaa_return_output := n16_MUX_uxn_opcodes_h_l2392_c2_6eaa_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2397_c7_2903] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_2903_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_2903_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_2903_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_2903_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_2903_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_2903_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_2903_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_2903_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2400_c7_34c4] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2400_c7_34c4_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2400_c7_34c4_cond;
     tmp16_MUX_uxn_opcodes_h_l2400_c7_34c4_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2400_c7_34c4_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2400_c7_34c4_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2400_c7_34c4_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2400_c7_34c4_return_output := tmp16_MUX_uxn_opcodes_h_l2400_c7_34c4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2397_c7_2903] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_2903_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_2903_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_2903_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_2903_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_2903_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_2903_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_2903_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_2903_return_output;

     -- Submodule level 9
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2392_c2_6eaa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2392_c2_6eaa_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_2903_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2392_c2_6eaa_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_2903_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2400_c7_34c4_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2404_c7_29f2_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2397_c7_2903_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2400_c7_34c4_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2400_c7_34c4] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2400_c7_34c4_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2400_c7_34c4_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2400_c7_34c4_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2400_c7_34c4_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2400_c7_34c4_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2400_c7_34c4_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2400_c7_34c4_return_output := result_u8_value_MUX_uxn_opcodes_h_l2400_c7_34c4_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2397_c7_2903] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2397_c7_2903_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2397_c7_2903_cond;
     tmp16_MUX_uxn_opcodes_h_l2397_c7_2903_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2397_c7_2903_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2397_c7_2903_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2397_c7_2903_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2397_c7_2903_return_output := tmp16_MUX_uxn_opcodes_h_l2397_c7_2903_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2392_c2_6eaa] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2392_c2_6eaa_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2392_c2_6eaa_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2392_c2_6eaa_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2392_c2_6eaa_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2392_c2_6eaa_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2392_c2_6eaa_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2392_c2_6eaa_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2392_c2_6eaa_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2392_c2_6eaa] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2392_c2_6eaa_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2392_c2_6eaa_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2392_c2_6eaa_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2392_c2_6eaa_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2392_c2_6eaa_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2392_c2_6eaa_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2392_c2_6eaa_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2392_c2_6eaa_return_output;

     -- Submodule level 10
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2397_c7_2903_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2400_c7_34c4_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2392_c2_6eaa_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2397_c7_2903_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2397_c7_2903] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2397_c7_2903_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2397_c7_2903_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2397_c7_2903_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2397_c7_2903_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2397_c7_2903_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2397_c7_2903_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2397_c7_2903_return_output := result_u8_value_MUX_uxn_opcodes_h_l2397_c7_2903_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2392_c2_6eaa] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2392_c2_6eaa_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2392_c2_6eaa_cond;
     tmp16_MUX_uxn_opcodes_h_l2392_c2_6eaa_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2392_c2_6eaa_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2392_c2_6eaa_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2392_c2_6eaa_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2392_c2_6eaa_return_output := tmp16_MUX_uxn_opcodes_h_l2392_c2_6eaa_return_output;

     -- Submodule level 11
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2392_c2_6eaa_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2397_c7_2903_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l2392_c2_6eaa_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2392_c2_6eaa] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2392_c2_6eaa_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2392_c2_6eaa_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2392_c2_6eaa_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2392_c2_6eaa_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2392_c2_6eaa_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2392_c2_6eaa_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2392_c2_6eaa_return_output := result_u8_value_MUX_uxn_opcodes_h_l2392_c2_6eaa_return_output;

     -- Submodule level 12
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_641b_uxn_opcodes_h_l2434_l2387_DUPLICATE_2ac1 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_641b_uxn_opcodes_h_l2434_l2387_DUPLICATE_2ac1_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_641b(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2392_c2_6eaa_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2392_c2_6eaa_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2392_c2_6eaa_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2392_c2_6eaa_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2392_c2_6eaa_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2392_c2_6eaa_return_output);

     -- Submodule level 13
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_641b_uxn_opcodes_h_l2434_l2387_DUPLICATE_2ac1_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_641b_uxn_opcodes_h_l2434_l2387_DUPLICATE_2ac1_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_n16 <= REG_VAR_n16;
REG_COMB_tmp16 <= REG_VAR_tmp16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     n16 <= REG_COMB_n16;
     tmp16 <= REG_COMB_tmp16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
