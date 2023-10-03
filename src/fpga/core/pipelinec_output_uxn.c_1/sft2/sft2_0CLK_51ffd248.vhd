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
-- Submodules: 114
entity sft2_0CLK_51ffd248 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end sft2_0CLK_51ffd248;
architecture arch of sft2_0CLK_51ffd248 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1526_c6_fcc9]
signal BIN_OP_EQ_uxn_opcodes_h_l1526_c6_fcc9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1526_c6_fcc9_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1526_c6_fcc9_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1526_c1_cee7]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1526_c1_cee7_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1526_c1_cee7_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1526_c1_cee7_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1526_c1_cee7_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1526_c2_3a8e]
signal tmp16_MUX_uxn_opcodes_h_l1526_c2_3a8e_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1526_c2_3a8e_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1526_c2_3a8e_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1526_c2_3a8e_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l1526_c2_3a8e]
signal t8_MUX_uxn_opcodes_h_l1526_c2_3a8e_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1526_c2_3a8e_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1526_c2_3a8e_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1526_c2_3a8e_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1526_c2_3a8e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c2_3a8e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c2_3a8e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c2_3a8e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c2_3a8e_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1526_c2_3a8e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c2_3a8e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c2_3a8e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c2_3a8e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c2_3a8e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1526_c2_3a8e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1526_c2_3a8e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1526_c2_3a8e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1526_c2_3a8e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1526_c2_3a8e_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1526_c2_3a8e]
signal result_stack_value_MUX_uxn_opcodes_h_l1526_c2_3a8e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1526_c2_3a8e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1526_c2_3a8e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1526_c2_3a8e_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1526_c2_3a8e]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1526_c2_3a8e_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1526_c2_3a8e_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1526_c2_3a8e_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1526_c2_3a8e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1526_c2_3a8e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1526_c2_3a8e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1526_c2_3a8e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1526_c2_3a8e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1526_c2_3a8e_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1526_c2_3a8e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1526_c2_3a8e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1526_c2_3a8e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1526_c2_3a8e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1526_c2_3a8e_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1526_c2_3a8e]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1526_c2_3a8e_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1526_c2_3a8e_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1526_c2_3a8e_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1526_c2_3a8e_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1526_c2_3a8e]
signal n16_MUX_uxn_opcodes_h_l1526_c2_3a8e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1526_c2_3a8e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1526_c2_3a8e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1526_c2_3a8e_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l1527_c3_e08b[uxn_opcodes_h_l1527_c3_e08b]
signal printf_uxn_opcodes_h_l1527_c3_e08b_uxn_opcodes_h_l1527_c3_e08b_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1532_c11_03e4]
signal BIN_OP_EQ_uxn_opcodes_h_l1532_c11_03e4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1532_c11_03e4_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1532_c11_03e4_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1532_c7_e055]
signal tmp16_MUX_uxn_opcodes_h_l1532_c7_e055_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1532_c7_e055_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1532_c7_e055_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1532_c7_e055_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l1532_c7_e055]
signal t8_MUX_uxn_opcodes_h_l1532_c7_e055_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1532_c7_e055_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1532_c7_e055_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1532_c7_e055_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1532_c7_e055]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1532_c7_e055_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1532_c7_e055_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1532_c7_e055_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1532_c7_e055_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1532_c7_e055]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1532_c7_e055_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1532_c7_e055_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1532_c7_e055_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1532_c7_e055_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1532_c7_e055]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1532_c7_e055_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1532_c7_e055_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1532_c7_e055_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1532_c7_e055_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1532_c7_e055]
signal result_stack_value_MUX_uxn_opcodes_h_l1532_c7_e055_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1532_c7_e055_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1532_c7_e055_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1532_c7_e055_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1532_c7_e055]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1532_c7_e055_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1532_c7_e055_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1532_c7_e055_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1532_c7_e055_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1532_c7_e055]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1532_c7_e055_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1532_c7_e055_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1532_c7_e055_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1532_c7_e055_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1532_c7_e055]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1532_c7_e055_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1532_c7_e055_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1532_c7_e055_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1532_c7_e055_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1532_c7_e055]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1532_c7_e055_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1532_c7_e055_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1532_c7_e055_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1532_c7_e055_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1532_c7_e055]
signal n16_MUX_uxn_opcodes_h_l1532_c7_e055_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1532_c7_e055_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1532_c7_e055_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1532_c7_e055_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1535_c11_d4db]
signal BIN_OP_EQ_uxn_opcodes_h_l1535_c11_d4db_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1535_c11_d4db_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1535_c11_d4db_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1535_c7_233e]
signal tmp16_MUX_uxn_opcodes_h_l1535_c7_233e_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1535_c7_233e_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1535_c7_233e_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1535_c7_233e_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l1535_c7_233e]
signal t8_MUX_uxn_opcodes_h_l1535_c7_233e_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1535_c7_233e_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1535_c7_233e_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1535_c7_233e_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1535_c7_233e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1535_c7_233e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1535_c7_233e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1535_c7_233e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1535_c7_233e_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1535_c7_233e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1535_c7_233e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1535_c7_233e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1535_c7_233e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1535_c7_233e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1535_c7_233e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1535_c7_233e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1535_c7_233e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1535_c7_233e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1535_c7_233e_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1535_c7_233e]
signal result_stack_value_MUX_uxn_opcodes_h_l1535_c7_233e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1535_c7_233e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1535_c7_233e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1535_c7_233e_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1535_c7_233e]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1535_c7_233e_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1535_c7_233e_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1535_c7_233e_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1535_c7_233e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1535_c7_233e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1535_c7_233e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1535_c7_233e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1535_c7_233e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1535_c7_233e_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1535_c7_233e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1535_c7_233e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1535_c7_233e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1535_c7_233e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1535_c7_233e_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1535_c7_233e]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1535_c7_233e_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1535_c7_233e_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1535_c7_233e_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1535_c7_233e_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1535_c7_233e]
signal n16_MUX_uxn_opcodes_h_l1535_c7_233e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1535_c7_233e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1535_c7_233e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1535_c7_233e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1539_c11_12ec]
signal BIN_OP_EQ_uxn_opcodes_h_l1539_c11_12ec_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1539_c11_12ec_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1539_c11_12ec_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1539_c7_76fd]
signal tmp16_MUX_uxn_opcodes_h_l1539_c7_76fd_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1539_c7_76fd_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1539_c7_76fd_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1539_c7_76fd_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1539_c7_76fd]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1539_c7_76fd_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1539_c7_76fd_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1539_c7_76fd_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1539_c7_76fd_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1539_c7_76fd]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1539_c7_76fd_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1539_c7_76fd_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1539_c7_76fd_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1539_c7_76fd_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1539_c7_76fd]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_76fd_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_76fd_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_76fd_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_76fd_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1539_c7_76fd]
signal result_stack_value_MUX_uxn_opcodes_h_l1539_c7_76fd_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1539_c7_76fd_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1539_c7_76fd_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1539_c7_76fd_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1539_c7_76fd]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1539_c7_76fd_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1539_c7_76fd_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1539_c7_76fd_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1539_c7_76fd_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1539_c7_76fd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_76fd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_76fd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_76fd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_76fd_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1539_c7_76fd]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1539_c7_76fd_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1539_c7_76fd_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1539_c7_76fd_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1539_c7_76fd_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1539_c7_76fd]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1539_c7_76fd_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1539_c7_76fd_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1539_c7_76fd_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1539_c7_76fd_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1539_c7_76fd]
signal n16_MUX_uxn_opcodes_h_l1539_c7_76fd_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1539_c7_76fd_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1539_c7_76fd_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1539_c7_76fd_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1542_c11_e5c0]
signal BIN_OP_EQ_uxn_opcodes_h_l1542_c11_e5c0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1542_c11_e5c0_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1542_c11_e5c0_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1542_c7_547b]
signal tmp16_MUX_uxn_opcodes_h_l1542_c7_547b_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1542_c7_547b_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1542_c7_547b_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1542_c7_547b_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1542_c7_547b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1542_c7_547b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1542_c7_547b_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1542_c7_547b_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1542_c7_547b_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1542_c7_547b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1542_c7_547b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1542_c7_547b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1542_c7_547b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1542_c7_547b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1542_c7_547b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1542_c7_547b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1542_c7_547b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1542_c7_547b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1542_c7_547b_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1542_c7_547b]
signal result_stack_value_MUX_uxn_opcodes_h_l1542_c7_547b_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1542_c7_547b_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1542_c7_547b_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1542_c7_547b_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1542_c7_547b]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1542_c7_547b_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1542_c7_547b_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1542_c7_547b_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1542_c7_547b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1542_c7_547b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1542_c7_547b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1542_c7_547b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1542_c7_547b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1542_c7_547b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1542_c7_547b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1542_c7_547b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1542_c7_547b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1542_c7_547b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1542_c7_547b_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1542_c7_547b]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1542_c7_547b_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1542_c7_547b_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1542_c7_547b_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1542_c7_547b_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1542_c7_547b]
signal n16_MUX_uxn_opcodes_h_l1542_c7_547b_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1542_c7_547b_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1542_c7_547b_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1542_c7_547b_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1544_c3_edcb]
signal CONST_SL_8_uxn_opcodes_h_l1544_c3_edcb_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1544_c3_edcb_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1547_c11_e55f]
signal BIN_OP_EQ_uxn_opcodes_h_l1547_c11_e55f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1547_c11_e55f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1547_c11_e55f_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1547_c7_799a]
signal tmp16_MUX_uxn_opcodes_h_l1547_c7_799a_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1547_c7_799a_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1547_c7_799a_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1547_c7_799a_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1547_c7_799a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1547_c7_799a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1547_c7_799a_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1547_c7_799a_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1547_c7_799a_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1547_c7_799a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1547_c7_799a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1547_c7_799a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1547_c7_799a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1547_c7_799a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1547_c7_799a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1547_c7_799a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1547_c7_799a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1547_c7_799a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1547_c7_799a_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1547_c7_799a]
signal result_stack_value_MUX_uxn_opcodes_h_l1547_c7_799a_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1547_c7_799a_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1547_c7_799a_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1547_c7_799a_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1547_c7_799a]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1547_c7_799a_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1547_c7_799a_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1547_c7_799a_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1547_c7_799a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1547_c7_799a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1547_c7_799a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1547_c7_799a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1547_c7_799a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1547_c7_799a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1547_c7_799a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1547_c7_799a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1547_c7_799a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1547_c7_799a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1547_c7_799a_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1547_c7_799a]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1547_c7_799a_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1547_c7_799a_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1547_c7_799a_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1547_c7_799a_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1547_c7_799a]
signal n16_MUX_uxn_opcodes_h_l1547_c7_799a_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1547_c7_799a_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1547_c7_799a_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1547_c7_799a_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1550_c11_d269]
signal BIN_OP_EQ_uxn_opcodes_h_l1550_c11_d269_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1550_c11_d269_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1550_c11_d269_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1550_c7_3c2d]
signal tmp16_MUX_uxn_opcodes_h_l1550_c7_3c2d_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1550_c7_3c2d_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1550_c7_3c2d_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1550_c7_3c2d_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1550_c7_3c2d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1550_c7_3c2d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1550_c7_3c2d_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1550_c7_3c2d_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1550_c7_3c2d_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1550_c7_3c2d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1550_c7_3c2d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1550_c7_3c2d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1550_c7_3c2d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1550_c7_3c2d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1550_c7_3c2d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1550_c7_3c2d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1550_c7_3c2d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1550_c7_3c2d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1550_c7_3c2d_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1550_c7_3c2d]
signal result_stack_value_MUX_uxn_opcodes_h_l1550_c7_3c2d_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1550_c7_3c2d_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1550_c7_3c2d_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1550_c7_3c2d_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1550_c7_3c2d]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1550_c7_3c2d_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1550_c7_3c2d_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1550_c7_3c2d_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1550_c7_3c2d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1550_c7_3c2d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1550_c7_3c2d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1550_c7_3c2d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1550_c7_3c2d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1550_c7_3c2d_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1550_c7_3c2d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1550_c7_3c2d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1550_c7_3c2d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1550_c7_3c2d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1550_c7_3c2d_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1550_c7_3c2d]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1550_c7_3c2d_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1550_c7_3c2d_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1550_c7_3c2d_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1550_c7_3c2d_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1550_c7_3c2d]
signal n16_MUX_uxn_opcodes_h_l1550_c7_3c2d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1550_c7_3c2d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1550_c7_3c2d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1550_c7_3c2d_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1551_c3_eb87]
signal BIN_OP_OR_uxn_opcodes_h_l1551_c3_eb87_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1551_c3_eb87_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1551_c3_eb87_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1554_c32_11d7]
signal BIN_OP_AND_uxn_opcodes_h_l1554_c32_11d7_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1554_c32_11d7_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1554_c32_11d7_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1554_c32_c26d]
signal BIN_OP_GT_uxn_opcodes_h_l1554_c32_c26d_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1554_c32_c26d_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1554_c32_c26d_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1554_c32_34b5]
signal MUX_uxn_opcodes_h_l1554_c32_34b5_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1554_c32_34b5_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1554_c32_34b5_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1554_c32_34b5_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1556_c11_67f6]
signal BIN_OP_EQ_uxn_opcodes_h_l1556_c11_67f6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1556_c11_67f6_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1556_c11_67f6_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1556_c7_ab19]
signal tmp16_MUX_uxn_opcodes_h_l1556_c7_ab19_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1556_c7_ab19_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1556_c7_ab19_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1556_c7_ab19_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1556_c7_ab19]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1556_c7_ab19_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1556_c7_ab19_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1556_c7_ab19_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1556_c7_ab19_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1556_c7_ab19]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1556_c7_ab19_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1556_c7_ab19_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1556_c7_ab19_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1556_c7_ab19_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1556_c7_ab19]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1556_c7_ab19_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1556_c7_ab19_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1556_c7_ab19_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1556_c7_ab19_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1556_c7_ab19]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1556_c7_ab19_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1556_c7_ab19_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1556_c7_ab19_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1556_c7_ab19_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1556_c7_ab19]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1556_c7_ab19_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1556_c7_ab19_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1556_c7_ab19_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1556_c7_ab19_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1556_c7_ab19]
signal result_stack_value_MUX_uxn_opcodes_h_l1556_c7_ab19_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1556_c7_ab19_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1556_c7_ab19_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1556_c7_ab19_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1557_c20_31c0]
signal BIN_OP_AND_uxn_opcodes_h_l1557_c20_31c0_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1557_c20_31c0_right : unsigned(3 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1557_c20_31c0_return_output : unsigned(7 downto 0);

-- BIN_OP_SR[uxn_opcodes_h_l1557_c12_48ae]
signal BIN_OP_SR_uxn_opcodes_h_l1557_c12_48ae_left : unsigned(15 downto 0);
signal BIN_OP_SR_uxn_opcodes_h_l1557_c12_48ae_right : unsigned(7 downto 0);
signal BIN_OP_SR_uxn_opcodes_h_l1557_c12_48ae_return_output : unsigned(15 downto 0);

-- CONST_SR_4[uxn_opcodes_h_l1557_c36_b0cb]
signal CONST_SR_4_uxn_opcodes_h_l1557_c36_b0cb_x : unsigned(7 downto 0);
signal CONST_SR_4_uxn_opcodes_h_l1557_c36_b0cb_return_output : unsigned(7 downto 0);

-- BIN_OP_SL[uxn_opcodes_h_l1557_c12_faf5]
signal BIN_OP_SL_uxn_opcodes_h_l1557_c12_faf5_left : unsigned(15 downto 0);
signal BIN_OP_SL_uxn_opcodes_h_l1557_c12_faf5_right : unsigned(7 downto 0);
signal BIN_OP_SL_uxn_opcodes_h_l1557_c12_faf5_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1563_c11_e70f]
signal BIN_OP_EQ_uxn_opcodes_h_l1563_c11_e70f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1563_c11_e70f_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1563_c11_e70f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1563_c7_3170]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1563_c7_3170_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1563_c7_3170_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1563_c7_3170_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1563_c7_3170_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1563_c7_3170]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1563_c7_3170_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1563_c7_3170_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1563_c7_3170_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1563_c7_3170_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1563_c7_3170]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1563_c7_3170_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1563_c7_3170_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1563_c7_3170_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1563_c7_3170_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1563_c7_3170]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1563_c7_3170_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1563_c7_3170_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1563_c7_3170_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1563_c7_3170_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1563_c7_3170]
signal result_stack_value_MUX_uxn_opcodes_h_l1563_c7_3170_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1563_c7_3170_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1563_c7_3170_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1563_c7_3170_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1565_c34_fda0]
signal CONST_SR_8_uxn_opcodes_h_l1565_c34_fda0_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1565_c34_fda0_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1567_c11_037d]
signal BIN_OP_EQ_uxn_opcodes_h_l1567_c11_037d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1567_c11_037d_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1567_c11_037d_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1567_c7_19d9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1567_c7_19d9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1567_c7_19d9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1567_c7_19d9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1567_c7_19d9_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1567_c7_19d9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1567_c7_19d9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1567_c7_19d9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1567_c7_19d9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1567_c7_19d9_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1567_c7_19d9]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1567_c7_19d9_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1567_c7_19d9_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1567_c7_19d9_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1567_c7_19d9_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_2866( ref_toks_0 : opcode_result_t;
 ref_toks_1 : signed;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.sp_relative_shift := ref_toks_1;
      base.is_sp_shift := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.stack_value := ref_toks_4;
      base.is_stack_read := ref_toks_5;
      base.is_opc_done := ref_toks_6;
      base.is_stack_write := ref_toks_7;
      base.is_stack_index_flipped := ref_toks_8;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1526_c6_fcc9
BIN_OP_EQ_uxn_opcodes_h_l1526_c6_fcc9 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1526_c6_fcc9_left,
BIN_OP_EQ_uxn_opcodes_h_l1526_c6_fcc9_right,
BIN_OP_EQ_uxn_opcodes_h_l1526_c6_fcc9_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1526_c1_cee7
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1526_c1_cee7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1526_c1_cee7_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1526_c1_cee7_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1526_c1_cee7_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1526_c1_cee7_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1526_c2_3a8e
tmp16_MUX_uxn_opcodes_h_l1526_c2_3a8e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1526_c2_3a8e_cond,
tmp16_MUX_uxn_opcodes_h_l1526_c2_3a8e_iftrue,
tmp16_MUX_uxn_opcodes_h_l1526_c2_3a8e_iffalse,
tmp16_MUX_uxn_opcodes_h_l1526_c2_3a8e_return_output);

-- t8_MUX_uxn_opcodes_h_l1526_c2_3a8e
t8_MUX_uxn_opcodes_h_l1526_c2_3a8e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1526_c2_3a8e_cond,
t8_MUX_uxn_opcodes_h_l1526_c2_3a8e_iftrue,
t8_MUX_uxn_opcodes_h_l1526_c2_3a8e_iffalse,
t8_MUX_uxn_opcodes_h_l1526_c2_3a8e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c2_3a8e
result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c2_3a8e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c2_3a8e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c2_3a8e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c2_3a8e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c2_3a8e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c2_3a8e
result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c2_3a8e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c2_3a8e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c2_3a8e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c2_3a8e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c2_3a8e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1526_c2_3a8e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1526_c2_3a8e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1526_c2_3a8e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1526_c2_3a8e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1526_c2_3a8e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1526_c2_3a8e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1526_c2_3a8e
result_stack_value_MUX_uxn_opcodes_h_l1526_c2_3a8e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1526_c2_3a8e_cond,
result_stack_value_MUX_uxn_opcodes_h_l1526_c2_3a8e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1526_c2_3a8e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1526_c2_3a8e_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1526_c2_3a8e
result_is_stack_read_MUX_uxn_opcodes_h_l1526_c2_3a8e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1526_c2_3a8e_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1526_c2_3a8e_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1526_c2_3a8e_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1526_c2_3a8e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1526_c2_3a8e
result_is_opc_done_MUX_uxn_opcodes_h_l1526_c2_3a8e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1526_c2_3a8e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1526_c2_3a8e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1526_c2_3a8e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1526_c2_3a8e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1526_c2_3a8e
result_is_stack_write_MUX_uxn_opcodes_h_l1526_c2_3a8e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1526_c2_3a8e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1526_c2_3a8e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1526_c2_3a8e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1526_c2_3a8e_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1526_c2_3a8e
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1526_c2_3a8e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1526_c2_3a8e_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1526_c2_3a8e_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1526_c2_3a8e_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1526_c2_3a8e_return_output);

-- n16_MUX_uxn_opcodes_h_l1526_c2_3a8e
n16_MUX_uxn_opcodes_h_l1526_c2_3a8e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1526_c2_3a8e_cond,
n16_MUX_uxn_opcodes_h_l1526_c2_3a8e_iftrue,
n16_MUX_uxn_opcodes_h_l1526_c2_3a8e_iffalse,
n16_MUX_uxn_opcodes_h_l1526_c2_3a8e_return_output);

-- printf_uxn_opcodes_h_l1527_c3_e08b_uxn_opcodes_h_l1527_c3_e08b
printf_uxn_opcodes_h_l1527_c3_e08b_uxn_opcodes_h_l1527_c3_e08b : entity work.printf_uxn_opcodes_h_l1527_c3_e08b_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1527_c3_e08b_uxn_opcodes_h_l1527_c3_e08b_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1532_c11_03e4
BIN_OP_EQ_uxn_opcodes_h_l1532_c11_03e4 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1532_c11_03e4_left,
BIN_OP_EQ_uxn_opcodes_h_l1532_c11_03e4_right,
BIN_OP_EQ_uxn_opcodes_h_l1532_c11_03e4_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1532_c7_e055
tmp16_MUX_uxn_opcodes_h_l1532_c7_e055 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1532_c7_e055_cond,
tmp16_MUX_uxn_opcodes_h_l1532_c7_e055_iftrue,
tmp16_MUX_uxn_opcodes_h_l1532_c7_e055_iffalse,
tmp16_MUX_uxn_opcodes_h_l1532_c7_e055_return_output);

-- t8_MUX_uxn_opcodes_h_l1532_c7_e055
t8_MUX_uxn_opcodes_h_l1532_c7_e055 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1532_c7_e055_cond,
t8_MUX_uxn_opcodes_h_l1532_c7_e055_iftrue,
t8_MUX_uxn_opcodes_h_l1532_c7_e055_iffalse,
t8_MUX_uxn_opcodes_h_l1532_c7_e055_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1532_c7_e055
result_sp_relative_shift_MUX_uxn_opcodes_h_l1532_c7_e055 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1532_c7_e055_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1532_c7_e055_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1532_c7_e055_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1532_c7_e055_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1532_c7_e055
result_is_sp_shift_MUX_uxn_opcodes_h_l1532_c7_e055 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1532_c7_e055_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1532_c7_e055_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1532_c7_e055_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1532_c7_e055_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1532_c7_e055
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1532_c7_e055 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1532_c7_e055_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1532_c7_e055_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1532_c7_e055_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1532_c7_e055_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1532_c7_e055
result_stack_value_MUX_uxn_opcodes_h_l1532_c7_e055 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1532_c7_e055_cond,
result_stack_value_MUX_uxn_opcodes_h_l1532_c7_e055_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1532_c7_e055_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1532_c7_e055_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1532_c7_e055
result_is_stack_read_MUX_uxn_opcodes_h_l1532_c7_e055 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1532_c7_e055_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1532_c7_e055_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1532_c7_e055_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1532_c7_e055_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1532_c7_e055
result_is_opc_done_MUX_uxn_opcodes_h_l1532_c7_e055 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1532_c7_e055_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1532_c7_e055_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1532_c7_e055_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1532_c7_e055_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1532_c7_e055
result_is_stack_write_MUX_uxn_opcodes_h_l1532_c7_e055 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1532_c7_e055_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1532_c7_e055_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1532_c7_e055_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1532_c7_e055_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1532_c7_e055
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1532_c7_e055 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1532_c7_e055_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1532_c7_e055_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1532_c7_e055_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1532_c7_e055_return_output);

-- n16_MUX_uxn_opcodes_h_l1532_c7_e055
n16_MUX_uxn_opcodes_h_l1532_c7_e055 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1532_c7_e055_cond,
n16_MUX_uxn_opcodes_h_l1532_c7_e055_iftrue,
n16_MUX_uxn_opcodes_h_l1532_c7_e055_iffalse,
n16_MUX_uxn_opcodes_h_l1532_c7_e055_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1535_c11_d4db
BIN_OP_EQ_uxn_opcodes_h_l1535_c11_d4db : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1535_c11_d4db_left,
BIN_OP_EQ_uxn_opcodes_h_l1535_c11_d4db_right,
BIN_OP_EQ_uxn_opcodes_h_l1535_c11_d4db_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1535_c7_233e
tmp16_MUX_uxn_opcodes_h_l1535_c7_233e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1535_c7_233e_cond,
tmp16_MUX_uxn_opcodes_h_l1535_c7_233e_iftrue,
tmp16_MUX_uxn_opcodes_h_l1535_c7_233e_iffalse,
tmp16_MUX_uxn_opcodes_h_l1535_c7_233e_return_output);

-- t8_MUX_uxn_opcodes_h_l1535_c7_233e
t8_MUX_uxn_opcodes_h_l1535_c7_233e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1535_c7_233e_cond,
t8_MUX_uxn_opcodes_h_l1535_c7_233e_iftrue,
t8_MUX_uxn_opcodes_h_l1535_c7_233e_iffalse,
t8_MUX_uxn_opcodes_h_l1535_c7_233e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1535_c7_233e
result_sp_relative_shift_MUX_uxn_opcodes_h_l1535_c7_233e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1535_c7_233e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1535_c7_233e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1535_c7_233e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1535_c7_233e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1535_c7_233e
result_is_sp_shift_MUX_uxn_opcodes_h_l1535_c7_233e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1535_c7_233e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1535_c7_233e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1535_c7_233e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1535_c7_233e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1535_c7_233e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1535_c7_233e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1535_c7_233e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1535_c7_233e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1535_c7_233e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1535_c7_233e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1535_c7_233e
result_stack_value_MUX_uxn_opcodes_h_l1535_c7_233e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1535_c7_233e_cond,
result_stack_value_MUX_uxn_opcodes_h_l1535_c7_233e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1535_c7_233e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1535_c7_233e_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1535_c7_233e
result_is_stack_read_MUX_uxn_opcodes_h_l1535_c7_233e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1535_c7_233e_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1535_c7_233e_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1535_c7_233e_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1535_c7_233e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1535_c7_233e
result_is_opc_done_MUX_uxn_opcodes_h_l1535_c7_233e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1535_c7_233e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1535_c7_233e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1535_c7_233e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1535_c7_233e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1535_c7_233e
result_is_stack_write_MUX_uxn_opcodes_h_l1535_c7_233e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1535_c7_233e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1535_c7_233e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1535_c7_233e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1535_c7_233e_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1535_c7_233e
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1535_c7_233e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1535_c7_233e_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1535_c7_233e_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1535_c7_233e_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1535_c7_233e_return_output);

-- n16_MUX_uxn_opcodes_h_l1535_c7_233e
n16_MUX_uxn_opcodes_h_l1535_c7_233e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1535_c7_233e_cond,
n16_MUX_uxn_opcodes_h_l1535_c7_233e_iftrue,
n16_MUX_uxn_opcodes_h_l1535_c7_233e_iffalse,
n16_MUX_uxn_opcodes_h_l1535_c7_233e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1539_c11_12ec
BIN_OP_EQ_uxn_opcodes_h_l1539_c11_12ec : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1539_c11_12ec_left,
BIN_OP_EQ_uxn_opcodes_h_l1539_c11_12ec_right,
BIN_OP_EQ_uxn_opcodes_h_l1539_c11_12ec_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1539_c7_76fd
tmp16_MUX_uxn_opcodes_h_l1539_c7_76fd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1539_c7_76fd_cond,
tmp16_MUX_uxn_opcodes_h_l1539_c7_76fd_iftrue,
tmp16_MUX_uxn_opcodes_h_l1539_c7_76fd_iffalse,
tmp16_MUX_uxn_opcodes_h_l1539_c7_76fd_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1539_c7_76fd
result_sp_relative_shift_MUX_uxn_opcodes_h_l1539_c7_76fd : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1539_c7_76fd_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1539_c7_76fd_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1539_c7_76fd_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1539_c7_76fd_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1539_c7_76fd
result_is_sp_shift_MUX_uxn_opcodes_h_l1539_c7_76fd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1539_c7_76fd_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1539_c7_76fd_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1539_c7_76fd_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1539_c7_76fd_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_76fd
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_76fd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_76fd_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_76fd_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_76fd_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_76fd_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1539_c7_76fd
result_stack_value_MUX_uxn_opcodes_h_l1539_c7_76fd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1539_c7_76fd_cond,
result_stack_value_MUX_uxn_opcodes_h_l1539_c7_76fd_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1539_c7_76fd_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1539_c7_76fd_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1539_c7_76fd
result_is_stack_read_MUX_uxn_opcodes_h_l1539_c7_76fd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1539_c7_76fd_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1539_c7_76fd_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1539_c7_76fd_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1539_c7_76fd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_76fd
result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_76fd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_76fd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_76fd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_76fd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_76fd_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1539_c7_76fd
result_is_stack_write_MUX_uxn_opcodes_h_l1539_c7_76fd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1539_c7_76fd_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1539_c7_76fd_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1539_c7_76fd_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1539_c7_76fd_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1539_c7_76fd
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1539_c7_76fd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1539_c7_76fd_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1539_c7_76fd_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1539_c7_76fd_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1539_c7_76fd_return_output);

-- n16_MUX_uxn_opcodes_h_l1539_c7_76fd
n16_MUX_uxn_opcodes_h_l1539_c7_76fd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1539_c7_76fd_cond,
n16_MUX_uxn_opcodes_h_l1539_c7_76fd_iftrue,
n16_MUX_uxn_opcodes_h_l1539_c7_76fd_iffalse,
n16_MUX_uxn_opcodes_h_l1539_c7_76fd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1542_c11_e5c0
BIN_OP_EQ_uxn_opcodes_h_l1542_c11_e5c0 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1542_c11_e5c0_left,
BIN_OP_EQ_uxn_opcodes_h_l1542_c11_e5c0_right,
BIN_OP_EQ_uxn_opcodes_h_l1542_c11_e5c0_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1542_c7_547b
tmp16_MUX_uxn_opcodes_h_l1542_c7_547b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1542_c7_547b_cond,
tmp16_MUX_uxn_opcodes_h_l1542_c7_547b_iftrue,
tmp16_MUX_uxn_opcodes_h_l1542_c7_547b_iffalse,
tmp16_MUX_uxn_opcodes_h_l1542_c7_547b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1542_c7_547b
result_sp_relative_shift_MUX_uxn_opcodes_h_l1542_c7_547b : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1542_c7_547b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1542_c7_547b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1542_c7_547b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1542_c7_547b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1542_c7_547b
result_is_sp_shift_MUX_uxn_opcodes_h_l1542_c7_547b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1542_c7_547b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1542_c7_547b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1542_c7_547b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1542_c7_547b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1542_c7_547b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1542_c7_547b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1542_c7_547b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1542_c7_547b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1542_c7_547b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1542_c7_547b_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1542_c7_547b
result_stack_value_MUX_uxn_opcodes_h_l1542_c7_547b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1542_c7_547b_cond,
result_stack_value_MUX_uxn_opcodes_h_l1542_c7_547b_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1542_c7_547b_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1542_c7_547b_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1542_c7_547b
result_is_stack_read_MUX_uxn_opcodes_h_l1542_c7_547b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1542_c7_547b_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1542_c7_547b_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1542_c7_547b_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1542_c7_547b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1542_c7_547b
result_is_opc_done_MUX_uxn_opcodes_h_l1542_c7_547b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1542_c7_547b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1542_c7_547b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1542_c7_547b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1542_c7_547b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1542_c7_547b
result_is_stack_write_MUX_uxn_opcodes_h_l1542_c7_547b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1542_c7_547b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1542_c7_547b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1542_c7_547b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1542_c7_547b_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1542_c7_547b
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1542_c7_547b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1542_c7_547b_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1542_c7_547b_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1542_c7_547b_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1542_c7_547b_return_output);

-- n16_MUX_uxn_opcodes_h_l1542_c7_547b
n16_MUX_uxn_opcodes_h_l1542_c7_547b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1542_c7_547b_cond,
n16_MUX_uxn_opcodes_h_l1542_c7_547b_iftrue,
n16_MUX_uxn_opcodes_h_l1542_c7_547b_iffalse,
n16_MUX_uxn_opcodes_h_l1542_c7_547b_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1544_c3_edcb
CONST_SL_8_uxn_opcodes_h_l1544_c3_edcb : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1544_c3_edcb_x,
CONST_SL_8_uxn_opcodes_h_l1544_c3_edcb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1547_c11_e55f
BIN_OP_EQ_uxn_opcodes_h_l1547_c11_e55f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1547_c11_e55f_left,
BIN_OP_EQ_uxn_opcodes_h_l1547_c11_e55f_right,
BIN_OP_EQ_uxn_opcodes_h_l1547_c11_e55f_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1547_c7_799a
tmp16_MUX_uxn_opcodes_h_l1547_c7_799a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1547_c7_799a_cond,
tmp16_MUX_uxn_opcodes_h_l1547_c7_799a_iftrue,
tmp16_MUX_uxn_opcodes_h_l1547_c7_799a_iffalse,
tmp16_MUX_uxn_opcodes_h_l1547_c7_799a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1547_c7_799a
result_sp_relative_shift_MUX_uxn_opcodes_h_l1547_c7_799a : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1547_c7_799a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1547_c7_799a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1547_c7_799a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1547_c7_799a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1547_c7_799a
result_is_sp_shift_MUX_uxn_opcodes_h_l1547_c7_799a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1547_c7_799a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1547_c7_799a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1547_c7_799a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1547_c7_799a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1547_c7_799a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1547_c7_799a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1547_c7_799a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1547_c7_799a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1547_c7_799a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1547_c7_799a_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1547_c7_799a
result_stack_value_MUX_uxn_opcodes_h_l1547_c7_799a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1547_c7_799a_cond,
result_stack_value_MUX_uxn_opcodes_h_l1547_c7_799a_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1547_c7_799a_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1547_c7_799a_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1547_c7_799a
result_is_stack_read_MUX_uxn_opcodes_h_l1547_c7_799a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1547_c7_799a_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1547_c7_799a_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1547_c7_799a_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1547_c7_799a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1547_c7_799a
result_is_opc_done_MUX_uxn_opcodes_h_l1547_c7_799a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1547_c7_799a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1547_c7_799a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1547_c7_799a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1547_c7_799a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1547_c7_799a
result_is_stack_write_MUX_uxn_opcodes_h_l1547_c7_799a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1547_c7_799a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1547_c7_799a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1547_c7_799a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1547_c7_799a_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1547_c7_799a
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1547_c7_799a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1547_c7_799a_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1547_c7_799a_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1547_c7_799a_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1547_c7_799a_return_output);

-- n16_MUX_uxn_opcodes_h_l1547_c7_799a
n16_MUX_uxn_opcodes_h_l1547_c7_799a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1547_c7_799a_cond,
n16_MUX_uxn_opcodes_h_l1547_c7_799a_iftrue,
n16_MUX_uxn_opcodes_h_l1547_c7_799a_iffalse,
n16_MUX_uxn_opcodes_h_l1547_c7_799a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1550_c11_d269
BIN_OP_EQ_uxn_opcodes_h_l1550_c11_d269 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1550_c11_d269_left,
BIN_OP_EQ_uxn_opcodes_h_l1550_c11_d269_right,
BIN_OP_EQ_uxn_opcodes_h_l1550_c11_d269_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1550_c7_3c2d
tmp16_MUX_uxn_opcodes_h_l1550_c7_3c2d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1550_c7_3c2d_cond,
tmp16_MUX_uxn_opcodes_h_l1550_c7_3c2d_iftrue,
tmp16_MUX_uxn_opcodes_h_l1550_c7_3c2d_iffalse,
tmp16_MUX_uxn_opcodes_h_l1550_c7_3c2d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1550_c7_3c2d
result_sp_relative_shift_MUX_uxn_opcodes_h_l1550_c7_3c2d : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1550_c7_3c2d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1550_c7_3c2d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1550_c7_3c2d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1550_c7_3c2d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1550_c7_3c2d
result_is_sp_shift_MUX_uxn_opcodes_h_l1550_c7_3c2d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1550_c7_3c2d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1550_c7_3c2d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1550_c7_3c2d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1550_c7_3c2d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1550_c7_3c2d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1550_c7_3c2d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1550_c7_3c2d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1550_c7_3c2d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1550_c7_3c2d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1550_c7_3c2d_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1550_c7_3c2d
result_stack_value_MUX_uxn_opcodes_h_l1550_c7_3c2d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1550_c7_3c2d_cond,
result_stack_value_MUX_uxn_opcodes_h_l1550_c7_3c2d_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1550_c7_3c2d_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1550_c7_3c2d_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1550_c7_3c2d
result_is_stack_read_MUX_uxn_opcodes_h_l1550_c7_3c2d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1550_c7_3c2d_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1550_c7_3c2d_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1550_c7_3c2d_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1550_c7_3c2d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1550_c7_3c2d
result_is_opc_done_MUX_uxn_opcodes_h_l1550_c7_3c2d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1550_c7_3c2d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1550_c7_3c2d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1550_c7_3c2d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1550_c7_3c2d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1550_c7_3c2d
result_is_stack_write_MUX_uxn_opcodes_h_l1550_c7_3c2d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1550_c7_3c2d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1550_c7_3c2d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1550_c7_3c2d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1550_c7_3c2d_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1550_c7_3c2d
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1550_c7_3c2d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1550_c7_3c2d_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1550_c7_3c2d_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1550_c7_3c2d_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1550_c7_3c2d_return_output);

-- n16_MUX_uxn_opcodes_h_l1550_c7_3c2d
n16_MUX_uxn_opcodes_h_l1550_c7_3c2d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1550_c7_3c2d_cond,
n16_MUX_uxn_opcodes_h_l1550_c7_3c2d_iftrue,
n16_MUX_uxn_opcodes_h_l1550_c7_3c2d_iffalse,
n16_MUX_uxn_opcodes_h_l1550_c7_3c2d_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1551_c3_eb87
BIN_OP_OR_uxn_opcodes_h_l1551_c3_eb87 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1551_c3_eb87_left,
BIN_OP_OR_uxn_opcodes_h_l1551_c3_eb87_right,
BIN_OP_OR_uxn_opcodes_h_l1551_c3_eb87_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1554_c32_11d7
BIN_OP_AND_uxn_opcodes_h_l1554_c32_11d7 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1554_c32_11d7_left,
BIN_OP_AND_uxn_opcodes_h_l1554_c32_11d7_right,
BIN_OP_AND_uxn_opcodes_h_l1554_c32_11d7_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1554_c32_c26d
BIN_OP_GT_uxn_opcodes_h_l1554_c32_c26d : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1554_c32_c26d_left,
BIN_OP_GT_uxn_opcodes_h_l1554_c32_c26d_right,
BIN_OP_GT_uxn_opcodes_h_l1554_c32_c26d_return_output);

-- MUX_uxn_opcodes_h_l1554_c32_34b5
MUX_uxn_opcodes_h_l1554_c32_34b5 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1554_c32_34b5_cond,
MUX_uxn_opcodes_h_l1554_c32_34b5_iftrue,
MUX_uxn_opcodes_h_l1554_c32_34b5_iffalse,
MUX_uxn_opcodes_h_l1554_c32_34b5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1556_c11_67f6
BIN_OP_EQ_uxn_opcodes_h_l1556_c11_67f6 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1556_c11_67f6_left,
BIN_OP_EQ_uxn_opcodes_h_l1556_c11_67f6_right,
BIN_OP_EQ_uxn_opcodes_h_l1556_c11_67f6_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1556_c7_ab19
tmp16_MUX_uxn_opcodes_h_l1556_c7_ab19 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1556_c7_ab19_cond,
tmp16_MUX_uxn_opcodes_h_l1556_c7_ab19_iftrue,
tmp16_MUX_uxn_opcodes_h_l1556_c7_ab19_iffalse,
tmp16_MUX_uxn_opcodes_h_l1556_c7_ab19_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1556_c7_ab19
result_is_stack_write_MUX_uxn_opcodes_h_l1556_c7_ab19 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1556_c7_ab19_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1556_c7_ab19_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1556_c7_ab19_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1556_c7_ab19_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1556_c7_ab19
result_is_opc_done_MUX_uxn_opcodes_h_l1556_c7_ab19 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1556_c7_ab19_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1556_c7_ab19_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1556_c7_ab19_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1556_c7_ab19_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1556_c7_ab19
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1556_c7_ab19 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1556_c7_ab19_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1556_c7_ab19_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1556_c7_ab19_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1556_c7_ab19_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1556_c7_ab19
result_is_sp_shift_MUX_uxn_opcodes_h_l1556_c7_ab19 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1556_c7_ab19_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1556_c7_ab19_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1556_c7_ab19_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1556_c7_ab19_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1556_c7_ab19
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1556_c7_ab19 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1556_c7_ab19_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1556_c7_ab19_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1556_c7_ab19_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1556_c7_ab19_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1556_c7_ab19
result_stack_value_MUX_uxn_opcodes_h_l1556_c7_ab19 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1556_c7_ab19_cond,
result_stack_value_MUX_uxn_opcodes_h_l1556_c7_ab19_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1556_c7_ab19_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1556_c7_ab19_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1557_c20_31c0
BIN_OP_AND_uxn_opcodes_h_l1557_c20_31c0 : entity work.BIN_OP_AND_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1557_c20_31c0_left,
BIN_OP_AND_uxn_opcodes_h_l1557_c20_31c0_right,
BIN_OP_AND_uxn_opcodes_h_l1557_c20_31c0_return_output);

-- BIN_OP_SR_uxn_opcodes_h_l1557_c12_48ae
BIN_OP_SR_uxn_opcodes_h_l1557_c12_48ae : entity work.BIN_OP_SR_uint16_t_uint8_t_0CLK_295015b8 port map (
BIN_OP_SR_uxn_opcodes_h_l1557_c12_48ae_left,
BIN_OP_SR_uxn_opcodes_h_l1557_c12_48ae_right,
BIN_OP_SR_uxn_opcodes_h_l1557_c12_48ae_return_output);

-- CONST_SR_4_uxn_opcodes_h_l1557_c36_b0cb
CONST_SR_4_uxn_opcodes_h_l1557_c36_b0cb : entity work.CONST_SR_4_uint8_t_0CLK_de264c78 port map (
CONST_SR_4_uxn_opcodes_h_l1557_c36_b0cb_x,
CONST_SR_4_uxn_opcodes_h_l1557_c36_b0cb_return_output);

-- BIN_OP_SL_uxn_opcodes_h_l1557_c12_faf5
BIN_OP_SL_uxn_opcodes_h_l1557_c12_faf5 : entity work.BIN_OP_SL_uint16_t_uint8_t_0CLK_b6546dec port map (
BIN_OP_SL_uxn_opcodes_h_l1557_c12_faf5_left,
BIN_OP_SL_uxn_opcodes_h_l1557_c12_faf5_right,
BIN_OP_SL_uxn_opcodes_h_l1557_c12_faf5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1563_c11_e70f
BIN_OP_EQ_uxn_opcodes_h_l1563_c11_e70f : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1563_c11_e70f_left,
BIN_OP_EQ_uxn_opcodes_h_l1563_c11_e70f_right,
BIN_OP_EQ_uxn_opcodes_h_l1563_c11_e70f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1563_c7_3170
result_is_stack_write_MUX_uxn_opcodes_h_l1563_c7_3170 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1563_c7_3170_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1563_c7_3170_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1563_c7_3170_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1563_c7_3170_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1563_c7_3170
result_is_opc_done_MUX_uxn_opcodes_h_l1563_c7_3170 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1563_c7_3170_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1563_c7_3170_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1563_c7_3170_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1563_c7_3170_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1563_c7_3170
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1563_c7_3170 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1563_c7_3170_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1563_c7_3170_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1563_c7_3170_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1563_c7_3170_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1563_c7_3170
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1563_c7_3170 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1563_c7_3170_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1563_c7_3170_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1563_c7_3170_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1563_c7_3170_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1563_c7_3170
result_stack_value_MUX_uxn_opcodes_h_l1563_c7_3170 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1563_c7_3170_cond,
result_stack_value_MUX_uxn_opcodes_h_l1563_c7_3170_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1563_c7_3170_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1563_c7_3170_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1565_c34_fda0
CONST_SR_8_uxn_opcodes_h_l1565_c34_fda0 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1565_c34_fda0_x,
CONST_SR_8_uxn_opcodes_h_l1565_c34_fda0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1567_c11_037d
BIN_OP_EQ_uxn_opcodes_h_l1567_c11_037d : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1567_c11_037d_left,
BIN_OP_EQ_uxn_opcodes_h_l1567_c11_037d_right,
BIN_OP_EQ_uxn_opcodes_h_l1567_c11_037d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1567_c7_19d9
result_is_stack_write_MUX_uxn_opcodes_h_l1567_c7_19d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1567_c7_19d9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1567_c7_19d9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1567_c7_19d9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1567_c7_19d9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1567_c7_19d9
result_is_opc_done_MUX_uxn_opcodes_h_l1567_c7_19d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1567_c7_19d9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1567_c7_19d9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1567_c7_19d9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1567_c7_19d9_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1567_c7_19d9
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1567_c7_19d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1567_c7_19d9_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1567_c7_19d9_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1567_c7_19d9_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1567_c7_19d9_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 pc,
 previous_stack_read,
 previous_ram_read,
 -- Registers
 t8,
 n16,
 tmp16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1526_c6_fcc9_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1526_c1_cee7_return_output,
 tmp16_MUX_uxn_opcodes_h_l1526_c2_3a8e_return_output,
 t8_MUX_uxn_opcodes_h_l1526_c2_3a8e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c2_3a8e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c2_3a8e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1526_c2_3a8e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1526_c2_3a8e_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1526_c2_3a8e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1526_c2_3a8e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1526_c2_3a8e_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1526_c2_3a8e_return_output,
 n16_MUX_uxn_opcodes_h_l1526_c2_3a8e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1532_c11_03e4_return_output,
 tmp16_MUX_uxn_opcodes_h_l1532_c7_e055_return_output,
 t8_MUX_uxn_opcodes_h_l1532_c7_e055_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1532_c7_e055_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1532_c7_e055_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1532_c7_e055_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1532_c7_e055_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1532_c7_e055_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1532_c7_e055_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1532_c7_e055_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1532_c7_e055_return_output,
 n16_MUX_uxn_opcodes_h_l1532_c7_e055_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1535_c11_d4db_return_output,
 tmp16_MUX_uxn_opcodes_h_l1535_c7_233e_return_output,
 t8_MUX_uxn_opcodes_h_l1535_c7_233e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1535_c7_233e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1535_c7_233e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1535_c7_233e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1535_c7_233e_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1535_c7_233e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1535_c7_233e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1535_c7_233e_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1535_c7_233e_return_output,
 n16_MUX_uxn_opcodes_h_l1535_c7_233e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1539_c11_12ec_return_output,
 tmp16_MUX_uxn_opcodes_h_l1539_c7_76fd_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1539_c7_76fd_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1539_c7_76fd_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_76fd_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1539_c7_76fd_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1539_c7_76fd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_76fd_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1539_c7_76fd_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1539_c7_76fd_return_output,
 n16_MUX_uxn_opcodes_h_l1539_c7_76fd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1542_c11_e5c0_return_output,
 tmp16_MUX_uxn_opcodes_h_l1542_c7_547b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1542_c7_547b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1542_c7_547b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1542_c7_547b_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1542_c7_547b_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1542_c7_547b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1542_c7_547b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1542_c7_547b_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1542_c7_547b_return_output,
 n16_MUX_uxn_opcodes_h_l1542_c7_547b_return_output,
 CONST_SL_8_uxn_opcodes_h_l1544_c3_edcb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1547_c11_e55f_return_output,
 tmp16_MUX_uxn_opcodes_h_l1547_c7_799a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1547_c7_799a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1547_c7_799a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1547_c7_799a_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1547_c7_799a_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1547_c7_799a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1547_c7_799a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1547_c7_799a_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1547_c7_799a_return_output,
 n16_MUX_uxn_opcodes_h_l1547_c7_799a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1550_c11_d269_return_output,
 tmp16_MUX_uxn_opcodes_h_l1550_c7_3c2d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1550_c7_3c2d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1550_c7_3c2d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1550_c7_3c2d_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1550_c7_3c2d_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1550_c7_3c2d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1550_c7_3c2d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1550_c7_3c2d_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1550_c7_3c2d_return_output,
 n16_MUX_uxn_opcodes_h_l1550_c7_3c2d_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1551_c3_eb87_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1554_c32_11d7_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1554_c32_c26d_return_output,
 MUX_uxn_opcodes_h_l1554_c32_34b5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1556_c11_67f6_return_output,
 tmp16_MUX_uxn_opcodes_h_l1556_c7_ab19_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1556_c7_ab19_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1556_c7_ab19_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1556_c7_ab19_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1556_c7_ab19_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1556_c7_ab19_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1556_c7_ab19_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1557_c20_31c0_return_output,
 BIN_OP_SR_uxn_opcodes_h_l1557_c12_48ae_return_output,
 CONST_SR_4_uxn_opcodes_h_l1557_c36_b0cb_return_output,
 BIN_OP_SL_uxn_opcodes_h_l1557_c12_faf5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1563_c11_e70f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1563_c7_3170_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1563_c7_3170_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1563_c7_3170_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1563_c7_3170_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1563_c7_3170_return_output,
 CONST_SR_8_uxn_opcodes_h_l1565_c34_fda0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1567_c11_037d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1567_c7_19d9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1567_c7_19d9_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1567_c7_19d9_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1526_c6_fcc9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1526_c6_fcc9_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1526_c6_fcc9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1526_c1_cee7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1526_c1_cee7_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1526_c1_cee7_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1526_c1_cee7_iffalse : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1526_c2_3a8e_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1526_c2_3a8e_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1532_c7_e055_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1526_c2_3a8e_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1526_c2_3a8e_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1526_c2_3a8e_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1526_c2_3a8e_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1532_c7_e055_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1526_c2_3a8e_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1526_c2_3a8e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c2_3a8e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c2_3a8e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1532_c7_e055_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c2_3a8e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c2_3a8e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c2_3a8e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c2_3a8e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1532_c7_e055_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c2_3a8e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c2_3a8e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1526_c2_3a8e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1529_c3_155e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1526_c2_3a8e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1532_c7_e055_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1526_c2_3a8e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1526_c2_3a8e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1526_c2_3a8e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1526_c2_3a8e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1532_c7_e055_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1526_c2_3a8e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1526_c2_3a8e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1526_c2_3a8e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1526_c2_3a8e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1532_c7_e055_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1526_c2_3a8e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1526_c2_3a8e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1526_c2_3a8e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1526_c2_3a8e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1532_c7_e055_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1526_c2_3a8e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1526_c2_3a8e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1526_c2_3a8e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1526_c2_3a8e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1532_c7_e055_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1526_c2_3a8e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1526_c2_3a8e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1526_c2_3a8e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1526_c2_3a8e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1532_c7_e055_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1526_c2_3a8e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1526_c2_3a8e_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1526_c2_3a8e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1526_c2_3a8e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1532_c7_e055_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1526_c2_3a8e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1526_c2_3a8e_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1527_c3_e08b_uxn_opcodes_h_l1527_c3_e08b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1532_c11_03e4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1532_c11_03e4_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1532_c11_03e4_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1532_c7_e055_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1532_c7_e055_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1535_c7_233e_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1532_c7_e055_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1532_c7_e055_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1532_c7_e055_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1535_c7_233e_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1532_c7_e055_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1532_c7_e055_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1532_c7_e055_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1535_c7_233e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1532_c7_e055_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1532_c7_e055_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1532_c7_e055_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1535_c7_233e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1532_c7_e055_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1532_c7_e055_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1533_c3_78ce : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1532_c7_e055_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1535_c7_233e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1532_c7_e055_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1532_c7_e055_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1532_c7_e055_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1535_c7_233e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1532_c7_e055_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1532_c7_e055_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1532_c7_e055_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1535_c7_233e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1532_c7_e055_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1532_c7_e055_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1532_c7_e055_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1535_c7_233e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1532_c7_e055_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1532_c7_e055_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1532_c7_e055_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1535_c7_233e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1532_c7_e055_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1532_c7_e055_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1532_c7_e055_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1535_c7_233e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1532_c7_e055_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1532_c7_e055_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1532_c7_e055_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1535_c7_233e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1532_c7_e055_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1535_c11_d4db_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1535_c11_d4db_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1535_c11_d4db_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1535_c7_233e_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1535_c7_233e_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1539_c7_76fd_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1535_c7_233e_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1535_c7_233e_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1535_c7_233e_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1535_c7_233e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1535_c7_233e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1535_c7_233e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1539_c7_76fd_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1535_c7_233e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1535_c7_233e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1535_c7_233e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1539_c7_76fd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1535_c7_233e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1535_c7_233e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1537_c3_f320 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1535_c7_233e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_76fd_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1535_c7_233e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1535_c7_233e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1535_c7_233e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1539_c7_76fd_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1535_c7_233e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1535_c7_233e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1535_c7_233e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1539_c7_76fd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1535_c7_233e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1535_c7_233e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1535_c7_233e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_76fd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1535_c7_233e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1535_c7_233e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1535_c7_233e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1539_c7_76fd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1535_c7_233e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1535_c7_233e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1535_c7_233e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1539_c7_76fd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1535_c7_233e_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1535_c7_233e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1535_c7_233e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1539_c7_76fd_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1535_c7_233e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1539_c11_12ec_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1539_c11_12ec_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1539_c11_12ec_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1539_c7_76fd_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1539_c7_76fd_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1542_c7_547b_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1539_c7_76fd_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1539_c7_76fd_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1539_c7_76fd_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1542_c7_547b_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1539_c7_76fd_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1539_c7_76fd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1539_c7_76fd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1542_c7_547b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1539_c7_76fd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_76fd_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1540_c3_bbe5 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_76fd_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1542_c7_547b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_76fd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1539_c7_76fd_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1539_c7_76fd_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1542_c7_547b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1539_c7_76fd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1539_c7_76fd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1539_c7_76fd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1542_c7_547b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1539_c7_76fd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_76fd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_76fd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1542_c7_547b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_76fd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1539_c7_76fd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1539_c7_76fd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1542_c7_547b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1539_c7_76fd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1539_c7_76fd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1539_c7_76fd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1542_c7_547b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1539_c7_76fd_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1539_c7_76fd_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1539_c7_76fd_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1542_c7_547b_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1539_c7_76fd_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1542_c11_e5c0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1542_c11_e5c0_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1542_c11_e5c0_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1542_c7_547b_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1542_c7_547b_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1547_c7_799a_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1542_c7_547b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1542_c7_547b_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1542_c7_547b_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1547_c7_799a_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1542_c7_547b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1542_c7_547b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1542_c7_547b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1547_c7_799a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1542_c7_547b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1542_c7_547b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1545_c3_08d4 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1542_c7_547b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1547_c7_799a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1542_c7_547b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1542_c7_547b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1542_c7_547b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1547_c7_799a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1542_c7_547b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1542_c7_547b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1542_c7_547b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1547_c7_799a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1542_c7_547b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1542_c7_547b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1542_c7_547b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1547_c7_799a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1542_c7_547b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1542_c7_547b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1542_c7_547b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1547_c7_799a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1542_c7_547b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1542_c7_547b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1542_c7_547b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1547_c7_799a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1542_c7_547b_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1542_c7_547b_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1542_c7_547b_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1547_c7_799a_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1542_c7_547b_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1544_c3_edcb_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1544_c3_edcb_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1547_c11_e55f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1547_c11_e55f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1547_c11_e55f_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1547_c7_799a_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1547_c7_799a_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1550_c7_3c2d_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1547_c7_799a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1547_c7_799a_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1547_c7_799a_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1550_c7_3c2d_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1547_c7_799a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1547_c7_799a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1547_c7_799a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1550_c7_3c2d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1547_c7_799a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1547_c7_799a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1548_c3_d701 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1547_c7_799a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1550_c7_3c2d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1547_c7_799a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1547_c7_799a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1547_c7_799a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1550_c7_3c2d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1547_c7_799a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1547_c7_799a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1547_c7_799a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1550_c7_3c2d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1547_c7_799a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1547_c7_799a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1547_c7_799a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1550_c7_3c2d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1547_c7_799a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1547_c7_799a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1547_c7_799a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1550_c7_3c2d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1547_c7_799a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1547_c7_799a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1547_c7_799a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1550_c7_3c2d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1547_c7_799a_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1547_c7_799a_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1547_c7_799a_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1550_c7_3c2d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1547_c7_799a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1550_c11_d269_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1550_c11_d269_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1550_c11_d269_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1550_c7_3c2d_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1550_c7_3c2d_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1556_c7_ab19_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1550_c7_3c2d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1550_c7_3c2d_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1550_c7_3c2d_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1550_c7_3c2d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1550_c7_3c2d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1550_c7_3c2d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1556_c7_ab19_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1550_c7_3c2d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1550_c7_3c2d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1550_c7_3c2d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1556_c7_ab19_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1550_c7_3c2d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1550_c7_3c2d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1550_c7_3c2d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1556_c7_ab19_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1550_c7_3c2d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1550_c7_3c2d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1550_c7_3c2d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1550_c7_3c2d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1550_c7_3c2d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1550_c7_3c2d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1556_c7_ab19_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1550_c7_3c2d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1550_c7_3c2d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1550_c7_3c2d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1556_c7_ab19_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1550_c7_3c2d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1550_c7_3c2d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1550_c7_3c2d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1556_c7_ab19_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1550_c7_3c2d_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1550_c7_3c2d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1550_c7_3c2d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1550_c7_3c2d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1551_c3_eb87_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1551_c3_eb87_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1551_c3_eb87_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1554_c32_34b5_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1554_c32_34b5_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1554_c32_34b5_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1554_c32_11d7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1554_c32_11d7_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1554_c32_11d7_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1554_c32_c26d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1554_c32_c26d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1554_c32_c26d_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1554_c32_34b5_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1556_c11_67f6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1556_c11_67f6_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1556_c11_67f6_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1556_c7_ab19_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1556_c7_ab19_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1556_c7_ab19_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1556_c7_ab19_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1556_c7_ab19_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1563_c7_3170_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1556_c7_ab19_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1556_c7_ab19_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1556_c7_ab19_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1563_c7_3170_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1556_c7_ab19_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1556_c7_ab19_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1556_c7_ab19_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1563_c7_3170_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1556_c7_ab19_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1556_c7_ab19_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1556_c7_ab19_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1556_c7_ab19_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1556_c7_ab19_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1560_c3_2e50 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1556_c7_ab19_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1563_c7_3170_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1556_c7_ab19_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1556_c7_ab19_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1556_c7_ab19_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1563_c7_3170_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1556_c7_ab19_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l1557_c12_48ae_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1557_c20_31c0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1557_c20_31c0_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1557_c20_31c0_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l1557_c12_48ae_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l1557_c12_48ae_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l1557_c12_faf5_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l1557_c12_faf5_right : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_opcodes_h_l1557_c36_b0cb_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_opcodes_h_l1557_c36_b0cb_x : unsigned(7 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l1557_c12_faf5_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1561_c24_261b_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1563_c11_e70f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1563_c11_e70f_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1563_c11_e70f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1563_c7_3170_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1563_c7_3170_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1567_c7_19d9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1563_c7_3170_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1563_c7_3170_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1563_c7_3170_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1567_c7_19d9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1563_c7_3170_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1563_c7_3170_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1563_c7_3170_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1567_c7_19d9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1563_c7_3170_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1563_c7_3170_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1564_c3_3d85 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1563_c7_3170_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1563_c7_3170_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1563_c7_3170_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1563_c7_3170_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1563_c7_3170_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1565_c34_fda0_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1565_c34_fda0_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1565_c24_47e6_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1567_c11_037d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1567_c11_037d_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1567_c11_037d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1567_c7_19d9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1567_c7_19d9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1567_c7_19d9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1567_c7_19d9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1567_c7_19d9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1567_c7_19d9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1567_c7_19d9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1567_c7_19d9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1567_c7_19d9_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1535_l1547_l1550_l1539_l1526_l1542_l1532_DUPLICATE_2bbc_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1535_l1547_l1556_l1539_l1526_l1542_l1532_DUPLICATE_4f32_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1535_l1547_l1550_l1539_l1526_l1563_l1542_l1532_DUPLICATE_e97a_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1535_l1547_l1550_l1539_l1526_l1563_l1542_l1567_l1532_DUPLICATE_462b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1535_l1547_l1550_l1556_l1539_l1526_l1563_l1542_l1567_l1532_DUPLICATE_168e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1535_l1547_l1550_l1539_l1542_l1532_DUPLICATE_bb4c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1535_l1547_l1550_l1556_l1539_l1563_l1542_l1567_l1532_DUPLICATE_26c7_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1543_l1551_DUPLICATE_62e1_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1550_l1563_DUPLICATE_2938_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_2866_uxn_opcodes_h_l1573_l1521_DUPLICATE_f78f_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1567_c11_037d_right := to_unsigned(9, 4);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1567_c7_19d9_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1556_c7_ab19_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1548_c3_d701 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1547_c7_799a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1548_c3_d701;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1550_c7_3c2d_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1563_c11_e70f_right := to_unsigned(8, 4);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1526_c2_3a8e_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1545_c3_08d4 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1542_c7_547b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1545_c3_08d4;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1554_c32_11d7_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1550_c11_d269_right := to_unsigned(6, 3);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1526_c1_cee7_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1533_c3_78ce := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1532_c7_e055_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1533_c3_78ce;
     VAR_MUX_uxn_opcodes_h_l1554_c32_34b5_iftrue := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1537_c3_f320 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1535_c7_233e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1537_c3_f320;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1526_c2_3a8e_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1547_c11_e55f_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1560_c3_2e50 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1556_c7_ab19_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1560_c3_2e50;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1526_c6_fcc9_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1542_c11_e5c0_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1529_c3_155e := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1526_c2_3a8e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1529_c3_155e;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1540_c3_bbe5 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_76fd_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1540_c3_bbe5;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1567_c7_19d9_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l1554_c32_c26d_right := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1554_c32_34b5_iffalse := resize(to_signed(-1, 2), 8);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1557_c20_31c0_right := to_unsigned(15, 4);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1556_c7_ab19_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1567_c7_19d9_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1564_c3_3d85 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1563_c7_3170_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1564_c3_3d85;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1550_c7_3c2d_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1539_c11_12ec_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1556_c11_67f6_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1532_c11_03e4_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1535_c11_d4db_right := to_unsigned(2, 2);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_ins := ins;
     VAR_pc := pc;
     VAR_previous_stack_read := previous_stack_read;
     VAR_previous_ram_read := previous_ram_read;

     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1526_c1_cee7_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1554_c32_11d7_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1551_c3_eb87_left := n16;
     VAR_BIN_OP_SR_uxn_opcodes_h_l1557_c12_48ae_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1526_c2_3a8e_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1532_c7_e055_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1535_c7_233e_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1539_c7_76fd_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1547_c7_799a_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1550_c7_3c2d_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1526_c6_fcc9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1532_c11_03e4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1535_c11_d4db_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1539_c11_12ec_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1542_c11_e5c0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1547_c11_e55f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1550_c11_d269_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1556_c11_67f6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1563_c11_e70f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1567_c11_037d_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l1535_c7_233e_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1557_c20_31c0_left := t8;
     VAR_CONST_SR_4_uxn_opcodes_h_l1557_c36_b0cb_x := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1526_c2_3a8e_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1532_c7_e055_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1535_c7_233e_iffalse := t8;
     VAR_CONST_SR_8_uxn_opcodes_h_l1565_c34_fda0_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1526_c2_3a8e_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1532_c7_e055_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1535_c7_233e_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1539_c7_76fd_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1542_c7_547b_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1547_c7_799a_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1550_c7_3c2d_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1556_c7_ab19_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l1563_c11_e70f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1563_c11_e70f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1563_c11_e70f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1563_c11_e70f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1563_c11_e70f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1563_c11_e70f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1563_c11_e70f_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l1554_c32_11d7] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1554_c32_11d7_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1554_c32_11d7_left;
     BIN_OP_AND_uxn_opcodes_h_l1554_c32_11d7_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1554_c32_11d7_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1554_c32_11d7_return_output := BIN_OP_AND_uxn_opcodes_h_l1554_c32_11d7_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1550_l1563_DUPLICATE_2938 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1550_l1563_DUPLICATE_2938_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1550_c11_d269] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1550_c11_d269_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1550_c11_d269_left;
     BIN_OP_EQ_uxn_opcodes_h_l1550_c11_d269_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1550_c11_d269_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1550_c11_d269_return_output := BIN_OP_EQ_uxn_opcodes_h_l1550_c11_d269_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l1557_c20_31c0] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1557_c20_31c0_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1557_c20_31c0_left;
     BIN_OP_AND_uxn_opcodes_h_l1557_c20_31c0_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1557_c20_31c0_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1557_c20_31c0_return_output := BIN_OP_AND_uxn_opcodes_h_l1557_c20_31c0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1532_c11_03e4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1532_c11_03e4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1532_c11_03e4_left;
     BIN_OP_EQ_uxn_opcodes_h_l1532_c11_03e4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1532_c11_03e4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1532_c11_03e4_return_output := BIN_OP_EQ_uxn_opcodes_h_l1532_c11_03e4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1547_c11_e55f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1547_c11_e55f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1547_c11_e55f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1547_c11_e55f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1547_c11_e55f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1547_c11_e55f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1547_c11_e55f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1567_c11_037d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1567_c11_037d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1567_c11_037d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1567_c11_037d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1567_c11_037d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1567_c11_037d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1567_c11_037d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1539_c11_12ec] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1539_c11_12ec_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1539_c11_12ec_left;
     BIN_OP_EQ_uxn_opcodes_h_l1539_c11_12ec_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1539_c11_12ec_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1539_c11_12ec_return_output := BIN_OP_EQ_uxn_opcodes_h_l1539_c11_12ec_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l1565_c34_fda0] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1565_c34_fda0_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1565_c34_fda0_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1565_c34_fda0_return_output := CONST_SR_8_uxn_opcodes_h_l1565_c34_fda0_return_output;

     -- CONST_SR_4[uxn_opcodes_h_l1557_c36_b0cb] LATENCY=0
     -- Inputs
     CONST_SR_4_uxn_opcodes_h_l1557_c36_b0cb_x <= VAR_CONST_SR_4_uxn_opcodes_h_l1557_c36_b0cb_x;
     -- Outputs
     VAR_CONST_SR_4_uxn_opcodes_h_l1557_c36_b0cb_return_output := CONST_SR_4_uxn_opcodes_h_l1557_c36_b0cb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1556_c11_67f6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1556_c11_67f6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1556_c11_67f6_left;
     BIN_OP_EQ_uxn_opcodes_h_l1556_c11_67f6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1556_c11_67f6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1556_c11_67f6_return_output := BIN_OP_EQ_uxn_opcodes_h_l1556_c11_67f6_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1535_l1547_l1550_l1556_l1539_l1526_l1563_l1542_l1567_l1532_DUPLICATE_168e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1535_l1547_l1550_l1556_l1539_l1526_l1563_l1542_l1567_l1532_DUPLICATE_168e_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1535_l1547_l1550_l1539_l1542_l1532_DUPLICATE_bb4c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1535_l1547_l1550_l1539_l1542_l1532_DUPLICATE_bb4c_return_output := result.is_stack_read;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1535_l1547_l1550_l1539_l1526_l1563_l1542_l1532_DUPLICATE_e97a LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1535_l1547_l1550_l1539_l1526_l1563_l1542_l1532_DUPLICATE_e97a_return_output := result.stack_value;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1535_l1547_l1550_l1539_l1526_l1542_l1532_DUPLICATE_2bbc LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1535_l1547_l1550_l1539_l1526_l1542_l1532_DUPLICATE_2bbc_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1535_c11_d4db] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1535_c11_d4db_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1535_c11_d4db_left;
     BIN_OP_EQ_uxn_opcodes_h_l1535_c11_d4db_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1535_c11_d4db_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1535_c11_d4db_return_output := BIN_OP_EQ_uxn_opcodes_h_l1535_c11_d4db_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1535_l1547_l1550_l1539_l1526_l1563_l1542_l1567_l1532_DUPLICATE_462b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1535_l1547_l1550_l1539_l1526_l1563_l1542_l1567_l1532_DUPLICATE_462b_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1542_c11_e5c0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1542_c11_e5c0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1542_c11_e5c0_left;
     BIN_OP_EQ_uxn_opcodes_h_l1542_c11_e5c0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1542_c11_e5c0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1542_c11_e5c0_return_output := BIN_OP_EQ_uxn_opcodes_h_l1542_c11_e5c0_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1535_l1547_l1550_l1556_l1539_l1563_l1542_l1567_l1532_DUPLICATE_26c7 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1535_l1547_l1550_l1556_l1539_l1563_l1542_l1567_l1532_DUPLICATE_26c7_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1535_l1547_l1556_l1539_l1526_l1542_l1532_DUPLICATE_4f32 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1535_l1547_l1556_l1539_l1526_l1542_l1532_DUPLICATE_4f32_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1526_c6_fcc9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1526_c6_fcc9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1526_c6_fcc9_left;
     BIN_OP_EQ_uxn_opcodes_h_l1526_c6_fcc9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1526_c6_fcc9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1526_c6_fcc9_return_output := BIN_OP_EQ_uxn_opcodes_h_l1526_c6_fcc9_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1543_l1551_DUPLICATE_62e1 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1543_l1551_DUPLICATE_62e1_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1554_c32_c26d_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1554_c32_11d7_return_output;
     VAR_BIN_OP_SR_uxn_opcodes_h_l1557_c12_48ae_right := VAR_BIN_OP_AND_uxn_opcodes_h_l1557_c20_31c0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1526_c1_cee7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1526_c6_fcc9_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1526_c2_3a8e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1526_c6_fcc9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1526_c2_3a8e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1526_c6_fcc9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c2_3a8e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1526_c6_fcc9_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1526_c2_3a8e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1526_c6_fcc9_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1526_c2_3a8e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1526_c6_fcc9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1526_c2_3a8e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1526_c6_fcc9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c2_3a8e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1526_c6_fcc9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1526_c2_3a8e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1526_c6_fcc9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1526_c2_3a8e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1526_c6_fcc9_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1526_c2_3a8e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1526_c6_fcc9_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1526_c2_3a8e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1526_c6_fcc9_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1532_c7_e055_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1532_c11_03e4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1532_c7_e055_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1532_c11_03e4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1532_c7_e055_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1532_c11_03e4_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1532_c7_e055_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1532_c11_03e4_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1532_c7_e055_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1532_c11_03e4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1532_c7_e055_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1532_c11_03e4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1532_c7_e055_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1532_c11_03e4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1532_c7_e055_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1532_c11_03e4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1532_c7_e055_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1532_c11_03e4_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1532_c7_e055_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1532_c11_03e4_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1532_c7_e055_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1532_c11_03e4_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1535_c7_233e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1535_c11_d4db_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1535_c7_233e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1535_c11_d4db_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1535_c7_233e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1535_c11_d4db_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1535_c7_233e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1535_c11_d4db_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1535_c7_233e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1535_c11_d4db_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1535_c7_233e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1535_c11_d4db_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1535_c7_233e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1535_c11_d4db_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1535_c7_233e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1535_c11_d4db_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1535_c7_233e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1535_c11_d4db_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1535_c7_233e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1535_c11_d4db_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1535_c7_233e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1535_c11_d4db_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1539_c7_76fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1539_c11_12ec_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_76fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1539_c11_12ec_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1539_c7_76fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1539_c11_12ec_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1539_c7_76fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1539_c11_12ec_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1539_c7_76fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1539_c11_12ec_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1539_c7_76fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1539_c11_12ec_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1539_c7_76fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1539_c11_12ec_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_76fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1539_c11_12ec_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1539_c7_76fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1539_c11_12ec_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1539_c7_76fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1539_c11_12ec_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1542_c7_547b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1542_c11_e5c0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1542_c7_547b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1542_c11_e5c0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1542_c7_547b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1542_c11_e5c0_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1542_c7_547b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1542_c11_e5c0_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1542_c7_547b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1542_c11_e5c0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1542_c7_547b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1542_c11_e5c0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1542_c7_547b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1542_c11_e5c0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1542_c7_547b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1542_c11_e5c0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1542_c7_547b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1542_c11_e5c0_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1542_c7_547b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1542_c11_e5c0_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1547_c7_799a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1547_c11_e55f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1547_c7_799a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1547_c11_e55f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1547_c7_799a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1547_c11_e55f_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1547_c7_799a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1547_c11_e55f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1547_c7_799a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1547_c11_e55f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1547_c7_799a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1547_c11_e55f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1547_c7_799a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1547_c11_e55f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1547_c7_799a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1547_c11_e55f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1547_c7_799a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1547_c11_e55f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1547_c7_799a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1547_c11_e55f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1550_c7_3c2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1550_c11_d269_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1550_c7_3c2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1550_c11_d269_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1550_c7_3c2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1550_c11_d269_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1550_c7_3c2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1550_c11_d269_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1550_c7_3c2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1550_c11_d269_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1550_c7_3c2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1550_c11_d269_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1550_c7_3c2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1550_c11_d269_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1550_c7_3c2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1550_c11_d269_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1550_c7_3c2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1550_c11_d269_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1550_c7_3c2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1550_c11_d269_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1556_c7_ab19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1556_c11_67f6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1556_c7_ab19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1556_c11_67f6_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1556_c7_ab19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1556_c11_67f6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1556_c7_ab19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1556_c11_67f6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1556_c7_ab19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1556_c11_67f6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1556_c7_ab19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1556_c11_67f6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1556_c7_ab19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1556_c11_67f6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1563_c7_3170_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1563_c11_e70f_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1563_c7_3170_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1563_c11_e70f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1563_c7_3170_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1563_c11_e70f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1563_c7_3170_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1563_c11_e70f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1563_c7_3170_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1563_c11_e70f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1567_c7_19d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1567_c11_037d_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1567_c7_19d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1567_c11_037d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1567_c7_19d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1567_c11_037d_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1551_c3_eb87_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1543_l1551_DUPLICATE_62e1_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1544_c3_edcb_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1543_l1551_DUPLICATE_62e1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c2_3a8e_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1535_l1547_l1550_l1539_l1526_l1542_l1532_DUPLICATE_2bbc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1532_c7_e055_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1535_l1547_l1550_l1539_l1526_l1542_l1532_DUPLICATE_2bbc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1535_c7_233e_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1535_l1547_l1550_l1539_l1526_l1542_l1532_DUPLICATE_2bbc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1539_c7_76fd_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1535_l1547_l1550_l1539_l1526_l1542_l1532_DUPLICATE_2bbc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1542_c7_547b_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1535_l1547_l1550_l1539_l1526_l1542_l1532_DUPLICATE_2bbc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1547_c7_799a_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1535_l1547_l1550_l1539_l1526_l1542_l1532_DUPLICATE_2bbc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1550_c7_3c2d_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1535_l1547_l1550_l1539_l1526_l1542_l1532_DUPLICATE_2bbc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1532_c7_e055_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1535_l1547_l1550_l1556_l1539_l1563_l1542_l1567_l1532_DUPLICATE_26c7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1535_c7_233e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1535_l1547_l1550_l1556_l1539_l1563_l1542_l1567_l1532_DUPLICATE_26c7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_76fd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1535_l1547_l1550_l1556_l1539_l1563_l1542_l1567_l1532_DUPLICATE_26c7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1542_c7_547b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1535_l1547_l1550_l1556_l1539_l1563_l1542_l1567_l1532_DUPLICATE_26c7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1547_c7_799a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1535_l1547_l1550_l1556_l1539_l1563_l1542_l1567_l1532_DUPLICATE_26c7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1550_c7_3c2d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1535_l1547_l1550_l1556_l1539_l1563_l1542_l1567_l1532_DUPLICATE_26c7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1556_c7_ab19_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1535_l1547_l1550_l1556_l1539_l1563_l1542_l1567_l1532_DUPLICATE_26c7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1563_c7_3170_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1535_l1547_l1550_l1556_l1539_l1563_l1542_l1567_l1532_DUPLICATE_26c7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1567_c7_19d9_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1535_l1547_l1550_l1556_l1539_l1563_l1542_l1567_l1532_DUPLICATE_26c7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c2_3a8e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1535_l1547_l1556_l1539_l1526_l1542_l1532_DUPLICATE_4f32_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1532_c7_e055_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1535_l1547_l1556_l1539_l1526_l1542_l1532_DUPLICATE_4f32_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1535_c7_233e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1535_l1547_l1556_l1539_l1526_l1542_l1532_DUPLICATE_4f32_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1539_c7_76fd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1535_l1547_l1556_l1539_l1526_l1542_l1532_DUPLICATE_4f32_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1542_c7_547b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1535_l1547_l1556_l1539_l1526_l1542_l1532_DUPLICATE_4f32_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1547_c7_799a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1535_l1547_l1556_l1539_l1526_l1542_l1532_DUPLICATE_4f32_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1556_c7_ab19_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1535_l1547_l1556_l1539_l1526_l1542_l1532_DUPLICATE_4f32_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1526_c2_3a8e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1535_l1547_l1550_l1556_l1539_l1526_l1563_l1542_l1567_l1532_DUPLICATE_168e_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1532_c7_e055_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1535_l1547_l1550_l1556_l1539_l1526_l1563_l1542_l1567_l1532_DUPLICATE_168e_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1535_c7_233e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1535_l1547_l1550_l1556_l1539_l1526_l1563_l1542_l1567_l1532_DUPLICATE_168e_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1539_c7_76fd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1535_l1547_l1550_l1556_l1539_l1526_l1563_l1542_l1567_l1532_DUPLICATE_168e_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1542_c7_547b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1535_l1547_l1550_l1556_l1539_l1526_l1563_l1542_l1567_l1532_DUPLICATE_168e_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1547_c7_799a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1535_l1547_l1550_l1556_l1539_l1526_l1563_l1542_l1567_l1532_DUPLICATE_168e_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1550_c7_3c2d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1535_l1547_l1550_l1556_l1539_l1526_l1563_l1542_l1567_l1532_DUPLICATE_168e_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1556_c7_ab19_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1535_l1547_l1550_l1556_l1539_l1526_l1563_l1542_l1567_l1532_DUPLICATE_168e_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1563_c7_3170_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1535_l1547_l1550_l1556_l1539_l1526_l1563_l1542_l1567_l1532_DUPLICATE_168e_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1567_c7_19d9_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1535_l1547_l1550_l1556_l1539_l1526_l1563_l1542_l1567_l1532_DUPLICATE_168e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1532_c7_e055_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1535_l1547_l1550_l1539_l1542_l1532_DUPLICATE_bb4c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1535_c7_233e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1535_l1547_l1550_l1539_l1542_l1532_DUPLICATE_bb4c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1539_c7_76fd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1535_l1547_l1550_l1539_l1542_l1532_DUPLICATE_bb4c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1542_c7_547b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1535_l1547_l1550_l1539_l1542_l1532_DUPLICATE_bb4c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1547_c7_799a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1535_l1547_l1550_l1539_l1542_l1532_DUPLICATE_bb4c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1550_c7_3c2d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1535_l1547_l1550_l1539_l1542_l1532_DUPLICATE_bb4c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1526_c2_3a8e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1535_l1547_l1550_l1539_l1526_l1563_l1542_l1567_l1532_DUPLICATE_462b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1532_c7_e055_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1535_l1547_l1550_l1539_l1526_l1563_l1542_l1567_l1532_DUPLICATE_462b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1535_c7_233e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1535_l1547_l1550_l1539_l1526_l1563_l1542_l1567_l1532_DUPLICATE_462b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1539_c7_76fd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1535_l1547_l1550_l1539_l1526_l1563_l1542_l1567_l1532_DUPLICATE_462b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1542_c7_547b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1535_l1547_l1550_l1539_l1526_l1563_l1542_l1567_l1532_DUPLICATE_462b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1547_c7_799a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1535_l1547_l1550_l1539_l1526_l1563_l1542_l1567_l1532_DUPLICATE_462b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1550_c7_3c2d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1535_l1547_l1550_l1539_l1526_l1563_l1542_l1567_l1532_DUPLICATE_462b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1563_c7_3170_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1535_l1547_l1550_l1539_l1526_l1563_l1542_l1567_l1532_DUPLICATE_462b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1567_c7_19d9_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1535_l1547_l1550_l1539_l1526_l1563_l1542_l1567_l1532_DUPLICATE_462b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1550_c7_3c2d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1550_l1563_DUPLICATE_2938_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1563_c7_3170_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1550_l1563_DUPLICATE_2938_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1526_c2_3a8e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1535_l1547_l1550_l1539_l1526_l1563_l1542_l1532_DUPLICATE_e97a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1532_c7_e055_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1535_l1547_l1550_l1539_l1526_l1563_l1542_l1532_DUPLICATE_e97a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1535_c7_233e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1535_l1547_l1550_l1539_l1526_l1563_l1542_l1532_DUPLICATE_e97a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1539_c7_76fd_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1535_l1547_l1550_l1539_l1526_l1563_l1542_l1532_DUPLICATE_e97a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1542_c7_547b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1535_l1547_l1550_l1539_l1526_l1563_l1542_l1532_DUPLICATE_e97a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1547_c7_799a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1535_l1547_l1550_l1539_l1526_l1563_l1542_l1532_DUPLICATE_e97a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1550_c7_3c2d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1535_l1547_l1550_l1539_l1526_l1563_l1542_l1532_DUPLICATE_e97a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1563_c7_3170_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1535_l1547_l1550_l1539_l1526_l1563_l1542_l1532_DUPLICATE_e97a_return_output;
     VAR_BIN_OP_SL_uxn_opcodes_h_l1557_c12_faf5_right := VAR_CONST_SR_4_uxn_opcodes_h_l1557_c36_b0cb_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1556_c7_ab19] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1556_c7_ab19_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1556_c7_ab19_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1556_c7_ab19_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1556_c7_ab19_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1556_c7_ab19_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1556_c7_ab19_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1556_c7_ab19_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1556_c7_ab19_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1563_c7_3170] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1563_c7_3170_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1563_c7_3170_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1563_c7_3170_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1563_c7_3170_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1563_c7_3170_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1563_c7_3170_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1563_c7_3170_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1563_c7_3170_return_output;

     -- BIN_OP_SR[uxn_opcodes_h_l1557_c12_48ae] LATENCY=0
     -- Inputs
     BIN_OP_SR_uxn_opcodes_h_l1557_c12_48ae_left <= VAR_BIN_OP_SR_uxn_opcodes_h_l1557_c12_48ae_left;
     BIN_OP_SR_uxn_opcodes_h_l1557_c12_48ae_right <= VAR_BIN_OP_SR_uxn_opcodes_h_l1557_c12_48ae_right;
     -- Outputs
     VAR_BIN_OP_SR_uxn_opcodes_h_l1557_c12_48ae_return_output := BIN_OP_SR_uxn_opcodes_h_l1557_c12_48ae_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1550_c7_3c2d] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1550_c7_3c2d_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1550_c7_3c2d_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1550_c7_3c2d_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1550_c7_3c2d_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1550_c7_3c2d_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1550_c7_3c2d_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1550_c7_3c2d_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1550_c7_3c2d_return_output;

     -- t8_MUX[uxn_opcodes_h_l1535_c7_233e] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1535_c7_233e_cond <= VAR_t8_MUX_uxn_opcodes_h_l1535_c7_233e_cond;
     t8_MUX_uxn_opcodes_h_l1535_c7_233e_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1535_c7_233e_iftrue;
     t8_MUX_uxn_opcodes_h_l1535_c7_233e_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1535_c7_233e_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1535_c7_233e_return_output := t8_MUX_uxn_opcodes_h_l1535_c7_233e_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1565_c24_47e6] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1565_c24_47e6_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1565_c34_fda0_return_output);

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1567_c7_19d9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1567_c7_19d9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1567_c7_19d9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1567_c7_19d9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1567_c7_19d9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1567_c7_19d9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1567_c7_19d9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1567_c7_19d9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1567_c7_19d9_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1567_c7_19d9] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1567_c7_19d9_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1567_c7_19d9_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1567_c7_19d9_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1567_c7_19d9_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1567_c7_19d9_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1567_c7_19d9_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1567_c7_19d9_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1567_c7_19d9_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1544_c3_edcb] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1544_c3_edcb_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1544_c3_edcb_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1544_c3_edcb_return_output := CONST_SL_8_uxn_opcodes_h_l1544_c3_edcb_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1554_c32_c26d] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1554_c32_c26d_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1554_c32_c26d_left;
     BIN_OP_GT_uxn_opcodes_h_l1554_c32_c26d_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1554_c32_c26d_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1554_c32_c26d_return_output := BIN_OP_GT_uxn_opcodes_h_l1554_c32_c26d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1567_c7_19d9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1567_c7_19d9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1567_c7_19d9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1567_c7_19d9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1567_c7_19d9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1567_c7_19d9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1567_c7_19d9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1567_c7_19d9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1567_c7_19d9_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1551_c3_eb87] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1551_c3_eb87_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1551_c3_eb87_left;
     BIN_OP_OR_uxn_opcodes_h_l1551_c3_eb87_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1551_c3_eb87_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1551_c3_eb87_return_output := BIN_OP_OR_uxn_opcodes_h_l1551_c3_eb87_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1526_c1_cee7] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1526_c1_cee7_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1526_c1_cee7_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1526_c1_cee7_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1526_c1_cee7_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1526_c1_cee7_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1526_c1_cee7_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1526_c1_cee7_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1526_c1_cee7_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1554_c32_34b5_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1554_c32_c26d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1550_c7_3c2d_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1551_c3_eb87_return_output;
     VAR_BIN_OP_SL_uxn_opcodes_h_l1557_c12_faf5_left := VAR_BIN_OP_SR_uxn_opcodes_h_l1557_c12_48ae_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1563_c7_3170_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1565_c24_47e6_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1542_c7_547b_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1544_c3_edcb_return_output;
     VAR_printf_uxn_opcodes_h_l1527_c3_e08b_uxn_opcodes_h_l1527_c3_e08b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1526_c1_cee7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1563_c7_3170_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1567_c7_19d9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1550_c7_3c2d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1556_c7_ab19_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1563_c7_3170_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1567_c7_19d9_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1547_c7_799a_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1550_c7_3c2d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1563_c7_3170_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1567_c7_19d9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1556_c7_ab19_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1563_c7_3170_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1532_c7_e055_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1535_c7_233e_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1563_c7_3170] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1563_c7_3170_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1563_c7_3170_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1563_c7_3170_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1563_c7_3170_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1563_c7_3170_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1563_c7_3170_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1563_c7_3170_return_output := result_stack_value_MUX_uxn_opcodes_h_l1563_c7_3170_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1547_c7_799a] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1547_c7_799a_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1547_c7_799a_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1547_c7_799a_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1547_c7_799a_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1547_c7_799a_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1547_c7_799a_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1547_c7_799a_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1547_c7_799a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1563_c7_3170] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1563_c7_3170_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1563_c7_3170_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1563_c7_3170_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1563_c7_3170_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1563_c7_3170_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1563_c7_3170_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1563_c7_3170_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1563_c7_3170_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1556_c7_ab19] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1556_c7_ab19_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1556_c7_ab19_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1556_c7_ab19_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1556_c7_ab19_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1556_c7_ab19_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1556_c7_ab19_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1556_c7_ab19_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1556_c7_ab19_return_output;

     -- BIN_OP_SL[uxn_opcodes_h_l1557_c12_faf5] LATENCY=0
     -- Inputs
     BIN_OP_SL_uxn_opcodes_h_l1557_c12_faf5_left <= VAR_BIN_OP_SL_uxn_opcodes_h_l1557_c12_faf5_left;
     BIN_OP_SL_uxn_opcodes_h_l1557_c12_faf5_right <= VAR_BIN_OP_SL_uxn_opcodes_h_l1557_c12_faf5_right;
     -- Outputs
     VAR_BIN_OP_SL_uxn_opcodes_h_l1557_c12_faf5_return_output := BIN_OP_SL_uxn_opcodes_h_l1557_c12_faf5_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1563_c7_3170] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1563_c7_3170_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1563_c7_3170_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1563_c7_3170_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1563_c7_3170_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1563_c7_3170_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1563_c7_3170_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1563_c7_3170_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1563_c7_3170_return_output;

     -- t8_MUX[uxn_opcodes_h_l1532_c7_e055] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1532_c7_e055_cond <= VAR_t8_MUX_uxn_opcodes_h_l1532_c7_e055_cond;
     t8_MUX_uxn_opcodes_h_l1532_c7_e055_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1532_c7_e055_iftrue;
     t8_MUX_uxn_opcodes_h_l1532_c7_e055_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1532_c7_e055_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1532_c7_e055_return_output := t8_MUX_uxn_opcodes_h_l1532_c7_e055_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1550_c7_3c2d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1550_c7_3c2d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1550_c7_3c2d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1550_c7_3c2d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1550_c7_3c2d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1550_c7_3c2d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1550_c7_3c2d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1550_c7_3c2d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1550_c7_3c2d_return_output;

     -- printf_uxn_opcodes_h_l1527_c3_e08b[uxn_opcodes_h_l1527_c3_e08b] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1527_c3_e08b_uxn_opcodes_h_l1527_c3_e08b_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1527_c3_e08b_uxn_opcodes_h_l1527_c3_e08b_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- n16_MUX[uxn_opcodes_h_l1550_c7_3c2d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1550_c7_3c2d_cond <= VAR_n16_MUX_uxn_opcodes_h_l1550_c7_3c2d_cond;
     n16_MUX_uxn_opcodes_h_l1550_c7_3c2d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1550_c7_3c2d_iftrue;
     n16_MUX_uxn_opcodes_h_l1550_c7_3c2d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1550_c7_3c2d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1550_c7_3c2d_return_output := n16_MUX_uxn_opcodes_h_l1550_c7_3c2d_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1563_c7_3170] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1563_c7_3170_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1563_c7_3170_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1563_c7_3170_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1563_c7_3170_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1563_c7_3170_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1563_c7_3170_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1563_c7_3170_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1563_c7_3170_return_output;

     -- MUX[uxn_opcodes_h_l1554_c32_34b5] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1554_c32_34b5_cond <= VAR_MUX_uxn_opcodes_h_l1554_c32_34b5_cond;
     MUX_uxn_opcodes_h_l1554_c32_34b5_iftrue <= VAR_MUX_uxn_opcodes_h_l1554_c32_34b5_iftrue;
     MUX_uxn_opcodes_h_l1554_c32_34b5_iffalse <= VAR_MUX_uxn_opcodes_h_l1554_c32_34b5_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1554_c32_34b5_return_output := MUX_uxn_opcodes_h_l1554_c32_34b5_return_output;

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l1556_c7_ab19_iftrue := VAR_BIN_OP_SL_uxn_opcodes_h_l1557_c12_faf5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1550_c7_3c2d_iftrue := VAR_MUX_uxn_opcodes_h_l1554_c32_34b5_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1547_c7_799a_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1550_c7_3c2d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1556_c7_ab19_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1563_c7_3170_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1547_c7_799a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1550_c7_3c2d_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1556_c7_ab19_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1563_c7_3170_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1542_c7_547b_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1547_c7_799a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1556_c7_ab19_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1563_c7_3170_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1550_c7_3c2d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1556_c7_ab19_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1556_c7_ab19_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1563_c7_3170_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1526_c2_3a8e_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1532_c7_e055_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1550_c7_3c2d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1550_c7_3c2d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1550_c7_3c2d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1550_c7_3c2d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1550_c7_3c2d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1550_c7_3c2d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1550_c7_3c2d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1550_c7_3c2d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1550_c7_3c2d_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1542_c7_547b] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1542_c7_547b_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1542_c7_547b_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1542_c7_547b_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1542_c7_547b_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1542_c7_547b_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1542_c7_547b_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1542_c7_547b_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1542_c7_547b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1550_c7_3c2d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1550_c7_3c2d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1550_c7_3c2d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1550_c7_3c2d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1550_c7_3c2d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1550_c7_3c2d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1550_c7_3c2d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1550_c7_3c2d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1550_c7_3c2d_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1561_c24_261b] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1561_c24_261b_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_SL_uxn_opcodes_h_l1557_c12_faf5_return_output);

     -- n16_MUX[uxn_opcodes_h_l1547_c7_799a] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1547_c7_799a_cond <= VAR_n16_MUX_uxn_opcodes_h_l1547_c7_799a_cond;
     n16_MUX_uxn_opcodes_h_l1547_c7_799a_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1547_c7_799a_iftrue;
     n16_MUX_uxn_opcodes_h_l1547_c7_799a_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1547_c7_799a_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1547_c7_799a_return_output := n16_MUX_uxn_opcodes_h_l1547_c7_799a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1556_c7_ab19] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1556_c7_ab19_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1556_c7_ab19_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1556_c7_ab19_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1556_c7_ab19_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1556_c7_ab19_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1556_c7_ab19_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1556_c7_ab19_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1556_c7_ab19_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1556_c7_ab19] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1556_c7_ab19_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1556_c7_ab19_cond;
     tmp16_MUX_uxn_opcodes_h_l1556_c7_ab19_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1556_c7_ab19_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1556_c7_ab19_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1556_c7_ab19_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1556_c7_ab19_return_output := tmp16_MUX_uxn_opcodes_h_l1556_c7_ab19_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1556_c7_ab19] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1556_c7_ab19_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1556_c7_ab19_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1556_c7_ab19_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1556_c7_ab19_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1556_c7_ab19_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1556_c7_ab19_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1556_c7_ab19_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1556_c7_ab19_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1547_c7_799a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1547_c7_799a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1547_c7_799a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1547_c7_799a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1547_c7_799a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1547_c7_799a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1547_c7_799a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1547_c7_799a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1547_c7_799a_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1556_c7_ab19] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1556_c7_ab19_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1556_c7_ab19_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1556_c7_ab19_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1556_c7_ab19_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1556_c7_ab19_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1556_c7_ab19_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1556_c7_ab19_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1556_c7_ab19_return_output;

     -- t8_MUX[uxn_opcodes_h_l1526_c2_3a8e] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1526_c2_3a8e_cond <= VAR_t8_MUX_uxn_opcodes_h_l1526_c2_3a8e_cond;
     t8_MUX_uxn_opcodes_h_l1526_c2_3a8e_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1526_c2_3a8e_iftrue;
     t8_MUX_uxn_opcodes_h_l1526_c2_3a8e_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1526_c2_3a8e_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1526_c2_3a8e_return_output := t8_MUX_uxn_opcodes_h_l1526_c2_3a8e_return_output;

     -- Submodule level 4
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1556_c7_ab19_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1561_c24_261b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1542_c7_547b_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1547_c7_799a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1550_c7_3c2d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1556_c7_ab19_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1542_c7_547b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1547_c7_799a_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1550_c7_3c2d_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1556_c7_ab19_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1539_c7_76fd_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1542_c7_547b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1550_c7_3c2d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1556_c7_ab19_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1547_c7_799a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1550_c7_3c2d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1547_c7_799a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1550_c7_3c2d_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1526_c2_3a8e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1550_c7_3c2d_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1556_c7_ab19_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1547_c7_799a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1547_c7_799a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1547_c7_799a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1547_c7_799a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1547_c7_799a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1547_c7_799a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1547_c7_799a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1547_c7_799a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1547_c7_799a_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1550_c7_3c2d] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1550_c7_3c2d_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1550_c7_3c2d_cond;
     tmp16_MUX_uxn_opcodes_h_l1550_c7_3c2d_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1550_c7_3c2d_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1550_c7_3c2d_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1550_c7_3c2d_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1550_c7_3c2d_return_output := tmp16_MUX_uxn_opcodes_h_l1550_c7_3c2d_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1539_c7_76fd] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1539_c7_76fd_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1539_c7_76fd_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1539_c7_76fd_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1539_c7_76fd_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1539_c7_76fd_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1539_c7_76fd_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1539_c7_76fd_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1539_c7_76fd_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1556_c7_ab19] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1556_c7_ab19_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1556_c7_ab19_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1556_c7_ab19_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1556_c7_ab19_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1556_c7_ab19_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1556_c7_ab19_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1556_c7_ab19_return_output := result_stack_value_MUX_uxn_opcodes_h_l1556_c7_ab19_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1550_c7_3c2d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1550_c7_3c2d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1550_c7_3c2d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1550_c7_3c2d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1550_c7_3c2d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1550_c7_3c2d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1550_c7_3c2d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1550_c7_3c2d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1550_c7_3c2d_return_output;

     -- n16_MUX[uxn_opcodes_h_l1542_c7_547b] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1542_c7_547b_cond <= VAR_n16_MUX_uxn_opcodes_h_l1542_c7_547b_cond;
     n16_MUX_uxn_opcodes_h_l1542_c7_547b_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1542_c7_547b_iftrue;
     n16_MUX_uxn_opcodes_h_l1542_c7_547b_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1542_c7_547b_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1542_c7_547b_return_output := n16_MUX_uxn_opcodes_h_l1542_c7_547b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1542_c7_547b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1542_c7_547b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1542_c7_547b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1542_c7_547b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1542_c7_547b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1542_c7_547b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1542_c7_547b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1542_c7_547b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1542_c7_547b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1547_c7_799a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1547_c7_799a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1547_c7_799a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1547_c7_799a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1547_c7_799a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1547_c7_799a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1547_c7_799a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1547_c7_799a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1547_c7_799a_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1550_c7_3c2d] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1550_c7_3c2d_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1550_c7_3c2d_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1550_c7_3c2d_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1550_c7_3c2d_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1550_c7_3c2d_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1550_c7_3c2d_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1550_c7_3c2d_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1550_c7_3c2d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1550_c7_3c2d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1550_c7_3c2d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1550_c7_3c2d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1550_c7_3c2d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1550_c7_3c2d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1550_c7_3c2d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1550_c7_3c2d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1550_c7_3c2d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1550_c7_3c2d_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1539_c7_76fd_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1542_c7_547b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1547_c7_799a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1550_c7_3c2d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1539_c7_76fd_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1542_c7_547b_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1547_c7_799a_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1550_c7_3c2d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1535_c7_233e_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1539_c7_76fd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1547_c7_799a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1550_c7_3c2d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1542_c7_547b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1547_c7_799a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1542_c7_547b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1547_c7_799a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1550_c7_3c2d_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1556_c7_ab19_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1547_c7_799a_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1550_c7_3c2d_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1547_c7_799a] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1547_c7_799a_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1547_c7_799a_cond;
     tmp16_MUX_uxn_opcodes_h_l1547_c7_799a_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1547_c7_799a_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1547_c7_799a_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1547_c7_799a_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1547_c7_799a_return_output := tmp16_MUX_uxn_opcodes_h_l1547_c7_799a_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1547_c7_799a] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1547_c7_799a_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1547_c7_799a_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1547_c7_799a_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1547_c7_799a_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1547_c7_799a_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1547_c7_799a_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1547_c7_799a_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1547_c7_799a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1539_c7_76fd] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1539_c7_76fd_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1539_c7_76fd_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1539_c7_76fd_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1539_c7_76fd_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1539_c7_76fd_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1539_c7_76fd_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1539_c7_76fd_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1539_c7_76fd_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1550_c7_3c2d] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1550_c7_3c2d_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1550_c7_3c2d_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1550_c7_3c2d_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1550_c7_3c2d_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1550_c7_3c2d_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1550_c7_3c2d_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1550_c7_3c2d_return_output := result_stack_value_MUX_uxn_opcodes_h_l1550_c7_3c2d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1547_c7_799a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1547_c7_799a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1547_c7_799a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1547_c7_799a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1547_c7_799a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1547_c7_799a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1547_c7_799a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1547_c7_799a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1547_c7_799a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1542_c7_547b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1542_c7_547b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1542_c7_547b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1542_c7_547b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1542_c7_547b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1542_c7_547b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1542_c7_547b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1542_c7_547b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1542_c7_547b_return_output;

     -- n16_MUX[uxn_opcodes_h_l1539_c7_76fd] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1539_c7_76fd_cond <= VAR_n16_MUX_uxn_opcodes_h_l1539_c7_76fd_cond;
     n16_MUX_uxn_opcodes_h_l1539_c7_76fd_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1539_c7_76fd_iftrue;
     n16_MUX_uxn_opcodes_h_l1539_c7_76fd_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1539_c7_76fd_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1539_c7_76fd_return_output := n16_MUX_uxn_opcodes_h_l1539_c7_76fd_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1542_c7_547b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1542_c7_547b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1542_c7_547b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1542_c7_547b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1542_c7_547b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1542_c7_547b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1542_c7_547b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1542_c7_547b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1542_c7_547b_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1535_c7_233e] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1535_c7_233e_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1535_c7_233e_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1535_c7_233e_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1535_c7_233e_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1535_c7_233e_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1535_c7_233e_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1535_c7_233e_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1535_c7_233e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1547_c7_799a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1547_c7_799a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1547_c7_799a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1547_c7_799a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1547_c7_799a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1547_c7_799a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1547_c7_799a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1547_c7_799a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1547_c7_799a_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1535_c7_233e_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1539_c7_76fd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1542_c7_547b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1547_c7_799a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1535_c7_233e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1539_c7_76fd_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1542_c7_547b_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1547_c7_799a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1532_c7_e055_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1535_c7_233e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1542_c7_547b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1547_c7_799a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1539_c7_76fd_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1542_c7_547b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_76fd_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1542_c7_547b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1547_c7_799a_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1550_c7_3c2d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1542_c7_547b_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1547_c7_799a_return_output;
     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1542_c7_547b] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1542_c7_547b_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1542_c7_547b_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1542_c7_547b_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1542_c7_547b_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1542_c7_547b_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1542_c7_547b_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1542_c7_547b_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1542_c7_547b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1542_c7_547b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1542_c7_547b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1542_c7_547b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1542_c7_547b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1542_c7_547b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1542_c7_547b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1542_c7_547b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1542_c7_547b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1542_c7_547b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1542_c7_547b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1542_c7_547b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1542_c7_547b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1542_c7_547b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1542_c7_547b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1542_c7_547b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1542_c7_547b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1542_c7_547b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1542_c7_547b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1539_c7_76fd] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1539_c7_76fd_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1539_c7_76fd_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1539_c7_76fd_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1539_c7_76fd_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1539_c7_76fd_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1539_c7_76fd_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1539_c7_76fd_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1539_c7_76fd_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1542_c7_547b] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1542_c7_547b_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1542_c7_547b_cond;
     tmp16_MUX_uxn_opcodes_h_l1542_c7_547b_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1542_c7_547b_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1542_c7_547b_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1542_c7_547b_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1542_c7_547b_return_output := tmp16_MUX_uxn_opcodes_h_l1542_c7_547b_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1532_c7_e055] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1532_c7_e055_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1532_c7_e055_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1532_c7_e055_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1532_c7_e055_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1532_c7_e055_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1532_c7_e055_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1532_c7_e055_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1532_c7_e055_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1539_c7_76fd] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_76fd_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_76fd_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_76fd_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_76fd_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_76fd_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_76fd_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_76fd_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_76fd_return_output;

     -- n16_MUX[uxn_opcodes_h_l1535_c7_233e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1535_c7_233e_cond <= VAR_n16_MUX_uxn_opcodes_h_l1535_c7_233e_cond;
     n16_MUX_uxn_opcodes_h_l1535_c7_233e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1535_c7_233e_iftrue;
     n16_MUX_uxn_opcodes_h_l1535_c7_233e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1535_c7_233e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1535_c7_233e_return_output := n16_MUX_uxn_opcodes_h_l1535_c7_233e_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1547_c7_799a] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1547_c7_799a_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1547_c7_799a_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1547_c7_799a_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1547_c7_799a_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1547_c7_799a_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1547_c7_799a_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1547_c7_799a_return_output := result_stack_value_MUX_uxn_opcodes_h_l1547_c7_799a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1535_c7_233e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1535_c7_233e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1535_c7_233e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1535_c7_233e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1535_c7_233e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1535_c7_233e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1535_c7_233e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1535_c7_233e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1535_c7_233e_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1532_c7_e055_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1535_c7_233e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_76fd_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1542_c7_547b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1532_c7_e055_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1535_c7_233e_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1539_c7_76fd_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1542_c7_547b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1526_c2_3a8e_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1532_c7_e055_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1539_c7_76fd_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1542_c7_547b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1535_c7_233e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1539_c7_76fd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1535_c7_233e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_76fd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1542_c7_547b_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1547_c7_799a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1539_c7_76fd_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1542_c7_547b_return_output;
     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1539_c7_76fd] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1539_c7_76fd_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1539_c7_76fd_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1539_c7_76fd_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1539_c7_76fd_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1539_c7_76fd_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1539_c7_76fd_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1539_c7_76fd_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1539_c7_76fd_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1542_c7_547b] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1542_c7_547b_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1542_c7_547b_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1542_c7_547b_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1542_c7_547b_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1542_c7_547b_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1542_c7_547b_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1542_c7_547b_return_output := result_stack_value_MUX_uxn_opcodes_h_l1542_c7_547b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1539_c7_76fd] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1539_c7_76fd_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1539_c7_76fd_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1539_c7_76fd_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1539_c7_76fd_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1539_c7_76fd_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1539_c7_76fd_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1539_c7_76fd_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1539_c7_76fd_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1535_c7_233e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1535_c7_233e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1535_c7_233e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1535_c7_233e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1535_c7_233e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1535_c7_233e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1535_c7_233e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1535_c7_233e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1535_c7_233e_return_output;

     -- n16_MUX[uxn_opcodes_h_l1532_c7_e055] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1532_c7_e055_cond <= VAR_n16_MUX_uxn_opcodes_h_l1532_c7_e055_cond;
     n16_MUX_uxn_opcodes_h_l1532_c7_e055_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1532_c7_e055_iftrue;
     n16_MUX_uxn_opcodes_h_l1532_c7_e055_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1532_c7_e055_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1532_c7_e055_return_output := n16_MUX_uxn_opcodes_h_l1532_c7_e055_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1535_c7_233e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1535_c7_233e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1535_c7_233e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1535_c7_233e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1535_c7_233e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1535_c7_233e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1535_c7_233e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1535_c7_233e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1535_c7_233e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1539_c7_76fd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_76fd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_76fd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_76fd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_76fd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_76fd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_76fd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_76fd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_76fd_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1526_c2_3a8e] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1526_c2_3a8e_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1526_c2_3a8e_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1526_c2_3a8e_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1526_c2_3a8e_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1526_c2_3a8e_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1526_c2_3a8e_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1526_c2_3a8e_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1526_c2_3a8e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1532_c7_e055] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1532_c7_e055_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1532_c7_e055_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1532_c7_e055_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1532_c7_e055_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1532_c7_e055_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1532_c7_e055_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1532_c7_e055_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1532_c7_e055_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1539_c7_76fd] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1539_c7_76fd_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1539_c7_76fd_cond;
     tmp16_MUX_uxn_opcodes_h_l1539_c7_76fd_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1539_c7_76fd_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1539_c7_76fd_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1539_c7_76fd_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1539_c7_76fd_return_output := tmp16_MUX_uxn_opcodes_h_l1539_c7_76fd_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l1526_c2_3a8e_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1532_c7_e055_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1535_c7_233e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_76fd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c2_3a8e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1532_c7_e055_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1535_c7_233e_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1539_c7_76fd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1535_c7_233e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1539_c7_76fd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1532_c7_e055_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1535_c7_233e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1532_c7_e055_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1535_c7_233e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1539_c7_76fd_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1542_c7_547b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1535_c7_233e_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1539_c7_76fd_return_output;
     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1535_c7_233e] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1535_c7_233e_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1535_c7_233e_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1535_c7_233e_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1535_c7_233e_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1535_c7_233e_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1535_c7_233e_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1535_c7_233e_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1535_c7_233e_return_output;

     -- n16_MUX[uxn_opcodes_h_l1526_c2_3a8e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1526_c2_3a8e_cond <= VAR_n16_MUX_uxn_opcodes_h_l1526_c2_3a8e_cond;
     n16_MUX_uxn_opcodes_h_l1526_c2_3a8e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1526_c2_3a8e_iftrue;
     n16_MUX_uxn_opcodes_h_l1526_c2_3a8e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1526_c2_3a8e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1526_c2_3a8e_return_output := n16_MUX_uxn_opcodes_h_l1526_c2_3a8e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1526_c2_3a8e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c2_3a8e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c2_3a8e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c2_3a8e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c2_3a8e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c2_3a8e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c2_3a8e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c2_3a8e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c2_3a8e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1535_c7_233e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1535_c7_233e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1535_c7_233e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1535_c7_233e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1535_c7_233e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1535_c7_233e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1535_c7_233e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1535_c7_233e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1535_c7_233e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1532_c7_e055] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1532_c7_e055_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1532_c7_e055_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1532_c7_e055_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1532_c7_e055_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1532_c7_e055_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1532_c7_e055_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1532_c7_e055_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1532_c7_e055_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1532_c7_e055] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1532_c7_e055_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1532_c7_e055_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1532_c7_e055_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1532_c7_e055_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1532_c7_e055_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1532_c7_e055_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1532_c7_e055_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1532_c7_e055_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1535_c7_233e] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1535_c7_233e_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1535_c7_233e_cond;
     tmp16_MUX_uxn_opcodes_h_l1535_c7_233e_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1535_c7_233e_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1535_c7_233e_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1535_c7_233e_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1535_c7_233e_return_output := tmp16_MUX_uxn_opcodes_h_l1535_c7_233e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1535_c7_233e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1535_c7_233e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1535_c7_233e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1535_c7_233e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1535_c7_233e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1535_c7_233e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1535_c7_233e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1535_c7_233e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1535_c7_233e_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1539_c7_76fd] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1539_c7_76fd_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1539_c7_76fd_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1539_c7_76fd_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1539_c7_76fd_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1539_c7_76fd_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1539_c7_76fd_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1539_c7_76fd_return_output := result_stack_value_MUX_uxn_opcodes_h_l1539_c7_76fd_return_output;

     -- Submodule level 9
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1526_c2_3a8e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1532_c7_e055_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1535_c7_233e_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1532_c7_e055_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1535_c7_233e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1532_c7_e055_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1535_c7_233e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c2_3a8e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1532_c7_e055_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1526_c2_3a8e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1532_c7_e055_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1535_c7_233e_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1539_c7_76fd_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1532_c7_e055_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1535_c7_233e_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1532_c7_e055] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1532_c7_e055_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1532_c7_e055_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1532_c7_e055_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1532_c7_e055_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1532_c7_e055_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1532_c7_e055_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1532_c7_e055_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1532_c7_e055_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1532_c7_e055] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1532_c7_e055_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1532_c7_e055_cond;
     tmp16_MUX_uxn_opcodes_h_l1532_c7_e055_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1532_c7_e055_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1532_c7_e055_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1532_c7_e055_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1532_c7_e055_return_output := tmp16_MUX_uxn_opcodes_h_l1532_c7_e055_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1526_c2_3a8e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c2_3a8e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c2_3a8e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c2_3a8e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c2_3a8e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c2_3a8e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c2_3a8e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c2_3a8e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c2_3a8e_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1532_c7_e055] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1532_c7_e055_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1532_c7_e055_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1532_c7_e055_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1532_c7_e055_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1532_c7_e055_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1532_c7_e055_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1532_c7_e055_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1532_c7_e055_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1526_c2_3a8e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1526_c2_3a8e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1526_c2_3a8e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1526_c2_3a8e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1526_c2_3a8e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1526_c2_3a8e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1526_c2_3a8e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1526_c2_3a8e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1526_c2_3a8e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1532_c7_e055] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1532_c7_e055_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1532_c7_e055_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1532_c7_e055_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1532_c7_e055_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1532_c7_e055_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1532_c7_e055_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1532_c7_e055_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1532_c7_e055_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1535_c7_233e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1535_c7_233e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1535_c7_233e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1535_c7_233e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1535_c7_233e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1535_c7_233e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1535_c7_233e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1535_c7_233e_return_output := result_stack_value_MUX_uxn_opcodes_h_l1535_c7_233e_return_output;

     -- Submodule level 10
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1526_c2_3a8e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1532_c7_e055_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1526_c2_3a8e_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1532_c7_e055_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1526_c2_3a8e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1532_c7_e055_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1532_c7_e055_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1535_c7_233e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1526_c2_3a8e_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1532_c7_e055_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1532_c7_e055] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1532_c7_e055_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1532_c7_e055_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1532_c7_e055_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1532_c7_e055_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1532_c7_e055_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1532_c7_e055_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1532_c7_e055_return_output := result_stack_value_MUX_uxn_opcodes_h_l1532_c7_e055_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1526_c2_3a8e] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1526_c2_3a8e_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1526_c2_3a8e_cond;
     tmp16_MUX_uxn_opcodes_h_l1526_c2_3a8e_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1526_c2_3a8e_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1526_c2_3a8e_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1526_c2_3a8e_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1526_c2_3a8e_return_output := tmp16_MUX_uxn_opcodes_h_l1526_c2_3a8e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1526_c2_3a8e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1526_c2_3a8e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1526_c2_3a8e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1526_c2_3a8e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1526_c2_3a8e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1526_c2_3a8e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1526_c2_3a8e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1526_c2_3a8e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1526_c2_3a8e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1526_c2_3a8e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1526_c2_3a8e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1526_c2_3a8e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1526_c2_3a8e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1526_c2_3a8e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1526_c2_3a8e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1526_c2_3a8e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1526_c2_3a8e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1526_c2_3a8e_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1526_c2_3a8e] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1526_c2_3a8e_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1526_c2_3a8e_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1526_c2_3a8e_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1526_c2_3a8e_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1526_c2_3a8e_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1526_c2_3a8e_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1526_c2_3a8e_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1526_c2_3a8e_return_output;

     -- Submodule level 11
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1526_c2_3a8e_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1532_c7_e055_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1526_c2_3a8e_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1526_c2_3a8e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1526_c2_3a8e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1526_c2_3a8e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1526_c2_3a8e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1526_c2_3a8e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1526_c2_3a8e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1526_c2_3a8e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1526_c2_3a8e_return_output := result_stack_value_MUX_uxn_opcodes_h_l1526_c2_3a8e_return_output;

     -- Submodule level 12
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_2866_uxn_opcodes_h_l1573_l1521_DUPLICATE_f78f LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_2866_uxn_opcodes_h_l1573_l1521_DUPLICATE_f78f_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_2866(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c2_3a8e_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c2_3a8e_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1526_c2_3a8e_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1526_c2_3a8e_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1526_c2_3a8e_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1526_c2_3a8e_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1526_c2_3a8e_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1526_c2_3a8e_return_output);

     -- Submodule level 13
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_2866_uxn_opcodes_h_l1573_l1521_DUPLICATE_f78f_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_2866_uxn_opcodes_h_l1573_l1521_DUPLICATE_f78f_return_output;
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
