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
-- BIN_OP_EQ[uxn_opcodes_h_l2513_c6_550c]
signal BIN_OP_EQ_uxn_opcodes_h_l2513_c6_550c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2513_c6_550c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2513_c6_550c_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2513_c2_e6cc]
signal n16_MUX_uxn_opcodes_h_l2513_c2_e6cc_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2513_c2_e6cc_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2513_c2_e6cc_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2513_c2_e6cc_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2513_c2_e6cc]
signal tmp16_MUX_uxn_opcodes_h_l2513_c2_e6cc_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2513_c2_e6cc_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2513_c2_e6cc_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2513_c2_e6cc_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2513_c2_e6cc]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2513_c2_e6cc_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2513_c2_e6cc_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2513_c2_e6cc_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2513_c2_e6cc_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l2513_c2_e6cc]
signal result_is_vram_write_MUX_uxn_opcodes_h_l2513_c2_e6cc_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2513_c2_e6cc_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2513_c2_e6cc_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2513_c2_e6cc_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2513_c2_e6cc]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2513_c2_e6cc_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2513_c2_e6cc_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2513_c2_e6cc_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2513_c2_e6cc_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2513_c2_e6cc]
signal result_u8_value_MUX_uxn_opcodes_h_l2513_c2_e6cc_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2513_c2_e6cc_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2513_c2_e6cc_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2513_c2_e6cc_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2513_c2_e6cc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2513_c2_e6cc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2513_c2_e6cc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2513_c2_e6cc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2513_c2_e6cc_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2513_c2_e6cc]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c2_e6cc_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c2_e6cc_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c2_e6cc_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c2_e6cc_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l2513_c2_e6cc]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2513_c2_e6cc_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2513_c2_e6cc_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2513_c2_e6cc_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2513_c2_e6cc_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2513_c2_e6cc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c2_e6cc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c2_e6cc_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c2_e6cc_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c2_e6cc_return_output : unsigned(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2513_c2_e6cc]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2513_c2_e6cc_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2513_c2_e6cc_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2513_c2_e6cc_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2513_c2_e6cc_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2513_c2_e6cc]
signal t16_MUX_uxn_opcodes_h_l2513_c2_e6cc_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2513_c2_e6cc_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2513_c2_e6cc_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2513_c2_e6cc_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2526_c11_e595]
signal BIN_OP_EQ_uxn_opcodes_h_l2526_c11_e595_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2526_c11_e595_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2526_c11_e595_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2526_c7_c72b]
signal n16_MUX_uxn_opcodes_h_l2526_c7_c72b_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2526_c7_c72b_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2526_c7_c72b_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2526_c7_c72b_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2526_c7_c72b]
signal tmp16_MUX_uxn_opcodes_h_l2526_c7_c72b_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2526_c7_c72b_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2526_c7_c72b_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2526_c7_c72b_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2526_c7_c72b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_c72b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_c72b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_c72b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_c72b_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2526_c7_c72b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_c72b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_c72b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_c72b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_c72b_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2526_c7_c72b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_c72b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_c72b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_c72b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_c72b_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2526_c7_c72b]
signal result_u8_value_MUX_uxn_opcodes_h_l2526_c7_c72b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2526_c7_c72b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2526_c7_c72b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2526_c7_c72b_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2526_c7_c72b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_c72b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_c72b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_c72b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_c72b_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2526_c7_c72b]
signal t16_MUX_uxn_opcodes_h_l2526_c7_c72b_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2526_c7_c72b_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2526_c7_c72b_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2526_c7_c72b_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2529_c11_f7ae]
signal BIN_OP_EQ_uxn_opcodes_h_l2529_c11_f7ae_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2529_c11_f7ae_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2529_c11_f7ae_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2529_c7_ece5]
signal n16_MUX_uxn_opcodes_h_l2529_c7_ece5_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2529_c7_ece5_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2529_c7_ece5_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2529_c7_ece5_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2529_c7_ece5]
signal tmp16_MUX_uxn_opcodes_h_l2529_c7_ece5_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2529_c7_ece5_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2529_c7_ece5_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2529_c7_ece5_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2529_c7_ece5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2529_c7_ece5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2529_c7_ece5_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2529_c7_ece5_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2529_c7_ece5_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2529_c7_ece5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2529_c7_ece5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2529_c7_ece5_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2529_c7_ece5_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2529_c7_ece5_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2529_c7_ece5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2529_c7_ece5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2529_c7_ece5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2529_c7_ece5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2529_c7_ece5_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2529_c7_ece5]
signal result_u8_value_MUX_uxn_opcodes_h_l2529_c7_ece5_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2529_c7_ece5_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2529_c7_ece5_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2529_c7_ece5_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2529_c7_ece5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2529_c7_ece5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2529_c7_ece5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2529_c7_ece5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2529_c7_ece5_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2529_c7_ece5]
signal t16_MUX_uxn_opcodes_h_l2529_c7_ece5_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2529_c7_ece5_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2529_c7_ece5_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2529_c7_ece5_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2534_c11_f862]
signal BIN_OP_EQ_uxn_opcodes_h_l2534_c11_f862_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2534_c11_f862_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2534_c11_f862_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2534_c7_d602]
signal n16_MUX_uxn_opcodes_h_l2534_c7_d602_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2534_c7_d602_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2534_c7_d602_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2534_c7_d602_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2534_c7_d602]
signal tmp16_MUX_uxn_opcodes_h_l2534_c7_d602_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2534_c7_d602_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2534_c7_d602_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2534_c7_d602_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2534_c7_d602]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_d602_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_d602_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_d602_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_d602_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2534_c7_d602]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_d602_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_d602_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_d602_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_d602_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2534_c7_d602]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_d602_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_d602_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_d602_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_d602_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2534_c7_d602]
signal result_u8_value_MUX_uxn_opcodes_h_l2534_c7_d602_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2534_c7_d602_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2534_c7_d602_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2534_c7_d602_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2534_c7_d602]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_d602_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_d602_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_d602_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_d602_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2534_c7_d602]
signal t16_MUX_uxn_opcodes_h_l2534_c7_d602_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2534_c7_d602_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2534_c7_d602_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2534_c7_d602_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2535_c3_66ec]
signal BIN_OP_OR_uxn_opcodes_h_l2535_c3_66ec_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2535_c3_66ec_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2535_c3_66ec_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2538_c11_c971]
signal BIN_OP_EQ_uxn_opcodes_h_l2538_c11_c971_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2538_c11_c971_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2538_c11_c971_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2538_c7_51e5]
signal n16_MUX_uxn_opcodes_h_l2538_c7_51e5_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2538_c7_51e5_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2538_c7_51e5_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2538_c7_51e5_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2538_c7_51e5]
signal tmp16_MUX_uxn_opcodes_h_l2538_c7_51e5_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2538_c7_51e5_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2538_c7_51e5_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2538_c7_51e5_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2538_c7_51e5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2538_c7_51e5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2538_c7_51e5_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2538_c7_51e5_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2538_c7_51e5_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2538_c7_51e5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2538_c7_51e5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2538_c7_51e5_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2538_c7_51e5_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2538_c7_51e5_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2538_c7_51e5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2538_c7_51e5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2538_c7_51e5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2538_c7_51e5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2538_c7_51e5_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2538_c7_51e5]
signal result_u8_value_MUX_uxn_opcodes_h_l2538_c7_51e5_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2538_c7_51e5_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2538_c7_51e5_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2538_c7_51e5_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2538_c7_51e5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2538_c7_51e5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2538_c7_51e5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2538_c7_51e5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2538_c7_51e5_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2542_c11_5f19]
signal BIN_OP_EQ_uxn_opcodes_h_l2542_c11_5f19_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2542_c11_5f19_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2542_c11_5f19_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2542_c7_1443]
signal n16_MUX_uxn_opcodes_h_l2542_c7_1443_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2542_c7_1443_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2542_c7_1443_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2542_c7_1443_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2542_c7_1443]
signal tmp16_MUX_uxn_opcodes_h_l2542_c7_1443_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2542_c7_1443_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2542_c7_1443_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2542_c7_1443_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2542_c7_1443]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2542_c7_1443_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2542_c7_1443_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2542_c7_1443_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2542_c7_1443_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2542_c7_1443]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2542_c7_1443_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2542_c7_1443_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2542_c7_1443_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2542_c7_1443_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2542_c7_1443]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2542_c7_1443_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2542_c7_1443_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2542_c7_1443_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2542_c7_1443_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2542_c7_1443]
signal result_u8_value_MUX_uxn_opcodes_h_l2542_c7_1443_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2542_c7_1443_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2542_c7_1443_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2542_c7_1443_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2542_c7_1443]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2542_c7_1443_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2542_c7_1443_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2542_c7_1443_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2542_c7_1443_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2543_c3_e6bc]
signal BIN_OP_OR_uxn_opcodes_h_l2543_c3_e6bc_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2543_c3_e6bc_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2543_c3_e6bc_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l2544_c11_d85c]
signal BIN_OP_MINUS_uxn_opcodes_h_l2544_c11_d85c_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l2544_c11_d85c_right : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l2544_c11_d85c_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2545_c30_2e0a]
signal sp_relative_shift_uxn_opcodes_h_l2545_c30_2e0a_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2545_c30_2e0a_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2545_c30_2e0a_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2545_c30_2e0a_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2550_c11_484a]
signal BIN_OP_EQ_uxn_opcodes_h_l2550_c11_484a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2550_c11_484a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2550_c11_484a_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2550_c7_9c1d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2550_c7_9c1d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2550_c7_9c1d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2550_c7_9c1d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2550_c7_9c1d_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2550_c7_9c1d]
signal result_u8_value_MUX_uxn_opcodes_h_l2550_c7_9c1d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2550_c7_9c1d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2550_c7_9c1d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2550_c7_9c1d_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2550_c7_9c1d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_9c1d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_9c1d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_9c1d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_9c1d_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2550_c7_9c1d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_9c1d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_9c1d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_9c1d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_9c1d_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2553_c31_8336]
signal CONST_SR_8_uxn_opcodes_h_l2553_c31_8336_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2553_c31_8336_return_output : unsigned(15 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2540_l2531_DUPLICATE_dd6c
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2540_l2531_DUPLICATE_dd6c_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2540_l2531_DUPLICATE_dd6c_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_188e( ref_toks_0 : opcode_result_t;
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
      base.is_stack_write := ref_toks_1;
      base.is_vram_write := ref_toks_2;
      base.is_stack_index_flipped := ref_toks_3;
      base.u8_value := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.is_pc_updated := ref_toks_7;
      base.stack_address_sp_offset := ref_toks_8;
      base.is_ram_write := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2513_c6_550c
BIN_OP_EQ_uxn_opcodes_h_l2513_c6_550c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2513_c6_550c_left,
BIN_OP_EQ_uxn_opcodes_h_l2513_c6_550c_right,
BIN_OP_EQ_uxn_opcodes_h_l2513_c6_550c_return_output);

-- n16_MUX_uxn_opcodes_h_l2513_c2_e6cc
n16_MUX_uxn_opcodes_h_l2513_c2_e6cc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2513_c2_e6cc_cond,
n16_MUX_uxn_opcodes_h_l2513_c2_e6cc_iftrue,
n16_MUX_uxn_opcodes_h_l2513_c2_e6cc_iffalse,
n16_MUX_uxn_opcodes_h_l2513_c2_e6cc_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2513_c2_e6cc
tmp16_MUX_uxn_opcodes_h_l2513_c2_e6cc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2513_c2_e6cc_cond,
tmp16_MUX_uxn_opcodes_h_l2513_c2_e6cc_iftrue,
tmp16_MUX_uxn_opcodes_h_l2513_c2_e6cc_iffalse,
tmp16_MUX_uxn_opcodes_h_l2513_c2_e6cc_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2513_c2_e6cc
result_is_stack_write_MUX_uxn_opcodes_h_l2513_c2_e6cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2513_c2_e6cc_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2513_c2_e6cc_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2513_c2_e6cc_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2513_c2_e6cc_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l2513_c2_e6cc
result_is_vram_write_MUX_uxn_opcodes_h_l2513_c2_e6cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l2513_c2_e6cc_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l2513_c2_e6cc_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l2513_c2_e6cc_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l2513_c2_e6cc_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2513_c2_e6cc
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2513_c2_e6cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2513_c2_e6cc_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2513_c2_e6cc_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2513_c2_e6cc_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2513_c2_e6cc_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2513_c2_e6cc
result_u8_value_MUX_uxn_opcodes_h_l2513_c2_e6cc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2513_c2_e6cc_cond,
result_u8_value_MUX_uxn_opcodes_h_l2513_c2_e6cc_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2513_c2_e6cc_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2513_c2_e6cc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2513_c2_e6cc
result_is_opc_done_MUX_uxn_opcodes_h_l2513_c2_e6cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2513_c2_e6cc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2513_c2_e6cc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2513_c2_e6cc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2513_c2_e6cc_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c2_e6cc
result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c2_e6cc : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c2_e6cc_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c2_e6cc_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c2_e6cc_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c2_e6cc_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l2513_c2_e6cc
result_is_pc_updated_MUX_uxn_opcodes_h_l2513_c2_e6cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l2513_c2_e6cc_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l2513_c2_e6cc_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l2513_c2_e6cc_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l2513_c2_e6cc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c2_e6cc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c2_e6cc : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c2_e6cc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c2_e6cc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c2_e6cc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c2_e6cc_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2513_c2_e6cc
result_is_ram_write_MUX_uxn_opcodes_h_l2513_c2_e6cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2513_c2_e6cc_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2513_c2_e6cc_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2513_c2_e6cc_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2513_c2_e6cc_return_output);

-- t16_MUX_uxn_opcodes_h_l2513_c2_e6cc
t16_MUX_uxn_opcodes_h_l2513_c2_e6cc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2513_c2_e6cc_cond,
t16_MUX_uxn_opcodes_h_l2513_c2_e6cc_iftrue,
t16_MUX_uxn_opcodes_h_l2513_c2_e6cc_iffalse,
t16_MUX_uxn_opcodes_h_l2513_c2_e6cc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2526_c11_e595
BIN_OP_EQ_uxn_opcodes_h_l2526_c11_e595 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2526_c11_e595_left,
BIN_OP_EQ_uxn_opcodes_h_l2526_c11_e595_right,
BIN_OP_EQ_uxn_opcodes_h_l2526_c11_e595_return_output);

-- n16_MUX_uxn_opcodes_h_l2526_c7_c72b
n16_MUX_uxn_opcodes_h_l2526_c7_c72b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2526_c7_c72b_cond,
n16_MUX_uxn_opcodes_h_l2526_c7_c72b_iftrue,
n16_MUX_uxn_opcodes_h_l2526_c7_c72b_iffalse,
n16_MUX_uxn_opcodes_h_l2526_c7_c72b_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2526_c7_c72b
tmp16_MUX_uxn_opcodes_h_l2526_c7_c72b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2526_c7_c72b_cond,
tmp16_MUX_uxn_opcodes_h_l2526_c7_c72b_iftrue,
tmp16_MUX_uxn_opcodes_h_l2526_c7_c72b_iffalse,
tmp16_MUX_uxn_opcodes_h_l2526_c7_c72b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_c72b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_c72b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_c72b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_c72b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_c72b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_c72b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_c72b
result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_c72b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_c72b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_c72b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_c72b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_c72b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_c72b
result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_c72b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_c72b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_c72b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_c72b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_c72b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2526_c7_c72b
result_u8_value_MUX_uxn_opcodes_h_l2526_c7_c72b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2526_c7_c72b_cond,
result_u8_value_MUX_uxn_opcodes_h_l2526_c7_c72b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2526_c7_c72b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2526_c7_c72b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_c72b
result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_c72b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_c72b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_c72b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_c72b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_c72b_return_output);

-- t16_MUX_uxn_opcodes_h_l2526_c7_c72b
t16_MUX_uxn_opcodes_h_l2526_c7_c72b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2526_c7_c72b_cond,
t16_MUX_uxn_opcodes_h_l2526_c7_c72b_iftrue,
t16_MUX_uxn_opcodes_h_l2526_c7_c72b_iffalse,
t16_MUX_uxn_opcodes_h_l2526_c7_c72b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2529_c11_f7ae
BIN_OP_EQ_uxn_opcodes_h_l2529_c11_f7ae : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2529_c11_f7ae_left,
BIN_OP_EQ_uxn_opcodes_h_l2529_c11_f7ae_right,
BIN_OP_EQ_uxn_opcodes_h_l2529_c11_f7ae_return_output);

-- n16_MUX_uxn_opcodes_h_l2529_c7_ece5
n16_MUX_uxn_opcodes_h_l2529_c7_ece5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2529_c7_ece5_cond,
n16_MUX_uxn_opcodes_h_l2529_c7_ece5_iftrue,
n16_MUX_uxn_opcodes_h_l2529_c7_ece5_iffalse,
n16_MUX_uxn_opcodes_h_l2529_c7_ece5_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2529_c7_ece5
tmp16_MUX_uxn_opcodes_h_l2529_c7_ece5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2529_c7_ece5_cond,
tmp16_MUX_uxn_opcodes_h_l2529_c7_ece5_iftrue,
tmp16_MUX_uxn_opcodes_h_l2529_c7_ece5_iffalse,
tmp16_MUX_uxn_opcodes_h_l2529_c7_ece5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2529_c7_ece5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2529_c7_ece5 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2529_c7_ece5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2529_c7_ece5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2529_c7_ece5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2529_c7_ece5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2529_c7_ece5
result_sp_relative_shift_MUX_uxn_opcodes_h_l2529_c7_ece5 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2529_c7_ece5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2529_c7_ece5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2529_c7_ece5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2529_c7_ece5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2529_c7_ece5
result_is_stack_write_MUX_uxn_opcodes_h_l2529_c7_ece5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2529_c7_ece5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2529_c7_ece5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2529_c7_ece5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2529_c7_ece5_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2529_c7_ece5
result_u8_value_MUX_uxn_opcodes_h_l2529_c7_ece5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2529_c7_ece5_cond,
result_u8_value_MUX_uxn_opcodes_h_l2529_c7_ece5_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2529_c7_ece5_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2529_c7_ece5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2529_c7_ece5
result_is_opc_done_MUX_uxn_opcodes_h_l2529_c7_ece5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2529_c7_ece5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2529_c7_ece5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2529_c7_ece5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2529_c7_ece5_return_output);

-- t16_MUX_uxn_opcodes_h_l2529_c7_ece5
t16_MUX_uxn_opcodes_h_l2529_c7_ece5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2529_c7_ece5_cond,
t16_MUX_uxn_opcodes_h_l2529_c7_ece5_iftrue,
t16_MUX_uxn_opcodes_h_l2529_c7_ece5_iffalse,
t16_MUX_uxn_opcodes_h_l2529_c7_ece5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2534_c11_f862
BIN_OP_EQ_uxn_opcodes_h_l2534_c11_f862 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2534_c11_f862_left,
BIN_OP_EQ_uxn_opcodes_h_l2534_c11_f862_right,
BIN_OP_EQ_uxn_opcodes_h_l2534_c11_f862_return_output);

-- n16_MUX_uxn_opcodes_h_l2534_c7_d602
n16_MUX_uxn_opcodes_h_l2534_c7_d602 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2534_c7_d602_cond,
n16_MUX_uxn_opcodes_h_l2534_c7_d602_iftrue,
n16_MUX_uxn_opcodes_h_l2534_c7_d602_iffalse,
n16_MUX_uxn_opcodes_h_l2534_c7_d602_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2534_c7_d602
tmp16_MUX_uxn_opcodes_h_l2534_c7_d602 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2534_c7_d602_cond,
tmp16_MUX_uxn_opcodes_h_l2534_c7_d602_iftrue,
tmp16_MUX_uxn_opcodes_h_l2534_c7_d602_iffalse,
tmp16_MUX_uxn_opcodes_h_l2534_c7_d602_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_d602
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_d602 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_d602_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_d602_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_d602_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_d602_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_d602
result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_d602 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_d602_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_d602_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_d602_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_d602_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_d602
result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_d602 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_d602_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_d602_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_d602_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_d602_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2534_c7_d602
result_u8_value_MUX_uxn_opcodes_h_l2534_c7_d602 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2534_c7_d602_cond,
result_u8_value_MUX_uxn_opcodes_h_l2534_c7_d602_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2534_c7_d602_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2534_c7_d602_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_d602
result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_d602 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_d602_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_d602_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_d602_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_d602_return_output);

-- t16_MUX_uxn_opcodes_h_l2534_c7_d602
t16_MUX_uxn_opcodes_h_l2534_c7_d602 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2534_c7_d602_cond,
t16_MUX_uxn_opcodes_h_l2534_c7_d602_iftrue,
t16_MUX_uxn_opcodes_h_l2534_c7_d602_iffalse,
t16_MUX_uxn_opcodes_h_l2534_c7_d602_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2535_c3_66ec
BIN_OP_OR_uxn_opcodes_h_l2535_c3_66ec : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2535_c3_66ec_left,
BIN_OP_OR_uxn_opcodes_h_l2535_c3_66ec_right,
BIN_OP_OR_uxn_opcodes_h_l2535_c3_66ec_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2538_c11_c971
BIN_OP_EQ_uxn_opcodes_h_l2538_c11_c971 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2538_c11_c971_left,
BIN_OP_EQ_uxn_opcodes_h_l2538_c11_c971_right,
BIN_OP_EQ_uxn_opcodes_h_l2538_c11_c971_return_output);

-- n16_MUX_uxn_opcodes_h_l2538_c7_51e5
n16_MUX_uxn_opcodes_h_l2538_c7_51e5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2538_c7_51e5_cond,
n16_MUX_uxn_opcodes_h_l2538_c7_51e5_iftrue,
n16_MUX_uxn_opcodes_h_l2538_c7_51e5_iffalse,
n16_MUX_uxn_opcodes_h_l2538_c7_51e5_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2538_c7_51e5
tmp16_MUX_uxn_opcodes_h_l2538_c7_51e5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2538_c7_51e5_cond,
tmp16_MUX_uxn_opcodes_h_l2538_c7_51e5_iftrue,
tmp16_MUX_uxn_opcodes_h_l2538_c7_51e5_iffalse,
tmp16_MUX_uxn_opcodes_h_l2538_c7_51e5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2538_c7_51e5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2538_c7_51e5 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2538_c7_51e5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2538_c7_51e5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2538_c7_51e5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2538_c7_51e5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2538_c7_51e5
result_sp_relative_shift_MUX_uxn_opcodes_h_l2538_c7_51e5 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2538_c7_51e5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2538_c7_51e5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2538_c7_51e5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2538_c7_51e5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2538_c7_51e5
result_is_stack_write_MUX_uxn_opcodes_h_l2538_c7_51e5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2538_c7_51e5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2538_c7_51e5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2538_c7_51e5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2538_c7_51e5_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2538_c7_51e5
result_u8_value_MUX_uxn_opcodes_h_l2538_c7_51e5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2538_c7_51e5_cond,
result_u8_value_MUX_uxn_opcodes_h_l2538_c7_51e5_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2538_c7_51e5_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2538_c7_51e5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2538_c7_51e5
result_is_opc_done_MUX_uxn_opcodes_h_l2538_c7_51e5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2538_c7_51e5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2538_c7_51e5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2538_c7_51e5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2538_c7_51e5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2542_c11_5f19
BIN_OP_EQ_uxn_opcodes_h_l2542_c11_5f19 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2542_c11_5f19_left,
BIN_OP_EQ_uxn_opcodes_h_l2542_c11_5f19_right,
BIN_OP_EQ_uxn_opcodes_h_l2542_c11_5f19_return_output);

-- n16_MUX_uxn_opcodes_h_l2542_c7_1443
n16_MUX_uxn_opcodes_h_l2542_c7_1443 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2542_c7_1443_cond,
n16_MUX_uxn_opcodes_h_l2542_c7_1443_iftrue,
n16_MUX_uxn_opcodes_h_l2542_c7_1443_iffalse,
n16_MUX_uxn_opcodes_h_l2542_c7_1443_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2542_c7_1443
tmp16_MUX_uxn_opcodes_h_l2542_c7_1443 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2542_c7_1443_cond,
tmp16_MUX_uxn_opcodes_h_l2542_c7_1443_iftrue,
tmp16_MUX_uxn_opcodes_h_l2542_c7_1443_iffalse,
tmp16_MUX_uxn_opcodes_h_l2542_c7_1443_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2542_c7_1443
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2542_c7_1443 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2542_c7_1443_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2542_c7_1443_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2542_c7_1443_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2542_c7_1443_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2542_c7_1443
result_sp_relative_shift_MUX_uxn_opcodes_h_l2542_c7_1443 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2542_c7_1443_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2542_c7_1443_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2542_c7_1443_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2542_c7_1443_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2542_c7_1443
result_is_stack_write_MUX_uxn_opcodes_h_l2542_c7_1443 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2542_c7_1443_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2542_c7_1443_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2542_c7_1443_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2542_c7_1443_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2542_c7_1443
result_u8_value_MUX_uxn_opcodes_h_l2542_c7_1443 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2542_c7_1443_cond,
result_u8_value_MUX_uxn_opcodes_h_l2542_c7_1443_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2542_c7_1443_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2542_c7_1443_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2542_c7_1443
result_is_opc_done_MUX_uxn_opcodes_h_l2542_c7_1443 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2542_c7_1443_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2542_c7_1443_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2542_c7_1443_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2542_c7_1443_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2543_c3_e6bc
BIN_OP_OR_uxn_opcodes_h_l2543_c3_e6bc : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2543_c3_e6bc_left,
BIN_OP_OR_uxn_opcodes_h_l2543_c3_e6bc_right,
BIN_OP_OR_uxn_opcodes_h_l2543_c3_e6bc_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l2544_c11_d85c
BIN_OP_MINUS_uxn_opcodes_h_l2544_c11_d85c : entity work.BIN_OP_MINUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l2544_c11_d85c_left,
BIN_OP_MINUS_uxn_opcodes_h_l2544_c11_d85c_right,
BIN_OP_MINUS_uxn_opcodes_h_l2544_c11_d85c_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2545_c30_2e0a
sp_relative_shift_uxn_opcodes_h_l2545_c30_2e0a : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2545_c30_2e0a_ins,
sp_relative_shift_uxn_opcodes_h_l2545_c30_2e0a_x,
sp_relative_shift_uxn_opcodes_h_l2545_c30_2e0a_y,
sp_relative_shift_uxn_opcodes_h_l2545_c30_2e0a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2550_c11_484a
BIN_OP_EQ_uxn_opcodes_h_l2550_c11_484a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2550_c11_484a_left,
BIN_OP_EQ_uxn_opcodes_h_l2550_c11_484a_right,
BIN_OP_EQ_uxn_opcodes_h_l2550_c11_484a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2550_c7_9c1d
result_sp_relative_shift_MUX_uxn_opcodes_h_l2550_c7_9c1d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2550_c7_9c1d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2550_c7_9c1d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2550_c7_9c1d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2550_c7_9c1d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2550_c7_9c1d
result_u8_value_MUX_uxn_opcodes_h_l2550_c7_9c1d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2550_c7_9c1d_cond,
result_u8_value_MUX_uxn_opcodes_h_l2550_c7_9c1d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2550_c7_9c1d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2550_c7_9c1d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_9c1d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_9c1d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_9c1d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_9c1d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_9c1d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_9c1d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_9c1d
result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_9c1d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_9c1d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_9c1d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_9c1d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_9c1d_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2553_c31_8336
CONST_SR_8_uxn_opcodes_h_l2553_c31_8336 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2553_c31_8336_x,
CONST_SR_8_uxn_opcodes_h_l2553_c31_8336_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2540_l2531_DUPLICATE_dd6c
CONST_SL_8_uint16_t_uxn_opcodes_h_l2540_l2531_DUPLICATE_dd6c : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l2540_l2531_DUPLICATE_dd6c_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l2540_l2531_DUPLICATE_dd6c_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2513_c6_550c_return_output,
 n16_MUX_uxn_opcodes_h_l2513_c2_e6cc_return_output,
 tmp16_MUX_uxn_opcodes_h_l2513_c2_e6cc_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2513_c2_e6cc_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l2513_c2_e6cc_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2513_c2_e6cc_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2513_c2_e6cc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2513_c2_e6cc_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c2_e6cc_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l2513_c2_e6cc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c2_e6cc_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2513_c2_e6cc_return_output,
 t16_MUX_uxn_opcodes_h_l2513_c2_e6cc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2526_c11_e595_return_output,
 n16_MUX_uxn_opcodes_h_l2526_c7_c72b_return_output,
 tmp16_MUX_uxn_opcodes_h_l2526_c7_c72b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_c72b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_c72b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_c72b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2526_c7_c72b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_c72b_return_output,
 t16_MUX_uxn_opcodes_h_l2526_c7_c72b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2529_c11_f7ae_return_output,
 n16_MUX_uxn_opcodes_h_l2529_c7_ece5_return_output,
 tmp16_MUX_uxn_opcodes_h_l2529_c7_ece5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2529_c7_ece5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2529_c7_ece5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2529_c7_ece5_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2529_c7_ece5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2529_c7_ece5_return_output,
 t16_MUX_uxn_opcodes_h_l2529_c7_ece5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2534_c11_f862_return_output,
 n16_MUX_uxn_opcodes_h_l2534_c7_d602_return_output,
 tmp16_MUX_uxn_opcodes_h_l2534_c7_d602_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_d602_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_d602_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_d602_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2534_c7_d602_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_d602_return_output,
 t16_MUX_uxn_opcodes_h_l2534_c7_d602_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2535_c3_66ec_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2538_c11_c971_return_output,
 n16_MUX_uxn_opcodes_h_l2538_c7_51e5_return_output,
 tmp16_MUX_uxn_opcodes_h_l2538_c7_51e5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2538_c7_51e5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2538_c7_51e5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2538_c7_51e5_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2538_c7_51e5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2538_c7_51e5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2542_c11_5f19_return_output,
 n16_MUX_uxn_opcodes_h_l2542_c7_1443_return_output,
 tmp16_MUX_uxn_opcodes_h_l2542_c7_1443_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2542_c7_1443_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2542_c7_1443_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2542_c7_1443_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2542_c7_1443_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2542_c7_1443_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2543_c3_e6bc_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l2544_c11_d85c_return_output,
 sp_relative_shift_uxn_opcodes_h_l2545_c30_2e0a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2550_c11_484a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2550_c7_9c1d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2550_c7_9c1d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_9c1d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_9c1d_return_output,
 CONST_SR_8_uxn_opcodes_h_l2553_c31_8336_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l2540_l2531_DUPLICATE_dd6c_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c6_550c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c6_550c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c6_550c_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2513_c2_e6cc_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2513_c2_e6cc_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2526_c7_c72b_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2513_c2_e6cc_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2513_c2_e6cc_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2513_c2_e6cc_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2513_c2_e6cc_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2526_c7_c72b_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2513_c2_e6cc_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2513_c2_e6cc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2513_c2_e6cc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2513_c2_e6cc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_c72b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2513_c2_e6cc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2513_c2_e6cc_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2513_c2_e6cc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2513_c2_e6cc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2513_c2_e6cc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2513_c2_e6cc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2513_c2_e6cc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2513_c2_e6cc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2513_c2_e6cc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2513_c2_e6cc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2513_c2_e6cc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2513_c2_e6cc_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2513_c2_e6cc_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2513_c2_e6cc_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2526_c7_c72b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2513_c2_e6cc_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2513_c2_e6cc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c2_e6cc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c2_e6cc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_c72b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c2_e6cc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c2_e6cc_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c2_e6cc_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2518_c3_a176 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c2_e6cc_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_c72b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c2_e6cc_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c2_e6cc_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2513_c2_e6cc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2513_c2_e6cc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2513_c2_e6cc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2513_c2_e6cc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2513_c2_e6cc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c2_e6cc_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2523_c3_3dae : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c2_e6cc_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_c72b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c2_e6cc_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c2_e6cc_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2513_c2_e6cc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2513_c2_e6cc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2513_c2_e6cc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2513_c2_e6cc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2513_c2_e6cc_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2513_c2_e6cc_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2513_c2_e6cc_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2526_c7_c72b_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2513_c2_e6cc_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2513_c2_e6cc_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2526_c11_e595_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2526_c11_e595_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2526_c11_e595_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2526_c7_c72b_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2526_c7_c72b_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2529_c7_ece5_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2526_c7_c72b_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2526_c7_c72b_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2526_c7_c72b_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2529_c7_ece5_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2526_c7_c72b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_c72b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2527_c3_cbdf : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_c72b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2529_c7_ece5_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_c72b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_c72b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_c72b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2529_c7_ece5_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_c72b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_c72b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_c72b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2529_c7_ece5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_c72b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2526_c7_c72b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2526_c7_c72b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2529_c7_ece5_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2526_c7_c72b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_c72b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_c72b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2529_c7_ece5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_c72b_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2526_c7_c72b_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2526_c7_c72b_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2529_c7_ece5_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2526_c7_c72b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2529_c11_f7ae_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2529_c11_f7ae_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2529_c11_f7ae_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2529_c7_ece5_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2529_c7_ece5_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2534_c7_d602_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2529_c7_ece5_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2529_c7_ece5_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2529_c7_ece5_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2534_c7_d602_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2529_c7_ece5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2529_c7_ece5_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2532_c3_c1f4 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2529_c7_ece5_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_d602_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2529_c7_ece5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2529_c7_ece5_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2529_c7_ece5_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_d602_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2529_c7_ece5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2529_c7_ece5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2529_c7_ece5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_d602_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2529_c7_ece5_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2529_c7_ece5_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2529_c7_ece5_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2534_c7_d602_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2529_c7_ece5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2529_c7_ece5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2529_c7_ece5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_d602_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2529_c7_ece5_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2529_c7_ece5_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2529_c7_ece5_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2534_c7_d602_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2529_c7_ece5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2534_c11_f862_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2534_c11_f862_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2534_c11_f862_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2534_c7_d602_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2534_c7_d602_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2538_c7_51e5_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2534_c7_d602_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2534_c7_d602_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2534_c7_d602_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2538_c7_51e5_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2534_c7_d602_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_d602_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2536_c3_2e8f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_d602_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2538_c7_51e5_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_d602_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_d602_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_d602_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2538_c7_51e5_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_d602_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_d602_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_d602_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2538_c7_51e5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_d602_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2534_c7_d602_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2534_c7_d602_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2538_c7_51e5_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2534_c7_d602_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_d602_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_d602_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2538_c7_51e5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_d602_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2534_c7_d602_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2534_c7_d602_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2534_c7_d602_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2535_c3_66ec_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2535_c3_66ec_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2535_c3_66ec_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2538_c11_c971_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2538_c11_c971_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2538_c11_c971_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2538_c7_51e5_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2538_c7_51e5_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2542_c7_1443_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2538_c7_51e5_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2538_c7_51e5_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2538_c7_51e5_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2542_c7_1443_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2538_c7_51e5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2538_c7_51e5_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2538_c7_51e5_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2542_c7_1443_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2538_c7_51e5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2538_c7_51e5_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2538_c7_51e5_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2542_c7_1443_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2538_c7_51e5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2538_c7_51e5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2538_c7_51e5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2542_c7_1443_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2538_c7_51e5_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2538_c7_51e5_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2538_c7_51e5_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2542_c7_1443_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2538_c7_51e5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2538_c7_51e5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2538_c7_51e5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2542_c7_1443_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2538_c7_51e5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2542_c11_5f19_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2542_c11_5f19_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2542_c11_5f19_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2542_c7_1443_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2542_c7_1443_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2542_c7_1443_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2542_c7_1443_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2542_c7_1443_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2542_c7_1443_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2542_c7_1443_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2547_c3_2648 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2542_c7_1443_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_9c1d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2542_c7_1443_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2542_c7_1443_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2542_c7_1443_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2550_c7_9c1d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2542_c7_1443_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2542_c7_1443_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2542_c7_1443_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2542_c7_1443_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2542_c7_1443_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2542_c7_1443_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2550_c7_9c1d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2542_c7_1443_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2542_c7_1443_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2542_c7_1443_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_9c1d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2542_c7_1443_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2543_c3_e6bc_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2543_c3_e6bc_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2543_c3_e6bc_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2544_c11_d85c_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2544_c11_d85c_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2544_c11_d85c_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2545_c30_2e0a_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2545_c30_2e0a_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2545_c30_2e0a_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2545_c30_2e0a_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2548_c21_05c6_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2550_c11_484a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2550_c11_484a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2550_c11_484a_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2550_c7_9c1d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2551_c3_82e4 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2550_c7_9c1d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2550_c7_9c1d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2550_c7_9c1d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2550_c7_9c1d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2550_c7_9c1d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_9c1d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2552_c3_27c3 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_9c1d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_9c1d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_9c1d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_9c1d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_9c1d_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2553_c31_8336_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2553_c31_8336_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2553_c21_c357_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2550_l2538_l2534_l2529_l2526_l2513_DUPLICATE_fc6b_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2550_l2538_l2534_l2529_l2526_DUPLICATE_7c17_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2542_l2538_l2534_l2529_l2526_DUPLICATE_1bc2_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2550_l2542_l2538_l2534_l2529_l2526_DUPLICATE_a342_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2530_l2543_l2539_l2535_DUPLICATE_484f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2540_l2531_DUPLICATE_dd6c_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2540_l2531_DUPLICATE_dd6c_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2550_l2538_DUPLICATE_1301_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_188e_uxn_opcodes_h_l2557_l2509_DUPLICATE_04df_return_output : opcode_result_t;
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
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2513_c2_e6cc_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c6_550c_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2550_c11_484a_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2529_c11_f7ae_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2526_c11_e595_right := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2542_c7_1443_iftrue := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2513_c2_e6cc_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2545_c30_2e0a_y := resize(to_signed(-2, 3), 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2527_c3_cbdf := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_c72b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2527_c3_cbdf;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2523_c3_3dae := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c2_e6cc_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2523_c3_3dae;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2513_c2_e6cc_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2551_c3_82e4 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2550_c7_9c1d_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2551_c3_82e4;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2536_c3_2e8f := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_d602_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2536_c3_2e8f;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2552_c3_27c3 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_9c1d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2552_c3_27c3;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2542_c11_5f19_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2538_c11_c971_right := to_unsigned(4, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c2_e6cc_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2532_c3_c1f4 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2529_c7_ece5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2532_c3_c1f4;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_9c1d_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2534_c11_f862_right := to_unsigned(3, 2);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2518_c3_a176 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c2_e6cc_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2518_c3_a176;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2547_c3_2648 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2542_c7_1443_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2547_c3_2648;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2513_c2_e6cc_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2513_c2_e6cc_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2545_c30_2e0a_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2545_c30_2e0a_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2543_c3_e6bc_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2513_c2_e6cc_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2526_c7_c72b_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2529_c7_ece5_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2534_c7_d602_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2542_c7_1443_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c6_550c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2526_c11_e595_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2529_c11_f7ae_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2534_c11_f862_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2538_c11_c971_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2542_c11_5f19_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2550_c11_484a_left := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2544_c11_d85c_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2535_c3_66ec_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2513_c2_e6cc_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2526_c7_c72b_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2534_c7_d602_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2553_c31_8336_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2513_c2_e6cc_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2526_c7_c72b_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2529_c7_ece5_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2534_c7_d602_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2538_c7_51e5_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2542_c7_1443_iffalse := tmp16;
     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2513_c2_e6cc] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2513_c2_e6cc_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l2542_c11_5f19] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2542_c11_5f19_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2542_c11_5f19_left;
     BIN_OP_EQ_uxn_opcodes_h_l2542_c11_5f19_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2542_c11_5f19_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2542_c11_5f19_return_output := BIN_OP_EQ_uxn_opcodes_h_l2542_c11_5f19_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2550_l2542_l2538_l2534_l2529_l2526_DUPLICATE_a342 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2550_l2542_l2538_l2534_l2529_l2526_DUPLICATE_a342_return_output := result.is_opc_done;

     -- CONST_SR_8[uxn_opcodes_h_l2553_c31_8336] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2553_c31_8336_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2553_c31_8336_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2553_c31_8336_return_output := CONST_SR_8_uxn_opcodes_h_l2553_c31_8336_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2550_c11_484a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2550_c11_484a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2550_c11_484a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2550_c11_484a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2550_c11_484a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2550_c11_484a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2550_c11_484a_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2513_c2_e6cc] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2513_c2_e6cc_return_output := result.is_vram_write;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l2513_c2_e6cc] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2513_c2_e6cc_return_output := result.is_stack_index_flipped;

     -- sp_relative_shift[uxn_opcodes_h_l2545_c30_2e0a] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2545_c30_2e0a_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2545_c30_2e0a_ins;
     sp_relative_shift_uxn_opcodes_h_l2545_c30_2e0a_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2545_c30_2e0a_x;
     sp_relative_shift_uxn_opcodes_h_l2545_c30_2e0a_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2545_c30_2e0a_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2545_c30_2e0a_return_output := sp_relative_shift_uxn_opcodes_h_l2545_c30_2e0a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2526_c11_e595] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2526_c11_e595_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2526_c11_e595_left;
     BIN_OP_EQ_uxn_opcodes_h_l2526_c11_e595_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2526_c11_e595_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2526_c11_e595_return_output := BIN_OP_EQ_uxn_opcodes_h_l2526_c11_e595_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2538_c11_c971] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2538_c11_c971_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2538_c11_c971_left;
     BIN_OP_EQ_uxn_opcodes_h_l2538_c11_c971_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2538_c11_c971_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2538_c11_c971_return_output := BIN_OP_EQ_uxn_opcodes_h_l2538_c11_c971_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2513_c6_550c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2513_c6_550c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c6_550c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2513_c6_550c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c6_550c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c6_550c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2513_c6_550c_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2542_l2538_l2534_l2529_l2526_DUPLICATE_1bc2 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2542_l2538_l2534_l2529_l2526_DUPLICATE_1bc2_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2550_l2538_l2534_l2529_l2526_l2513_DUPLICATE_fc6b LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2550_l2538_l2534_l2529_l2526_l2513_DUPLICATE_fc6b_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2534_c11_f862] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2534_c11_f862_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2534_c11_f862_left;
     BIN_OP_EQ_uxn_opcodes_h_l2534_c11_f862_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2534_c11_f862_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2534_c11_f862_return_output := BIN_OP_EQ_uxn_opcodes_h_l2534_c11_f862_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2530_l2543_l2539_l2535_DUPLICATE_484f LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2530_l2543_l2539_l2535_DUPLICATE_484f_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2550_l2538_l2534_l2529_l2526_DUPLICATE_7c17 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2550_l2538_l2534_l2529_l2526_DUPLICATE_7c17_return_output := result.sp_relative_shift;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l2513_c2_e6cc] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2513_c2_e6cc_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2529_c11_f7ae] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2529_c11_f7ae_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2529_c11_f7ae_left;
     BIN_OP_EQ_uxn_opcodes_h_l2529_c11_f7ae_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2529_c11_f7ae_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2529_c11_f7ae_return_output := BIN_OP_EQ_uxn_opcodes_h_l2529_c11_f7ae_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2550_l2538_DUPLICATE_1301 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2550_l2538_DUPLICATE_1301_return_output := result.stack_address_sp_offset;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l2513_c2_e6cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c6_550c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c2_e6cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c6_550c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2513_c2_e6cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c6_550c_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2513_c2_e6cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c6_550c_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2513_c2_e6cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c6_550c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2513_c2_e6cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c6_550c_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2513_c2_e6cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c6_550c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c2_e6cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c6_550c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c2_e6cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c6_550c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2513_c2_e6cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c6_550c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2513_c2_e6cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c6_550c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2513_c2_e6cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c6_550c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2526_c7_c72b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2526_c11_e595_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_c72b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2526_c11_e595_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_c72b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2526_c11_e595_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_c72b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2526_c11_e595_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_c72b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2526_c11_e595_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2526_c7_c72b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2526_c11_e595_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2526_c7_c72b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2526_c11_e595_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2526_c7_c72b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2526_c11_e595_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2529_c7_ece5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2529_c11_f7ae_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2529_c7_ece5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2529_c11_f7ae_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2529_c7_ece5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2529_c11_f7ae_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2529_c7_ece5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2529_c11_f7ae_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2529_c7_ece5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2529_c11_f7ae_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2529_c7_ece5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2529_c11_f7ae_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2529_c7_ece5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2529_c11_f7ae_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2529_c7_ece5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2529_c11_f7ae_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2534_c7_d602_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2534_c11_f862_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_d602_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2534_c11_f862_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_d602_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2534_c11_f862_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_d602_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2534_c11_f862_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_d602_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2534_c11_f862_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2534_c7_d602_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2534_c11_f862_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2534_c7_d602_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2534_c11_f862_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2534_c7_d602_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2534_c11_f862_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2538_c7_51e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2538_c11_c971_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2538_c7_51e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2538_c11_c971_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2538_c7_51e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2538_c11_c971_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2538_c7_51e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2538_c11_c971_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2538_c7_51e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2538_c11_c971_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2538_c7_51e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2538_c11_c971_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2538_c7_51e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2538_c11_c971_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2542_c7_1443_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2542_c11_5f19_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2542_c7_1443_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2542_c11_5f19_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2542_c7_1443_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2542_c11_5f19_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2542_c7_1443_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2542_c11_5f19_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2542_c7_1443_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2542_c11_5f19_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2542_c7_1443_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2542_c11_5f19_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2542_c7_1443_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2542_c11_5f19_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_9c1d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2550_c11_484a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2550_c7_9c1d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2550_c11_484a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_9c1d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2550_c11_484a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2550_c7_9c1d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2550_c11_484a_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2535_c3_66ec_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2530_l2543_l2539_l2535_DUPLICATE_484f_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2543_c3_e6bc_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2530_l2543_l2539_l2535_DUPLICATE_484f_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2540_l2531_DUPLICATE_dd6c_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2530_l2543_l2539_l2535_DUPLICATE_484f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_c72b_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2550_l2538_l2534_l2529_l2526_DUPLICATE_7c17_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2529_c7_ece5_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2550_l2538_l2534_l2529_l2526_DUPLICATE_7c17_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_d602_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2550_l2538_l2534_l2529_l2526_DUPLICATE_7c17_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2538_c7_51e5_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2550_l2538_l2534_l2529_l2526_DUPLICATE_7c17_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2550_c7_9c1d_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2550_l2538_l2534_l2529_l2526_DUPLICATE_7c17_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_c72b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2550_l2542_l2538_l2534_l2529_l2526_DUPLICATE_a342_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2529_c7_ece5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2550_l2542_l2538_l2534_l2529_l2526_DUPLICATE_a342_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_d602_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2550_l2542_l2538_l2534_l2529_l2526_DUPLICATE_a342_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2538_c7_51e5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2550_l2542_l2538_l2534_l2529_l2526_DUPLICATE_a342_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2542_c7_1443_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2550_l2542_l2538_l2534_l2529_l2526_DUPLICATE_a342_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_9c1d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2550_l2542_l2538_l2534_l2529_l2526_DUPLICATE_a342_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_c72b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2542_l2538_l2534_l2529_l2526_DUPLICATE_1bc2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2529_c7_ece5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2542_l2538_l2534_l2529_l2526_DUPLICATE_1bc2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_d602_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2542_l2538_l2534_l2529_l2526_DUPLICATE_1bc2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2538_c7_51e5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2542_l2538_l2534_l2529_l2526_DUPLICATE_1bc2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2542_c7_1443_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2542_l2538_l2534_l2529_l2526_DUPLICATE_1bc2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2538_c7_51e5_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2550_l2538_DUPLICATE_1301_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_9c1d_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2550_l2538_DUPLICATE_1301_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2513_c2_e6cc_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2550_l2538_l2534_l2529_l2526_l2513_DUPLICATE_fc6b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2526_c7_c72b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2550_l2538_l2534_l2529_l2526_l2513_DUPLICATE_fc6b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2529_c7_ece5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2550_l2538_l2534_l2529_l2526_l2513_DUPLICATE_fc6b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2534_c7_d602_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2550_l2538_l2534_l2529_l2526_l2513_DUPLICATE_fc6b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2538_c7_51e5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2550_l2538_l2534_l2529_l2526_l2513_DUPLICATE_fc6b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2550_c7_9c1d_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2550_l2538_l2534_l2529_l2526_l2513_DUPLICATE_fc6b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2513_c2_e6cc_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2513_c2_e6cc_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2513_c2_e6cc_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2513_c2_e6cc_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2513_c2_e6cc_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2513_c2_e6cc_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2513_c2_e6cc_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2513_c2_e6cc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2542_c7_1443_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2545_c30_2e0a_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2550_c7_9c1d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_9c1d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_9c1d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_9c1d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_9c1d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_9c1d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_9c1d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_9c1d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_9c1d_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l2513_c2_e6cc] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l2513_c2_e6cc_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2513_c2_e6cc_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l2513_c2_e6cc_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2513_c2_e6cc_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l2513_c2_e6cc_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2513_c2_e6cc_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2513_c2_e6cc_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l2513_c2_e6cc_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2513_c2_e6cc] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2513_c2_e6cc_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2513_c2_e6cc_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2513_c2_e6cc_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2513_c2_e6cc_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2513_c2_e6cc_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2513_c2_e6cc_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2513_c2_e6cc_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2513_c2_e6cc_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2550_c7_9c1d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2550_c7_9c1d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2550_c7_9c1d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2550_c7_9c1d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2550_c7_9c1d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2550_c7_9c1d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2550_c7_9c1d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2550_c7_9c1d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2550_c7_9c1d_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l2540_l2531_DUPLICATE_dd6c LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l2540_l2531_DUPLICATE_dd6c_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2540_l2531_DUPLICATE_dd6c_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2540_l2531_DUPLICATE_dd6c_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l2540_l2531_DUPLICATE_dd6c_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2553_c21_c357] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2553_c21_c357_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2553_c31_8336_return_output);

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l2513_c2_e6cc] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l2513_c2_e6cc_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2513_c2_e6cc_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2513_c2_e6cc_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2513_c2_e6cc_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2513_c2_e6cc_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2513_c2_e6cc_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2513_c2_e6cc_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l2513_c2_e6cc_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2535_c3_66ec] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2535_c3_66ec_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2535_c3_66ec_left;
     BIN_OP_OR_uxn_opcodes_h_l2535_c3_66ec_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2535_c3_66ec_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2535_c3_66ec_return_output := BIN_OP_OR_uxn_opcodes_h_l2535_c3_66ec_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2542_c7_1443] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2542_c7_1443_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2542_c7_1443_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2542_c7_1443_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2542_c7_1443_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2542_c7_1443_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2542_c7_1443_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2542_c7_1443_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2542_c7_1443_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2550_c7_9c1d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_9c1d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_9c1d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_9c1d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_9c1d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_9c1d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_9c1d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_9c1d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_9c1d_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2543_c3_e6bc] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2543_c3_e6bc_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2543_c3_e6bc_left;
     BIN_OP_OR_uxn_opcodes_h_l2543_c3_e6bc_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2543_c3_e6bc_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2543_c3_e6bc_return_output := BIN_OP_OR_uxn_opcodes_h_l2543_c3_e6bc_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2513_c2_e6cc] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2513_c2_e6cc_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2513_c2_e6cc_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2513_c2_e6cc_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2513_c2_e6cc_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2513_c2_e6cc_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2513_c2_e6cc_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2513_c2_e6cc_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2513_c2_e6cc_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l2534_c7_d602_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2535_c3_66ec_return_output;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2544_c11_d85c_left := VAR_BIN_OP_OR_uxn_opcodes_h_l2543_c3_e6bc_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2542_c7_1443_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2543_c3_e6bc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2550_c7_9c1d_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2553_c21_c357_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2538_c7_51e5_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2540_l2531_DUPLICATE_dd6c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2529_c7_ece5_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2540_l2531_DUPLICATE_dd6c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2542_c7_1443_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_9c1d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2538_c7_51e5_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2542_c7_1443_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2542_c7_1443_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2550_c7_9c1d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2542_c7_1443_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_9c1d_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2542_c7_1443] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2542_c7_1443_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2542_c7_1443_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2542_c7_1443_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2542_c7_1443_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2542_c7_1443_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2542_c7_1443_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2542_c7_1443_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2542_c7_1443_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2550_c7_9c1d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2550_c7_9c1d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2550_c7_9c1d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2550_c7_9c1d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2550_c7_9c1d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2550_c7_9c1d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2550_c7_9c1d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2550_c7_9c1d_return_output := result_u8_value_MUX_uxn_opcodes_h_l2550_c7_9c1d_return_output;

     -- t16_MUX[uxn_opcodes_h_l2534_c7_d602] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2534_c7_d602_cond <= VAR_t16_MUX_uxn_opcodes_h_l2534_c7_d602_cond;
     t16_MUX_uxn_opcodes_h_l2534_c7_d602_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2534_c7_d602_iftrue;
     t16_MUX_uxn_opcodes_h_l2534_c7_d602_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2534_c7_d602_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2534_c7_d602_return_output := t16_MUX_uxn_opcodes_h_l2534_c7_d602_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2542_c7_1443] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2542_c7_1443_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2542_c7_1443_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2542_c7_1443_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2542_c7_1443_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2542_c7_1443_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2542_c7_1443_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2542_c7_1443_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2542_c7_1443_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2542_c7_1443] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2542_c7_1443_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2542_c7_1443_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2542_c7_1443_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2542_c7_1443_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2542_c7_1443_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2542_c7_1443_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2542_c7_1443_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2542_c7_1443_return_output;

     -- BIN_OP_MINUS[uxn_opcodes_h_l2544_c11_d85c] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l2544_c11_d85c_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l2544_c11_d85c_left;
     BIN_OP_MINUS_uxn_opcodes_h_l2544_c11_d85c_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l2544_c11_d85c_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2544_c11_d85c_return_output := BIN_OP_MINUS_uxn_opcodes_h_l2544_c11_d85c_return_output;

     -- n16_MUX[uxn_opcodes_h_l2542_c7_1443] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2542_c7_1443_cond <= VAR_n16_MUX_uxn_opcodes_h_l2542_c7_1443_cond;
     n16_MUX_uxn_opcodes_h_l2542_c7_1443_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2542_c7_1443_iftrue;
     n16_MUX_uxn_opcodes_h_l2542_c7_1443_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2542_c7_1443_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2542_c7_1443_return_output := n16_MUX_uxn_opcodes_h_l2542_c7_1443_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2538_c7_51e5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2538_c7_51e5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2538_c7_51e5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2538_c7_51e5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2538_c7_51e5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2538_c7_51e5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2538_c7_51e5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2538_c7_51e5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2538_c7_51e5_return_output;

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l2542_c7_1443_iftrue := VAR_BIN_OP_MINUS_uxn_opcodes_h_l2544_c11_d85c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2538_c7_51e5_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2542_c7_1443_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2538_c7_51e5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2542_c7_1443_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_d602_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2538_c7_51e5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2538_c7_51e5_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2542_c7_1443_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2538_c7_51e5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2542_c7_1443_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2542_c7_1443_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2550_c7_9c1d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2529_c7_ece5_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2534_c7_d602_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2538_c7_51e5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2538_c7_51e5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2538_c7_51e5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2538_c7_51e5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2538_c7_51e5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2538_c7_51e5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2538_c7_51e5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2538_c7_51e5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2538_c7_51e5_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2534_c7_d602] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_d602_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_d602_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_d602_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_d602_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_d602_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_d602_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_d602_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_d602_return_output;

     -- n16_MUX[uxn_opcodes_h_l2538_c7_51e5] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2538_c7_51e5_cond <= VAR_n16_MUX_uxn_opcodes_h_l2538_c7_51e5_cond;
     n16_MUX_uxn_opcodes_h_l2538_c7_51e5_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2538_c7_51e5_iftrue;
     n16_MUX_uxn_opcodes_h_l2538_c7_51e5_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2538_c7_51e5_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2538_c7_51e5_return_output := n16_MUX_uxn_opcodes_h_l2538_c7_51e5_return_output;

     -- t16_MUX[uxn_opcodes_h_l2529_c7_ece5] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2529_c7_ece5_cond <= VAR_t16_MUX_uxn_opcodes_h_l2529_c7_ece5_cond;
     t16_MUX_uxn_opcodes_h_l2529_c7_ece5_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2529_c7_ece5_iftrue;
     t16_MUX_uxn_opcodes_h_l2529_c7_ece5_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2529_c7_ece5_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2529_c7_ece5_return_output := t16_MUX_uxn_opcodes_h_l2529_c7_ece5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2538_c7_51e5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2538_c7_51e5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2538_c7_51e5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2538_c7_51e5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2538_c7_51e5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2538_c7_51e5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2538_c7_51e5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2538_c7_51e5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2538_c7_51e5_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2548_c21_05c6] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2548_c21_05c6_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2544_c11_d85c_return_output);

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2538_c7_51e5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2538_c7_51e5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2538_c7_51e5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2538_c7_51e5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2538_c7_51e5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2538_c7_51e5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2538_c7_51e5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2538_c7_51e5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2538_c7_51e5_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2542_c7_1443] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2542_c7_1443_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2542_c7_1443_cond;
     tmp16_MUX_uxn_opcodes_h_l2542_c7_1443_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2542_c7_1443_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2542_c7_1443_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2542_c7_1443_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2542_c7_1443_return_output := tmp16_MUX_uxn_opcodes_h_l2542_c7_1443_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2542_c7_1443_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2548_c21_05c6_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2534_c7_d602_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2538_c7_51e5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_d602_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2538_c7_51e5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2529_c7_ece5_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_d602_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_d602_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2538_c7_51e5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_d602_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2538_c7_51e5_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2526_c7_c72b_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2529_c7_ece5_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2538_c7_51e5_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2542_c7_1443_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2538_c7_51e5] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2538_c7_51e5_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2538_c7_51e5_cond;
     tmp16_MUX_uxn_opcodes_h_l2538_c7_51e5_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2538_c7_51e5_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2538_c7_51e5_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2538_c7_51e5_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2538_c7_51e5_return_output := tmp16_MUX_uxn_opcodes_h_l2538_c7_51e5_return_output;

     -- n16_MUX[uxn_opcodes_h_l2534_c7_d602] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2534_c7_d602_cond <= VAR_n16_MUX_uxn_opcodes_h_l2534_c7_d602_cond;
     n16_MUX_uxn_opcodes_h_l2534_c7_d602_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2534_c7_d602_iftrue;
     n16_MUX_uxn_opcodes_h_l2534_c7_d602_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2534_c7_d602_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2534_c7_d602_return_output := n16_MUX_uxn_opcodes_h_l2534_c7_d602_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2534_c7_d602] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_d602_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_d602_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_d602_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_d602_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_d602_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_d602_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_d602_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_d602_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2534_c7_d602] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_d602_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_d602_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_d602_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_d602_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_d602_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_d602_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_d602_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_d602_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2534_c7_d602] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_d602_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_d602_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_d602_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_d602_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_d602_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_d602_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_d602_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_d602_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2529_c7_ece5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2529_c7_ece5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2529_c7_ece5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2529_c7_ece5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2529_c7_ece5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2529_c7_ece5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2529_c7_ece5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2529_c7_ece5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2529_c7_ece5_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2542_c7_1443] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2542_c7_1443_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2542_c7_1443_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2542_c7_1443_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2542_c7_1443_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2542_c7_1443_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2542_c7_1443_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2542_c7_1443_return_output := result_u8_value_MUX_uxn_opcodes_h_l2542_c7_1443_return_output;

     -- t16_MUX[uxn_opcodes_h_l2526_c7_c72b] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2526_c7_c72b_cond <= VAR_t16_MUX_uxn_opcodes_h_l2526_c7_c72b_cond;
     t16_MUX_uxn_opcodes_h_l2526_c7_c72b_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2526_c7_c72b_iftrue;
     t16_MUX_uxn_opcodes_h_l2526_c7_c72b_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2526_c7_c72b_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2526_c7_c72b_return_output := t16_MUX_uxn_opcodes_h_l2526_c7_c72b_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l2529_c7_ece5_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2534_c7_d602_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2529_c7_ece5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_d602_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_c72b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2529_c7_ece5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2529_c7_ece5_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_d602_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2529_c7_ece5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_d602_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2538_c7_51e5_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2542_c7_1443_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2513_c2_e6cc_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2526_c7_c72b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2534_c7_d602_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2538_c7_51e5_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2526_c7_c72b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_c72b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_c72b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_c72b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_c72b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_c72b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_c72b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_c72b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_c72b_return_output;

     -- t16_MUX[uxn_opcodes_h_l2513_c2_e6cc] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2513_c2_e6cc_cond <= VAR_t16_MUX_uxn_opcodes_h_l2513_c2_e6cc_cond;
     t16_MUX_uxn_opcodes_h_l2513_c2_e6cc_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2513_c2_e6cc_iftrue;
     t16_MUX_uxn_opcodes_h_l2513_c2_e6cc_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2513_c2_e6cc_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2513_c2_e6cc_return_output := t16_MUX_uxn_opcodes_h_l2513_c2_e6cc_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2529_c7_ece5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2529_c7_ece5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2529_c7_ece5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2529_c7_ece5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2529_c7_ece5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2529_c7_ece5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2529_c7_ece5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2529_c7_ece5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2529_c7_ece5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2529_c7_ece5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2529_c7_ece5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2529_c7_ece5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2529_c7_ece5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2529_c7_ece5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2529_c7_ece5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2529_c7_ece5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2529_c7_ece5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2529_c7_ece5_return_output;

     -- n16_MUX[uxn_opcodes_h_l2529_c7_ece5] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2529_c7_ece5_cond <= VAR_n16_MUX_uxn_opcodes_h_l2529_c7_ece5_cond;
     n16_MUX_uxn_opcodes_h_l2529_c7_ece5_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2529_c7_ece5_iftrue;
     n16_MUX_uxn_opcodes_h_l2529_c7_ece5_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2529_c7_ece5_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2529_c7_ece5_return_output := n16_MUX_uxn_opcodes_h_l2529_c7_ece5_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2534_c7_d602] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2534_c7_d602_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2534_c7_d602_cond;
     tmp16_MUX_uxn_opcodes_h_l2534_c7_d602_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2534_c7_d602_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2534_c7_d602_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2534_c7_d602_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2534_c7_d602_return_output := tmp16_MUX_uxn_opcodes_h_l2534_c7_d602_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2538_c7_51e5] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2538_c7_51e5_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2538_c7_51e5_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2538_c7_51e5_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2538_c7_51e5_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2538_c7_51e5_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2538_c7_51e5_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2538_c7_51e5_return_output := result_u8_value_MUX_uxn_opcodes_h_l2538_c7_51e5_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2529_c7_ece5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2529_c7_ece5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2529_c7_ece5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2529_c7_ece5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2529_c7_ece5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2529_c7_ece5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2529_c7_ece5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2529_c7_ece5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2529_c7_ece5_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2526_c7_c72b_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2529_c7_ece5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_c72b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2529_c7_ece5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2513_c2_e6cc_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_c72b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_c72b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2529_c7_ece5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_c72b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2529_c7_ece5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2534_c7_d602_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2538_c7_51e5_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2513_c2_e6cc_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2529_c7_ece5_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2534_c7_d602_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2526_c7_c72b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_c72b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_c72b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_c72b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_c72b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_c72b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_c72b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_c72b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_c72b_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2534_c7_d602] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2534_c7_d602_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2534_c7_d602_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2534_c7_d602_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2534_c7_d602_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2534_c7_d602_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2534_c7_d602_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2534_c7_d602_return_output := result_u8_value_MUX_uxn_opcodes_h_l2534_c7_d602_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2526_c7_c72b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_c72b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_c72b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_c72b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_c72b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_c72b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_c72b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_c72b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_c72b_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2529_c7_ece5] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2529_c7_ece5_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2529_c7_ece5_cond;
     tmp16_MUX_uxn_opcodes_h_l2529_c7_ece5_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2529_c7_ece5_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2529_c7_ece5_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2529_c7_ece5_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2529_c7_ece5_return_output := tmp16_MUX_uxn_opcodes_h_l2529_c7_ece5_return_output;

     -- n16_MUX[uxn_opcodes_h_l2526_c7_c72b] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2526_c7_c72b_cond <= VAR_n16_MUX_uxn_opcodes_h_l2526_c7_c72b_cond;
     n16_MUX_uxn_opcodes_h_l2526_c7_c72b_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2526_c7_c72b_iftrue;
     n16_MUX_uxn_opcodes_h_l2526_c7_c72b_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2526_c7_c72b_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2526_c7_c72b_return_output := n16_MUX_uxn_opcodes_h_l2526_c7_c72b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2526_c7_c72b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_c72b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_c72b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_c72b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_c72b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_c72b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_c72b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_c72b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_c72b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2513_c2_e6cc] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2513_c2_e6cc_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2513_c2_e6cc_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2513_c2_e6cc_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2513_c2_e6cc_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2513_c2_e6cc_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2513_c2_e6cc_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2513_c2_e6cc_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2513_c2_e6cc_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l2513_c2_e6cc_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2526_c7_c72b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c2_e6cc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_c72b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c2_e6cc_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_c72b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c2_e6cc_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_c72b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2529_c7_ece5_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2534_c7_d602_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2526_c7_c72b_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2529_c7_ece5_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2526_c7_c72b] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2526_c7_c72b_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2526_c7_c72b_cond;
     tmp16_MUX_uxn_opcodes_h_l2526_c7_c72b_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2526_c7_c72b_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2526_c7_c72b_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2526_c7_c72b_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2526_c7_c72b_return_output := tmp16_MUX_uxn_opcodes_h_l2526_c7_c72b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2513_c2_e6cc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c2_e6cc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c2_e6cc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c2_e6cc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c2_e6cc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c2_e6cc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c2_e6cc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c2_e6cc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c2_e6cc_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2529_c7_ece5] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2529_c7_ece5_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2529_c7_ece5_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2529_c7_ece5_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2529_c7_ece5_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2529_c7_ece5_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2529_c7_ece5_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2529_c7_ece5_return_output := result_u8_value_MUX_uxn_opcodes_h_l2529_c7_ece5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2513_c2_e6cc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2513_c2_e6cc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c2_e6cc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2513_c2_e6cc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c2_e6cc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2513_c2_e6cc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c2_e6cc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c2_e6cc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2513_c2_e6cc_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2513_c2_e6cc] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c2_e6cc_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c2_e6cc_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c2_e6cc_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c2_e6cc_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c2_e6cc_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c2_e6cc_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c2_e6cc_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c2_e6cc_return_output;

     -- n16_MUX[uxn_opcodes_h_l2513_c2_e6cc] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2513_c2_e6cc_cond <= VAR_n16_MUX_uxn_opcodes_h_l2513_c2_e6cc_cond;
     n16_MUX_uxn_opcodes_h_l2513_c2_e6cc_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2513_c2_e6cc_iftrue;
     n16_MUX_uxn_opcodes_h_l2513_c2_e6cc_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2513_c2_e6cc_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2513_c2_e6cc_return_output := n16_MUX_uxn_opcodes_h_l2513_c2_e6cc_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2513_c2_e6cc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2526_c7_c72b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2529_c7_ece5_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2513_c2_e6cc_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2526_c7_c72b_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2513_c2_e6cc] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2513_c2_e6cc_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2513_c2_e6cc_cond;
     tmp16_MUX_uxn_opcodes_h_l2513_c2_e6cc_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2513_c2_e6cc_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2513_c2_e6cc_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2513_c2_e6cc_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2513_c2_e6cc_return_output := tmp16_MUX_uxn_opcodes_h_l2513_c2_e6cc_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2526_c7_c72b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2526_c7_c72b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2526_c7_c72b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2526_c7_c72b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2526_c7_c72b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2526_c7_c72b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2526_c7_c72b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2526_c7_c72b_return_output := result_u8_value_MUX_uxn_opcodes_h_l2526_c7_c72b_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2513_c2_e6cc_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2526_c7_c72b_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l2513_c2_e6cc_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2513_c2_e6cc] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2513_c2_e6cc_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2513_c2_e6cc_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2513_c2_e6cc_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2513_c2_e6cc_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2513_c2_e6cc_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2513_c2_e6cc_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2513_c2_e6cc_return_output := result_u8_value_MUX_uxn_opcodes_h_l2513_c2_e6cc_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_188e_uxn_opcodes_h_l2557_l2509_DUPLICATE_04df LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_188e_uxn_opcodes_h_l2557_l2509_DUPLICATE_04df_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_188e(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2513_c2_e6cc_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2513_c2_e6cc_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2513_c2_e6cc_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2513_c2_e6cc_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c2_e6cc_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c2_e6cc_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2513_c2_e6cc_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c2_e6cc_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2513_c2_e6cc_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_188e_uxn_opcodes_h_l2557_l2509_DUPLICATE_04df_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_188e_uxn_opcodes_h_l2557_l2509_DUPLICATE_04df_return_output;
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
