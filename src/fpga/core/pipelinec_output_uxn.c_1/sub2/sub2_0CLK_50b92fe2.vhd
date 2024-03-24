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
entity sub2_0CLK_50b92fe2 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end sub2_0CLK_50b92fe2;
architecture arch of sub2_0CLK_50b92fe2 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l2497_c6_b623]
signal BIN_OP_EQ_uxn_opcodes_h_l2497_c6_b623_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2497_c6_b623_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2497_c6_b623_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2497_c2_1b15]
signal t16_MUX_uxn_opcodes_h_l2497_c2_1b15_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2497_c2_1b15_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2497_c2_1b15_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2497_c2_1b15_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2497_c2_1b15]
signal n16_MUX_uxn_opcodes_h_l2497_c2_1b15_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2497_c2_1b15_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2497_c2_1b15_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2497_c2_1b15_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2497_c2_1b15]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2497_c2_1b15_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2497_c2_1b15_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2497_c2_1b15_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2497_c2_1b15_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2497_c2_1b15]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2497_c2_1b15_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2497_c2_1b15_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2497_c2_1b15_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2497_c2_1b15_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2497_c2_1b15]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c2_1b15_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c2_1b15_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c2_1b15_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c2_1b15_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2497_c2_1b15]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2497_c2_1b15_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2497_c2_1b15_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2497_c2_1b15_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2497_c2_1b15_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2497_c2_1b15]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2497_c2_1b15_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2497_c2_1b15_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2497_c2_1b15_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2497_c2_1b15_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2497_c2_1b15]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c2_1b15_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c2_1b15_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c2_1b15_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c2_1b15_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l2497_c2_1b15]
signal result_is_vram_write_MUX_uxn_opcodes_h_l2497_c2_1b15_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2497_c2_1b15_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2497_c2_1b15_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2497_c2_1b15_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l2497_c2_1b15]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2497_c2_1b15_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2497_c2_1b15_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2497_c2_1b15_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2497_c2_1b15_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2497_c2_1b15]
signal result_u8_value_MUX_uxn_opcodes_h_l2497_c2_1b15_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2497_c2_1b15_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2497_c2_1b15_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2497_c2_1b15_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2497_c2_1b15]
signal tmp16_MUX_uxn_opcodes_h_l2497_c2_1b15_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2497_c2_1b15_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2497_c2_1b15_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2497_c2_1b15_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2510_c11_5af3]
signal BIN_OP_EQ_uxn_opcodes_h_l2510_c11_5af3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2510_c11_5af3_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2510_c11_5af3_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2510_c7_ecce]
signal t16_MUX_uxn_opcodes_h_l2510_c7_ecce_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2510_c7_ecce_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2510_c7_ecce_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2510_c7_ecce_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2510_c7_ecce]
signal n16_MUX_uxn_opcodes_h_l2510_c7_ecce_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2510_c7_ecce_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2510_c7_ecce_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2510_c7_ecce_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2510_c7_ecce]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_ecce_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_ecce_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_ecce_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_ecce_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2510_c7_ecce]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_ecce_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_ecce_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_ecce_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_ecce_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2510_c7_ecce]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_ecce_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_ecce_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_ecce_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_ecce_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2510_c7_ecce]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_ecce_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_ecce_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_ecce_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_ecce_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2510_c7_ecce]
signal result_u8_value_MUX_uxn_opcodes_h_l2510_c7_ecce_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2510_c7_ecce_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2510_c7_ecce_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2510_c7_ecce_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2510_c7_ecce]
signal tmp16_MUX_uxn_opcodes_h_l2510_c7_ecce_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2510_c7_ecce_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2510_c7_ecce_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2510_c7_ecce_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2513_c11_6331]
signal BIN_OP_EQ_uxn_opcodes_h_l2513_c11_6331_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2513_c11_6331_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2513_c11_6331_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2513_c7_0ef3]
signal t16_MUX_uxn_opcodes_h_l2513_c7_0ef3_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2513_c7_0ef3_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2513_c7_0ef3_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2513_c7_0ef3_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2513_c7_0ef3]
signal n16_MUX_uxn_opcodes_h_l2513_c7_0ef3_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2513_c7_0ef3_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2513_c7_0ef3_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2513_c7_0ef3_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2513_c7_0ef3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_0ef3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_0ef3_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_0ef3_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_0ef3_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2513_c7_0ef3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_0ef3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_0ef3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_0ef3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_0ef3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2513_c7_0ef3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_0ef3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_0ef3_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_0ef3_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_0ef3_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2513_c7_0ef3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_0ef3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_0ef3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_0ef3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_0ef3_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2513_c7_0ef3]
signal result_u8_value_MUX_uxn_opcodes_h_l2513_c7_0ef3_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2513_c7_0ef3_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2513_c7_0ef3_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2513_c7_0ef3_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2513_c7_0ef3]
signal tmp16_MUX_uxn_opcodes_h_l2513_c7_0ef3_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2513_c7_0ef3_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2513_c7_0ef3_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2513_c7_0ef3_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2518_c11_114a]
signal BIN_OP_EQ_uxn_opcodes_h_l2518_c11_114a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2518_c11_114a_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2518_c11_114a_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2518_c7_51bd]
signal t16_MUX_uxn_opcodes_h_l2518_c7_51bd_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2518_c7_51bd_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2518_c7_51bd_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2518_c7_51bd_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2518_c7_51bd]
signal n16_MUX_uxn_opcodes_h_l2518_c7_51bd_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2518_c7_51bd_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2518_c7_51bd_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2518_c7_51bd_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2518_c7_51bd]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2518_c7_51bd_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2518_c7_51bd_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2518_c7_51bd_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2518_c7_51bd_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2518_c7_51bd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2518_c7_51bd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2518_c7_51bd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2518_c7_51bd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2518_c7_51bd_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2518_c7_51bd]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2518_c7_51bd_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2518_c7_51bd_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2518_c7_51bd_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2518_c7_51bd_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2518_c7_51bd]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2518_c7_51bd_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2518_c7_51bd_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2518_c7_51bd_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2518_c7_51bd_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2518_c7_51bd]
signal result_u8_value_MUX_uxn_opcodes_h_l2518_c7_51bd_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2518_c7_51bd_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2518_c7_51bd_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2518_c7_51bd_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2518_c7_51bd]
signal tmp16_MUX_uxn_opcodes_h_l2518_c7_51bd_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2518_c7_51bd_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2518_c7_51bd_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2518_c7_51bd_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2519_c3_0b33]
signal BIN_OP_OR_uxn_opcodes_h_l2519_c3_0b33_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2519_c3_0b33_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2519_c3_0b33_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2522_c11_b01d]
signal BIN_OP_EQ_uxn_opcodes_h_l2522_c11_b01d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2522_c11_b01d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2522_c11_b01d_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2522_c7_7846]
signal n16_MUX_uxn_opcodes_h_l2522_c7_7846_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2522_c7_7846_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2522_c7_7846_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2522_c7_7846_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2522_c7_7846]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2522_c7_7846_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2522_c7_7846_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2522_c7_7846_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2522_c7_7846_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2522_c7_7846]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2522_c7_7846_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2522_c7_7846_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2522_c7_7846_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2522_c7_7846_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2522_c7_7846]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2522_c7_7846_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2522_c7_7846_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2522_c7_7846_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2522_c7_7846_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2522_c7_7846]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2522_c7_7846_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2522_c7_7846_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2522_c7_7846_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2522_c7_7846_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2522_c7_7846]
signal result_u8_value_MUX_uxn_opcodes_h_l2522_c7_7846_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2522_c7_7846_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2522_c7_7846_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2522_c7_7846_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2522_c7_7846]
signal tmp16_MUX_uxn_opcodes_h_l2522_c7_7846_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2522_c7_7846_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2522_c7_7846_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2522_c7_7846_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2526_c11_9e7e]
signal BIN_OP_EQ_uxn_opcodes_h_l2526_c11_9e7e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2526_c11_9e7e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2526_c11_9e7e_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2526_c7_1f95]
signal n16_MUX_uxn_opcodes_h_l2526_c7_1f95_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2526_c7_1f95_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2526_c7_1f95_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2526_c7_1f95_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2526_c7_1f95]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_1f95_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_1f95_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_1f95_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_1f95_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2526_c7_1f95]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_1f95_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_1f95_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_1f95_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_1f95_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2526_c7_1f95]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_1f95_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_1f95_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_1f95_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_1f95_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2526_c7_1f95]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_1f95_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_1f95_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_1f95_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_1f95_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2526_c7_1f95]
signal result_u8_value_MUX_uxn_opcodes_h_l2526_c7_1f95_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2526_c7_1f95_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2526_c7_1f95_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2526_c7_1f95_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2526_c7_1f95]
signal tmp16_MUX_uxn_opcodes_h_l2526_c7_1f95_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2526_c7_1f95_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2526_c7_1f95_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2526_c7_1f95_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2527_c3_ce5c]
signal BIN_OP_OR_uxn_opcodes_h_l2527_c3_ce5c_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2527_c3_ce5c_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2527_c3_ce5c_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l2528_c11_dc75]
signal BIN_OP_MINUS_uxn_opcodes_h_l2528_c11_dc75_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l2528_c11_dc75_right : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l2528_c11_dc75_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2529_c30_c3e1]
signal sp_relative_shift_uxn_opcodes_h_l2529_c30_c3e1_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2529_c30_c3e1_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2529_c30_c3e1_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2529_c30_c3e1_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2534_c11_90cc]
signal BIN_OP_EQ_uxn_opcodes_h_l2534_c11_90cc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2534_c11_90cc_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2534_c11_90cc_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2534_c7_1643]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_1643_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_1643_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_1643_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_1643_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2534_c7_1643]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_1643_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_1643_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_1643_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_1643_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2534_c7_1643]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_1643_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_1643_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_1643_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_1643_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2534_c7_1643]
signal result_u8_value_MUX_uxn_opcodes_h_l2534_c7_1643_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2534_c7_1643_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2534_c7_1643_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2534_c7_1643_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2537_c31_71d6]
signal CONST_SR_8_uxn_opcodes_h_l2537_c31_71d6_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2537_c31_71d6_return_output : unsigned(15 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2515_l2524_DUPLICATE_018d
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2515_l2524_DUPLICATE_018d_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2515_l2524_DUPLICATE_018d_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_04b4( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : signed;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_opc_done := ref_toks_1;
      base.is_ram_write := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.is_stack_index_flipped := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.is_vram_write := ref_toks_7;
      base.is_pc_updated := ref_toks_8;
      base.u8_value := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2497_c6_b623
BIN_OP_EQ_uxn_opcodes_h_l2497_c6_b623 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2497_c6_b623_left,
BIN_OP_EQ_uxn_opcodes_h_l2497_c6_b623_right,
BIN_OP_EQ_uxn_opcodes_h_l2497_c6_b623_return_output);

-- t16_MUX_uxn_opcodes_h_l2497_c2_1b15
t16_MUX_uxn_opcodes_h_l2497_c2_1b15 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2497_c2_1b15_cond,
t16_MUX_uxn_opcodes_h_l2497_c2_1b15_iftrue,
t16_MUX_uxn_opcodes_h_l2497_c2_1b15_iffalse,
t16_MUX_uxn_opcodes_h_l2497_c2_1b15_return_output);

-- n16_MUX_uxn_opcodes_h_l2497_c2_1b15
n16_MUX_uxn_opcodes_h_l2497_c2_1b15 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2497_c2_1b15_cond,
n16_MUX_uxn_opcodes_h_l2497_c2_1b15_iftrue,
n16_MUX_uxn_opcodes_h_l2497_c2_1b15_iffalse,
n16_MUX_uxn_opcodes_h_l2497_c2_1b15_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2497_c2_1b15
result_is_opc_done_MUX_uxn_opcodes_h_l2497_c2_1b15 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2497_c2_1b15_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2497_c2_1b15_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2497_c2_1b15_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2497_c2_1b15_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2497_c2_1b15
result_is_ram_write_MUX_uxn_opcodes_h_l2497_c2_1b15 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2497_c2_1b15_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2497_c2_1b15_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2497_c2_1b15_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2497_c2_1b15_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c2_1b15
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c2_1b15 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c2_1b15_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c2_1b15_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c2_1b15_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c2_1b15_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2497_c2_1b15
result_is_stack_write_MUX_uxn_opcodes_h_l2497_c2_1b15 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2497_c2_1b15_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2497_c2_1b15_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2497_c2_1b15_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2497_c2_1b15_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2497_c2_1b15
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2497_c2_1b15 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2497_c2_1b15_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2497_c2_1b15_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2497_c2_1b15_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2497_c2_1b15_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c2_1b15
result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c2_1b15 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c2_1b15_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c2_1b15_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c2_1b15_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c2_1b15_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l2497_c2_1b15
result_is_vram_write_MUX_uxn_opcodes_h_l2497_c2_1b15 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l2497_c2_1b15_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l2497_c2_1b15_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l2497_c2_1b15_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l2497_c2_1b15_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l2497_c2_1b15
result_is_pc_updated_MUX_uxn_opcodes_h_l2497_c2_1b15 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l2497_c2_1b15_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l2497_c2_1b15_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l2497_c2_1b15_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l2497_c2_1b15_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2497_c2_1b15
result_u8_value_MUX_uxn_opcodes_h_l2497_c2_1b15 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2497_c2_1b15_cond,
result_u8_value_MUX_uxn_opcodes_h_l2497_c2_1b15_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2497_c2_1b15_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2497_c2_1b15_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2497_c2_1b15
tmp16_MUX_uxn_opcodes_h_l2497_c2_1b15 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2497_c2_1b15_cond,
tmp16_MUX_uxn_opcodes_h_l2497_c2_1b15_iftrue,
tmp16_MUX_uxn_opcodes_h_l2497_c2_1b15_iffalse,
tmp16_MUX_uxn_opcodes_h_l2497_c2_1b15_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2510_c11_5af3
BIN_OP_EQ_uxn_opcodes_h_l2510_c11_5af3 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2510_c11_5af3_left,
BIN_OP_EQ_uxn_opcodes_h_l2510_c11_5af3_right,
BIN_OP_EQ_uxn_opcodes_h_l2510_c11_5af3_return_output);

-- t16_MUX_uxn_opcodes_h_l2510_c7_ecce
t16_MUX_uxn_opcodes_h_l2510_c7_ecce : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2510_c7_ecce_cond,
t16_MUX_uxn_opcodes_h_l2510_c7_ecce_iftrue,
t16_MUX_uxn_opcodes_h_l2510_c7_ecce_iffalse,
t16_MUX_uxn_opcodes_h_l2510_c7_ecce_return_output);

-- n16_MUX_uxn_opcodes_h_l2510_c7_ecce
n16_MUX_uxn_opcodes_h_l2510_c7_ecce : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2510_c7_ecce_cond,
n16_MUX_uxn_opcodes_h_l2510_c7_ecce_iftrue,
n16_MUX_uxn_opcodes_h_l2510_c7_ecce_iffalse,
n16_MUX_uxn_opcodes_h_l2510_c7_ecce_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_ecce
result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_ecce : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_ecce_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_ecce_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_ecce_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_ecce_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_ecce
result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_ecce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_ecce_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_ecce_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_ecce_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_ecce_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_ecce
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_ecce : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_ecce_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_ecce_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_ecce_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_ecce_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_ecce
result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_ecce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_ecce_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_ecce_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_ecce_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_ecce_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2510_c7_ecce
result_u8_value_MUX_uxn_opcodes_h_l2510_c7_ecce : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2510_c7_ecce_cond,
result_u8_value_MUX_uxn_opcodes_h_l2510_c7_ecce_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2510_c7_ecce_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2510_c7_ecce_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2510_c7_ecce
tmp16_MUX_uxn_opcodes_h_l2510_c7_ecce : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2510_c7_ecce_cond,
tmp16_MUX_uxn_opcodes_h_l2510_c7_ecce_iftrue,
tmp16_MUX_uxn_opcodes_h_l2510_c7_ecce_iffalse,
tmp16_MUX_uxn_opcodes_h_l2510_c7_ecce_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2513_c11_6331
BIN_OP_EQ_uxn_opcodes_h_l2513_c11_6331 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2513_c11_6331_left,
BIN_OP_EQ_uxn_opcodes_h_l2513_c11_6331_right,
BIN_OP_EQ_uxn_opcodes_h_l2513_c11_6331_return_output);

-- t16_MUX_uxn_opcodes_h_l2513_c7_0ef3
t16_MUX_uxn_opcodes_h_l2513_c7_0ef3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2513_c7_0ef3_cond,
t16_MUX_uxn_opcodes_h_l2513_c7_0ef3_iftrue,
t16_MUX_uxn_opcodes_h_l2513_c7_0ef3_iffalse,
t16_MUX_uxn_opcodes_h_l2513_c7_0ef3_return_output);

-- n16_MUX_uxn_opcodes_h_l2513_c7_0ef3
n16_MUX_uxn_opcodes_h_l2513_c7_0ef3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2513_c7_0ef3_cond,
n16_MUX_uxn_opcodes_h_l2513_c7_0ef3_iftrue,
n16_MUX_uxn_opcodes_h_l2513_c7_0ef3_iffalse,
n16_MUX_uxn_opcodes_h_l2513_c7_0ef3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_0ef3
result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_0ef3 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_0ef3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_0ef3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_0ef3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_0ef3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_0ef3
result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_0ef3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_0ef3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_0ef3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_0ef3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_0ef3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_0ef3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_0ef3 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_0ef3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_0ef3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_0ef3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_0ef3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_0ef3
result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_0ef3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_0ef3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_0ef3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_0ef3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_0ef3_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2513_c7_0ef3
result_u8_value_MUX_uxn_opcodes_h_l2513_c7_0ef3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2513_c7_0ef3_cond,
result_u8_value_MUX_uxn_opcodes_h_l2513_c7_0ef3_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2513_c7_0ef3_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2513_c7_0ef3_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2513_c7_0ef3
tmp16_MUX_uxn_opcodes_h_l2513_c7_0ef3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2513_c7_0ef3_cond,
tmp16_MUX_uxn_opcodes_h_l2513_c7_0ef3_iftrue,
tmp16_MUX_uxn_opcodes_h_l2513_c7_0ef3_iffalse,
tmp16_MUX_uxn_opcodes_h_l2513_c7_0ef3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2518_c11_114a
BIN_OP_EQ_uxn_opcodes_h_l2518_c11_114a : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2518_c11_114a_left,
BIN_OP_EQ_uxn_opcodes_h_l2518_c11_114a_right,
BIN_OP_EQ_uxn_opcodes_h_l2518_c11_114a_return_output);

-- t16_MUX_uxn_opcodes_h_l2518_c7_51bd
t16_MUX_uxn_opcodes_h_l2518_c7_51bd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2518_c7_51bd_cond,
t16_MUX_uxn_opcodes_h_l2518_c7_51bd_iftrue,
t16_MUX_uxn_opcodes_h_l2518_c7_51bd_iffalse,
t16_MUX_uxn_opcodes_h_l2518_c7_51bd_return_output);

-- n16_MUX_uxn_opcodes_h_l2518_c7_51bd
n16_MUX_uxn_opcodes_h_l2518_c7_51bd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2518_c7_51bd_cond,
n16_MUX_uxn_opcodes_h_l2518_c7_51bd_iftrue,
n16_MUX_uxn_opcodes_h_l2518_c7_51bd_iffalse,
n16_MUX_uxn_opcodes_h_l2518_c7_51bd_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2518_c7_51bd
result_sp_relative_shift_MUX_uxn_opcodes_h_l2518_c7_51bd : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2518_c7_51bd_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2518_c7_51bd_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2518_c7_51bd_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2518_c7_51bd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2518_c7_51bd
result_is_opc_done_MUX_uxn_opcodes_h_l2518_c7_51bd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2518_c7_51bd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2518_c7_51bd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2518_c7_51bd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2518_c7_51bd_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2518_c7_51bd
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2518_c7_51bd : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2518_c7_51bd_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2518_c7_51bd_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2518_c7_51bd_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2518_c7_51bd_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2518_c7_51bd
result_is_stack_write_MUX_uxn_opcodes_h_l2518_c7_51bd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2518_c7_51bd_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2518_c7_51bd_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2518_c7_51bd_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2518_c7_51bd_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2518_c7_51bd
result_u8_value_MUX_uxn_opcodes_h_l2518_c7_51bd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2518_c7_51bd_cond,
result_u8_value_MUX_uxn_opcodes_h_l2518_c7_51bd_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2518_c7_51bd_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2518_c7_51bd_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2518_c7_51bd
tmp16_MUX_uxn_opcodes_h_l2518_c7_51bd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2518_c7_51bd_cond,
tmp16_MUX_uxn_opcodes_h_l2518_c7_51bd_iftrue,
tmp16_MUX_uxn_opcodes_h_l2518_c7_51bd_iffalse,
tmp16_MUX_uxn_opcodes_h_l2518_c7_51bd_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2519_c3_0b33
BIN_OP_OR_uxn_opcodes_h_l2519_c3_0b33 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2519_c3_0b33_left,
BIN_OP_OR_uxn_opcodes_h_l2519_c3_0b33_right,
BIN_OP_OR_uxn_opcodes_h_l2519_c3_0b33_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2522_c11_b01d
BIN_OP_EQ_uxn_opcodes_h_l2522_c11_b01d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2522_c11_b01d_left,
BIN_OP_EQ_uxn_opcodes_h_l2522_c11_b01d_right,
BIN_OP_EQ_uxn_opcodes_h_l2522_c11_b01d_return_output);

-- n16_MUX_uxn_opcodes_h_l2522_c7_7846
n16_MUX_uxn_opcodes_h_l2522_c7_7846 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2522_c7_7846_cond,
n16_MUX_uxn_opcodes_h_l2522_c7_7846_iftrue,
n16_MUX_uxn_opcodes_h_l2522_c7_7846_iffalse,
n16_MUX_uxn_opcodes_h_l2522_c7_7846_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2522_c7_7846
result_sp_relative_shift_MUX_uxn_opcodes_h_l2522_c7_7846 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2522_c7_7846_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2522_c7_7846_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2522_c7_7846_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2522_c7_7846_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2522_c7_7846
result_is_opc_done_MUX_uxn_opcodes_h_l2522_c7_7846 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2522_c7_7846_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2522_c7_7846_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2522_c7_7846_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2522_c7_7846_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2522_c7_7846
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2522_c7_7846 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2522_c7_7846_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2522_c7_7846_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2522_c7_7846_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2522_c7_7846_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2522_c7_7846
result_is_stack_write_MUX_uxn_opcodes_h_l2522_c7_7846 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2522_c7_7846_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2522_c7_7846_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2522_c7_7846_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2522_c7_7846_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2522_c7_7846
result_u8_value_MUX_uxn_opcodes_h_l2522_c7_7846 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2522_c7_7846_cond,
result_u8_value_MUX_uxn_opcodes_h_l2522_c7_7846_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2522_c7_7846_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2522_c7_7846_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2522_c7_7846
tmp16_MUX_uxn_opcodes_h_l2522_c7_7846 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2522_c7_7846_cond,
tmp16_MUX_uxn_opcodes_h_l2522_c7_7846_iftrue,
tmp16_MUX_uxn_opcodes_h_l2522_c7_7846_iffalse,
tmp16_MUX_uxn_opcodes_h_l2522_c7_7846_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2526_c11_9e7e
BIN_OP_EQ_uxn_opcodes_h_l2526_c11_9e7e : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2526_c11_9e7e_left,
BIN_OP_EQ_uxn_opcodes_h_l2526_c11_9e7e_right,
BIN_OP_EQ_uxn_opcodes_h_l2526_c11_9e7e_return_output);

-- n16_MUX_uxn_opcodes_h_l2526_c7_1f95
n16_MUX_uxn_opcodes_h_l2526_c7_1f95 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2526_c7_1f95_cond,
n16_MUX_uxn_opcodes_h_l2526_c7_1f95_iftrue,
n16_MUX_uxn_opcodes_h_l2526_c7_1f95_iffalse,
n16_MUX_uxn_opcodes_h_l2526_c7_1f95_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_1f95
result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_1f95 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_1f95_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_1f95_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_1f95_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_1f95_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_1f95
result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_1f95 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_1f95_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_1f95_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_1f95_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_1f95_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_1f95
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_1f95 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_1f95_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_1f95_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_1f95_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_1f95_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_1f95
result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_1f95 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_1f95_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_1f95_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_1f95_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_1f95_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2526_c7_1f95
result_u8_value_MUX_uxn_opcodes_h_l2526_c7_1f95 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2526_c7_1f95_cond,
result_u8_value_MUX_uxn_opcodes_h_l2526_c7_1f95_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2526_c7_1f95_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2526_c7_1f95_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2526_c7_1f95
tmp16_MUX_uxn_opcodes_h_l2526_c7_1f95 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2526_c7_1f95_cond,
tmp16_MUX_uxn_opcodes_h_l2526_c7_1f95_iftrue,
tmp16_MUX_uxn_opcodes_h_l2526_c7_1f95_iffalse,
tmp16_MUX_uxn_opcodes_h_l2526_c7_1f95_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2527_c3_ce5c
BIN_OP_OR_uxn_opcodes_h_l2527_c3_ce5c : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2527_c3_ce5c_left,
BIN_OP_OR_uxn_opcodes_h_l2527_c3_ce5c_right,
BIN_OP_OR_uxn_opcodes_h_l2527_c3_ce5c_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l2528_c11_dc75
BIN_OP_MINUS_uxn_opcodes_h_l2528_c11_dc75 : entity work.BIN_OP_MINUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l2528_c11_dc75_left,
BIN_OP_MINUS_uxn_opcodes_h_l2528_c11_dc75_right,
BIN_OP_MINUS_uxn_opcodes_h_l2528_c11_dc75_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2529_c30_c3e1
sp_relative_shift_uxn_opcodes_h_l2529_c30_c3e1 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2529_c30_c3e1_ins,
sp_relative_shift_uxn_opcodes_h_l2529_c30_c3e1_x,
sp_relative_shift_uxn_opcodes_h_l2529_c30_c3e1_y,
sp_relative_shift_uxn_opcodes_h_l2529_c30_c3e1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2534_c11_90cc
BIN_OP_EQ_uxn_opcodes_h_l2534_c11_90cc : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2534_c11_90cc_left,
BIN_OP_EQ_uxn_opcodes_h_l2534_c11_90cc_right,
BIN_OP_EQ_uxn_opcodes_h_l2534_c11_90cc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_1643
result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_1643 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_1643_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_1643_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_1643_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_1643_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_1643
result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_1643 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_1643_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_1643_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_1643_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_1643_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_1643
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_1643 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_1643_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_1643_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_1643_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_1643_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2534_c7_1643
result_u8_value_MUX_uxn_opcodes_h_l2534_c7_1643 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2534_c7_1643_cond,
result_u8_value_MUX_uxn_opcodes_h_l2534_c7_1643_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2534_c7_1643_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2534_c7_1643_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2537_c31_71d6
CONST_SR_8_uxn_opcodes_h_l2537_c31_71d6 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2537_c31_71d6_x,
CONST_SR_8_uxn_opcodes_h_l2537_c31_71d6_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2515_l2524_DUPLICATE_018d
CONST_SL_8_uint16_t_uxn_opcodes_h_l2515_l2524_DUPLICATE_018d : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l2515_l2524_DUPLICATE_018d_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l2515_l2524_DUPLICATE_018d_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2497_c6_b623_return_output,
 t16_MUX_uxn_opcodes_h_l2497_c2_1b15_return_output,
 n16_MUX_uxn_opcodes_h_l2497_c2_1b15_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2497_c2_1b15_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2497_c2_1b15_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c2_1b15_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2497_c2_1b15_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2497_c2_1b15_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c2_1b15_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l2497_c2_1b15_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l2497_c2_1b15_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2497_c2_1b15_return_output,
 tmp16_MUX_uxn_opcodes_h_l2497_c2_1b15_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2510_c11_5af3_return_output,
 t16_MUX_uxn_opcodes_h_l2510_c7_ecce_return_output,
 n16_MUX_uxn_opcodes_h_l2510_c7_ecce_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_ecce_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_ecce_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_ecce_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_ecce_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2510_c7_ecce_return_output,
 tmp16_MUX_uxn_opcodes_h_l2510_c7_ecce_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2513_c11_6331_return_output,
 t16_MUX_uxn_opcodes_h_l2513_c7_0ef3_return_output,
 n16_MUX_uxn_opcodes_h_l2513_c7_0ef3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_0ef3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_0ef3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_0ef3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_0ef3_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2513_c7_0ef3_return_output,
 tmp16_MUX_uxn_opcodes_h_l2513_c7_0ef3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2518_c11_114a_return_output,
 t16_MUX_uxn_opcodes_h_l2518_c7_51bd_return_output,
 n16_MUX_uxn_opcodes_h_l2518_c7_51bd_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2518_c7_51bd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2518_c7_51bd_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2518_c7_51bd_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2518_c7_51bd_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2518_c7_51bd_return_output,
 tmp16_MUX_uxn_opcodes_h_l2518_c7_51bd_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2519_c3_0b33_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2522_c11_b01d_return_output,
 n16_MUX_uxn_opcodes_h_l2522_c7_7846_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2522_c7_7846_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2522_c7_7846_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2522_c7_7846_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2522_c7_7846_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2522_c7_7846_return_output,
 tmp16_MUX_uxn_opcodes_h_l2522_c7_7846_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2526_c11_9e7e_return_output,
 n16_MUX_uxn_opcodes_h_l2526_c7_1f95_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_1f95_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_1f95_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_1f95_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_1f95_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2526_c7_1f95_return_output,
 tmp16_MUX_uxn_opcodes_h_l2526_c7_1f95_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2527_c3_ce5c_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l2528_c11_dc75_return_output,
 sp_relative_shift_uxn_opcodes_h_l2529_c30_c3e1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2534_c11_90cc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_1643_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_1643_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_1643_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2534_c7_1643_return_output,
 CONST_SR_8_uxn_opcodes_h_l2537_c31_71d6_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l2515_l2524_DUPLICATE_018d_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2497_c6_b623_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2497_c6_b623_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2497_c6_b623_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2497_c2_1b15_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2497_c2_1b15_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2510_c7_ecce_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2497_c2_1b15_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2497_c2_1b15_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2497_c2_1b15_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2497_c2_1b15_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2510_c7_ecce_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2497_c2_1b15_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2497_c2_1b15_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2497_c2_1b15_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2497_c2_1b15_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_ecce_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2497_c2_1b15_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2497_c2_1b15_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2497_c2_1b15_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2497_c2_1b15_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2497_c2_1b15_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2497_c2_1b15_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2497_c2_1b15_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c2_1b15_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2507_c3_52da : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c2_1b15_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_ecce_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c2_1b15_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c2_1b15_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2497_c2_1b15_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2497_c2_1b15_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_ecce_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2497_c2_1b15_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2497_c2_1b15_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2497_c2_1b15_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2497_c2_1b15_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2497_c2_1b15_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2497_c2_1b15_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2497_c2_1b15_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c2_1b15_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2502_c3_357c : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c2_1b15_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_ecce_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c2_1b15_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c2_1b15_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2497_c2_1b15_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2497_c2_1b15_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2497_c2_1b15_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2497_c2_1b15_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2497_c2_1b15_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2497_c2_1b15_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2497_c2_1b15_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2497_c2_1b15_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2497_c2_1b15_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2497_c2_1b15_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2497_c2_1b15_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2497_c2_1b15_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2510_c7_ecce_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2497_c2_1b15_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2497_c2_1b15_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2497_c2_1b15_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2497_c2_1b15_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2510_c7_ecce_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2497_c2_1b15_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2497_c2_1b15_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2510_c11_5af3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2510_c11_5af3_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2510_c11_5af3_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2510_c7_ecce_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2510_c7_ecce_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2513_c7_0ef3_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2510_c7_ecce_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2510_c7_ecce_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2510_c7_ecce_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2513_c7_0ef3_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2510_c7_ecce_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_ecce_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_ecce_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_0ef3_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_ecce_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_ecce_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_ecce_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_0ef3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_ecce_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_ecce_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2511_c3_d69e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_ecce_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_0ef3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_ecce_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_ecce_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_ecce_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_0ef3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_ecce_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2510_c7_ecce_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2510_c7_ecce_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2513_c7_0ef3_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2510_c7_ecce_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2510_c7_ecce_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2510_c7_ecce_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2513_c7_0ef3_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2510_c7_ecce_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_6331_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_6331_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_6331_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2513_c7_0ef3_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2513_c7_0ef3_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2518_c7_51bd_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2513_c7_0ef3_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2513_c7_0ef3_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2513_c7_0ef3_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2518_c7_51bd_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2513_c7_0ef3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_0ef3_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_0ef3_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2518_c7_51bd_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_0ef3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_0ef3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_0ef3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2518_c7_51bd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_0ef3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_0ef3_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2516_c3_a286 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_0ef3_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2518_c7_51bd_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_0ef3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_0ef3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_0ef3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2518_c7_51bd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_0ef3_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2513_c7_0ef3_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2513_c7_0ef3_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2518_c7_51bd_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2513_c7_0ef3_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2513_c7_0ef3_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2513_c7_0ef3_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2518_c7_51bd_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2513_c7_0ef3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2518_c11_114a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2518_c11_114a_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2518_c11_114a_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2518_c7_51bd_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2518_c7_51bd_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2518_c7_51bd_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2518_c7_51bd_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2518_c7_51bd_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2522_c7_7846_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2518_c7_51bd_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2518_c7_51bd_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2518_c7_51bd_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2522_c7_7846_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2518_c7_51bd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2518_c7_51bd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2518_c7_51bd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2522_c7_7846_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2518_c7_51bd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2518_c7_51bd_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2520_c3_d4e4 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2518_c7_51bd_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2522_c7_7846_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2518_c7_51bd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2518_c7_51bd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2518_c7_51bd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2522_c7_7846_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2518_c7_51bd_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2518_c7_51bd_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2518_c7_51bd_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2522_c7_7846_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2518_c7_51bd_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2518_c7_51bd_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2518_c7_51bd_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2522_c7_7846_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2518_c7_51bd_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2519_c3_0b33_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2519_c3_0b33_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2519_c3_0b33_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2522_c11_b01d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2522_c11_b01d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2522_c11_b01d_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2522_c7_7846_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2522_c7_7846_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2526_c7_1f95_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2522_c7_7846_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2522_c7_7846_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2522_c7_7846_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_1f95_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2522_c7_7846_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2522_c7_7846_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2522_c7_7846_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_1f95_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2522_c7_7846_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2522_c7_7846_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2522_c7_7846_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_1f95_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2522_c7_7846_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2522_c7_7846_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2522_c7_7846_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_1f95_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2522_c7_7846_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2522_c7_7846_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2522_c7_7846_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2526_c7_1f95_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2522_c7_7846_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2522_c7_7846_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2522_c7_7846_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2526_c7_1f95_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2522_c7_7846_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2526_c11_9e7e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2526_c11_9e7e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2526_c11_9e7e_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2526_c7_1f95_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2526_c7_1f95_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2526_c7_1f95_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_1f95_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_1f95_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_1643_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_1f95_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_1f95_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_1f95_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_1643_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_1f95_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_1f95_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2531_c3_f6ec : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_1f95_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_1643_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_1f95_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_1f95_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_1f95_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_1f95_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2526_c7_1f95_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2526_c7_1f95_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2534_c7_1643_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2526_c7_1f95_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2526_c7_1f95_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2526_c7_1f95_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2526_c7_1f95_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2527_c3_ce5c_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2527_c3_ce5c_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2527_c3_ce5c_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2528_c11_dc75_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2528_c11_dc75_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2528_c11_dc75_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2529_c30_c3e1_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2529_c30_c3e1_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2529_c30_c3e1_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2529_c30_c3e1_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2532_c21_10a4_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2534_c11_90cc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2534_c11_90cc_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2534_c11_90cc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_1643_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_1643_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_1643_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_1643_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2535_c3_8736 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_1643_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_1643_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_1643_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2536_c3_b801 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_1643_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_1643_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2534_c7_1643_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2534_c7_1643_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2534_c7_1643_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2537_c31_71d6_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2537_c31_71d6_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2537_c21_40d8_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2513_l2510_l2497_l2534_l2522_l2518_DUPLICATE_ccbf_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2513_l2510_l2534_l2522_l2518_DUPLICATE_fa8d_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2513_l2510_l2534_l2526_l2522_l2518_DUPLICATE_5d66_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2513_l2510_l2526_l2522_l2518_DUPLICATE_4e85_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2514_l2527_l2523_l2519_DUPLICATE_7e3f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2515_l2524_DUPLICATE_018d_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2515_l2524_DUPLICATE_018d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2522_l2534_DUPLICATE_89c1_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_04b4_uxn_opcodes_h_l2541_l2493_DUPLICATE_3e19_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2497_c6_b623_right := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2529_c30_c3e1_y := resize(to_signed(-2, 3), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2510_c11_5af3_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_6331_right := to_unsigned(2, 2);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2497_c2_1b15_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2520_c3_d4e4 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2518_c7_51bd_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2520_c3_d4e4;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2531_c3_f6ec := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_1f95_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2531_c3_f6ec;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2502_c3_357c := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c2_1b15_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2502_c3_357c;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2516_c3_a286 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_0ef3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2516_c3_a286;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2497_c2_1b15_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2518_c11_114a_right := to_unsigned(3, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2497_c2_1b15_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2497_c2_1b15_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2507_c3_52da := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c2_1b15_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2507_c3_52da;
     VAR_sp_relative_shift_uxn_opcodes_h_l2529_c30_c3e1_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2535_c3_8736 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_1643_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2535_c3_8736;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2497_c2_1b15_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2534_c11_90cc_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2526_c11_9e7e_right := to_unsigned(5, 3);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2497_c2_1b15_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2536_c3_b801 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_1643_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2536_c3_b801;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_1f95_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_1643_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2511_c3_d69e := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_ecce_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2511_c3_d69e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2522_c11_b01d_right := to_unsigned(4, 3);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2529_c30_c3e1_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2527_c3_ce5c_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2497_c2_1b15_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2510_c7_ecce_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2513_c7_0ef3_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2518_c7_51bd_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2526_c7_1f95_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2497_c6_b623_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2510_c11_5af3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_6331_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2518_c11_114a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2522_c11_b01d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2526_c11_9e7e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2534_c11_90cc_left := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2528_c11_dc75_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2519_c3_0b33_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2497_c2_1b15_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2510_c7_ecce_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2518_c7_51bd_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2537_c31_71d6_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2497_c2_1b15_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2510_c7_ecce_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2513_c7_0ef3_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2518_c7_51bd_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2522_c7_7846_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2526_c7_1f95_iffalse := tmp16;
     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2497_c2_1b15] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2497_c2_1b15_return_output := result.is_pc_updated;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2497_c2_1b15] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2497_c2_1b15_return_output := result.is_vram_write;

     -- sp_relative_shift[uxn_opcodes_h_l2529_c30_c3e1] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2529_c30_c3e1_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2529_c30_c3e1_ins;
     sp_relative_shift_uxn_opcodes_h_l2529_c30_c3e1_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2529_c30_c3e1_x;
     sp_relative_shift_uxn_opcodes_h_l2529_c30_c3e1_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2529_c30_c3e1_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2529_c30_c3e1_return_output := sp_relative_shift_uxn_opcodes_h_l2529_c30_c3e1_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2522_l2534_DUPLICATE_89c1 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2522_l2534_DUPLICATE_89c1_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2513_c11_6331] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2513_c11_6331_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_6331_left;
     BIN_OP_EQ_uxn_opcodes_h_l2513_c11_6331_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_6331_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_6331_return_output := BIN_OP_EQ_uxn_opcodes_h_l2513_c11_6331_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2513_l2510_l2497_l2534_l2522_l2518_DUPLICATE_ccbf LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2513_l2510_l2497_l2534_l2522_l2518_DUPLICATE_ccbf_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2518_c11_114a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2518_c11_114a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2518_c11_114a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2518_c11_114a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2518_c11_114a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2518_c11_114a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2518_c11_114a_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l2537_c31_71d6] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2537_c31_71d6_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2537_c31_71d6_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2537_c31_71d6_return_output := CONST_SR_8_uxn_opcodes_h_l2537_c31_71d6_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2513_l2510_l2534_l2522_l2518_DUPLICATE_fa8d LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2513_l2510_l2534_l2522_l2518_DUPLICATE_fa8d_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2497_c6_b623] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2497_c6_b623_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2497_c6_b623_left;
     BIN_OP_EQ_uxn_opcodes_h_l2497_c6_b623_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2497_c6_b623_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2497_c6_b623_return_output := BIN_OP_EQ_uxn_opcodes_h_l2497_c6_b623_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2510_c11_5af3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2510_c11_5af3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2510_c11_5af3_left;
     BIN_OP_EQ_uxn_opcodes_h_l2510_c11_5af3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2510_c11_5af3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2510_c11_5af3_return_output := BIN_OP_EQ_uxn_opcodes_h_l2510_c11_5af3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2522_c11_b01d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2522_c11_b01d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2522_c11_b01d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2522_c11_b01d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2522_c11_b01d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2522_c11_b01d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2522_c11_b01d_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l2497_c2_1b15] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2497_c2_1b15_return_output := result.is_stack_index_flipped;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l2497_c2_1b15] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2497_c2_1b15_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2534_c11_90cc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2534_c11_90cc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2534_c11_90cc_left;
     BIN_OP_EQ_uxn_opcodes_h_l2534_c11_90cc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2534_c11_90cc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2534_c11_90cc_return_output := BIN_OP_EQ_uxn_opcodes_h_l2534_c11_90cc_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2514_l2527_l2523_l2519_DUPLICATE_7e3f LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2514_l2527_l2523_l2519_DUPLICATE_7e3f_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l2526_c11_9e7e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2526_c11_9e7e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2526_c11_9e7e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2526_c11_9e7e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2526_c11_9e7e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2526_c11_9e7e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2526_c11_9e7e_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2513_l2510_l2526_l2522_l2518_DUPLICATE_4e85 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2513_l2510_l2526_l2522_l2518_DUPLICATE_4e85_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2513_l2510_l2534_l2526_l2522_l2518_DUPLICATE_5d66 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2513_l2510_l2534_l2526_l2522_l2518_DUPLICATE_5d66_return_output := result.is_opc_done;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l2497_c2_1b15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2497_c6_b623_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2497_c2_1b15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2497_c6_b623_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2497_c2_1b15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2497_c6_b623_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2497_c2_1b15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2497_c6_b623_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2497_c2_1b15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2497_c6_b623_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2497_c2_1b15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2497_c6_b623_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2497_c2_1b15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2497_c6_b623_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c2_1b15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2497_c6_b623_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c2_1b15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2497_c6_b623_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2497_c2_1b15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2497_c6_b623_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2497_c2_1b15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2497_c6_b623_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2497_c2_1b15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2497_c6_b623_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2510_c7_ecce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2510_c11_5af3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_ecce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2510_c11_5af3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_ecce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2510_c11_5af3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_ecce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2510_c11_5af3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_ecce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2510_c11_5af3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2510_c7_ecce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2510_c11_5af3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2510_c7_ecce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2510_c11_5af3_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2510_c7_ecce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2510_c11_5af3_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2513_c7_0ef3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_6331_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_0ef3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_6331_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_0ef3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_6331_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_0ef3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_6331_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_0ef3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_6331_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2513_c7_0ef3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_6331_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2513_c7_0ef3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_6331_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2513_c7_0ef3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_6331_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2518_c7_51bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2518_c11_114a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2518_c7_51bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2518_c11_114a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2518_c7_51bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2518_c11_114a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2518_c7_51bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2518_c11_114a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2518_c7_51bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2518_c11_114a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2518_c7_51bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2518_c11_114a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2518_c7_51bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2518_c11_114a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2518_c7_51bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2518_c11_114a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2522_c7_7846_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2522_c11_b01d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2522_c7_7846_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2522_c11_b01d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2522_c7_7846_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2522_c11_b01d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2522_c7_7846_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2522_c11_b01d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2522_c7_7846_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2522_c11_b01d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2522_c7_7846_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2522_c11_b01d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2522_c7_7846_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2522_c11_b01d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2526_c7_1f95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2526_c11_9e7e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_1f95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2526_c11_9e7e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_1f95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2526_c11_9e7e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_1f95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2526_c11_9e7e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_1f95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2526_c11_9e7e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2526_c7_1f95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2526_c11_9e7e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2526_c7_1f95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2526_c11_9e7e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_1643_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2534_c11_90cc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_1643_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2534_c11_90cc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_1643_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2534_c11_90cc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2534_c7_1643_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2534_c11_90cc_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2519_c3_0b33_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2514_l2527_l2523_l2519_DUPLICATE_7e3f_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2527_c3_ce5c_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2514_l2527_l2523_l2519_DUPLICATE_7e3f_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2515_l2524_DUPLICATE_018d_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2514_l2527_l2523_l2519_DUPLICATE_7e3f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_ecce_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2513_l2510_l2534_l2522_l2518_DUPLICATE_fa8d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_0ef3_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2513_l2510_l2534_l2522_l2518_DUPLICATE_fa8d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2518_c7_51bd_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2513_l2510_l2534_l2522_l2518_DUPLICATE_fa8d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2522_c7_7846_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2513_l2510_l2534_l2522_l2518_DUPLICATE_fa8d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_1643_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2513_l2510_l2534_l2522_l2518_DUPLICATE_fa8d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_ecce_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2513_l2510_l2534_l2526_l2522_l2518_DUPLICATE_5d66_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_0ef3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2513_l2510_l2534_l2526_l2522_l2518_DUPLICATE_5d66_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2518_c7_51bd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2513_l2510_l2534_l2526_l2522_l2518_DUPLICATE_5d66_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2522_c7_7846_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2513_l2510_l2534_l2526_l2522_l2518_DUPLICATE_5d66_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_1f95_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2513_l2510_l2534_l2526_l2522_l2518_DUPLICATE_5d66_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_1643_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2513_l2510_l2534_l2526_l2522_l2518_DUPLICATE_5d66_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_ecce_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2513_l2510_l2526_l2522_l2518_DUPLICATE_4e85_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_0ef3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2513_l2510_l2526_l2522_l2518_DUPLICATE_4e85_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2518_c7_51bd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2513_l2510_l2526_l2522_l2518_DUPLICATE_4e85_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2522_c7_7846_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2513_l2510_l2526_l2522_l2518_DUPLICATE_4e85_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_1f95_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2513_l2510_l2526_l2522_l2518_DUPLICATE_4e85_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2522_c7_7846_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2522_l2534_DUPLICATE_89c1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_1643_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2522_l2534_DUPLICATE_89c1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2497_c2_1b15_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2513_l2510_l2497_l2534_l2522_l2518_DUPLICATE_ccbf_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2510_c7_ecce_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2513_l2510_l2497_l2534_l2522_l2518_DUPLICATE_ccbf_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2513_c7_0ef3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2513_l2510_l2497_l2534_l2522_l2518_DUPLICATE_ccbf_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2518_c7_51bd_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2513_l2510_l2497_l2534_l2522_l2518_DUPLICATE_ccbf_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2522_c7_7846_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2513_l2510_l2497_l2534_l2522_l2518_DUPLICATE_ccbf_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2534_c7_1643_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2513_l2510_l2497_l2534_l2522_l2518_DUPLICATE_ccbf_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2497_c2_1b15_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2497_c2_1b15_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2497_c2_1b15_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2497_c2_1b15_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2497_c2_1b15_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2497_c2_1b15_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2497_c2_1b15_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2497_c2_1b15_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_1f95_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2529_c30_c3e1_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l2497_c2_1b15] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l2497_c2_1b15_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2497_c2_1b15_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2497_c2_1b15_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2497_c2_1b15_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2497_c2_1b15_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2497_c2_1b15_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2497_c2_1b15_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l2497_c2_1b15_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2534_c7_1643] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_1643_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_1643_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_1643_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_1643_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_1643_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_1643_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_1643_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_1643_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2534_c7_1643] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_1643_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_1643_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_1643_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_1643_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_1643_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_1643_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_1643_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_1643_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2537_c21_40d8] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2537_c21_40d8_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2537_c31_71d6_return_output);

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l2515_l2524_DUPLICATE_018d LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l2515_l2524_DUPLICATE_018d_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2515_l2524_DUPLICATE_018d_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2515_l2524_DUPLICATE_018d_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l2515_l2524_DUPLICATE_018d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2534_c7_1643] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_1643_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_1643_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_1643_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_1643_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_1643_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_1643_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_1643_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_1643_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2519_c3_0b33] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2519_c3_0b33_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2519_c3_0b33_left;
     BIN_OP_OR_uxn_opcodes_h_l2519_c3_0b33_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2519_c3_0b33_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2519_c3_0b33_return_output := BIN_OP_OR_uxn_opcodes_h_l2519_c3_0b33_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2497_c2_1b15] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2497_c2_1b15_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2497_c2_1b15_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2497_c2_1b15_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2497_c2_1b15_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2497_c2_1b15_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2497_c2_1b15_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2497_c2_1b15_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2497_c2_1b15_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2497_c2_1b15] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2497_c2_1b15_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2497_c2_1b15_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2497_c2_1b15_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2497_c2_1b15_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2497_c2_1b15_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2497_c2_1b15_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2497_c2_1b15_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2497_c2_1b15_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2527_c3_ce5c] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2527_c3_ce5c_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2527_c3_ce5c_left;
     BIN_OP_OR_uxn_opcodes_h_l2527_c3_ce5c_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2527_c3_ce5c_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2527_c3_ce5c_return_output := BIN_OP_OR_uxn_opcodes_h_l2527_c3_ce5c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2526_c7_1f95] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_1f95_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_1f95_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_1f95_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_1f95_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_1f95_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_1f95_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_1f95_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_1f95_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l2497_c2_1b15] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l2497_c2_1b15_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2497_c2_1b15_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l2497_c2_1b15_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2497_c2_1b15_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l2497_c2_1b15_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2497_c2_1b15_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2497_c2_1b15_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l2497_c2_1b15_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l2518_c7_51bd_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2519_c3_0b33_return_output;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2528_c11_dc75_left := VAR_BIN_OP_OR_uxn_opcodes_h_l2527_c3_ce5c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2526_c7_1f95_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2527_c3_ce5c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2534_c7_1643_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2537_c21_40d8_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2522_c7_7846_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2515_l2524_DUPLICATE_018d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2513_c7_0ef3_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2515_l2524_DUPLICATE_018d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_1f95_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_1643_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2522_c7_7846_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_1f95_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_1f95_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_1643_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_1f95_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_1643_return_output;
     -- BIN_OP_MINUS[uxn_opcodes_h_l2528_c11_dc75] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l2528_c11_dc75_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l2528_c11_dc75_left;
     BIN_OP_MINUS_uxn_opcodes_h_l2528_c11_dc75_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l2528_c11_dc75_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2528_c11_dc75_return_output := BIN_OP_MINUS_uxn_opcodes_h_l2528_c11_dc75_return_output;

     -- t16_MUX[uxn_opcodes_h_l2518_c7_51bd] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2518_c7_51bd_cond <= VAR_t16_MUX_uxn_opcodes_h_l2518_c7_51bd_cond;
     t16_MUX_uxn_opcodes_h_l2518_c7_51bd_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2518_c7_51bd_iftrue;
     t16_MUX_uxn_opcodes_h_l2518_c7_51bd_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2518_c7_51bd_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2518_c7_51bd_return_output := t16_MUX_uxn_opcodes_h_l2518_c7_51bd_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2526_c7_1f95] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_1f95_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_1f95_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_1f95_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_1f95_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_1f95_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_1f95_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_1f95_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_1f95_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2534_c7_1643] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2534_c7_1643_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2534_c7_1643_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2534_c7_1643_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2534_c7_1643_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2534_c7_1643_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2534_c7_1643_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2534_c7_1643_return_output := result_u8_value_MUX_uxn_opcodes_h_l2534_c7_1643_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2526_c7_1f95] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_1f95_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_1f95_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_1f95_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_1f95_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_1f95_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_1f95_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_1f95_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_1f95_return_output;

     -- n16_MUX[uxn_opcodes_h_l2526_c7_1f95] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2526_c7_1f95_cond <= VAR_n16_MUX_uxn_opcodes_h_l2526_c7_1f95_cond;
     n16_MUX_uxn_opcodes_h_l2526_c7_1f95_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2526_c7_1f95_iftrue;
     n16_MUX_uxn_opcodes_h_l2526_c7_1f95_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2526_c7_1f95_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2526_c7_1f95_return_output := n16_MUX_uxn_opcodes_h_l2526_c7_1f95_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2526_c7_1f95] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_1f95_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_1f95_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_1f95_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_1f95_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_1f95_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_1f95_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_1f95_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_1f95_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2522_c7_7846] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2522_c7_7846_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2522_c7_7846_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2522_c7_7846_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2522_c7_7846_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2522_c7_7846_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2522_c7_7846_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2522_c7_7846_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2522_c7_7846_return_output;

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l2526_c7_1f95_iftrue := VAR_BIN_OP_MINUS_uxn_opcodes_h_l2528_c11_dc75_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2522_c7_7846_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2526_c7_1f95_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2522_c7_7846_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_1f95_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2518_c7_51bd_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2522_c7_7846_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2522_c7_7846_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_1f95_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2522_c7_7846_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_1f95_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2526_c7_1f95_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2534_c7_1643_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2513_c7_0ef3_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2518_c7_51bd_return_output;
     -- n16_MUX[uxn_opcodes_h_l2522_c7_7846] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2522_c7_7846_cond <= VAR_n16_MUX_uxn_opcodes_h_l2522_c7_7846_cond;
     n16_MUX_uxn_opcodes_h_l2522_c7_7846_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2522_c7_7846_iftrue;
     n16_MUX_uxn_opcodes_h_l2522_c7_7846_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2522_c7_7846_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2522_c7_7846_return_output := n16_MUX_uxn_opcodes_h_l2522_c7_7846_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2526_c7_1f95] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2526_c7_1f95_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2526_c7_1f95_cond;
     tmp16_MUX_uxn_opcodes_h_l2526_c7_1f95_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2526_c7_1f95_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2526_c7_1f95_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2526_c7_1f95_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2526_c7_1f95_return_output := tmp16_MUX_uxn_opcodes_h_l2526_c7_1f95_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2522_c7_7846] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2522_c7_7846_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2522_c7_7846_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2522_c7_7846_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2522_c7_7846_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2522_c7_7846_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2522_c7_7846_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2522_c7_7846_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2522_c7_7846_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2532_c21_10a4] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2532_c21_10a4_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2528_c11_dc75_return_output);

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2522_c7_7846] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2522_c7_7846_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2522_c7_7846_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2522_c7_7846_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2522_c7_7846_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2522_c7_7846_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2522_c7_7846_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2522_c7_7846_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2522_c7_7846_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2518_c7_51bd] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2518_c7_51bd_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2518_c7_51bd_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2518_c7_51bd_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2518_c7_51bd_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2518_c7_51bd_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2518_c7_51bd_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2518_c7_51bd_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2518_c7_51bd_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2522_c7_7846] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2522_c7_7846_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2522_c7_7846_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2522_c7_7846_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2522_c7_7846_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2522_c7_7846_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2522_c7_7846_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2522_c7_7846_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2522_c7_7846_return_output;

     -- t16_MUX[uxn_opcodes_h_l2513_c7_0ef3] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2513_c7_0ef3_cond <= VAR_t16_MUX_uxn_opcodes_h_l2513_c7_0ef3_cond;
     t16_MUX_uxn_opcodes_h_l2513_c7_0ef3_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2513_c7_0ef3_iftrue;
     t16_MUX_uxn_opcodes_h_l2513_c7_0ef3_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2513_c7_0ef3_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2513_c7_0ef3_return_output := t16_MUX_uxn_opcodes_h_l2513_c7_0ef3_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2526_c7_1f95_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2532_c21_10a4_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2518_c7_51bd_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2522_c7_7846_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2518_c7_51bd_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2522_c7_7846_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_0ef3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2518_c7_51bd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2518_c7_51bd_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2522_c7_7846_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2518_c7_51bd_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2522_c7_7846_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2510_c7_ecce_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2513_c7_0ef3_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2522_c7_7846_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2526_c7_1f95_return_output;
     -- n16_MUX[uxn_opcodes_h_l2518_c7_51bd] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2518_c7_51bd_cond <= VAR_n16_MUX_uxn_opcodes_h_l2518_c7_51bd_cond;
     n16_MUX_uxn_opcodes_h_l2518_c7_51bd_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2518_c7_51bd_iftrue;
     n16_MUX_uxn_opcodes_h_l2518_c7_51bd_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2518_c7_51bd_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2518_c7_51bd_return_output := n16_MUX_uxn_opcodes_h_l2518_c7_51bd_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2518_c7_51bd] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2518_c7_51bd_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2518_c7_51bd_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2518_c7_51bd_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2518_c7_51bd_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2518_c7_51bd_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2518_c7_51bd_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2518_c7_51bd_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2518_c7_51bd_return_output;

     -- t16_MUX[uxn_opcodes_h_l2510_c7_ecce] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2510_c7_ecce_cond <= VAR_t16_MUX_uxn_opcodes_h_l2510_c7_ecce_cond;
     t16_MUX_uxn_opcodes_h_l2510_c7_ecce_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2510_c7_ecce_iftrue;
     t16_MUX_uxn_opcodes_h_l2510_c7_ecce_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2510_c7_ecce_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2510_c7_ecce_return_output := t16_MUX_uxn_opcodes_h_l2510_c7_ecce_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2522_c7_7846] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2522_c7_7846_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2522_c7_7846_cond;
     tmp16_MUX_uxn_opcodes_h_l2522_c7_7846_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2522_c7_7846_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2522_c7_7846_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2522_c7_7846_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2522_c7_7846_return_output := tmp16_MUX_uxn_opcodes_h_l2522_c7_7846_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2526_c7_1f95] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2526_c7_1f95_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2526_c7_1f95_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2526_c7_1f95_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2526_c7_1f95_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2526_c7_1f95_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2526_c7_1f95_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2526_c7_1f95_return_output := result_u8_value_MUX_uxn_opcodes_h_l2526_c7_1f95_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2513_c7_0ef3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_0ef3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_0ef3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_0ef3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_0ef3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_0ef3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_0ef3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_0ef3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_0ef3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2518_c7_51bd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2518_c7_51bd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2518_c7_51bd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2518_c7_51bd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2518_c7_51bd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2518_c7_51bd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2518_c7_51bd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2518_c7_51bd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2518_c7_51bd_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2518_c7_51bd] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2518_c7_51bd_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2518_c7_51bd_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2518_c7_51bd_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2518_c7_51bd_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2518_c7_51bd_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2518_c7_51bd_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2518_c7_51bd_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2518_c7_51bd_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l2513_c7_0ef3_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2518_c7_51bd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_0ef3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2518_c7_51bd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_ecce_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_0ef3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_0ef3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2518_c7_51bd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_0ef3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2518_c7_51bd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2522_c7_7846_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2526_c7_1f95_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2497_c2_1b15_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2510_c7_ecce_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2518_c7_51bd_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2522_c7_7846_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2513_c7_0ef3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_0ef3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_0ef3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_0ef3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_0ef3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_0ef3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_0ef3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_0ef3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_0ef3_return_output;

     -- t16_MUX[uxn_opcodes_h_l2497_c2_1b15] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2497_c2_1b15_cond <= VAR_t16_MUX_uxn_opcodes_h_l2497_c2_1b15_cond;
     t16_MUX_uxn_opcodes_h_l2497_c2_1b15_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2497_c2_1b15_iftrue;
     t16_MUX_uxn_opcodes_h_l2497_c2_1b15_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2497_c2_1b15_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2497_c2_1b15_return_output := t16_MUX_uxn_opcodes_h_l2497_c2_1b15_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2513_c7_0ef3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_0ef3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_0ef3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_0ef3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_0ef3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_0ef3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_0ef3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_0ef3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_0ef3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2513_c7_0ef3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_0ef3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_0ef3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_0ef3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_0ef3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_0ef3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_0ef3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_0ef3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_0ef3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2510_c7_ecce] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_ecce_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_ecce_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_ecce_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_ecce_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_ecce_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_ecce_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_ecce_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_ecce_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2518_c7_51bd] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2518_c7_51bd_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2518_c7_51bd_cond;
     tmp16_MUX_uxn_opcodes_h_l2518_c7_51bd_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2518_c7_51bd_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2518_c7_51bd_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2518_c7_51bd_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2518_c7_51bd_return_output := tmp16_MUX_uxn_opcodes_h_l2518_c7_51bd_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2522_c7_7846] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2522_c7_7846_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2522_c7_7846_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2522_c7_7846_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2522_c7_7846_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2522_c7_7846_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2522_c7_7846_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2522_c7_7846_return_output := result_u8_value_MUX_uxn_opcodes_h_l2522_c7_7846_return_output;

     -- n16_MUX[uxn_opcodes_h_l2513_c7_0ef3] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2513_c7_0ef3_cond <= VAR_n16_MUX_uxn_opcodes_h_l2513_c7_0ef3_cond;
     n16_MUX_uxn_opcodes_h_l2513_c7_0ef3_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2513_c7_0ef3_iftrue;
     n16_MUX_uxn_opcodes_h_l2513_c7_0ef3_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2513_c7_0ef3_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2513_c7_0ef3_return_output := n16_MUX_uxn_opcodes_h_l2513_c7_0ef3_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2510_c7_ecce_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2513_c7_0ef3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_ecce_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_0ef3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2497_c2_1b15_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_ecce_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_ecce_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_0ef3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_ecce_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_0ef3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2518_c7_51bd_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2522_c7_7846_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2497_c2_1b15_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2513_c7_0ef3_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2518_c7_51bd_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2518_c7_51bd] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2518_c7_51bd_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2518_c7_51bd_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2518_c7_51bd_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2518_c7_51bd_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2518_c7_51bd_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2518_c7_51bd_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2518_c7_51bd_return_output := result_u8_value_MUX_uxn_opcodes_h_l2518_c7_51bd_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2510_c7_ecce] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_ecce_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_ecce_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_ecce_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_ecce_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_ecce_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_ecce_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_ecce_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_ecce_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2510_c7_ecce] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_ecce_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_ecce_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_ecce_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_ecce_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_ecce_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_ecce_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_ecce_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_ecce_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2497_c2_1b15] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2497_c2_1b15_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2497_c2_1b15_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2497_c2_1b15_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2497_c2_1b15_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2497_c2_1b15_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2497_c2_1b15_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2497_c2_1b15_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2497_c2_1b15_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2510_c7_ecce] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_ecce_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_ecce_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_ecce_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_ecce_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_ecce_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_ecce_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_ecce_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_ecce_return_output;

     -- n16_MUX[uxn_opcodes_h_l2510_c7_ecce] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2510_c7_ecce_cond <= VAR_n16_MUX_uxn_opcodes_h_l2510_c7_ecce_cond;
     n16_MUX_uxn_opcodes_h_l2510_c7_ecce_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2510_c7_ecce_iftrue;
     n16_MUX_uxn_opcodes_h_l2510_c7_ecce_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2510_c7_ecce_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2510_c7_ecce_return_output := n16_MUX_uxn_opcodes_h_l2510_c7_ecce_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2513_c7_0ef3] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2513_c7_0ef3_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2513_c7_0ef3_cond;
     tmp16_MUX_uxn_opcodes_h_l2513_c7_0ef3_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2513_c7_0ef3_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2513_c7_0ef3_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2513_c7_0ef3_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2513_c7_0ef3_return_output := tmp16_MUX_uxn_opcodes_h_l2513_c7_0ef3_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l2497_c2_1b15_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2510_c7_ecce_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2497_c2_1b15_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_ecce_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c2_1b15_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_ecce_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c2_1b15_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_ecce_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2513_c7_0ef3_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2518_c7_51bd_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2510_c7_ecce_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2513_c7_0ef3_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2497_c2_1b15] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2497_c2_1b15_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2497_c2_1b15_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2497_c2_1b15_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2497_c2_1b15_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2497_c2_1b15_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2497_c2_1b15_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2497_c2_1b15_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2497_c2_1b15_return_output;

     -- n16_MUX[uxn_opcodes_h_l2497_c2_1b15] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2497_c2_1b15_cond <= VAR_n16_MUX_uxn_opcodes_h_l2497_c2_1b15_cond;
     n16_MUX_uxn_opcodes_h_l2497_c2_1b15_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2497_c2_1b15_iftrue;
     n16_MUX_uxn_opcodes_h_l2497_c2_1b15_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2497_c2_1b15_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2497_c2_1b15_return_output := n16_MUX_uxn_opcodes_h_l2497_c2_1b15_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2497_c2_1b15] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c2_1b15_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c2_1b15_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c2_1b15_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c2_1b15_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c2_1b15_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c2_1b15_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c2_1b15_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c2_1b15_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2510_c7_ecce] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2510_c7_ecce_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2510_c7_ecce_cond;
     tmp16_MUX_uxn_opcodes_h_l2510_c7_ecce_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2510_c7_ecce_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2510_c7_ecce_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2510_c7_ecce_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2510_c7_ecce_return_output := tmp16_MUX_uxn_opcodes_h_l2510_c7_ecce_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2497_c2_1b15] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c2_1b15_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c2_1b15_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c2_1b15_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c2_1b15_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c2_1b15_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c2_1b15_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c2_1b15_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c2_1b15_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2513_c7_0ef3] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2513_c7_0ef3_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2513_c7_0ef3_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2513_c7_0ef3_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2513_c7_0ef3_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2513_c7_0ef3_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2513_c7_0ef3_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2513_c7_0ef3_return_output := result_u8_value_MUX_uxn_opcodes_h_l2513_c7_0ef3_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2497_c2_1b15_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2510_c7_ecce_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2513_c7_0ef3_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2497_c2_1b15_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2510_c7_ecce_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2510_c7_ecce] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2510_c7_ecce_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2510_c7_ecce_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2510_c7_ecce_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2510_c7_ecce_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2510_c7_ecce_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2510_c7_ecce_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2510_c7_ecce_return_output := result_u8_value_MUX_uxn_opcodes_h_l2510_c7_ecce_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2497_c2_1b15] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2497_c2_1b15_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2497_c2_1b15_cond;
     tmp16_MUX_uxn_opcodes_h_l2497_c2_1b15_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2497_c2_1b15_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2497_c2_1b15_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2497_c2_1b15_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2497_c2_1b15_return_output := tmp16_MUX_uxn_opcodes_h_l2497_c2_1b15_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2497_c2_1b15_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2510_c7_ecce_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l2497_c2_1b15_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2497_c2_1b15] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2497_c2_1b15_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2497_c2_1b15_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2497_c2_1b15_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2497_c2_1b15_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2497_c2_1b15_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2497_c2_1b15_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2497_c2_1b15_return_output := result_u8_value_MUX_uxn_opcodes_h_l2497_c2_1b15_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_04b4_uxn_opcodes_h_l2541_l2493_DUPLICATE_3e19 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_04b4_uxn_opcodes_h_l2541_l2493_DUPLICATE_3e19_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_04b4(
     result,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2497_c2_1b15_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2497_c2_1b15_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c2_1b15_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2497_c2_1b15_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2497_c2_1b15_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c2_1b15_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2497_c2_1b15_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2497_c2_1b15_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2497_c2_1b15_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_04b4_uxn_opcodes_h_l2541_l2493_DUPLICATE_3e19_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_04b4_uxn_opcodes_h_l2541_l2493_DUPLICATE_3e19_return_output;
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
